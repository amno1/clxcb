;;; io.lisp — request/reply and event entry points.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; Acknowledgements
;;;
;;; The request/reply/event byte layout is defined by the X Window
;;; System Protocol, section "Connection Setup" and the individual
;;; reply and event structures:
;;;
;;;     https://www.x.org/releases/current/doc/xproto/x11protocol.html
;;;
;;; The threading model -- one I/O lock, one reader at a time that
;;; releases the lock while it waits for the socket, an input buffer
;;; holding partial packets, widening of 16-bit sequence numbers, the
;;; request_completed rule and the periodic sync -- follows libxcb
;;; (libxcb/xcb_conn.c, xcb_out.c, xcb_in.c):
;;;
;;;   Copyright (C) 2001-2004 Bart Massey and Jamey Sharp
;;;   Distributed under the MIT/X11 licence
;;;
;;; No libxcb code is copied.  See doc/threads.md for the design, its
;;; invariants (numbered below as "invariant N"), and the tests.

(in-package "XCB")

;;; Protocol error condition

(define-condition protocol-error (cl:error)
  ((code          :initarg :code          :reader protocol-error-code)
   (sequence      :initarg :sequence      :reader protocol-error-sequence)
   (bad-value     :initarg :bad-value     :reader protocol-error-bad-value)
   (minor-opcode  :initarg :minor-opcode  :reader protocol-error-minor-opcode)
   (major-opcode  :initarg :major-opcode  :reader protocol-error-major-opcode)
   (error-object  :initarg :error-object  :initform nil
                  :reader protocol-error-object))
  (:report (lambda (condition stream)
             (cl:format stream
                     "X11 protocol error code ~D (major ~D, minor ~D, serial ~D, value #x~X)"
                     (protocol-error-code         condition)
                     (protocol-error-major-opcode condition)
                     (protocol-error-minor-opcode condition)
                     (protocol-error-sequence     condition)
                     (protocol-error-bad-value    condition)))))

(define-condition connection-closed (cl:error)
  ((connection :initarg :connection :reader connection-closed-connection)
   (reason :initarg :reason :reader connection-closed-reason))
  (:documentation "Signalled by any operation on a closed connection,
   and by a thread waiting on a connection when it closes.")
  (:report (lambda (c s)
             (cl:format s "The X connection ~A is closed (~A)"
                        (connection-closed-connection c)
                        (let ((r (connection-closed-reason c)))
                          (case r
                            (:closed "closed by the client")
                            (:eof "the server hung up")
                            (t r)))))))

(define-condition no-reply (cl:error)
  ((sequence :initarg :sequence :reader no-reply-sequence))
  (:documentation "Signalled by READ-REPLY when the server has answered
   everything up to and past the request, and no reply for it is filed:
   either the request was sent without a reply, or its reply was
   discarded with DISCARD-REPLY.")
  (:report (lambda (c s)
             (cl:format s "Request ~D has no reply to read"
                        (no-reply-sequence c)))))


;;; Direct socket I/O, for the setup handshake only
;;;
;;; Before HANDSHAKE returns no other thread can have the
;;; connection, and nothing has been read into the input buffer, so the
;;; handshake reads and writes the socket directly.  Everything after it
;;; goes through the output queue and the input buffer.
;;;
;;; On SBCL on Linux every connection to a socket does raw
;;; sendmsg/recvmsg (CONN-RAW-FD), and the stream branches below are
;;; unreachable.  They remain for connections made over an explicit
;;; stream, which are single-threaded: the design in doc/threads.md
;;; covers the raw path only.  Do not "fix" the raw path by branching on
;;; the platform.

(defun %ensure-open (conn)
  (when (conn-closed conn)
    (cl:error 'connection-closed :connection conn :reason (conn-closed conn)))
  (unless (or (conn-raw-fd conn) (conn-stream conn))
    (cl:error 'connection-closed :connection conn :reason :closed)))

(defun %conn-read (conn buf start end)
  "Fill BUF from START to END with bytes from CONN, blocking.  For the
   setup handshake only (see above)."
  (%ensure-open conn)
  (let ((fd (conn-raw-fd conn)))
    (if fd
        (loop while (< start end)
              do (multiple-value-bind (n fds) (%socket-receive fd buf start end)
                   (when (zerop n)
                     (cl:error 'end-of-file :stream (conn-stream conn)))
                   (incf start n)
                   (when fds
                     (setf (conn-received-fds conn)
                           (nconc (conn-received-fds conn) fds)))))
        (loop with stream = (conn-stream conn)
              while (< start end)
              for next = (read-sequence buf stream :start start :end end)
              do (when (= next start)
                   (cl:error 'end-of-file :stream stream))
                 (setf start next)))
    buf))

(defun %conn-read-octets (conn n)
  "Read exactly N bytes from CONN into a fresh octet vector."
  (%conn-read conn (make-array n :element-type 'octet) 0 n))


;;; Sending (doc/threads.md, section 2)

(defun %enqueue-request (conn serial octets fds)
  "Append request SERIAL to the output queue (I/O lock held)."
  (let ((cell (list (list* serial octets fds))))
    (if (%conn-out-tail conn)
        (setf (cdr (%conn-out-tail conn)) cell)
        (setf (%conn-out-queue conn) cell))
    (setf (%conn-out-tail conn) cell)
    (incf (%conn-out-bytes conn) (cl:length octets))))

(defvar *defer-writes* nil
  "EXPERIMENTAL, for measuring (doc/threads.md, section 2).  When true,
   FLUSH-REQUEST leaves its request queued instead of writing it,
   unless +WRITE-BATCH-BYTES+ are queued, as libxcb does: its requests
   wait in its output buffer until the buffer fills or xcb_flush.

   The rule this imposes: any thread that sends a request and then
   relies on the server having received it -- including by another
   thread blocking on the socket -- must call FLUSH first.  The thread
   that blocks does not do this for you: it flushes when it starts to
   wait, and a request sent after that stays queued until someone
   flushes.  NIL, the default, writes every request before
   FLUSH-REQUEST returns, and no such rule applies.")

(defconstant +write-batch-bytes+ 65536
  "The most bytes one write joins, and with *DEFER-WRITES* the queue
   size at which FLUSH-REQUEST writes.")

(defvar *checked-requests* nil
  "True inside WITH-CHECKED-REQUESTS.")

(defmacro with-checked-requests (() &body body)
  "WARNING: call REQUEST-CHECK on every void request BODY sends.  An
   error for one you do not check is never reported anywhere.

   Run BODY with the requests without a reply that it sends *checked*,
   like libxcb's _checked senders: an X error for one of them is kept for
   REQUEST-CHECK on its cookie and never goes to POLL-FOR-EVENT or
   WAIT-FOR-EVENT.  Outside this form a void request's error goes to
   whichever comes first, REQUEST-CHECK or an event function, so
   REQUEST-CHECK alone, without this form, loses nothing.  Requests with
   a reply are not affected: their errors always go to READ-REPLY."
  `(let ((*checked-requests* t))
     ,@body))

(defun %number-request (conn octets fds reply-fds route)
  "Give the request OCTETS the next sequence number and queue it, in one
   critical section (I/O lock held; invariant 3).  ROUTE is where an X
   error for it goes (doc/threads.md, section 5): :REPLY, :CHECKED or
   NIL.
   Returns the number."
  (%maybe-send-sync conn)
  (let ((serial (incf (conn-next-serial conn))))
    (if reply-fds
        (setf (gethash serial (conn-fd-reply-serials conn)) t)
        (remhash serial (conn-fd-reply-serials conn)))
    (case route
      (:reply (setf (gethash serial (%conn-reply-serials conn)) t))
      (:checked (setf (gethash serial (%conn-checked-serials conn)) t)))
    (%enqueue-request conn serial octets fds)
    serial))

(defun %maybe-send-sync (conn)
  "Keep 16-bit sequence numbers unambiguous (doc/threads.md, section 6):
   a packet's number is widened relative to the last packet read, which
   works while the server sends something at least every 65,535
   requests.  A request with no reply sends nothing, so before 65,534 of
   them could go by, queue a GetInputFocus, whose reply nobody reads.
   (I/O lock held.)"
  (when (>= (- (conn-next-serial conn)
               (max (%conn-last-sync conn) (%conn-request-read conn)))
            65534)
    (%enqueue-sync conn)))

(defun %enqueue-sync (conn)
  "Number and queue a GetInputFocus whose reply nobody reads, and return
   its sequence number (I/O lock held).  Its reply makes the server
   answer past every request before it."
  (let* ((order (conn-byte-order conn))
         (octets (make-array 4 :element-type 'octet))
         (serial (incf (conn-next-serial conn))))
    ;; GetInputFocus: opcode 43, one unused byte, length 1.
    (setf (aref octets 0) 43
          (aref octets 1) 0)
    (if (eql order +msb+)
        (setf (aref octets 2) 0 (aref octets 3) 1)
        (setf (aref octets 2) 1 (aref octets 3) 0))
    (setf (gethash serial (%conn-discard-serials conn)) t
          (%conn-last-sync conn) serial)
    (%enqueue-request conn serial octets nil)
    serial))

(defun %write-queued (conn)
  "Write the output queue, oldest first, until it is empty (I/O lock
   held; the caller is the writer).  Waits for the socket with the lock
   released; while it cannot write, reads what the server sends, so the
   two cannot block each other."
  (let ((fd (conn-raw-fd conn)))
    (loop while (%conn-out-queue conn)
          do (multiple-value-bind (octets fds count last-serial) (%next-batch conn)
               (let ((start 0) (end (cl:length octets)))
                 (unless fd
                   ;; A stream connection (single-threaded): write it
                   ;; through the stream.  FLUSH-REQUEST refused FDS.
                   (%ensure-open conn)
                   (write-sequence octets (conn-stream conn))
                   (finish-output (conn-stream conn))
                   (setf start end))
                 (loop while (< start end)
                       do (%ensure-open conn)
                          (let ((n (%socket-send-now fd octets start end fds)))
                            (if (eq n :again)
                                (%wait-writable conn fd)
                                (progn (incf start n)
                                       ;; The descriptors went with the first byte.
                                       (setf fds nil))))))
               (setf (%conn-request-written conn) last-serial)
               (loop repeat count
                     do (decf (%conn-out-bytes conn)
                              (cl:length (second (pop (%conn-out-queue conn))))))
               (unless (%conn-out-queue conn)
                 (setf (%conn-out-tail conn) nil))))))

(defun %next-batch (conn)
  "The requests at the head of the output queue to write in one sendmsg:
   the first, with its descriptors, and those after it that carry none,
   up to +WRITE-BATCH-BYTES+ (descriptors attach to a write's first byte,
   so a request with some starts a new batch).  Returns (VALUES OCTETS
   FDS COUNT LAST-SERIAL); the requests stay queued until written.
   (I/O lock held.)"
  (let* ((queue (%conn-out-queue conn))
         (first (first queue)))
    (destructuring-bind (serial octets . fds) first
      (let ((batch (list octets)) (bytes (cl:length octets))
            (count 1) (last-serial serial))
        (loop for (next-serial next-octets . next-fds) in (rest queue)
              while (and (null next-fds)
                         (<= (+ bytes (cl:length next-octets)) +write-batch-bytes+))
              do (push next-octets batch)
                 (incf bytes (cl:length next-octets))
                 (incf count)
                 (setf last-serial next-serial))
        (cl:values (if (= count 1)
                       octets
                       (let ((all (make-array bytes :element-type 'octet)) (at 0))
                         (dolist (o (nreverse batch) all)
                           (replace all o :start1 at)
                           (incf at (cl:length o)))))
                   fds count last-serial)))))

(defun %wait-writable (conn fd)
  "The socket is full.  If no thread is reading, read what is available
   (the server may be blocked writing to us); otherwise wait a little
   for the socket with the I/O lock released."
  (if (and (not (%conn-reading conn))
           (%wait-fd fd :input 0))
      (progn (%read-available conn)
             (%cv-broadcast (conn-io-cv conn)))
      (progn
        (%release-lock (conn-io-lock conn))
        (unwind-protect (%wait-fd fd :output 0.05)
          (%grab-lock (conn-io-lock conn))))))

(defun %flush-out (conn &optional (upto (conn-next-serial conn)))
  "Make sure every request up to UPTO has been written (I/O lock held).
   Only one thread writes at a time; the others wait for it."
  (loop until (>= (%conn-request-written conn) upto)
        do (%ensure-open conn)
           (if (%conn-writing conn)
               (%cv-wait (conn-io-cv conn) (conn-io-lock conn))
               (progn
                 (setf (%conn-writing conn) t)
                 (unwind-protect (%write-queued conn)
                   (setf (%conn-writing conn) nil)
                   (%cv-broadcast (conn-io-cv conn)))))))

;;; In connection-setup.lisp: it sends the BIG-REQUESTS extension's
;;; Enable, which is generated code, loaded after this file.
(declaim (ftype (cl:function (t t) t) %ensure-big-requests))

(defun flush-request (conn &key fds reply-fds has-reply)
  "Send the request encoded in the calling thread's send buffer
   (CONN-SEND-BUFFER) and return its sequence number, the cookie.

   The generated request senders call this after encoding and
   BUFFER-FINISH-REQUEST.  The request is numbered and queued in one
   step, and written before this returns.  FDS are descriptors to send
   with the request; they stay open, and the caller keeps owning them.
   REPLY-FDS says the request's reply carries descriptors, which it
   claims when it arrives.  HAS-REPLY says the request has a reply: then
   an X error for it goes only to its READ-REPLY (the generated senders
   pass it; libxcb's isvoid).  The cookie is 64-bit; the wire, and a
   reply's SEQUENCE slot, carry its low 16 bits."
  (when (and (or fds reply-fds) (eq (conn-transport conn) :tcp))
    (cl:error "Connection ~A is over TCP, which cannot carry file ~
               descriptors: this request needs a connection on the X ~
               server's own machine." conn))
  (when (and reply-fds (null (conn-raw-fd conn)))
    (require-fd-passing 'flush-request)
    (cl:error "Connection ~A cannot receive file descriptors: it does ~
               not talk to a socket." conn))
  (when (and fds (null (conn-raw-fd conn)))
    (require-fd-passing 'flush-request)
    (cl:error "Connection ~A cannot send file descriptors: it does not ~
               talk to a socket." conn))
  (let ((octets (copy-seq (buffer-octets (conn-send-buffer conn)))))
    ;; BUFFER-FINISH-REQUEST wrote a request too long for 16 bits in the
    ;; BIG-REQUESTS form (0 in the length field).  Enable the extension
    ;; first: its Enable request reuses this thread's send buffer, which
    ;; is why OCTETS was copied out of it above.
    (when (and (>= (cl:length octets) 8)
               (zerop (aref octets 2)) (zerop (aref octets 3)))
      (%ensure-big-requests conn (floor (cl:length octets) 4)))
    (with-lock ((conn-io-lock conn))
      (%ensure-open conn)
      (let ((serial (%number-request conn octets fds reply-fds
                                     (cond (has-reply :reply)
                                           (*checked-requests* :checked)))))
        (unless (and *defer-writes*
                     (< (%conn-out-bytes conn) +write-batch-bytes+))
          (%flush-out conn serial))
        serial))))

(defun flush (conn)
  "Write every request queued on CONN.  By default FLUSH-REQUEST writes
   each request before it returns, and this does nothing more.  With
   *DEFER-WRITES* on it is what sends requests the queue still holds,
   and a thread that relies on the server having received its requests
   must call it (see *DEFER-WRITES*)."
  (with-lock ((conn-io-lock conn))
    (unless (conn-closed conn)
      (%flush-out conn)))
  (cl:values))


;;; The input buffer (doc/threads.md, section 1)

(defun %read-available (conn)
  "One non-blocking read of what the socket has into the input buffer,
   then file every complete packet (I/O lock held).  Returns the number
   of bytes read, 0 at end of file (the connection is then marked
   closed), or NIL if nothing was there."
  (let ((fd (conn-raw-fd conn)))
    (unless fd
      (return-from %read-available (%stream-read-available conn nil)))
    (multiple-value-bind (buf end) (%in-buffer-room conn 4096)
     (multiple-value-bind (n fds) (%socket-receive-now fd buf end (cl:length buf))
      (cond ((eq n :again) nil)
            ((zerop n)
             (setf (conn-closed conn) (or (conn-closed conn) :eof))
             0)
            (t
             (when fds
               (setf (conn-received-fds conn) (nconc (conn-received-fds conn) fds)))
             (setf (%conn-in-end conn) (+ end n))
             (%file-packets conn)
             n))))))

(defun %in-buffer-room (conn room)
  "Make at least ROOM free bytes at the end of the input buffer: move
   the unparsed bytes to the front, and grow it if still needed.
   Returns (VALUES BUFFER END), END where new bytes go.  (I/O lock
   held.)"
  (let ((buf (%conn-in-buffer conn))
        (start (%conn-in-start conn))
        (end (%conn-in-end conn)))
    (when (> start 0)
      (replace buf buf :start2 start :end2 end)
      (setf end (- end start)
            (%conn-in-start conn) 0 (%conn-in-end conn) end))
    (when (> (+ end room) (cl:length buf))
      (let ((new (make-array (max (* 2 (cl:length buf)) (+ end room)) :element-type 'octet)))
        (replace new buf :end2 end)
        (setf buf new (%conn-in-buffer conn) new)))
    (cl:values buf end)))

;;; A connection over a plain stream (no raw descriptor; see "Direct
;;; socket I/O" above) is single-threaded: its reader blocks on the
;;; stream.  It goes through the same input buffer and filing, so the
;;; rest of this file does not care which kind a connection is.

(defun %stream-read-available (conn first-byte)
  "Append FIRST-BYTE, if an octet, and then every byte the stream has
   ready (LISTEN) to the input buffer, and file the complete packets
   (I/O lock held).  Returns the number of bytes added, 0 at end of file
   (FIRST-BYTE :EOF; the connection is then marked closed), or NIL if
   there was nothing."
  (let ((stream (conn-stream conn)) (count 0))
    (when (eq first-byte :eof)
      (setf (conn-closed conn) (or (conn-closed conn) :eof))
      (return-from %stream-read-available 0))
    (flet ((add (byte)
             (multiple-value-bind (buf end) (%in-buffer-room conn 1)
               (setf (aref buf end) byte
                     (%conn-in-end conn) (1+ end))
               (incf count))))
      (when first-byte (add first-byte))
      (loop while (and stream (open-stream-p stream) (listen stream))
            do (let ((byte (read-byte stream nil :eof)))
                 (if (eq byte :eof)
                     (progn (setf (conn-closed conn) (or (conn-closed conn) :eof))
                            (return))
                     (add byte)))))
    (%file-packets conn)
    (if (plusp count) count nil)))

(defun %widen (conn serial16)
  "Widen the 16-bit sequence number of a packet just read (I/O lock
   held): the smallest number not below the last packet read with those
   low 16 bits (packets arrive in order)."
  (let* ((last (%conn-request-read conn))
         (widened (logior (logandc2 last #xFFFF) serial16)))
    (when (< widened last)
      (incf widened #x10000))
    (setf (%conn-request-read conn) widened)))

(defconstant +max-packet-bytes+ (* 256 1024 1024)
  "The longest reply or event accepted from the server, in bytes.  Far
   above anything a server sends; a longer one closes the connection.")

(defun %parse-packet (conn)
  "If the input buffer holds a complete packet, remove it and return
   (VALUES KIND OCTETS SERIAL FDS): KIND :REPLY, :EVENT or :ERROR,
   OCTETS a fresh copy, SERIAL widened to 64 bits, FDS the descriptors a
   reply claims (invariant 9).  Otherwise return NIL.  (I/O lock held.)"
  (let* ((buf (%conn-in-buffer conn))
         (start (%conn-in-start conn))
         (available (- (%conn-in-end conn) start))
         (order (conn-byte-order conn)))
    (when (< available 32)
      (return-from %parse-packet nil))
    (let* ((type (aref buf start))
           (length (if (or (= type 1) (= (logand type #x7F) 35))
                       (+ 32 (* 4 (read-card32-at buf (+ start 4) order)))
                       32)))
      ;; A packet claiming more than +MAX-PACKET-BYTES+ is malformed; no
      ;; server sends one.  Rather than grow the input buffer until memory
      ;; runs out, close the connection, as libxcb does
      ;; (XCB_CONN_CLOSED_MEM_INSUFFICIENT); its waiters then signal.
      (when (> length +max-packet-bytes+)
        (setf (conn-closed conn)
              (or (conn-closed conn)
                  (make-condition 'simple-error
                                  :format-control "the server sent a packet of ~D bytes"
                                  :format-arguments (list length))))
        (return-from %parse-packet nil))
      (when (< available length)
        (return-from %parse-packet nil))
      (let* ((octets (subseq buf start (+ start length)))
             ;; KeymapNotify (11) has no sequence number: bytes 1-31
             ;; are the keymap.  It must not move the widening base.
             (serial (if (= (logand type #x7F) 11)
                         (%conn-request-read conn)
                         (%widen conn (read-card16-at octets 2 order))))
             (kind (case type (0 :error) (1 :reply) (t :event))))
        (setf (%conn-in-start conn) (+ start length))
        (when (= (%conn-in-start conn) (%conn-in-end conn))
          (setf (%conn-in-start conn) 0 (%conn-in-end conn) 0))
        (cl:values kind octets serial
                   (when (eq kind :reply) (%claim-reply-fds conn octets serial)))))))

(defun %claim-reply-fds (conn octets serial)
  "If request SERIAL's reply carries file descriptors, take its NFD
   (byte 1) descriptors off the front of CONN-RECEIVED-FDS and return
   them."
  (when (gethash serial (conn-fd-reply-serials conn))
    (remhash serial (conn-fd-reply-serials conn))
    (let ((nfd (aref octets 1))
          (queue (conn-received-fds conn)))
      (when (< (cl:length queue) nfd)
        (cl:error "The reply to request ~D has ~D file descriptors, but ~
                   only ~D arrived" serial nfd (cl:length queue)))
      (setf (conn-received-fds conn) (nthcdr nfd queue))
      (subseq queue 0 nfd))))

(defun %queue-event (conn item)
  (let ((cell (list item)))
    (if (%conn-event-tail conn)
        (setf (cdr (%conn-event-tail conn)) cell)
        (setf (conn-event-queue conn) cell))
    (setf (%conn-event-tail conn) cell)))

(defun %pop-event-item (conn)
  (let ((item (pop (conn-event-queue conn))))
    (unless (conn-event-queue conn)
      (setf (%conn-event-tail conn) nil))
    item))

(defun %prune-checked-serials (conn)
  "Drop the checked requests the server has answered past without an
   error: they succeeded, and no packet for them will come (I/O lock
   held).  Walks only the checked table, so it costs nothing while no
   checked request is in flight, however many others are."
  (let ((checked (%conn-checked-serials conn))
        (completed (%conn-request-completed conn)))
    (when (plusp (hash-table-count checked))
      (let ((done '()))
        (maphash (lambda (serial flag)
                   (declare (ignore flag))
                   (when (<= serial completed)
                     (push serial done)))
                 checked)
        (dolist (serial done) (remhash serial checked))))))

(defun %file-packets (conn)
  "File every complete packet in the input buffer (I/O lock held;
   invariant 4): replies and errors under their sequence number, events
   on the queue.  The caller broadcasts."
  (progn
    (loop
      (multiple-value-bind (kind octets serial fds) (%parse-packet conn)
        (unless kind (return (%prune-checked-serials conn)))
        (ecase kind
          (:reply
           (setf (%conn-request-completed conn)
                 (max (%conn-request-completed conn) serial))
           (remhash serial (%conn-reply-serials conn))
           (if (gethash serial (%conn-discard-serials conn))
               (remhash serial (%conn-discard-serials conn))
               (setf (gethash serial (conn-pending-replies conn)) (cons octets fds))))
          (:error
           (setf (%conn-request-completed conn)
                 (max (%conn-request-completed conn) serial))
           (if (remhash serial (%conn-discard-serials conn))
               ;; A discarded request's error goes with its reply
               ;; (DISCARD-REPLY).
               (remhash serial (%conn-reply-serials conn))
               (progn
                 (setf (gethash serial (conn-pending-replies conn)) (cons :error octets))
                 ;; doc/threads.md, section 5: an error for a request with a
                 ;; reply, or a checked one, is only for READ-REPLY or
                 ;; REQUEST-CHECK.  An unchecked void request's error is also
                 ;; marked on the event queue, for whichever comes first.
                 (let ((routed (or (remhash serial (%conn-reply-serials conn))
                                   (remhash serial (%conn-checked-serials conn)))))
                   (unless routed
                     (%queue-event conn (cons :error serial)))))))
          (:event
           ;; One less than the event's serial, as libxcb does (xcb_in.c,
           ;; read_packet): the request that caused an event may cause
           ;; more events or a reply after it, so it is not known to be
           ;; complete until a later serial arrives.  An error completes
           ;; its request, above.
           (setf (%conn-request-completed conn)
                 (max (%conn-request-completed conn) (1- serial)))
           ;; Decoded when taken (%QUEUED-EVENT), not here: a decoder
           ;; registered after the read, before the event is taken, is
           ;; then used, and the reader, holding the lock, does less.
           (%queue-event conn (cons :raw octets))))))))


;;; Waiting (doc/threads.md, section 3)

(defun %wait-for (conn ready &key timeout)
  "The loop every waiting thread runs (I/O lock held).  READY is called
   with the lock held; it returns true and a value when what the caller
   waits for is there.  Returns that value, or NIL and :TIMEOUT when
   TIMEOUT seconds pass first.  Signals CONNECTION-CLOSED when the
   connection closes (invariant 8).

   At most one thread is the reader (invariant 1).  It waits for the
   socket with the lock released (invariant 7), reads and files what
   came, and wakes everyone (invariant 5).  The others wait on the
   condition variable."
  (let ((deadline (and timeout
                       (+ (get-internal-real-time)
                          (round (* timeout internal-time-units-per-second))))))
    (flet ((remaining ()
             (and deadline
                  (max 0 (/ (- deadline (get-internal-real-time))
                            internal-time-units-per-second)))))
      (unless (conn-closed conn)
        (%flush-out conn))                ; invariant 6
      (loop
        (%file-packets conn)
        (multiple-value-bind (done value) (funcall ready)
          (when done (return value)))
        (when (conn-closed conn)
          (cl:error 'connection-closed :connection conn :reason (conn-closed conn)))
        (when (and deadline (<= (remaining) 0))
          (return (cl:values nil :timeout)))
        (if (%conn-reading conn)
            (if deadline
                (%cv-wait (conn-io-cv conn) (conn-io-lock conn)
                          (max 1/1000 (remaining)))
                (%cv-wait (conn-io-cv conn) (conn-io-lock conn)))
            (let ((fd (conn-raw-fd conn)) (readable nil))
              (setf (%conn-reading conn) t)
              (unwind-protect
                   (progn
                     (%release-lock (conn-io-lock conn))
                     (unwind-protect
                          (setf readable
                                (cond (fd
                                       (if deadline
                                           (%wait-fd fd :input (remaining))
                                           (%wait-fd fd :input)))
                                      (deadline (%stream-wait conn (remaining)))
                                      ;; A stream: block for one byte.
                                      (t (read-byte (conn-stream conn) nil :eof))))
                       (%grab-lock (conn-io-lock conn)))
                     (when (and readable (not (conn-closed conn)))
                       (handler-case (if fd
                                         (%read-available conn)
                                         (%stream-read-available
                                          conn (if (eq readable t) nil readable)))
                         (cl:error (e)
                           (setf (conn-closed conn) (or (conn-closed conn) e))))))
                (setf (%conn-reading conn) nil)
                (%cv-broadcast (conn-io-cv conn)))))))))

(defun %stream-wait (conn seconds)
  "Wait up to SECONDS for a stream connection to have input: T if it
   has, NIL if not.  Streams offer no way to wait with a timeout, so
   this polls LISTEN."
  (let ((stream (conn-stream conn))
        (deadline (+ (get-internal-real-time)
                     (round (* seconds internal-time-units-per-second)))))
    (loop
      (when (or (null stream) (not (open-stream-p stream)) (listen stream))
        (return t))
      (when (>= (get-internal-real-time) deadline)
        (return nil))
      (sleep 0.005))))

(defmacro %with-io-lock ((conn) &body body)
  `(with-lock ((conn-io-lock ,conn))
     ,@body))


;;; Replies

(defvar *pending-fds* nil
  "The file descriptors that came with the reply being decoded, in the
   order the server sent them.

   Not connection state: meaningful only for the dynamic extent of one
   decoder call, which %DECODE-REPLY binds it around.  A decoder takes
   from it with TAKE-PENDING-FD(S) and must not keep a reference to it.")

(defun take-pending-fd ()
  "Take the next file descriptor of the reply being decoded.  It is
   open in this process, and yours to close.  Like libxcb's, it is
   received close-on-exec."
  (unless *pending-fds*
    (cl:error "The reply declares more file descriptors than arrived with it"))
  (pop *pending-fds*))

(defun take-pending-fds (n)
  "Take the next N file descriptors of the reply being decoded."
  (loop repeat n collect (take-pending-fd)))

(defun %decode-reply (decoder buf order fds)
  (let ((*pending-fds* fds))
    (cl:values (funcall decoder buf 0 order))))

(defun read-reply (conn cookie decoder)
  "Block until the reply to COOKIE arrives, and return what DECODER
   makes of it.  DECODER is a function of (BUFFER POSITION ORDER)
   returning (VALUES REPLY NEW-POSITION) -- the generated
   <request>-REPLY functions pass their DECODE-<request>-REPLY -- or the
   name of a generated reply class, whose decoder is then used.

   COOKIE must be one this connection issued: a number it never sent
   would never be answered, and the wait would not end.

   Safe to call from several threads, each for its own cookie.  An
   error for COOKIE is signalled as PROTOCOL-ERROR; if the server
   has answered past COOKIE without a reply, NO-REPLY; if the
   connection closes, CONNECTION-CLOSED."
  (let* ((order (conn-byte-order conn))
         (decoder (%as-decoder decoder))
         (entry
           (%with-io-lock (conn)
             (%wait-for conn
                        (lambda ()
                          (let ((entry (gethash cookie (conn-pending-replies conn))))
                            (cond (entry
                                   (remhash cookie (conn-pending-replies conn))
                                   (cl:values t entry))
                                  ((>= (%conn-request-completed conn) cookie)
                                   (cl:values t :none))
                                  (t nil))))))))
    (cond ((eq entry :none)
           (cl:error 'no-reply :sequence cookie))
          ((eq (car entry) :error)
           (handle-error-packet conn (cdr entry) order))
          (t (%decode-reply decoder (car entry) order (cdr entry))))))


(defun request-check (conn cookie)
  "Wait until the request COOKIE -- one without a reply, such as
   CreateWindow -- has been processed, and return its X error as a
   PROTOCOL-ERROR condition, or NIL if it succeeded.  libxcb's
   xcb_request_check.

   Unlike READ-REPLY this returns the error instead of signalling it: it
   is a check, so (when (request-check conn cookie) ...) needs no
   handler.  Signal it with ERROR if you prefer.  Called on a request
   that has a reply, it signals an error: that reply would otherwise be
   lost.  A second check of the same cookie returns NIL, since the first
   took the error.  Each call may cost a round trip (a sync is sent when
   the server has not yet answered past the request).  Signals
   CONNECTION-CLOSED if the connection is closed, or closes first.
   COOKIE must be one this connection issued: a number it never sent
   would never be answered, and the wait would not end."
  (flet ((entry-result ()
           ;; The error filed under COOKIE, taken; a reply means misuse.
           (let ((entry (gethash cookie (conn-pending-replies conn))))
             (cond ((null entry) nil)
                   ((eq (car entry) :error)
                    (remhash cookie (conn-pending-replies conn))
                    (cl:values t (cdr entry)))
                   (t (cl:error "REQUEST-CHECK on request ~D, which has a reply: ~
                                 read it with its -REPLY function instead" cookie))))))
    (let ((octets
            (%with-io-lock (conn)
              ;; Before anything is queued: a sync on a closed connection
              ;; would only be thrown away.
              (%ensure-open conn)
              (%flush-out conn cookie)
              (%file-packets conn)
              ;; The error first: it may be filed while REQUEST-COMPLETED is
              ;; already past COOKIE, advanced by a later packet read with it.
              (multiple-value-bind (found octets) (entry-result)
                (cond
                  (found octets)
                  ;; Packets are filed in order, so once any packet after
                  ;; COOKIE has been filed, its error, if it had one, has been
                  ;; too.  A request that succeeds sends no packet at all:
                  ;; the next answer past it is what proves it succeeded.
                  ((>= (%conn-request-completed conn) cookie) nil)
                  (t
                   ;; Nothing may be coming after COOKIE: make the server
                   ;; answer past it, then wait.
                   (%enqueue-sync conn)
                   (%wait-for conn
                              (lambda ()
                                (multiple-value-bind (found octets) (entry-result)
                                  (cond (found (cl:values t octets))
                                        ((>= (%conn-request-completed conn) cookie)
                                         (cl:values t nil))
                                        (t nil)))))))))))
      (when octets
        (%error-condition conn octets (conn-byte-order conn))))))

;;; Events

(defvar *debug-decoders* nil
  "When true, an error inside an event decoder propagates.  When NIL
   (the default), the event is returned as its raw bytes instead, so a
   decoder bug cannot take down an application's event loop.")

(defun event-decoder-for (conn buf order)
  "Return the decoder function for the event in BUF, or NIL."
  (let ((code (logand (aref buf 0) #x7F)))
    (if (= code 35)
        ;; XGE (GenericEvent): the event's identity is the (extension .
        ;; event-type) pair, not the wire code.
        (let ((extension (conn-extension-by-major-opcode conn (aref buf 1))))
          (or (and extension
                   (lookup-extension-ge-event-decoder
                    extension (read-card16-at buf 8 order)))
              (lookup-event-decoder 35)))
        (conn-event-decoder conn code))))

(defun decode-event (conn buf length order)
  "Return an event object for the packet in BUF (LENGTH bytes at offset
   0): a freshly decoded structure, or a copy of the raw bytes when no
   decoder is registered for the event.  Internal to the read path: it
   is called by the reader, with the I/O lock held."
  (let ((decoder (event-decoder-for conn buf order)))
    (cond ((null decoder) (subseq buf 0 length))
          (*debug-decoders* (cl:values (funcall decoder buf 0 order)))
          (t (handler-case (cl:values (funcall decoder buf 0 order))
               (cl:error () (subseq buf 0 length)))))))

(defun %error-condition (conn buf order)
  "A PROTOCOL-ERROR for the X11 error packet in BUF, its body
   decoded if a decoder is registered for its code.  Not signalled."
  (let* ((code     (aref buf 1))
         (decoder  (conn-error-decoder conn code))
         (obj      (when decoder
                     (ignore-errors (cl:values (funcall decoder buf 0 order))))))
    (make-condition 'protocol-error
                    :code code
                    :sequence (read-card16-at buf 2 order)
                    :bad-value (read-card32-at buf 4 order)
                    :minor-opcode (read-card16-at buf 8 order)
                    :major-opcode (aref buf 10)
                    :error-object obj)))

;;; Nothing subtler than this: REQUEST-CHECK returns the condition that
;;; READ-REPLY and the event functions signal, so building it is split out.
(defun handle-error-packet (conn buf order)
  "Signal a PROTOCOL-ERROR for the X11 error packet in BUF."
  (cl:error (%error-condition conn buf order)))

(defun %queued-event (conn cell)
  "The event in the queue CELL, decoding it the first time (I/O lock
   held).  The decoded event replaces the raw bytes in CELL."
  (let ((item (car cell)))
    (if (and (consp item) (eq (car item) :raw))
        (setf (car cell)
              (decode-event conn (cdr item) (cl:length (cdr item))
                            (conn-byte-order conn)))
        item)))

(defun %take-event (conn)
  "Take the next event from the queue (I/O lock held).  Returns (VALUES
   T EVENT), (VALUES T ERROR-OCTETS :ERROR) for an error nobody else
   took, or NIL if the queue is empty."
  (loop
    (let ((item (let ((cell (conn-event-queue conn)))
                  (when cell
                    (%queued-event conn cell)
                    (%pop-event-item conn)))))
      (cond ((null item) (return nil))
            ((and (consp item) (eq (car item) :error))
             (let ((entry (gethash (cdr item) (conn-pending-replies conn))))
               ;; Still filed: nobody's READ-REPLY took it, so it is ours.
               (when (and entry (eq (car entry) :error))
                 (remhash (cdr item) (conn-pending-replies conn))
                 (return (cl:values t (cdr entry) :error)))))
            (t (return (cl:values t item)))))))

(defun %event-result (conn found event kind)
  (cond ((not found) nil)
        ((eq kind :error) (handle-error-packet conn event (conn-byte-order conn)))
        (t event)))

(defun wait-for-event (conn)
  "Block until an event arrives on CONN; return it.  An X error for a
   request nobody reads the reply of is signalled here, as a
   PROTOCOL-ERROR.  Signals CONNECTION-CLOSED if the connection
   closes while waiting."
  (let ((taken (%with-io-lock (conn)
                 (%wait-for conn (lambda ()
                                   (multiple-value-bind (found event kind) (%take-event conn)
                                     (when found (cl:values t (cons event kind)))))))))
    (%event-result conn t (car taken) (cdr taken))))

(defun %read-now (conn)
  "Read and file what is available, if no other thread is the reader
   (I/O lock held).  Never waits."
  (when (and (not (%conn-reading conn)) (not (conn-closed conn)))
    (if (conn-raw-fd conn)
        (loop while (and (%wait-fd (conn-raw-fd conn) :input 0)
                         (let ((n (%read-available conn)))
                           (and n (plusp n)))))
        (%stream-read-available conn nil))
    (%cv-broadcast (conn-io-cv conn))))

(defun poll-for-event (conn)
  "Return the next event on CONN, reading what the socket has without
   waiting, or NIL if there is none."
  (multiple-value-bind (found event kind)
      (%with-io-lock (conn)
        (unless (conn-closed conn)
          (%flush-out conn))
        (%file-packets conn)
        (multiple-value-bind (found event kind) (%take-event conn)
          (if found
              (cl:values found event kind)
              (progn (%read-now conn)
                     (%take-event conn)))))
    (%event-result conn found event kind)))

(defun queue-available-events (conn)
  "Read everything the socket has without waiting, and queue its events,
   leaving them for POLL-FOR-EVENT and WAIT-FOR-EVENT.  Returns the number
   of events queued."
  (%with-io-lock (conn)
    (unless (conn-closed conn)
      (%flush-out conn)
      (%file-packets conn)
      (%read-now conn))
    (cl:length (conn-event-queue conn))))

(defun wait-for-x-event-or-timeout (conn seconds)
  "Wait up to SECONDS for an event to be queued on CONN.  Returns true if
   one is (it stays queued), NIL on timeout."
  (%with-io-lock (conn)
    (%wait-for conn (lambda () (when (conn-event-queue conn) (cl:values t t)))
               :timeout seconds)))

(defun clear-event-queue (conn)
  "Discard every event queued on CONN."
  (%with-io-lock (conn)
    (setf (conn-event-queue conn) nil
          (%conn-event-tail conn) nil))
  (cl:values))

(defun pop-queued-events-while (conn predicate)
  "Remove events from the front of CONN's queue while PREDICATE is true
   of them, and return them, oldest first.  PREDICATE is called with the
   I/O lock held and must not use CONN."
  ;; %QUEUED-EVENT decodes the head event in place before PREDICATE sees
  ;; it, so the event the predicate rejects stays queued decoded, not
  ;; raw.  That is harmless: it is decoded once either way.
  (%with-io-lock (conn)
    (loop while (let ((cell (conn-event-queue conn)))
                  (and cell
                       (not (and (consp (car cell)) (eq (caar cell) :error)))
                       (funcall predicate (%queued-event conn cell))))
          collect (%pop-event-item conn))))

(defun poll-for-queued-event (conn)
  "Return the next event already queued on CONN, or NIL, without reading
   the socket (libxcb's xcb_poll_for_queued_event).  Like POLL-FOR-EVENT,
   an X error nobody else takes is signalled here."
  (multiple-value-bind (found event kind)
      (%with-io-lock (conn)
        (%file-packets conn)
        (%take-event conn))
    (%event-result conn found event kind)))

(defun discard-reply (conn cookie)
  "Throw away the reply to COOKIE, a request with a reply, now or when it
   arrives, without waiting for it (libxcb's xcb_discard_reply).  An X
   error for the request is thrown away too.  After this, READ-REPLY for
   COOKIE would wait in vain."
  (%with-io-lock (conn)
    (remhash cookie (%conn-reply-serials conn))
    (if (gethash cookie (conn-pending-replies conn))
        (remhash cookie (conn-pending-replies conn))
        (when (> cookie (%conn-request-completed conn))
          (setf (gethash cookie (%conn-discard-serials conn)) t))))
  (cl:values))

;;; io.lisp ends here
