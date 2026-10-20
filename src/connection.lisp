;;; connection.lisp — the XCB connection object and its lifecycle.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; Acknowledgements
;;;
;;; This file is a fresh Common Lisp implementation of the XCB
;;; connection object and its XID allocator.  The design follows the
;;; C library libxcb, whose behaviour is documented in:
;;;
;;;   struct xcb_connection_t       — libxcb/xcbint.h
;;;   _xcb_xid_init, xcb_generate_id — libxcb/xcb_xid.c
;;;   xcb_connect_to_fd, xcb_disconnect — libxcb/xcb_conn.c
;;;   _xcb_open, _xcb_open_unix     — libxcb/xcb_util.c
;;;   struct xcb_setup_t, X_PROTOCOL, X_TCP_PORT — libxcb/xcb.h
;;;
;;; Those sources are Copyright (C) 2001-2008 Bart Massey, Jamey Sharp,
;;; and Josh Triplett, and are distributed under the MIT/X11 licence.
;;; No libxcb code is copied; the algorithms and field layouts above
;;; are the published X11 protocol and its libxcb reference.
;;;
;;; The general connection model (one bidirectional byte stream, a
;;; monotonically increasing 16-bit request sequence number, a table
;;; of outstanding reply cookies keyed by that number, and a lazy
;;; per-connection extension cache) is the model both Xlib and XCB
;;; implement; it is documented in the X Window System Protocol,
;;; section "Connection Setup".

(in-package #:xcb)

;;; Protocol constants
;;; From xcb.h: X_PROTOCOL, X_PROTOCOL_REVISION, X_TCP_PORT.

(defparameter +protocol-major-version+ 11
  "The X11 protocol major version number, sent in the setup request.")

(defparameter +protocol-minor-version+ 0
  "The X11 protocol minor version number, sent in the setup request.")

(defparameter +x-tcp-port+ 6000
  "Base TCP port.  The port for display N is (+ +x-tcp-port+ N).")

(define-condition resource-id-exhausted (cl:error)
  ((connection :initarg :connection
               :reader resource-id-exhausted-connection
               :documentation "The connection whose XID range ran out."))
  (:documentation
   "Signalled by GENERATE-ID when the connection's XID range has been
    fully consumed and no new one can be had: the server lacks XC-MISC,
    or has no XIDs left, or an installed refill function failed.  libxcb
    returns -1 from xcb_generate_id instead; this library prefers a
    condition so the failure cannot be ignored.")
  (:report (lambda (c s)
             (cl:format s "XID range exhausted on connection ~A."
                     (resource-id-exhausted-connection c)))))

(defun socket-path (&optional (display-number 0))
  "Return the conventional Unix-domain socket path for DISPLAY-NUMBER.
   This is the path libxcb's _xcb_open constructs when it has no
   explicit path from the DISPLAY string: /tmp/.X11-unix/XN."
  (cl:format nil "/tmp/.X11-unix/X~D" display-number))

(defclass connection ()
  (;; transport
   (%socket
    :initarg :socket :initform nil :reader conn-socket
    :documentation "The platform layer's socket object for this connection,
    or NIL when the connection has been closed.  Prefer the CONN-SOCKET
    function over SLOT-VALUE, and prefer CONN-FD over reaching into
    the socket itself.")

   (stream
    :initarg :stream :initform nil :reader conn-stream
    :documentation "A bidirectional octet stream over the socket.
    Wire reads and writes go through this stream.  Set automatically
    from %SOCKET at construction time when %SOCKET is a stream socket;
    a caller may supply :STREAM explicitly for testing.")

   (byte-order
    :initform *default-byte-order* :reader conn-byte-order
    :documentation "The byte order this connection speaks.  Chosen by
    the client and sent to the server at the start of the setup
    request; captured from *DEFAULT-BYTE-ORDER* at construction, so a
    later rebinding does not change an already-open connection.")

   ;; setup fields, filled in by HANDSHAKE
   (protocol-major-version   :accessor conn-protocol-major-version)
   (protocol-minor-version   :accessor conn-protocol-minor-version)
   (release-number           :accessor conn-release-number)
   (resource-id-base         :accessor conn-resource-id-base)
   (resource-id-mask         :accessor conn-resource-id-mask)
   (motion-buffer-size       :accessor conn-motion-buffer-size)
   (maximum-request-length   :accessor conn-maximum-request-length)
   (image-byte-order         :accessor conn-image-byte-order)
   (bitmap-format-bit-order  :accessor conn-bitmap-format-bit-order)
   (bitmap-format-scanline-unit :accessor conn-bitmap-format-scanline-unit)
   (bitmap-format-scanline-pad  :accessor conn-bitmap-format-scanline-pad)
   (min-keycode              :accessor conn-min-keycode)
   (max-keycode              :accessor conn-max-keycode)
   (vendor                   :accessor conn-vendor)
   (pixmap-formats           :accessor conn-pixmap-formats)
   (roots                    :accessor conn-roots)

   ;; Locks (see doc/threads.md).  None is recursive.
   (io-lock
    :initform (%make-lock "clxcb I/O") :reader conn-io-lock
    :documentation "Guards the output queue, the input buffer, sequence
    numbers, pending replies, received descriptors, the event queue and
    the reader, writer and closed flags.")
   (io-cv
    :initform (%make-cv "clxcb I/O") :reader conn-io-cv
    :documentation "Broadcast whenever packets are filed, a reader or
    writer finishes, or the connection closes.")
   (xid-lock
    :initform (%make-lock "clxcb XIDs") :reader conn-xid-lock)
   (extension-lock
    :initform (%make-lock "clxcb extensions") :reader conn-extension-lock)
   (atom-lock
    :initform (%make-lock "clxcb atoms") :reader conn-atom-lock)

   ;; per-connection I/O buffers
   (send-buffers
    :initform (%make-thread-table)
    :reader %conn-send-buffers
    :documentation "Each thread's send buffer (see CONN-SEND-BUFFER),
    keyed by thread.")

   (in-buffer
    :initform (make-array 16384 :element-type 'octet) :accessor %conn-in-buffer
    :documentation "Bytes read from the socket and not yet parsed into
    packets, from IN-START to IN-END: a partial packet waits here.")
   (in-start :initform 0 :accessor %conn-in-start)
   (in-end :initform 0 :accessor %conn-in-end)

   (out-queue
    :initform nil :accessor %conn-out-queue
    :documentation "Requests numbered and not yet written, oldest first:
    (SERIAL OCTETS . FDS).  Written in order by whichever thread is the
    writer.")
   (out-tail :initform nil :accessor %conn-out-tail)
   (out-bytes
    :initform 0 :accessor %conn-out-bytes
    :documentation "The number of bytes in the output queue.")
   (transport
    :initarg :transport :initform :local :reader conn-transport
    :documentation ":LOCAL for a Unix-domain socket, :TCP for a TCP one.
    Both do the same raw socket I/O; only a local socket can carry file
    descriptors (DRI3, MIT-SHM's AttachFd and CreateSegment, RandR's
    CreateLease), which only make sense on the server's own machine
    anyway.")
   (big-requests
    :initform nil :accessor %conn-big-requests
    :documentation "NIL until BIG-REQUESTS is first needed; then the
    longest request, in 4-byte units, the server accepts with it, or
    :ABSENT if the server does not have it.")

   (reading
    :initform nil :accessor %conn-reading
    :documentation "True while a thread is the reader (doc/threads.md).")
   (writing
    :initform nil :accessor %conn-writing
    :documentation "True while a thread is writing the output queue.")
   (closed
    :initform nil :accessor conn-closed
    :documentation "NIL while open; then why it closed: :CLOSED after
    CLOSE-CONNECTION, :EOF when the server hung up, or the condition
    that broke the connection.")

   (request-written
    :initform 0 :accessor %conn-request-written
    :documentation "The last request written to the socket.")
   (request-read
    :initform 0 :accessor %conn-request-read
    :documentation "The sequence number of the last packet read, widened
    to 64 bits; packets' 16-bit numbers are widened relative to it.")
   (request-completed
    :initform 0 :accessor %conn-request-completed
    :documentation "Every request up to this one has been answered or
    never will be (libxcb's request_completed).")
   (last-sync
    :initform 0 :accessor %conn-last-sync
    :documentation "The last request after which a sync was sent, or
    whose answer was read (see %MAYBE-SEND-SYNC).")
   (discard-serials
    :initform (make-hash-table) :reader %conn-discard-serials
    :documentation "Requests whose replies nobody wants: the syncs.")
   ;; Where an X error goes (doc/threads.md, section 5).  A request in
   ;; neither table is an unchecked void request, whose error is filed in
   ;; both places.  Two tables, because the entries live differently:
   (reply-serials
    :initform (make-hash-table) :reader %conn-reply-serials
    :documentation "Requests in flight that have a reply: their errors
    go only to READ-REPLY.  An entry goes when the reply or error is
    filed, which always happens, so this table is never pruned.")
   (checked-serials
    :initform (make-hash-table) :reader %conn-checked-serials
    :documentation "Void requests in flight sent inside
    WITH-CHECKED-REQUESTS: their errors go only to REQUEST-CHECK.  One
    that succeeds gets no answer, so besides going when its error is
    filed, an entry is pruned once the server has answered past it
    (%PRUNE-CHECKED-SERIALS); the pass walks only this table.")
   (event-tail :initform nil :accessor %conn-event-tail)

   ;; file-descriptor passing (see platform.lisp and io.lisp)
   (raw-fd
    :initform nil :accessor conn-raw-fd
    :documentation "The socket's file descriptor when this connection
    does its I/O with sendmsg/recvmsg, so that file descriptors can
    travel with requests and replies; NIL when it uses its Lisp stream.
    Set at construction for a real socket when *FD-PASSING-SUPPORTED*.")

   (received-fds
    :initform nil :accessor conn-received-fds
    :documentation "File descriptors the server has sent that no reply
    has claimed yet, oldest first.")

   (extension-index
    :initform nil :accessor conn-extension-index
    :documentation "An index of EXTENSIONS by major opcode and by
    first-event/first-error base, for decoding extension events and
    errors; rebuilt by dispatch.lisp whenever EXTENSIONS grows.")

   (fd-reply-serials
    :initform (make-hash-table) :reader conn-fd-reply-serials
    :documentation "Sequence numbers of requests in flight whose reply
    carries file descriptors.  When such a reply arrives it claims as
    many descriptors from RECEIVED-FDS as its NFD byte says.")

   ;; runtime state
   (next-serial
    :initform 0 :accessor conn-next-serial
    :documentation "The 64-bit sequence number of the last request
    numbered on this connection (the wire carries its low 16 bits).
    FLUSH-REQUEST increments it, under the I/O lock.")

   (atom-map
    :initform (make-hash-table :test 'equal) :reader conn-atoms
    :documentation "Maps an atom name to its numeric ID, filled in
    lazily by INTERN-ATOM-ID.  The slot has only a reader, so the table
    cannot be replaced, which would break INTERN-ATOM-ID's caching; its
    entries may be added to, with (setf (gethash name (conn-atoms conn))
    id).")

   (pending-replies
    :initform (make-hash-table) :accessor conn-pending-replies
    :documentation "Maps a request's 64-bit sequence number to its reply,
    (OCTETS . FDS), or its error, (:ERROR . OCTETS), until READ-REPLY (or,
    for an error, the event functions) takes it.  Under the I/O lock.")

   (event-queue
    :initform nil :accessor conn-event-queue
    :documentation "FIFO list of decoded events, and of (:ERROR . SERIAL)
    markers for errors nobody may be waiting for, filed by the reader and
    not yet taken.  Under the I/O lock: use CLEAR-EVENT-QUEUE,
    POP-QUEUED-EVENTS-WHILE and the event functions, not this slot.")

   (extensions
    :initform (make-hash-table :test 'equal) :accessor conn-extensions
    :documentation "Maps an extension's internal key (its CL package
    name, e.g. \"XCB-XKB\") to the plist (:PRESENT :MAJOR-OPCODE
    :FIRST-EVENT :FIRST-ERROR) returned by QueryExtension, once
    ENSURE-EXTENSION has been called for it.")

   ;; XID allocator state
   (resource-id-next
    :initform 0 :accessor conn-resource-id-next
    :documentation "Last XID handed out within the current range, as an
    offset from zero.  libxcb calls this field xid.last.  The value
    actually returned to a caller is (logior resource-id-next
    resource-id-base).")

   (resource-id-max
    :initform 0 :accessor conn-resource-id-max
    :documentation "Upper bound of the current XID range, inclusive.
    libxcb calls this field xid.max.  Set to resource-id-mask on the
    first call to GENERATE-ID, then advanced by a refill function when
    one is installed.")

   (resource-id-refill-function
    :initform nil :accessor conn-resource-id-refill-function
    :documentation "A function of one argument (the connection), called
    by GENERATE-ID when the current range is exhausted.  It must
    install a new range by SETF-ing conn-resource-id-next and
    conn-resource-id-max, and return true.  When NIL (the default),
    range exhaustion signals RESOURCE-ID-EXHAUSTED.  A higher layer may
    set this to a closure over the XC-MISC GetXIDRange request; this
    file does not depend on that extension.")

   ;; RENDER-layer caches
   ;; These two slots exist only so the RENDER helper layer can cache
   ;; per-connection server data without re-querying.  They carry no
   ;; protocol meaning and are safe to ignore for non-RENDER users.
   (a8-format
    :initform nil :accessor conn-a8-format
    :documentation "Cached A8 PictFormat ID, filled in on first use by
    the RENDER helper layer.")
   (pict-formats-reply
    :initform nil :accessor conn-pict-formats-reply
    :documentation "Cached QueryPictFormats reply, filled in on first
    use by the RENDER helper layer.")

   ;; XInput-layer cache, like the RENDER ones above.
   (xi2-version
    :initform nil :accessor conn-xi2-version
    :documentation "The XInput 2 version negotiated on this connection,
    as (MAJOR . MINOR), filled in by the XInput helper layer's
    ENSURE-XI2-VERSION."))
  (:documentation
   "A single X11 connection.  Instances are created by OPEN-CONNECTION
    and destroyed by CLOSE-CONNECTION; the setup fields are populated
    by HANDSHAKE (in connection-setup.lisp) once the initial
    server handshake has completed."))

(defun conn-send-buffer (conn)
  "The calling thread's BUFFER for encoding requests on CONN.  A request
   sender resets it, encodes, and calls FLUSH-REQUEST; each thread has
   its own, so encoding needs no lock."
  (%thread-table-ensure (%conn-send-buffers conn)
                        (lambda ()
                          (make-buffer :byte-order (conn-byte-order conn) :capacity 4096))))

(defun conn-fd (conn)
  "Return the file descriptor underlying CONN, suitable for SELECT or
   POLL.  Signals an error if the connection has been closed."
  (let ((socket (conn-socket conn)))
    (unless socket
      (cl:error "Connection ~A has no socket (closed?)." conn))
    (%socket-fd socket)))

(defmethod initialize-instance :after ((conn connection)
                                       &key &allow-other-keys)
  "When a stream socket was supplied but no stream was, derive the
   stream from the socket.  An explicitly supplied :STREAM is left
   untouched, which is what lets a test construct a connection whose
   transport is an in-memory stream."
  (let ((socket (slot-value conn '%socket))
        (stream (slot-value conn 'stream)))
    (when (and socket (null stream))
      (setf (slot-value conn 'stream) (%socket-stream socket))
      ;; A real socket: do the I/O with sendmsg/recvmsg, so file
      ;; descriptors can travel.  The stream stays open, for anything
      ;; that asks about it, but is no longer read from or written to.
      (when *fd-passing-supported*
        (setf (slot-value conn 'raw-fd) (conn-fd conn))))))

(defun open-connection (&key (path (socket-path)) host port timeout)
  "Open a socket to the X server and return a fresh CONNECTION
   wrapping it: a TCP connection to HOST on PORT when HOST is given,
   otherwise a Unix-domain socket at PATH.  The connection is not yet
   set up: the caller is expected to run HANDSHAKE next, or to use
   CONNECT or CALL-WITH-X-CONNECTION from connection-setup.lisp, which
   do both.

   PATH defaults to the conventional display-0 socket; passing NIL is
   treated as \"use the default\".  A TCP connection has TCP_NODELAY set,
   as libxcb does, so that small requests are not held back.  TIMEOUT,
   when supplied, is a timeout in seconds for the socket's I/O, and for
   connecting where the platform layer supports that."
  (make-instance 'connection
                 :socket (%open-socket (and (not host) (or path (socket-path)))
                                       host port timeout)
                 :transport (if host :tcp :local)))

(defun close-connection (conn)
  "Close CONN's underlying socket and stream.  Idempotent: calling this
   on an already-closed connection is a no-op.  After this call, no
   further I/O is possible on CONN: any attempt signals, rather than
   reaching the kernel with a stale file descriptor.  Descriptors the
   server sent that no reply claimed are closed too, since nothing else
   can."
  ;; doc/threads.md, invariant 10: mark the connection closed and shut
  ;; the socket down, which wakes a reader blocked on it; wait until no
  ;; thread is reading or writing; only then close the descriptor, so its
  ;; number cannot be given to another file under a reader.
  (when conn
    (with-lock ((conn-io-lock conn))
      (let ((socket (slot-value conn '%socket)))
        ;; %FLUSH-OUT may release the I/O lock while it waits for the
        ;; socket to take more (as all of io.lisp's waits do), so other
        ;; threads can run in the middle of it.  That is safe: the lock is
        ;; held again before CLOSED is set below, and a thread that then
        ;; tries to read or write finds the connection closed.  Do not
        ;; move the flush after that, or queued requests are lost.
        (unless (conn-closed conn)
          (ignore-errors (%flush-out conn)))
        (unless (conn-closed conn)
          (setf (conn-closed conn) :closed))
        (when socket
          (ignore-errors
           (%shutdown-socket socket)))
        (%cv-broadcast (conn-io-cv conn))
        (loop while (or (%conn-reading conn) (%conn-writing conn))
              do (%cv-wait (conn-io-cv conn) (conn-io-lock conn)))
        (when socket
          (ignore-errors (%close-socket socket))
          (setf (slot-value conn '%socket) nil))
        (setf (slot-value conn 'stream) nil
              (slot-value conn 'raw-fd) nil)
        (dolist (fd (slot-value conn 'received-fds))
          (ignore-errors (%close-fd fd)))
        (setf (slot-value conn 'received-fds) nil)
        (clrhash (slot-value conn 'fd-reply-serials))
        (%cv-broadcast (conn-io-cv conn)))))
  (cl:values))

;;; XID allocation
;;;
;;; Algorithm transliterated from libxcb's xcb_generate_id and
;;; _xcb_xid_init.  The two fields that matter are:
;;;
;;;   inc = resource_id_mask & -resource_id_mask
;;;       the lowest set bit of the mask, i.e. the granularity at which
;;;       the server will hand out XIDs.  On every server in practice
;;;       this is 1, but the protocol does not require it, and getting
;;;       it wrong produces duplicate XIDs and intermittent
;;;       BadIDChoice errors on the rare server that is not contiguous.
;;;
;;;   base = resource_id_base
;;;       the per-client offset into the resource-id space.  Every
;;;       returned XID has these bits set, so two clients cannot
;;;       collide.
;;;
;;; The first call seeds the range from the setup mask and returns BASE;
;;; each later call returns BASE | n*inc, for n = 1, 2, ..., up to
;;; BASE | mask.  When the range is used up, a new one is asked for with
;;; RESOURCE-ID-REFILL-FUNCTION, or when that is NIL with XC-MISC's
;;; GetXIDRange, as libxcb does; RESOURCE-ID-EXHAUSTED is signalled only
;;; if no new range can be had.

;;; In connection-setup.lisp: it sends XC-MISC's GetXIDRange, which is
;;; generated code, loaded after this file.
(declaim (ftype (cl:function (t) t) %xc-misc-refill))

(defun generate-id (conn)
  "Return a fresh, unique XID for CONN.  Safe to call from several
   threads: the XID lock is held across the whole allocation, a refill
   included, so two threads cannot both see the range exhausted and
   both refill it."
  (with-lock ((conn-xid-lock conn))
    (%generate-id conn)))

(defun %generate-id (conn)
  "Return a fresh, unique XID for CONN; the XID lock is held.

   When the current range is used up, a new one is asked for: with
   CONN-RESOURCE-ID-REFILL-FUNCTION if one is installed, otherwise with
   the XC-MISC extension's GetXIDRange (%XC-MISC-REFILL), as libxcb
   does.  Signals RESOURCE-ID-EXHAUSTED if no new range can be had."
  (let* ((mask (conn-resource-id-mask conn))
         (inc  (logand mask (- mask)))
         (base (conn-resource-id-base conn)))
    (when (zerop inc)
      (cl:error "Connection ~A cannot allocate XIDs: resource-id-mask is ~D. ~
              The handshake may not have run, or the server sent an ~
              invalid setup reply."
             conn mask))
    (let ((last (conn-resource-id-next conn))
          (max  (conn-resource-id-max  conn)))
      (if (>= last (- (+ max 1) inc))
          ;; Range exhausted -- either the very first call (last is 0
          ;; and the initial max is 0), or a genuine exhaustion.
          (if (zerop last)
              ;; First call: seed the range from the setup mask.
              (setf (conn-resource-id-max conn) mask)
              ;; A genuine exhaustion: ask for a new range, with the
              ;; installed function, or else XC-MISC as libxcb does.
              (funcall (or (conn-resource-id-refill-function conn)
                           #'%xc-misc-refill)
                       conn))
          ;; Ordinary advance.
          (setf (conn-resource-id-next conn) (+ last inc))))
    (logior (conn-resource-id-next conn) base)))
