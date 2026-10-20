;;; tests/io.lisp — requests, replies, events and errors over a connection.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; The connection in most of these tests talks to an OCTET-PIPE, an
;;; in-memory binary stream: what the client writes is collected, and
;;; what it reads comes from a vector of canned server packets.  The last
;;; test talks to the real X server named by $DISPLAY, if there is one.

(in-package #:xcb/tests)

(defclass octet-pipe (sb-gray:fundamental-binary-input-stream
                      sb-gray:fundamental-binary-output-stream)
  ((input  :initarg :input :initform (make-array 0 :element-type 'octet)
           :accessor pipe-input)
   (in-pos :initform 0 :accessor pipe-in-pos)
   (output :initform (make-array 0 :element-type 'octet :adjustable t :fill-pointer 0)
           :reader pipe-output)))

(defmethod stream-element-type ((s octet-pipe)) 'octet)

(defmethod sb-gray:stream-read-byte ((s octet-pipe))
  (if (< (pipe-in-pos s) (length (pipe-input s)))
      (prog1 (aref (pipe-input s) (pipe-in-pos s)) (incf (pipe-in-pos s)))
      :eof))

(defmethod sb-gray:stream-read-sequence ((s octet-pipe) seq &optional (start 0) end)
  (let* ((end (or end (length seq)))
         (n (min (- end start) (- (length (pipe-input s)) (pipe-in-pos s)))))
    (replace seq (pipe-input s) :start1 start :end1 (+ start n) :start2 (pipe-in-pos s))
    (incf (pipe-in-pos s) n)
    (+ start n)))

(defmethod sb-gray:stream-listen ((s octet-pipe))
  (< (pipe-in-pos s) (length (pipe-input s))))

(defmethod sb-gray:stream-write-byte ((s octet-pipe) byte)
  (vector-push-extend byte (pipe-output s))
  byte)

(defmethod sb-gray:stream-write-sequence ((s octet-pipe) seq &optional (start 0) end)
  (loop for i from start below (or end (length seq))
        do (vector-push-extend (elt seq i) (pipe-output s)))
  seq)

(defmethod sb-gray:stream-finish-output ((s octet-pipe)) nil)
(defmethod sb-gray:stream-force-output ((s octet-pipe)) nil)

(defun make-test-connection (&key (order +LSB+) (packets '()))
  "A connection over an OCTET-PIPE whose input is PACKETS (octet
   sequences) concatenated.  Returns the connection and the pipe."
  (let* ((pipe (make-instance 'octet-pipe
                              :input (coerce (apply #'concatenate 'vector packets)
                                             '(simple-array octet (*)))))
         (conn (let ((*default-byte-order* order))
                 (make-instance 'connection :stream pipe))))
    (values conn pipe)))

(defun written (pipe)
  (coerce (pipe-output pipe) '(simple-array octet (*))))

(defun packet (order &rest writes)
  "Build a packet by applying WRITES, each (WRITER VALUE), and padding
   to at least 32 bytes."
  (let ((buf (make-buffer :byte-order order)))
    (loop for (writer value) in writes do (funcall writer buf value))
    (when (< (buffer-position buf) 32)
      (buffer-write-padding buf (- 32 (buffer-position buf))))
    (octets buf)))

(defun geometry-reply-packet (order sequence root width)
  (packet order
          '(buffer-write-card8 1) '(buffer-write-card8 24)
          `(buffer-write-card16 ,sequence) '(buffer-write-card32 0)
          `(buffer-write-card32 ,root) '(buffer-write-card16 0) '(buffer-write-card16 0)
          `(buffer-write-card16 ,width) '(buffer-write-card16 10) '(buffer-write-card16 0)))

;;; Request encoding

(deftest request-intern-atom-bytes ()
  (multiple-value-bind (conn pipe) (make-test-connection)
    (is (= 1 (xcb::intern-atom conn nil "WM_NAME")))
    (is (equalp #(16 0 4 0  7 0 0 0  87 77 95 78 65 77 69 0) (written pipe))))
  (multiple-value-bind (conn pipe) (make-test-connection :order +MSB+)
    (xcb::intern-atom conn t "AB")
    (is (equalp #(16 1 0 3  0 2 0 0  65 66 0 0) (written pipe)))))

(deftest request-serials-count-up ()
  (let ((conn (make-test-connection)))
    (is (equal '(1 2 3) (list (xcb::get-input-focus conn)
                              (xcb::get-input-focus conn)
                              (xcb::get-input-focus conn))))))

(deftest request-value-list-switch ()
  ;; Only the values whose bits are set in VALUE-MASK go on the wire, in
  ;; bit order, and the request length counts them.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (xcb::change-window-attributes conn #x10 (logior xcb-const:+cw-event-mask+
                                                     xcb-const:+cw-back-pixel+)
                                   :event-mask #x8000 :background-pixel #xABCDEF)
    (let ((o (written pipe)))
      (is (= 20 (length o)))
      (is (= 5 (read-card16-at o 2 +LSB+)))
      (is (= #xABCDEF (read-card32-at o 12 +LSB+)))
      (is (= #x8000 (read-card32-at o 16 +LSB+))))))

(defun value-mask-failure (thunk)
  "Call THUNK; return (MISSING-P KEYWORD BIT) of the VALUE-MASK-ERROR it
   signals, or :NO-ERROR."
  (handler-case (progn (funcall thunk) :no-error)
    (value-mask-error (e)
      (list (value-mask-error-missing-p e) (value-mask-error-keyword e)
            (value-mask-error-bit e)))))

(deftest request-value-mask-bit-without-value ()
  ;; A bit set in the mask without its keyword is refused before anything
  ;; is written, with the bit and the keyword named.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (is (equal (list t :background-pixel xcb-const:+cw-back-pixel+)
               (value-mask-failure
                (lambda ()
                  (xcb::change-window-attributes conn #x10 (logior xcb-const:+cw-event-mask+
                                                                   xcb-const:+cw-back-pixel+)
                                                 :event-mask #x8000)))))
    (is (zerop (length (written pipe))))))

(deftest request-value-mask-value-without-bit ()
  ;; A keyword given without its bit would be dropped silently; it is
  ;; refused instead, and nothing is written.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (is (equal (list nil :border-pixel xcb-const:+cw-border-pixel+)
               (value-mask-failure
                (lambda ()
                  (xcb::change-window-attributes conn #x10 xcb-const:+cw-event-mask+
                                                 :event-mask #x8000 :border-pixel 99)))))
    (is (zerop (length (written pipe))))))

(deftest request-value-mask-explicit-nil ()
  ;; A keyword given as NIL counts as not given: NIL is never a value.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (declare (ignore pipe))
    (is (equal (list t :event-mask xcb-const:+cw-event-mask+)
               (value-mask-failure
                (lambda ()
                  (xcb::change-window-attributes conn #x10 xcb-const:+cw-event-mask+
                                                 :event-mask nil)))))))

(deftest request-packed-rectangles ()
  ;; POLY-FILL-RECTANGLE takes its rectangles as RECTANGLE objects or as
  ;; one vector of integers, x y width height after one another; both
  ;; put the same bytes on the wire, in either byte order.
  (dolist (order (list +LSB+ +MSB+))
    (flet ((bytes (rectangles)
             (multiple-value-bind (conn pipe) (make-test-connection :order order)
               (xcb::poly-fill-rectangle conn #x10 #x20 rectangles)
               (written pipe))))
      (let ((objects (bytes (list (make-instance 'xcb::rectangle :x 1 :y -2 :width 300 :height 4)
                                  (make-instance 'xcb::rectangle :x -32768 :y 32767 :width 65535 :height 0))))
            (packed (bytes (vector 1 -2 300 4 -32768 32767 65535 0)))
            (typed (bytes (make-array 8 :element-type '(signed-byte 32)
                                        :initial-contents '(1 -2 300 4 -32768 32767 65535 0)))))
        (is (= 28 (length objects)))
        (is (equalp objects packed))
        (is (equalp objects typed))))))

(deftest request-packed-points-and-segments ()
  ;; The same for POLY-LINE's points and POLY-SEGMENT's segments.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (xcb::poly-line conn 0 #x10 #x20 (list (make-instance 'xcb::point :x 5 :y 6)
                                           (make-instance 'xcb::point :x 7 :y 8)))
    (xcb::poly-line conn 0 #x10 #x20 #(5 6 7 8))
    (let* ((o (written pipe)) (half (/ (length o) 2)))
      (is (equalp (subseq o 0 half) (subseq o half)))))
  (multiple-value-bind (conn pipe) (make-test-connection)
    (xcb::poly-segment conn #x10 #x20 (list (make-instance 'xcb::segment :x1 1 :y1 2 :x2 3 :y2 4)))
    (xcb::poly-segment conn #x10 #x20 #(1 2 3 4))
    (let* ((o (written pipe)) (half (/ (length o) 2)))
      (is (equalp (subseq o 0 half) (subseq o half))))))

(deftest request-packed-wrong-length ()
  ;; A packed vector that is not a whole number of elements is refused.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (declare (ignore pipe))
    (is (eq :refused (handler-case (progn (xcb::poly-fill-rectangle conn #x10 #x20 #(1 2 3)) :sent)
                       (cl:error () :refused))))))

(deftest request-value-mask-message ()
  ;; The report names the request, the keyword and the bit.
  (let ((text (handler-case
                  (multiple-value-bind (conn pipe) (make-test-connection)
                    (declare (ignore pipe))
                    (xcb::configure-window conn #x10 xcb-const:+config-window-width+))
                (value-mask-error (e) (princ-to-string e)))))
    (is (and (stringp text)
             (search "CONFIGURE-WINDOW" text)
             (search ":WIDTH" text)
             (search "#x4" text)))))

(deftest request-expression-length ()
  ;; ChangeProperty sends data_len * format / 8 bytes of DATA.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (xcb::change-property conn 0 1 2 3 16 2 #(1 2 3 4 5 6))
    (let ((o (written pipe)))
      (is (= 28 (length o)))
      (is (= 7 (read-card16-at o 2 +LSB+)))
      (is (equalp #(1 2 3 4) (subseq o 24))))))

(deftest request-exprfield ()
  ;; QueryTextExtents' odd_length is computed from the string's length.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (xcb::query-text-extents conn 5 (loop for c in '(65 66 67)
                                          collect (make-instance 'xcb::char2-b
                                                                 :byte1 0 :byte2 c)))
    (let ((o (written pipe)))
      (is (= 1 (aref o 1)))
      (is (= 4 (read-card16-at o 2 +LSB+)))
      (is (equalp #(0 65 0 66 0 67 0 0) (subseq o 8))))))

(deftest request-extension-header ()
  (multiple-value-bind (conn pipe) (make-test-connection)
    (setf (gethash "XCB-RENDER" (conn-extensions conn))
          (list :present t :major-opcode 139 :first-event 0 :first-error 140))
    (xcb-render::query-version conn 0 11)
    (is (equalp #(139 0 3 0  0 0 0 0  11 0 0 0) (written pipe))))
  (let ((conn (make-test-connection)))
    (setf (gethash "XCB-RENDER" (conn-extensions conn)) (list :present nil))
    (signals cl:error (xcb-render::query-version conn 0 11))))

;;; Replies, events and errors

(deftest reply-decoding ()
  (let ((o (geometry-reply-packet +MSB+ 9 #x123 640)))
    (multiple-value-bind (r pos) (xcb::decode-get-geometry-reply o 0 +MSB+)
      (is (= 32 pos))
      (is (typep r 'xcb:reply))
      (is (= #x123 (xcb::root r)))
      (is (= 640 (xcb::width r)))
      (is (= 24 (xcb::depth r)))
      (is (= 9 (xcb::sequence r))))))

(deftest replies-events-and-retention ()
  ;; Waiting for reply 2 reads past an event and reply 1 on the way:
  ;; the event is queued and reply 1 retained for its own READ-REPLY.
  (let* ((expose (let ((buf (make-buffer :byte-order +LSB+)))
                   (encode-event buf (make-instance 'xcb::expose
                                      :response-type 12 :sequence 1 :window 77
                                      :x 0 :y 0 :width 10 :height 10 :count 0))
                   (octets buf)))
         (conn (make-test-connection
                :packets (list expose
                               (geometry-reply-packet +LSB+ 1 100 10)
                               (geometry-reply-packet +LSB+ 2 200 20)))))
    (let ((c1 (xcb::get-geometry conn 5))
          (c2 (xcb::get-geometry conn 6)))
      (is (= 200 (xcb::root (xcb::get-geometry-reply conn c2))))
      (is (= 1 (length (conn-event-queue conn))))
      (is (gethash c1 (conn-pending-replies conn)))
      ;; The old calling convention: the reply class instead of a decoder.
      (is (= 100 (xcb::root (read-reply conn c1 'xcb::get-geometry-reply))))
      (is (null (gethash c1 (conn-pending-replies conn))))
      (let ((ev (poll-for-event conn)))
        (is (typep ev 'xcb::expose))
        (is (= 77 (xcb::window ev))))
      (is (null (poll-for-event conn))))))

(deftest error-for-cookie-is-signalled ()
  (let* ((err (packet +LSB+ '(buffer-write-card8 0) '(buffer-write-card8 3)
                      '(buffer-write-card16 1) '(buffer-write-card32 #xDEAD)
                      '(buffer-write-card16 0) '(buffer-write-card8 14)))
         (conn (make-test-connection :packets (list err))))
    (let ((cookie (xcb::get-geometry conn 1)))
      (handler-case (progn (xcb::get-geometry-reply conn cookie)
                           (is nil "no error signalled"))
        (xcb::protocol-error (e)
          (is (= 3 (xcb::protocol-error-code e)))
          (is (= #xDEAD (xcb::protocol-error-bad-value e)))
          (is (= 14 (xcb::protocol-error-major-opcode e)))
          ;; Window is an <errorcopy> of Value, decoded by Value's decoder.
          (is (typep (xcb::protocol-error-object e) 'xcb::window-error))
          (is (= #xDEAD (xcb::bad-value (xcb::protocol-error-object e)))))))))

(deftest unknown-event-comes-back-raw ()
  (let ((conn (make-test-connection :packets (list (packet +LSB+ '(buffer-write-card8 127))))))
    (let ((ev (wait-for-event conn)))
      (is (typep ev '(simple-array octet (*))))
      (is (= 127 (aref ev 0))))))

(deftest extension-event-dispatch ()
  ;; XFIXES' CursorNotify is its event 1; the server numbers it from
  ;; the extension's first-event.
  (let* ((ev (let ((buf (make-buffer :byte-order +LSB+)))
               (encode-event buf (make-instance 'xcb-xfixes::cursor-notify
                                  :response-type 88 :subtype 0 :sequence 0 :window 5
                                  :cursor-serial 17 :timestamp 0 :name 0))
               (octets buf)))
         (conn (make-test-connection :packets (list ev))))
    (setf (gethash "XCB-XFIXES" (conn-extensions conn))
          (list :present t :major-opcode 138 :first-event 87 :first-error 140))
    (let ((decoded (wait-for-event conn)))
      (is (typep decoded 'xcb-xfixes::cursor-notify))
      (is (= 17 (xcb-xfixes::cursor-serial decoded))))))

(deftest xge-event-dispatch ()
  ;; An XInput2 PropertyEvent (event_type 12) arrives as a GenericEvent
  ;; (35) naming the extension by its major opcode.
  (let* ((ev (packet +LSB+ '(buffer-write-card8 35) '(buffer-write-card8 131)
                     '(buffer-write-card16 4) '(buffer-write-card32 0)
                     '(buffer-write-card16 12) '(buffer-write-card16 2)
                     '(buffer-write-card32 1234) '(buffer-write-card32 300)
                     '(buffer-write-card8 1)))
         (conn (make-test-connection :packets (list ev))))
    (setf (gethash "XCB-INPUT" (conn-extensions conn))
          (list :present t :major-opcode 131 :first-event 66 :first-error 129))
    (let ((decoded (wait-for-event conn)))
      (is (typep decoded 'xcb-input::property))
      (is (= 2 (xcb-input::deviceid decoded)))
      (is (= 300 (slot-value decoded 'xcb-input::property)))
      (is (= 1 (xcb-input::what decoded))))))

(deftest send-request-with-a-request-object ()
  ;; The classic interface: fill in a request instance, send it.  A
  ;; switch field goes on the wire only if its slot is bound.
  (multiple-value-bind (conn pipe) (make-test-connection)
    (is (= 1 (send-request conn (make-instance 'xcb::create-gc-request
                                               :cid 7 :drawable 9
                                               :value-mask (logior xcb-const:+gc-foreground+
                                                                   xcb-const:+gc-background+)
                                               :foreground 1 :background 0))))
    (let ((o (written pipe)))
      (is (= 55 (aref o 0)))
      (is (= 6 (read-card16-at o 2 +LSB+)))
      (is (= 1 (read-card32-at o 16 +LSB+)))
      (is (= 0 (read-card32-at o 20 +LSB+))))))

(deftest reply-fds-are-claimed-in-order ()
  ;; Two DRI3 Open replies, each carrying one descriptor (NFD in byte 1).
  ;; The descriptors arrived together; each reply claims its own in
  ;; arrival order, and a retained reply keeps the one it claimed.
  (flet ((open-reply (sequence)
           (packet +LSB+ '(buffer-write-card8 1) '(buffer-write-card8 1)
                   `(buffer-write-card16 ,sequence) '(buffer-write-card32 0))))
    (let ((conn (make-test-connection :packets (list (open-reply 1) (open-reply 2)))))
      (setf (conn-received-fds conn) (list 10 11)
            (gethash 1 (xcb::conn-fd-reply-serials conn)) t
            (gethash 2 (xcb::conn-fd-reply-serials conn)) t)
      (is (= 11 (xcb-dri3::device-fd (read-reply conn 2 #'xcb-dri3::decode-open-reply))))
      (is (= 10 (xcb-dri3::device-fd (read-reply conn 1 'xcb-dri3::open-reply))))
      (is (null (conn-received-fds conn))))))

(deftest fds-need-a-socket ()
  ;; A connection over a plain stream cannot carry descriptors.
  (let ((conn (make-test-connection)))
    (setf (gethash "XCB-DRI3" (conn-extensions conn))
          (list :present t :major-opcode 149 :first-event 0 :first-error 0))
    (handler-case (progn (xcb-dri3::pixmap-from-buffer conn 1 2 16 2 2 8 24 32 3)
                         (is nil "no error signalled"))
      (cl:error (e) (is (search "file descriptors" (princ-to-string e)))))))

(deftest closed-connection-signals ()
  (let ((conn (make-test-connection)))
    (close-connection conn)
    (is (null (conn-raw-fd conn)))
    (handler-case (progn (xcb::get-input-focus conn)
                         (is nil "no error signalled"))
      (cl:error (e) (is (search "closed" (princ-to-string e)))))))

(deftest unknown-generic-event-decodes-as-ge-generic ()
  ;; A GenericEvent of an extension this connection never queried is
  ;; still decoded, by xproto's GeGeneric.
  (let ((conn (make-test-connection
               :packets (list (packet +LSB+ '(buffer-write-card8 35) '(buffer-write-card8 200)
                                      '(buffer-write-card16 1) '(buffer-write-card32 0)
                                      '(buffer-write-card16 7))))))
    (let ((ev (wait-for-event conn)))
      (is (typep ev 'xcb::ge-generic))
      (is (= 200 (xcb::extension ev))))))

(deftest extension-index-follows-new-extensions ()
  ;; Events of an extension learned after the first decode are found.
  (flet ((cursor-notify (code)
           (let ((buf (make-buffer :byte-order +LSB+)))
             (encode-event buf (make-instance 'xcb-xfixes::cursor-notify
                                              :response-type code :subtype 0 :sequence 0
                                              :window 5 :cursor-serial code
                                              :timestamp 0 :name 0))
             (octets buf))))
    (let ((conn (make-test-connection :packets (list (cursor-notify 88) (cursor-notify 98)))))
      (setf (gethash "XCB-XFIXES" (conn-extensions conn))
            (list :present t :major-opcode 138 :first-event 87 :first-error 140))
      (is (= 88 (xcb-xfixes::cursor-serial (wait-for-event conn))))
      ;; Pretend a second XFIXES-shaped extension arrived, based at 97.
      (setf (gethash "XCB-XFIXES2" (conn-extensions conn))
            (list :present t :major-opcode 139 :first-event 97 :first-error 150))
      (xcb:register-extension-event-decoder "XCB-XFIXES2" 1 #'xcb-xfixes::decode-cursor-notify)
      (unwind-protect
           (is (= 98 (xcb-xfixes::cursor-serial (wait-for-event conn))))
        (remhash (cons "XCB-XFIXES2" 1) xcb::*extension-event-decoders*)))))

(deftest event-queue-fifo ()
  (let ((conn (make-test-connection)))
    (setf (conn-event-queue conn) (list :event-1 :event-2))
    (is (eq :event-1 (poll-for-event conn)))
    (is (eq :event-2 (poll-for-event conn)))
    (is (null (poll-for-event conn)))))

;;; A real server

(deftest live-round-trip ()
  (if (not (uiop:getenv "DISPLAY"))
      (skip)
      (with-x-connection (conn)
        (let ((id1 (generate-id conn))
              (id2 (generate-id conn)))
          (is (/= id1 id2)))
        (let ((atom-id (intern-atom-id conn "WM_NAME")))
          (is (plusp atom-id))
          (is (string= "WM_NAME" (atom-name conn atom-id)))
          (is (= atom-id (intern-atom-id conn "WM_NAME"))))
        (let* ((root (root-window conn))
               (reply (xcb::get-geometry-reply conn (xcb::get-geometry conn root))))
          (is (= root (xcb::root reply)))
          (is (plusp (xcb::width reply)))
          (is (plusp (xcb::depth reply))))
        (let ((screen (first (conn-roots conn))))
          (is (plusp (width-in-pixels screen)))
          (is (find-root-visual screen))))))

(deftest live-big-request ()
  ;; A 300,000-byte ChangeProperty is longer than 256 KiB, the most a
  ;; request can say in its 16-bit length: it goes out in the
  ;; BIG-REQUESTS form, which FLUSH-REQUEST enables on first use, and the
  ;; server stores all of it.
  (if (not (uiop:getenv "DISPLAY"))
      (skip)
      (with-x-connection (conn)
        (let* ((screen (first (conn-roots conn)))
               (window (generate-id conn))
               (property (intern-atom-id conn "CLXCB_BIG_REQUEST_TEST"))
               (data (make-array 300000 :element-type 'octet :initial-element 7)))
          (xcb::create-window conn 0 window (xcb:root screen) 0 0 10 10 0 1 0 0)
          (xcb::change-property conn 0 window property 31 8 (length data) data)
          (let ((reply (xcb::get-property-reply
                        conn (xcb::get-property conn 0 window property 0 0 100000))))
            (is (= 300000 (xcb::value-len reply)))
            (is (every (lambda (b) (= b 7)) (xcb::value reply))))
          (is (> (conn-maximum-request-length conn) #xFFFF)
              "CONN-MAXIMUM-REQUEST-LENGTH does not report the BIG-REQUESTS maximum")))))

(deftest live-xid-range-refill ()
  ;; Once the XID range the server handed out is used up, GENERATE-ID
  ;; asks XC-MISC for a new one, and the XIDs it then gives are ones the
  ;; server accepts (no BadIDChoice).
  (if (not (uiop:getenv "DISPLAY"))
      (skip)
      (with-x-connection (conn)
        (unless (extension-present-p conn "XCB-XCMISC")
          (skip))
        (let ((screen (first (conn-roots conn))))
          (generate-id conn)            ; seeds the range from the setup
          ;; Pretend the whole range is used up.
          (setf (xcb::conn-resource-id-next conn) (xcb::conn-resource-id-max conn))
          (let* ((id (generate-id conn))
                 (cookie (xcb::create-window conn 0 id (xcb:root screen)
                                             0 0 10 10 0 1 0 0)))
            (is (/= id (logior (xcb::conn-resource-id-max conn) (xcb::conn-resource-id-base conn)))
                "GENERATE-ID did not move to a new range")
            (is (null (request-check conn cookie))
                "the server refused an XID from the new range")
            ;; And the new range goes on handing out usable XIDs.
            (let* ((next (generate-id conn))
                   (cookie2 (xcb::create-window conn 0 next (xcb:root screen)
                                                0 0 10 10 0 1 0 0)))
              (is (/= next id))
              (is (null (request-check conn cookie2)))))))))

(deftest oversized-packet-closes-the-connection ()
  ;; A reply claiming a length no server sends closes the connection,
  ;; as in libxcb, instead of growing the input buffer to fit it.
  (let* ((packet (make-array 32 :element-type 'octet :initial-element 0))
         (conn (progn
                 (setf (aref packet 0) 1          ; a reply
                       (aref packet 4) #xff (aref packet 5) #xff
                       (aref packet 6) #xff (aref packet 7) #x7f)
                 (make-test-connection :packets (list packet)))))
    (signals connection-closed (wait-for-event conn))
    (is (< (length (xcb::%conn-in-buffer conn)) (* 1024 1024))
        "the input buffer grew to fit the claimed length")))
