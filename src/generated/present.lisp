;;; Generated from present.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-PRESENT
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:capabilities
   #:complete-notify
   #:configure-notify
   #:decode-complete-notify
   #:decode-configure-notify
   #:decode-generic
   #:decode-idle-notify
   #:decode-notify
   #:decode-query-capabilities-reply
   #:decode-query-version-reply
   #:decode-redirect-notify
   #:divisor
   #:encode-generic
   #:encode-notify
   #:event
   #:event-type
   #:event-window
   #:evtype
   #:extension
   #:generic
   #:height
   #:idle-fence
   #:idle-notify
   #:kind
   #:length
   #:major-version
   #:minor-version
   #:mode
   #:msc
   #:notifies
   #:notify
   #:notify-msc
   #:notify-msc-request
   #:off-x
   #:off-y
   #:options
   #:pixmap
   #:pixmap-flags
   #:pixmap-height
   #:pixmap-request
   #:pixmap-width
   #:query-capabilities
   #:query-capabilities-reply
   #:query-capabilities-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:redirect-notify
   #:remainder
   #:response-type
   #:select-input
   #:select-input-request
   #:sequence
   #:serial
   #:target-crtc
   #:target-msc
   #:update-rect
   #:update-region
   #:update-window
   #:ust
   #:valid-rect
   #:valid-region
   #:wait-fence
   #:width
   #:window
   #:x
   #:x-off
   #:y
   #:y-off))

(in-package #:XCB-PRESENT)

(xcb:register-extension-xname "XCB-PRESENT" "Present")

;;; Enum xcb.Present.Event
(xcb:defenum present-event
  (:configure-notify 0)
  (:complete-notify 1)
  (:idle-notify 2)
  (:redirect-notify 3))

;;; Enum xcb.Present.EventMask
(xcb:defenum present-event-mask
  (:no-event 0)
  (:configure-notify 1)
  (:complete-notify 2)
  (:idle-notify 4)
  (:redirect-notify 8))

;;; Enum xcb.Present.Option
(xcb:defenum present-option
  (:none 0)
  (:async 1)
  (:copy 2)
  (:ust 4)
  (:suboptimal 8)
  (:async-may-tear 16))

;;; Enum xcb.Present.Capability
(xcb:defenum present-capability
  (:none 0)
  (:async 1)
  (:fence 2)
  (:ust 4)
  (:async-may-tear 8))

;;; Enum xcb.Present.CompleteKind
(xcb:defenum present-complete-kind
  (:pixmap 0)
  (:notify-msc 1))

;;; Enum xcb.Present.CompleteMode
(xcb:defenum present-complete-mode
  (:copy 0)
  (:flip 1)
  (:skip 2)
  (:suboptimal-copy 3))

;;; xcb.Present.Notify
(defclass notify nil
          ((window :initarg :window :accessor window :type xcb:window)
           (serial :initarg :serial :accessor serial :type (unsigned-byte 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((window (slot-value %obj 'window)) (serial (slot-value %obj 'serial)))
    (declare (ignorable window serial))
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf serial)))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) window serial)
    (declare (ignorable %p window serial))
    (setf window (xcb:read-card32-at %buf %p %order))
    (setf serial (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'notify :window window :serial serial) (+ %p 8))))

;;; Request xcb.Present.QueryVersion
(defun query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-PRESENT"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf major-version)
    (xcb:buffer-write-card32 %buf minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 32))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Present.Pixmap
(defun pixmap
       (conn window pixmap serial valid update x-off y-off target-crtc wait-fence idle-fence
        options target-msc divisor remainder notifies)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-PRESENT"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-write-card32 %buf serial)
    (xcb:buffer-write-card32 %buf valid)
    (xcb:buffer-write-card32 %buf update)
    (xcb:buffer-write-card16 %buf x-off)
    (xcb:buffer-write-card16 %buf y-off)
    (xcb:buffer-write-card32 %buf target-crtc)
    (xcb:buffer-write-card32 %buf wait-fence)
    (xcb:buffer-write-card32 %buf idle-fence)
    (xcb:buffer-write-card32 %buf options)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-card64 %buf target-msc)
    (xcb:buffer-write-card64 %buf divisor)
    (xcb:buffer-write-card64 %buf remainder)
    (xcb:buffer-write-list %buf notifies nil #'encode-notify)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass pixmap-request (xcb:request)
          ((window :initarg :window :type xcb:window) (pixmap :initarg :pixmap :type xcb:pixmap)
           (serial :initarg :serial :type (unsigned-byte 32))
           (valid :initarg :valid :type xcb-xfixes:region)
           (update :initarg :update :type xcb-xfixes:region)
           (x-off :initarg :x-off :type (signed-byte 16))
           (y-off :initarg :y-off :type (signed-byte 16))
           (target-crtc :initarg :target-crtc :type xcb-randr:crtc)
           (wait-fence :initarg :wait-fence :type xcb-sync:fence)
           (idle-fence :initarg :idle-fence :type xcb-sync:fence)
           (options :initarg :options :type (unsigned-byte 32))
           (target-msc :initarg :target-msc :type (unsigned-byte 64))
           (divisor :initarg :divisor :type (unsigned-byte 64))
           (remainder :initarg :remainder :type (unsigned-byte 64))
           (notifies :initarg :notifies :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj pixmap-request))
  (pixmap conn (slot-value %obj 'window) (slot-value %obj 'pixmap) (slot-value %obj 'serial)
   (slot-value %obj 'valid) (slot-value %obj 'update) (slot-value %obj 'x-off)
   (slot-value %obj 'y-off) (slot-value %obj 'target-crtc) (slot-value %obj 'wait-fence)
   (slot-value %obj 'idle-fence) (slot-value %obj 'options) (slot-value %obj 'target-msc)
   (slot-value %obj 'divisor) (slot-value %obj 'remainder) (slot-value %obj 'notifies)))

;;; Request xcb.Present.NotifyMSC
(defun notify-msc (conn window serial target-msc divisor remainder)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-PRESENT"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf serial)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-card64 %buf target-msc)
    (xcb:buffer-write-card64 %buf divisor)
    (xcb:buffer-write-card64 %buf remainder)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass notify-msc-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (serial :initarg :serial :type (unsigned-byte 32))
           (target-msc :initarg :target-msc :type (unsigned-byte 64))
           (divisor :initarg :divisor :type (unsigned-byte 64))
           (remainder :initarg :remainder :type (unsigned-byte 64))))
(defmethod xcb:send-request (conn (%obj notify-msc-request))
  (notify-msc conn (slot-value %obj 'window) (slot-value %obj 'serial)
   (slot-value %obj 'target-msc) (slot-value %obj 'divisor) (slot-value %obj 'remainder)))
(deftype event () '(unsigned-byte 32))

;;; Request xcb.Present.SelectInput
(defun select-input (conn eid window event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-PRESENT"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf eid)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-input-request (xcb:request)
          ((eid :initarg :eid :type event) (window :initarg :window :type xcb:window)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'eid) (slot-value %obj 'window)
   (slot-value %obj 'event-mask)))

;;; Request xcb.Present.QueryCapabilities
(defun query-capabilities (conn target)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-PRESENT"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf target)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-capabilities-request (xcb:request-with-reply)
          ((target :initarg :target :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-capabilities-request))
  (query-capabilities conn (slot-value %obj 'target)))
(defclass query-capabilities-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (capabilities :initarg :capabilities :accessor capabilities :type (unsigned-byte 32))))
(defun decode-query-capabilities-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length capabilities)
    (declare (ignorable %p response-type sequence length capabilities))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf capabilities (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'query-capabilities-reply :response-type response-type :sequence sequence
                    :length length :capabilities capabilities)
     (+ %pos 32 (* 4 length)))))
(defun query-capabilities-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-capabilities-reply))

;;; Event xcb.Present.Generic (0)
(defclass generic (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (evtype :initarg :evtype :accessor evtype :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type event)))
(defun decode-generic (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type extension sequence length evtype event)
    (declare (ignorable %p response-type extension sequence length evtype event))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf evtype (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'generic :response-type response-type :extension extension :sequence sequence
                    :length length :evtype evtype :event event)
     (+ %pos 32))))
(defun encode-generic (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (extension (slot-value %obj 'extension))
         (sequence (slot-value %obj 'sequence))
         (length (slot-value %obj 'length))
         (evtype (slot-value %obj 'evtype))
         (event (slot-value %obj 'event)))
    (declare (ignorable response-type extension sequence length evtype event))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf extension)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf length)
    (xcb:buffer-write-card16 %buf evtype)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf event)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj generic)) (encode-generic %buf %obj))
(xcb:register-extension-event-decoder "XCB-PRESENT" 0 #'decode-generic)

;;; Event xcb.Present.ConfigureNotify (0)
(defclass configure-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type event)
           (window :initarg :window :accessor window :type xcb:window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (off-x :initarg :off-x :accessor off-x :type (signed-byte 16))
           (off-y :initarg :off-y :accessor off-y :type (signed-byte 16))
           (pixmap-width :initarg :pixmap-width :accessor pixmap-width :type (unsigned-byte 16))
           (pixmap-height :initarg :pixmap-height :accessor pixmap-height :type (unsigned-byte 16))
           (pixmap-flags :initarg :pixmap-flags :accessor pixmap-flags :type (unsigned-byte 32))))
(defun decode-configure-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        event
        window
        x
        y
        width
        height
        off-x
        off-y
        pixmap-width
        pixmap-height
        pixmap-flags)
    (declare
     (ignorable %p response-type extension sequence length event-type event window x y width height
      off-x off-y pixmap-width pixmap-height pixmap-flags))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 20) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 22) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf off-x (xcb:read-int16-at %buf (+ %p 28) %order))
    (setf off-y (xcb:read-int16-at %buf (+ %p 30) %order))
    (setf pixmap-width (xcb:read-card16-at %buf (+ %p 32) %order))
    (setf pixmap-height (xcb:read-card16-at %buf (+ %p 34) %order))
    (setf pixmap-flags (xcb:read-card32-at %buf (+ %p 36) %order))
    (values
     (make-instance 'configure-notify :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :event event :window window :x x
                    :y y :width width :height height :off-x off-x :off-y off-y :pixmap-width
                    pixmap-width :pixmap-height pixmap-height :pixmap-flags pixmap-flags)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-PRESENT" 0 #'decode-configure-notify)

;;; Event xcb.Present.CompleteNotify (1)
(defclass complete-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (kind :initarg :kind :accessor kind :type (unsigned-byte 8))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (event :initarg :event :accessor event :type event)
           (window :initarg :window :accessor window :type xcb:window)
           (serial :initarg :serial :accessor serial :type (unsigned-byte 32))
           (ust :initarg :ust :accessor ust :type (unsigned-byte 64))
           (msc :initarg :msc :accessor msc :type (unsigned-byte 64))))
(defun decode-complete-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        kind
        mode
        event
        window
        serial
        ust
        msc)
    (declare
     (ignorable %p response-type extension sequence length event-type kind mode event window serial
      ust msc))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf kind (xcb:read-card8-at %buf (+ %p 10)))
    (setf mode (xcb:read-card8-at %buf (+ %p 11)))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf serial (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf ust (xcb:read-card64-at %buf (+ %p 24) %order))
    (setf msc (xcb:read-card64-at %buf (+ %p 32) %order))
    (values
     (make-instance 'complete-notify :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :kind kind :mode mode :event
                    event :window window :serial serial :ust ust :msc msc)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-PRESENT" 1 #'decode-complete-notify)

;;; Event xcb.Present.IdleNotify (2)
(defclass idle-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type event)
           (window :initarg :window :accessor window :type xcb:window)
           (serial :initarg :serial :accessor serial :type (unsigned-byte 32))
           (pixmap :initarg :pixmap :type xcb:pixmap)
           (idle-fence :initarg :idle-fence :accessor idle-fence :type xcb-sync:fence)))
(defun decode-idle-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        event
        window
        serial
        pixmap
        idle-fence)
    (declare
     (ignorable %p response-type extension sequence length event-type event window serial pixmap
      idle-fence))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf serial (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf pixmap (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf idle-fence (xcb:read-card32-at %buf (+ %p 28) %order))
    (values
     (make-instance 'idle-notify :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :event event :window window
                    :serial serial :pixmap pixmap :idle-fence idle-fence)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-PRESENT" 2 #'decode-idle-notify)

;;; Event xcb.Present.RedirectNotify (3)
(defclass redirect-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (update-window :initarg :update-window :accessor update-window :type
            (or boolean (unsigned-byte 8)))
           (event :initarg :event :accessor event :type event)
           (event-window :initarg :event-window :accessor event-window :type xcb:window)
           (window :initarg :window :accessor window :type xcb:window)
           (pixmap :initarg :pixmap :type xcb:pixmap)
           (serial :initarg :serial :accessor serial :type (unsigned-byte 32))
           (valid-region :initarg :valid-region :accessor valid-region :type xcb-xfixes:region)
           (update-region :initarg :update-region :accessor update-region :type xcb-xfixes:region)
           (valid-rect :initarg :valid-rect :accessor valid-rect :type xcb:rectangle)
           (update-rect :initarg :update-rect :accessor update-rect :type xcb:rectangle)
           (x-off :initarg :x-off :accessor x-off :type (signed-byte 16))
           (y-off :initarg :y-off :accessor y-off :type (signed-byte 16))
           (target-crtc :initarg :target-crtc :accessor target-crtc :type xcb-randr:crtc)
           (wait-fence :initarg :wait-fence :accessor wait-fence :type xcb-sync:fence)
           (idle-fence :initarg :idle-fence :accessor idle-fence :type xcb-sync:fence)
           (options :initarg :options :accessor options :type (unsigned-byte 32))
           (target-msc :initarg :target-msc :accessor target-msc :type (unsigned-byte 64))
           (divisor :initarg :divisor :accessor divisor :type (unsigned-byte 64))
           (remainder :initarg :remainder :accessor remainder :type (unsigned-byte 64))
           (notifies :initarg :notifies :accessor notifies :type cl:sequence)))
(defun decode-redirect-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        update-window
        event
        event-window
        window
        pixmap
        serial
        valid-region
        update-region
        valid-rect
        update-rect
        x-off
        y-off
        target-crtc
        wait-fence
        idle-fence
        options
        target-msc
        divisor
        remainder
        notifies)
    (declare
     (ignorable %p response-type extension sequence length event-type update-window event
      event-window window pixmap serial valid-region update-region valid-rect update-rect x-off
      y-off target-crtc wait-fence idle-fence options target-msc divisor remainder notifies))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf update-window (xcb:read-card8-at %buf (+ %p 10)))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf event-window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf pixmap (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf serial (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf valid-region (xcb:read-card32-at %buf (+ %p 32) %order))
    (setf update-region (xcb:read-card32-at %buf (+ %p 36) %order))
    (setf valid-rect (xcb:decode-rectangle %buf (+ %p 40) %order))
    (setf update-rect (xcb:decode-rectangle %buf (+ %p 48) %order))
    (setf x-off (xcb:read-int16-at %buf (+ %p 56) %order))
    (setf y-off (xcb:read-int16-at %buf (+ %p 58) %order))
    (setf target-crtc (xcb:read-card32-at %buf (+ %p 60) %order))
    (setf wait-fence (xcb:read-card32-at %buf (+ %p 64) %order))
    (setf idle-fence (xcb:read-card32-at %buf (+ %p 68) %order))
    (setf options (xcb:read-card32-at %buf (+ %p 72) %order))
    (setf target-msc (xcb:read-card64-at %buf (+ %p 80) %order))
    (setf divisor (xcb:read-card64-at %buf (+ %p 88) %order))
    (setf remainder (xcb:read-card64-at %buf (+ %p 96) %order))
    (setf %p (+ %p 104))
    (multiple-value-setq (notifies %p)
      (xcb:read-struct-vector-at %buf %p (floor (- (+ %pos 32 (* 4 length)) %p) 8) %order
       #'decode-notify))
    (values
     (make-instance 'redirect-notify :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :update-window update-window
                    :event event :event-window event-window :window window :pixmap pixmap :serial
                    serial :valid-region valid-region :update-region update-region :valid-rect
                    valid-rect :update-rect update-rect :x-off x-off :y-off y-off :target-crtc
                    target-crtc :wait-fence wait-fence :idle-fence idle-fence :options options
                    :target-msc target-msc :divisor divisor :remainder remainder :notifies
                    notifies)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-PRESENT" 3 #'decode-redirect-notify)
