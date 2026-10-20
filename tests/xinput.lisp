;;; tests/xinput.lisp — the XInput 2 helpers (src/xinput-util.lisp).
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; The first tests need no server.  The XI2-LIVE- ones talk to the X
;;; server named by $DISPLAY and are skipped when there is none or it
;;; lacks XInput.

(in-package #:xcb/tests)

;;; Fixed point

(deftest fp3232-conversions ()
  (let ((fp (make-instance 'xcb-input::fp3232 :integral -2 :frac (expt 2 31))))
    (is (= -1.5d0 (xcb-input:fp3232->double fp))))
  (dolist (x '(0 1 -1 1.25d0 -3.75d0 1234.0078125d0))
    (is (= x (xcb-input:fp3232->double (xcb-input:double->fp3232 x)))))
  (let ((fp (xcb-input:double->fp3232 -0.25d0)))
    (is (= -1 (xcb-input::integral fp)))
    (is (= (* 3 (expt 2 30)) (xcb-input::frac fp))))
  (is (= 1.5d0 (xcb-input:fp1616->double #x18000)))
  (is (= -98304 (xcb-input:double->fp1616 -1.5d0))))

;;; Event masks

(deftest xi-event-mask-building ()
  (let ((m (xcb-input:make-xi-event-mask :deviceid 3 :events '(:key-press :raw-motion))))
    (is (= 3 (xcb-input::deviceid m)))
    (is (equal (list (logior 4 131072)) (xcb-input::mask m)))
    (is (= 1 (xcb-input::mask-len m)))
    (is (equal '(:key-press :raw-motion) (xcb-input:xi-event-mask-events m))))
  ;; A mask wider than 32 bits is split into words, least significant
  ;; first; bits no keyword names come back as the second value.
  (let ((m (xcb-input:make-xi-event-mask :events (list :motion (ash 1 40)))))
    (is (equal (list 64 256) (xcb-input::mask m)))
    (is (= 2 (xcb-input::mask-len m)))
    (multiple-value-bind (keys others) (xcb-input:xi-event-mask-events m)
      (is (equal '(:motion) keys))
      (is (= (ash 1 40) others))))
  ;; An empty selection is still one (zero) word.
  (is (equal '(0) (xcb-input::mask (xcb-input:make-xi-event-mask))))
  (signals cl:error (xcb-input:make-xi-event-mask :events '(:no-such-event))))

;;; Device classes

(deftest xi-device-class-walkers ()
  (flet ((device-class (type &rest initargs)
           (apply #'make-instance 'xcb-input::device-class :type type initargs)))
    (let ((info (make-instance 'xcb-input::xi-device-info
                               :classes (vector (device-class 1)
                                                (device-class 2 :valuator-number 3)
                                                (device-class 2 :valuator-number 0)
                                                (device-class 3 :scroll-number 3)
                                                (device-class 8)))))
      ;; Sorted by axis number, not wire order.
      (is (equal '(0 3) (mapcar (lambda (c) (slot-value c 'xcb-input::valuator-number))
                                (xcb-input:xi-device-valuators info))))
      (is (= 1 (length (xcb-input:xi-device-scroll-axes info))))
      (is (= 1 (length (xcb-input:xi-device-touch-classes info))))
      (is (= 1 (length (xcb-input:xi-device-classes info :button))))
      (is (= 1 (length (xcb-input:xi-device-classes info 1))))
      (is (null (xcb-input:xi-device-classes info :key))))))

(deftest xi-valuator-range-as-doubles ()
  (let ((v (make-instance 'xcb-input::device-class
                          :type 2 :valuator-number 0
                          :valuator-min (xcb-input:double->fp3232 -1)
                          :valuator-max (xcb-input:double->fp3232 2559.5d0)
                          :valuator-value (xcb-input:double->fp3232 100.25d0)
                          :valuator-resolution 10000 :valuator-mode 1)))
    (is (equal '(-1d0 2559.5d0 100.25d0 10000 :absolute)
               (multiple-value-list (xcb-input:xi-valuator-range v))))))

(deftest xi-positions-as-doubles ()
  ;; XI2 events and the XIQueryPointer reply carry FP1616 coordinates...
  (let ((ev (make-instance 'xcb-input::motion :root-x #x18000 :root-y #x-8000
                                              :event-x #x10000 :event-y 0)))
    (is (equal '(1.5d0 -0.5d0) (multiple-value-list (xcb-input:xi-root-position ev))))
    (is (equal '(1d0 0d0) (multiple-value-list (xcb-input:xi-window-position ev)))))
  (let ((r (make-instance 'xcb-input::xi-query-pointer-reply :root-x #x20000 :root-y 0
                                                             :win-x #x28000 :win-y #x8000)))
    (is (equal '(2.5d0 0.5d0) (multiple-value-list (xcb-input:xi-window-position r)))))
  ;; ... XI 1.x events whole pixels.
  (let ((ev (make-instance 'xcb-input::device-motion-notify :root-x 10 :root-y 20
                                                            :event-x 3 :event-y 4)))
    (is (equal '(10d0 20d0) (multiple-value-list (xcb-input:xi-root-position ev)))))
  (signals cl:error (xcb-input:xi-root-position (make-instance 'xcb-input::property))))

(deftest xi-property-data-follows-format ()
  (let ((r (make-instance 'xcb-input::xi-get-property-reply :format 16 :data16 #(1 2))))
    (is (equalp #(1 2) (xcb-input:xi-property-data r))))
  (is (null (xcb-input:xi-property-data
             (make-instance 'xcb-input::xi-get-property-reply :format 0)))))

(deftest fixed-point-range-checks ()
  (signals cl:error (xcb-input:double->fp3232 (expt 2d0 31)))
  (is (= (- (expt 2 31)) (xcb-input::integral (xcb-input:double->fp3232 (- (expt 2d0 31))))))
  (signals cl:error (xcb-input:double->fp1616 40000))
  (is (= (- (expt 2 31)) (xcb-input:double->fp1616 -32768))))

;;; Sending events

(defun xinput-test-connection ()
  (multiple-value-bind (conn pipe) (make-test-connection)
    (setf (gethash "XCB-INPUT" (conn-extensions conn))
          (list :present t :major-opcode 131 :first-event 66 :first-error 129))
    (values conn pipe)))

(deftest send-xi-event-encodes-xi1-events ()
  ;; DeviceKeyPress, an XI 1.x event, goes into SendExtensionEvent as its
  ;; 32 wire bytes, followed by the event classes.
  (multiple-value-bind (conn pipe) (xinput-test-connection)
    (let* ((wire (let ((b (make-buffer :byte-order +LSB+)))
                   (buffer-write-card8 b 67)                  ; DeviceKeyPress: first-event + 1
                   (buffer-write-card8 b 38)                  ; detail
                   (buffer-write-padding b 30)
                   (octets b)))
           (event (xcb-input::decode-device-key-press wire 0 +LSB+))
           (expected (let ((b (make-buffer :byte-order +LSB+)))
                       (encode-event b event)
                       (octets b))))
      (is (= 1 (xcb-input:send-xi-event conn 77 event :device-id 5 :classes '(#x1234))))
      (let ((o (written pipe)))
        (is (= 131 (aref o 0)))                               ; XInput's major opcode
        (is (= 31 (aref o 1)))                                ; SendExtensionEvent
        (is (= (length o) (* 4 (read-card16-at o 2 +LSB+))))
        (is (= 77 (read-card32-at o 4 +LSB+)))                ; destination
        (is (= 5 (aref o 8)))                                 ; device
        (is (equalp expected (subseq o (- (length o) 36) (- (length o) 4))))
        (is (= #x1234 (read-card32-at o (- (length o) 4) +LSB+)))))))

(deftest send-xi-event-refuses-xi2-events ()
  (let ((conn (xinput-test-connection)))
    (handler-case (progn (xcb-input:send-xi-event conn 1 (make-instance 'xcb-input::property))
                         (is nil "no error signalled"))
      (cl:error (e) (is (search "Generic Events" (princ-to-string e)))))))

;;; Selection and grabs, against canned replies

(defun xi2-test-connection (&rest packets)
  "A test connection with XInput known and XI 2.4 already negotiated,
   reading PACKETS."
  (multiple-value-bind (conn pipe) (make-test-connection :packets packets)
    (setf (gethash "XCB-INPUT" (conn-extensions conn))
          (list :present t :major-opcode 131 :first-event 66 :first-error 129)
          (conn-xi2-version conn) (cons 2 4))
    (values conn pipe)))

(defun reply-packet (sequence &rest writes)
  (apply #'packet +LSB+ '(buffer-write-card8 1) '(buffer-write-card8 0)
         `(buffer-write-card16 ,sequence) '(buffer-write-card32 0) writes))

(deftest select-xi-events-on-several-devices ()
  (multiple-value-bind (conn pipe) (xi2-test-connection)
    (xcb-input:select-xi-events conn 99 '(:key-press) :deviceid '(4 5))
    (let ((o (written pipe)))
      (is (= 46 (aref o 1)))                                 ; XISelectEvents
      (is (= 99 (read-card32-at o 4 +LSB+)))                 ; window
      (is (= 2 (read-card16-at o 8 +LSB+)))                  ; num_mask
      ;; Two EventMasks: deviceid, mask_len 1, one mask word each.
      (is (equal '(4 1 4 5 1 4)
                 (list (read-card16-at o 12 +LSB+) (read-card16-at o 14 +LSB+)
                       (read-card32-at o 16 +LSB+)
                       (read-card16-at o 20 +LSB+) (read-card16-at o 22 +LSB+)
                       (read-card32-at o 24 +LSB+)))))))

(deftest grab-xi-device-request-and-status ()
  ;; The reply's status byte (offset 8) is 1: AlreadyGrabbed.
  (multiple-value-bind (conn pipe)
      (xi2-test-connection (reply-packet 1 '(buffer-write-card8 1)))
    (is (eq :already-grabbed
            (xcb-input:grab-xi-device conn 77 2 '(:button-press :motion)
                                      :mode :sync :owner-events t)))
    (let ((o (written pipe)))
      (is (= 131 (aref o 0)))
      (is (= 51 (aref o 1)))                                 ; XIGrabDevice
      (is (= 77 (read-card32-at o 4 +LSB+)))                 ; window
      (is (= 2 (read-card16-at o 16 +LSB+)))                 ; deviceid
      (is (= 0 (aref o 18)))                                 ; mode :sync
      (is (= 1 (aref o 19)))                                 ; paired mode :async
      (is (= 1 (aref o 20)))                                 ; owner_events
      (is (= 1 (read-card16-at o 22 +LSB+)))                 ; mask_len
      (is (= (logior 16 64) (read-card32-at o 24 +LSB+))))))

(deftest passive-grab-xi-device-reports-failures ()
  ;; One modifier state failed: GrabModifierInfo (modifiers, status 1).
  (multiple-value-bind (conn pipe)
      (xi2-test-connection
       (let ((b (make-buffer :byte-order +LSB+)))
         (buffer-write-card8 b 1) (buffer-write-card8 b 0)
         (buffer-write-card16 b 1) (buffer-write-card32 b 2)       ; 8 extra bytes
         (buffer-write-card16 b 1) (buffer-write-padding b 22)     ; num_modifiers
         (buffer-write-card32 b 4) (buffer-write-card8 b 1)        ; the failure
         (buffer-write-padding b 3)
         (octets b)))
    (is (equal '((4 . :already-grabbed))
               (xcb-input:passive-grab-xi-device conn 77 2 :button 3 '(:button-press)
                                                 :modifiers '(4 :any))))
    (let ((o (written pipe)))
      (is (= 54 (aref o 1)))                                 ; XIPassiveGrabDevice
      ;; The two modifier states close the request.
      (is (equal (list 4 #x80000000)
                 (list (read-card32-at o (- (length o) 8) +LSB+)
                       (read-card32-at o (- (length o) 4) +LSB+)))))))

(deftest missing-extension-signals-before-sending ()
  (multiple-value-bind (conn pipe) (make-test-connection)
    (setf (gethash "XCB-INPUT" (conn-extensions conn)) (list :present nil))
    (handler-case (progn (xcb-input:ensure-xi2-version conn)
                         (is nil "no error signalled"))
      (extension-not-present (e)
        (is (equal "XCB-INPUT" (extension-not-present-extension e)))))
    (is (zerop (length (written pipe))))
    (is (not (extension-present-p conn "XCB-INPUT")))))

;;; Against a server

(defmacro with-xinput-connection ((conn) &body body)
  `(if (not (uiop:getenv "DISPLAY"))
       (skip)
       (with-x-connection (,conn)
         (if (not (getf (ensure-extension ,conn "XCB-INPUT") :present))
             (skip)
             (progn ,@body)))))

(deftest xi2-live-version-is-negotiated-once ()
  (with-xinput-connection (conn)
    (is (null (xcb-input:xi2-version conn)))
    (multiple-value-bind (major minor) (xcb-input:ensure-xi2-version conn)
      (is (= 2 major))
      (is (<= 0 minor 4))
      (is (equal (cons major minor) (xcb-input:xi2-version conn)))
      ;; The second call is answered from the cache: no request is sent.
      (let ((serial (conn-next-serial conn)))
        (is (equal (list major minor)
                   (multiple-value-list (xcb-input:ensure-xi2-version conn 2 0))))
        (is (= serial (conn-next-serial conn)))))))

(deftest xi2-live-device-classes ()
  (with-xinput-connection (conn)
    (xcb-input:ensure-xi2-version conn)
    (let* ((devices (coerce (xcb-input::infos (xcb-input::xi-query-device-reply
                                               conn (xcb-input::xi-query-device conn 0)))
                            'list))
           (pointer (find 2 devices :key #'xcb-input::deviceid))    ; Virtual core pointer
           (keyboard (find 3 devices :key #'xcb-input::deviceid)))  ; Virtual core keyboard
      (is pointer)
      (is keyboard)
      (let ((valuators (xcb-input:xi-device-valuators pointer)))
        (is (plusp (length valuators)))
        ;; The valuators are numbered 0, 1, ... and their ranges are
        ;; fixed-point numbers.
        (is (equal (loop for i below (length valuators) collect i)
                   (mapcar (lambda (v) (slot-value v 'xcb-input::valuator-number))
                           valuators)))
        (is (every (lambda (v)
                     (typep (xcb-input:fp3232->double
                             (slot-value v 'xcb-input::valuator-max))
                            'double-float))
                   valuators)))
      (let ((keys (xcb-input:xi-device-classes keyboard :key)))
        (is (= 1 (length keys)))
        (is (= (1+ (- (conn-max-keycode conn) (conn-min-keycode conn)))
               (slot-value (first keys) 'xcb-input::key-num-keys)))))))

(deftest xi2-live-select-and-receive ()
  ;; Select XI2 property events on the root window through the helpers,
  ;; read the selection back with XIGetSelectedEvents, then change a
  ;; property of the virtual core pointer and receive the Generic Event.
  (with-xinput-connection (conn)
    (let ((root (root-window conn))
          (prop (intern-atom-id conn "CLXCB_XI2_TEST_PROPERTY")))
      (xcb-input:select-xi-events conn root '(:property) :deviceid 2)
      (let* ((reply (xcb-input::xi-get-selected-events-reply
                     conn (xcb-input::xi-get-selected-events conn root)))
             (mask (find 2 (coerce (xcb-input::masks reply) 'list)
                         :key #'xcb-input::deviceid)))
        (is mask)
        (is (equal '(:property) (and mask (xcb-input:xi-event-mask-events mask)))))
      (xcb-input::xi-change-property conn 2 0 32 prop xcb-const:+atom-integer+ 1
                                     :data32 (list 42))
      (unwind-protect
           (let ((event (loop repeat 100
                              for ev = (wait-for-event conn)
                              when (typep ev 'xcb-input::property) return ev)))
             (is (typep event 'xcb:event))
             (is (= 2 (xcb-input::deviceid event)))
             (is (= prop (slot-value event 'xcb-input::property))))
        (xcb-input::xi-delete-property conn 2 prop)
        (xcb-input:select-xi-events conn root '() :deviceid 2)))))
