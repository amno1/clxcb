;;; Generated from dri2.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-DRI2
  (:use #:cl)
  (:shadow #:COUNT #:FORMAT #:LENGTH #:SEQUENCE)
  (:export
   #:alignment-pad
   #:attach-format
   #:attachment
   #:authenticate
   #:authenticate-reply
   #:authenticate-request
   #:authenticated
   #:buffer-swap-complete
   #:buffers
   #:connect
   #:connect-reply
   #:connect-request
   #:copy-region
   #:copy-region-reply
   #:copy-region-request
   #:count
   #:cpp
   #:create-drawable
   #:create-drawable-request
   #:decode-attach-format
   #:decode-authenticate-reply
   #:decode-buffer-swap-complete
   #:decode-connect-reply
   #:decode-copy-region-reply
   #:decode-dri2-buffer
   #:decode-get-buffers-reply
   #:decode-get-buffers-with-format-reply
   #:decode-get-msc-reply
   #:decode-get-param-reply
   #:decode-invalidate-buffers
   #:decode-query-version-reply
   #:decode-swap-buffers-reply
   #:decode-wait-msc-reply
   #:decode-wait-sbc-reply
   #:destroy-drawable
   #:destroy-drawable-request
   #:device-name
   #:device-name-length
   #:drawable
   #:dri2-buffer
   #:driver-name
   #:driver-name-length
   #:encode-attach-format
   #:encode-buffer-swap-complete
   #:encode-dri2-buffer
   #:encode-invalidate-buffers
   #:event-type
   #:flags
   #:format
   #:get-buffers
   #:get-buffers-reply
   #:get-buffers-request
   #:get-buffers-with-format
   #:get-buffers-with-format-reply
   #:get-buffers-with-format-request
   #:get-msc
   #:get-msc-reply
   #:get-msc-request
   #:get-param
   #:get-param-reply
   #:get-param-request
   #:height
   #:invalidate-buffers
   #:is-param-recognized
   #:length
   #:major-version
   #:minor-version
   #:msc-hi
   #:msc-lo
   #:name
   #:pitch
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:sbc
   #:sbc-hi
   #:sbc-lo
   #:sequence
   #:swap-buffers
   #:swap-buffers-reply
   #:swap-buffers-request
   #:swap-hi
   #:swap-interval
   #:swap-interval-request
   #:swap-lo
   #:ust-hi
   #:ust-lo
   #:value-hi
   #:value-lo
   #:wait-msc
   #:wait-msc-reply
   #:wait-msc-request
   #:wait-sbc
   #:wait-sbc-reply
   #:wait-sbc-request
   #:width))

(in-package #:XCB-DRI2)

(xcb:register-extension-xname "XCB-DRI2" "DRI2")

;;; Enum xcb.DRI2.Attachment
(xcb:defenum dri2-attachment
  (:buffer-front-left 0)
  (:buffer-back-left 1)
  (:buffer-front-right 2)
  (:buffer-back-right 3)
  (:buffer-depth 4)
  (:buffer-stencil 5)
  (:buffer-accum 6)
  (:buffer-fake-front-left 7)
  (:buffer-fake-front-right 8)
  (:buffer-depth-stencil 9)
  (:buffer-hiz 10))

;;; Enum xcb.DRI2.DriverType
(xcb:defenum dri2-driver-type
  (:dri 0)
  (:vdpau 1))

;;; Enum xcb.DRI2.EventType
(xcb:defenum dri2-event-type
  (:exchange-complete 1)
  (:blit-complete 2)
  (:flip-complete 3))

;;; xcb.DRI2.DRI2Buffer
(defclass dri2-buffer nil
          ((attachment :initarg :attachment :accessor attachment :type (unsigned-byte 32))
           (name :initarg :name :accessor name :type (unsigned-byte 32))
           (pitch :initarg :pitch :accessor pitch :type (unsigned-byte 32))
           (cpp :initarg :cpp :accessor cpp :type (unsigned-byte 32))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun encode-dri2-buffer (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((attachment (slot-value %obj 'attachment))
         (name (slot-value %obj 'name))
         (pitch (slot-value %obj 'pitch))
         (cpp (slot-value %obj 'cpp))
         (flags (slot-value %obj 'flags)))
    (declare (ignorable attachment name pitch cpp flags))
    (xcb:buffer-write-card32 %buf attachment)
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card32 %buf pitch)
    (xcb:buffer-write-card32 %buf cpp)
    (xcb:buffer-write-card32 %buf flags)))
(defun decode-dri2-buffer (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) attachment name pitch cpp flags)
    (declare (ignorable %p attachment name pitch cpp flags))
    (setf attachment (xcb:read-card32-at %buf %p %order))
    (setf name (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf pitch (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf cpp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'dri2-buffer :attachment attachment :name name :pitch pitch :cpp cpp :flags
                    flags)
     (+ %p 20))))

;;; xcb.DRI2.AttachFormat
(defclass attach-format nil
          ((attachment :initarg :attachment :accessor attachment :type (unsigned-byte 32))
           (format :initarg :format :accessor format :type (unsigned-byte 32))))
(defun encode-attach-format (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((attachment (slot-value %obj 'attachment)) (format (slot-value %obj 'format)))
    (declare (ignorable attachment format))
    (xcb:buffer-write-card32 %buf attachment)
    (xcb:buffer-write-card32 %buf format)))
(defun decode-attach-format (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) attachment format)
    (declare (ignorable %p attachment format))
    (setf attachment (xcb:read-card32-at %buf %p %order))
    (setf format (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'attach-format :attachment attachment :format format) (+ %p 8))))

;;; Request xcb.DRI2.QueryVersion
(defun query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
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

;;; Request xcb.DRI2.Connect
(defun connect (conn window driver-type)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf driver-type)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass connect-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (driver-type :initarg :driver-type :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj connect-request))
  (connect conn (slot-value %obj 'window) (slot-value %obj 'driver-type)))
(defclass connect-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (driver-name-length :initarg :driver-name-length :accessor driver-name-length :type
            (unsigned-byte 32))
           (device-name-length :initarg :device-name-length :accessor device-name-length :type
            (unsigned-byte 32))
           (driver-name :initarg :driver-name :accessor driver-name :type cl:sequence)
           (alignment-pad :initarg :alignment-pad :accessor alignment-pad :type cl:sequence)
           (device-name :initarg :device-name :accessor device-name :type cl:sequence)))
(defun decode-connect-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        driver-name-length
        device-name-length
        driver-name
        alignment-pad
        device-name)
    (declare
     (ignorable %p response-type sequence length driver-name-length device-name-length driver-name
      alignment-pad device-name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf driver-name-length (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf device-name-length (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (setf driver-name
            (xcb:read-string-at %buf %p
             (min driver-name-length (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length driver-name))
    (multiple-value-setq (alignment-pad %p)
      (xcb:read-vector-at %buf %p
       (min (- (logand (+ driver-name-length 3) (lognot 3)) driver-name-length)
            (floor (- (+ %pos 32 (* 4 length)) %p) 1))
       %order :card8))
    (setf device-name
            (xcb:read-string-at %buf %p
             (min device-name-length (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length device-name))
    (values
     (make-instance 'connect-reply :response-type response-type :sequence sequence :length length
                    :driver-name-length driver-name-length :device-name-length device-name-length
                    :driver-name driver-name :alignment-pad alignment-pad :device-name device-name)
     (+ %pos 32 (* 4 length)))))
(defun connect-reply (conn cookie) (xcb:read-reply conn cookie #'decode-connect-reply))

;;; Request xcb.DRI2.Authenticate
(defun authenticate (conn window magic)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf magic)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass authenticate-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (magic :initarg :magic :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj authenticate-request))
  (authenticate conn (slot-value %obj 'window) (slot-value %obj 'magic)))
(defclass authenticate-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (authenticated :initarg :authenticated :accessor authenticated :type
            (unsigned-byte 32))))
(defun decode-authenticate-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length authenticated)
    (declare (ignorable %p response-type sequence length authenticated))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf authenticated (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'authenticate-reply :response-type response-type :sequence sequence :length
                    length :authenticated authenticated)
     (+ %pos 32 (* 4 length)))))
(defun authenticate-reply (conn cookie) (xcb:read-reply conn cookie #'decode-authenticate-reply))

;;; Request xcb.DRI2.CreateDrawable
(defun create-drawable (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-drawable-request (xcb:request) ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj create-drawable-request))
  (create-drawable conn (slot-value %obj 'drawable)))

;;; Request xcb.DRI2.DestroyDrawable
(defun destroy-drawable (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-drawable-request (xcb:request) ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj destroy-drawable-request))
  (destroy-drawable conn (slot-value %obj 'drawable)))

;;; Request xcb.DRI2.GetBuffers
(defun get-buffers (conn drawable count attachments)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf count)
    (xcb:buffer-write-list %buf attachments nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-buffers-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (count :initarg :count :type (unsigned-byte 32))
           (attachments :initarg :attachments :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj get-buffers-request))
  (get-buffers conn (slot-value %obj 'drawable) (slot-value %obj 'count)
   (slot-value %obj 'attachments)))
(defclass get-buffers-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 32))
           (height :initarg :height :accessor height :type (unsigned-byte 32))
           (count :initarg :count :accessor count :type (unsigned-byte 32))
           (buffers :initarg :buffers :accessor buffers :type cl:sequence)))
(defun decode-get-buffers-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length width height count buffers)
    (declare (ignorable %p response-type sequence length width height count buffers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf height (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf count (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (buffers %p)
      (xcb:read-struct-vector-at %buf %p (min count (floor (- (+ %pos 32 (* 4 length)) %p) 20))
       %order #'decode-dri2-buffer))
    (values
     (make-instance 'get-buffers-reply :response-type response-type :sequence sequence :length
                    length :width width :height height :count count :buffers buffers)
     (+ %pos 32 (* 4 length)))))
(defun get-buffers-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-buffers-reply))

;;; Request xcb.DRI2.CopyRegion
(defun copy-region (conn drawable region dest src)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf dest)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass copy-region-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (region :initarg :region :type (unsigned-byte 32))
           (dest :initarg :dest :type (unsigned-byte 32))
           (src :initarg :src :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj copy-region-request))
  (copy-region conn (slot-value %obj 'drawable) (slot-value %obj 'region) (slot-value %obj 'dest)
   (slot-value %obj 'src)))
(defclass copy-region-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-copy-region-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length)
    (declare (ignorable %p response-type sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'copy-region-reply :response-type response-type :sequence sequence :length
                    length)
     (+ %pos 32 (* 4 length)))))
(defun copy-region-reply (conn cookie) (xcb:read-reply conn cookie #'decode-copy-region-reply))

;;; Request xcb.DRI2.GetBuffersWithFormat
(defun get-buffers-with-format (conn drawable count attachments)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf count)
    (xcb:buffer-write-list %buf attachments nil #'encode-attach-format)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-buffers-with-format-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (count :initarg :count :type (unsigned-byte 32))
           (attachments :initarg :attachments :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj get-buffers-with-format-request))
  (get-buffers-with-format conn (slot-value %obj 'drawable) (slot-value %obj 'count)
   (slot-value %obj 'attachments)))
(defclass get-buffers-with-format-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 32))
           (height :initarg :height :accessor height :type (unsigned-byte 32))
           (count :initarg :count :accessor count :type (unsigned-byte 32))
           (buffers :initarg :buffers :accessor buffers :type cl:sequence)))
(defun decode-get-buffers-with-format-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length width height count buffers)
    (declare (ignorable %p response-type sequence length width height count buffers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf height (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf count (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (buffers %p)
      (xcb:read-struct-vector-at %buf %p (min count (floor (- (+ %pos 32 (* 4 length)) %p) 20))
       %order #'decode-dri2-buffer))
    (values
     (make-instance 'get-buffers-with-format-reply :response-type response-type :sequence sequence
                    :length length :width width :height height :count count :buffers buffers)
     (+ %pos 32 (* 4 length)))))
(defun get-buffers-with-format-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-buffers-with-format-reply))

;;; Request xcb.DRI2.SwapBuffers
(defun swap-buffers
       (conn drawable target-msc-hi target-msc-lo divisor-hi divisor-lo remainder-hi remainder-lo)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf target-msc-hi)
    (xcb:buffer-write-card32 %buf target-msc-lo)
    (xcb:buffer-write-card32 %buf divisor-hi)
    (xcb:buffer-write-card32 %buf divisor-lo)
    (xcb:buffer-write-card32 %buf remainder-hi)
    (xcb:buffer-write-card32 %buf remainder-lo)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass swap-buffers-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (target-msc-hi :initarg :target-msc-hi :type (unsigned-byte 32))
           (target-msc-lo :initarg :target-msc-lo :type (unsigned-byte 32))
           (divisor-hi :initarg :divisor-hi :type (unsigned-byte 32))
           (divisor-lo :initarg :divisor-lo :type (unsigned-byte 32))
           (remainder-hi :initarg :remainder-hi :type (unsigned-byte 32))
           (remainder-lo :initarg :remainder-lo :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj swap-buffers-request))
  (swap-buffers conn (slot-value %obj 'drawable) (slot-value %obj 'target-msc-hi)
   (slot-value %obj 'target-msc-lo) (slot-value %obj 'divisor-hi) (slot-value %obj 'divisor-lo)
   (slot-value %obj 'remainder-hi) (slot-value %obj 'remainder-lo)))
(defclass swap-buffers-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (swap-hi :initarg :swap-hi :accessor swap-hi :type (unsigned-byte 32))
           (swap-lo :initarg :swap-lo :accessor swap-lo :type (unsigned-byte 32))))
(defun decode-swap-buffers-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length swap-hi swap-lo)
    (declare (ignorable %p response-type sequence length swap-hi swap-lo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf swap-hi (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf swap-lo (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'swap-buffers-reply :response-type response-type :sequence sequence :length
                    length :swap-hi swap-hi :swap-lo swap-lo)
     (+ %pos 32 (* 4 length)))))
(defun swap-buffers-reply (conn cookie) (xcb:read-reply conn cookie #'decode-swap-buffers-reply))

;;; Request xcb.DRI2.GetMSC
(defun get-msc (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-msc-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj get-msc-request))
  (get-msc conn (slot-value %obj 'drawable)))
(defclass get-msc-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (ust-hi :initarg :ust-hi :accessor ust-hi :type (unsigned-byte 32))
           (ust-lo :initarg :ust-lo :accessor ust-lo :type (unsigned-byte 32))
           (msc-hi :initarg :msc-hi :accessor msc-hi :type (unsigned-byte 32))
           (msc-lo :initarg :msc-lo :accessor msc-lo :type (unsigned-byte 32))
           (sbc-hi :initarg :sbc-hi :accessor sbc-hi :type (unsigned-byte 32))
           (sbc-lo :initarg :sbc-lo :accessor sbc-lo :type (unsigned-byte 32))))
(defun decode-get-msc-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo)
    (declare
     (ignorable %p response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf ust-hi (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ust-lo (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf msc-hi (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf msc-lo (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf sbc-hi (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf sbc-lo (xcb:read-card32-at %buf (+ %p 28) %order))
    (values
     (make-instance 'get-msc-reply :response-type response-type :sequence sequence :length length
                    :ust-hi ust-hi :ust-lo ust-lo :msc-hi msc-hi :msc-lo msc-lo :sbc-hi sbc-hi
                    :sbc-lo sbc-lo)
     (+ %pos 32 (* 4 length)))))
(defun get-msc-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-msc-reply))

;;; Request xcb.DRI2.WaitMSC
(defun wait-msc
       (conn drawable target-msc-hi target-msc-lo divisor-hi divisor-lo remainder-hi remainder-lo)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf target-msc-hi)
    (xcb:buffer-write-card32 %buf target-msc-lo)
    (xcb:buffer-write-card32 %buf divisor-hi)
    (xcb:buffer-write-card32 %buf divisor-lo)
    (xcb:buffer-write-card32 %buf remainder-hi)
    (xcb:buffer-write-card32 %buf remainder-lo)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass wait-msc-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (target-msc-hi :initarg :target-msc-hi :type (unsigned-byte 32))
           (target-msc-lo :initarg :target-msc-lo :type (unsigned-byte 32))
           (divisor-hi :initarg :divisor-hi :type (unsigned-byte 32))
           (divisor-lo :initarg :divisor-lo :type (unsigned-byte 32))
           (remainder-hi :initarg :remainder-hi :type (unsigned-byte 32))
           (remainder-lo :initarg :remainder-lo :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj wait-msc-request))
  (wait-msc conn (slot-value %obj 'drawable) (slot-value %obj 'target-msc-hi)
   (slot-value %obj 'target-msc-lo) (slot-value %obj 'divisor-hi) (slot-value %obj 'divisor-lo)
   (slot-value %obj 'remainder-hi) (slot-value %obj 'remainder-lo)))
(defclass wait-msc-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (ust-hi :initarg :ust-hi :accessor ust-hi :type (unsigned-byte 32))
           (ust-lo :initarg :ust-lo :accessor ust-lo :type (unsigned-byte 32))
           (msc-hi :initarg :msc-hi :accessor msc-hi :type (unsigned-byte 32))
           (msc-lo :initarg :msc-lo :accessor msc-lo :type (unsigned-byte 32))
           (sbc-hi :initarg :sbc-hi :accessor sbc-hi :type (unsigned-byte 32))
           (sbc-lo :initarg :sbc-lo :accessor sbc-lo :type (unsigned-byte 32))))
(defun decode-wait-msc-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo)
    (declare
     (ignorable %p response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf ust-hi (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ust-lo (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf msc-hi (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf msc-lo (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf sbc-hi (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf sbc-lo (xcb:read-card32-at %buf (+ %p 28) %order))
    (values
     (make-instance 'wait-msc-reply :response-type response-type :sequence sequence :length length
                    :ust-hi ust-hi :ust-lo ust-lo :msc-hi msc-hi :msc-lo msc-lo :sbc-hi sbc-hi
                    :sbc-lo sbc-lo)
     (+ %pos 32 (* 4 length)))))
(defun wait-msc-reply (conn cookie) (xcb:read-reply conn cookie #'decode-wait-msc-reply))

;;; Request xcb.DRI2.WaitSBC
(defun wait-sbc (conn drawable target-sbc-hi target-sbc-lo)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf target-sbc-hi)
    (xcb:buffer-write-card32 %buf target-sbc-lo)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass wait-sbc-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (target-sbc-hi :initarg :target-sbc-hi :type (unsigned-byte 32))
           (target-sbc-lo :initarg :target-sbc-lo :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj wait-sbc-request))
  (wait-sbc conn (slot-value %obj 'drawable) (slot-value %obj 'target-sbc-hi)
   (slot-value %obj 'target-sbc-lo)))
(defclass wait-sbc-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (ust-hi :initarg :ust-hi :accessor ust-hi :type (unsigned-byte 32))
           (ust-lo :initarg :ust-lo :accessor ust-lo :type (unsigned-byte 32))
           (msc-hi :initarg :msc-hi :accessor msc-hi :type (unsigned-byte 32))
           (msc-lo :initarg :msc-lo :accessor msc-lo :type (unsigned-byte 32))
           (sbc-hi :initarg :sbc-hi :accessor sbc-hi :type (unsigned-byte 32))
           (sbc-lo :initarg :sbc-lo :accessor sbc-lo :type (unsigned-byte 32))))
(defun decode-wait-sbc-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo)
    (declare
     (ignorable %p response-type sequence length ust-hi ust-lo msc-hi msc-lo sbc-hi sbc-lo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf ust-hi (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ust-lo (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf msc-hi (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf msc-lo (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf sbc-hi (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf sbc-lo (xcb:read-card32-at %buf (+ %p 28) %order))
    (values
     (make-instance 'wait-sbc-reply :response-type response-type :sequence sequence :length length
                    :ust-hi ust-hi :ust-lo ust-lo :msc-hi msc-hi :msc-lo msc-lo :sbc-hi sbc-hi
                    :sbc-lo sbc-lo)
     (+ %pos 32 (* 4 length)))))
(defun wait-sbc-reply (conn cookie) (xcb:read-reply conn cookie #'decode-wait-sbc-reply))

;;; Request xcb.DRI2.SwapInterval
(defun swap-interval (conn drawable interval)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf interval)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass swap-interval-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (interval :initarg :interval :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj swap-interval-request))
  (swap-interval conn (slot-value %obj 'drawable) (slot-value %obj 'interval)))

;;; Request xcb.DRI2.GetParam
(defun get-param (conn drawable param)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI2")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf param)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-param-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (param :initarg :param :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-param-request))
  (get-param conn (slot-value %obj 'drawable) (slot-value %obj 'param)))
(defclass get-param-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (is-param-recognized :initarg :is-param-recognized :accessor is-param-recognized :type
            (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (value-hi :initarg :value-hi :accessor value-hi :type (unsigned-byte 32))
           (value-lo :initarg :value-lo :accessor value-lo :type (unsigned-byte 32))))
(defun decode-get-param-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type is-param-recognized sequence length value-hi value-lo)
    (declare (ignorable %p response-type is-param-recognized sequence length value-hi value-lo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf is-param-recognized (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf value-hi (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf value-lo (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'get-param-reply :response-type response-type :is-param-recognized
                    is-param-recognized :sequence sequence :length length :value-hi value-hi
                    :value-lo value-lo)
     (+ %pos 32 (* 4 length)))))
(defun get-param-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-param-reply))

;;; Event xcb.DRI2.BufferSwapComplete (0)
(defclass buffer-swap-complete (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (drawable :initarg :drawable :accessor drawable :type xcb:drawable)
           (ust-hi :initarg :ust-hi :accessor ust-hi :type (unsigned-byte 32))
           (ust-lo :initarg :ust-lo :accessor ust-lo :type (unsigned-byte 32))
           (msc-hi :initarg :msc-hi :accessor msc-hi :type (unsigned-byte 32))
           (msc-lo :initarg :msc-lo :accessor msc-lo :type (unsigned-byte 32))
           (sbc :initarg :sbc :accessor sbc :type (unsigned-byte 32))))
(defun decode-buffer-swap-complete (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event-type drawable ust-hi ust-lo msc-hi msc-lo sbc)
    (declare
     (ignorable %p response-type sequence event-type drawable ust-hi ust-lo msc-hi msc-lo sbc))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf drawable (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ust-hi (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf ust-lo (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf msc-hi (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf msc-lo (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf sbc (xcb:read-card32-at %buf (+ %p 28) %order))
    (values
     (make-instance 'buffer-swap-complete :response-type response-type :sequence sequence
                    :event-type event-type :drawable drawable :ust-hi ust-hi :ust-lo ust-lo :msc-hi
                    msc-hi :msc-lo msc-lo :sbc sbc)
     (+ %pos 32))))
(defun encode-buffer-swap-complete (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event-type (slot-value %obj 'event-type))
         (drawable (slot-value %obj 'drawable))
         (ust-hi (slot-value %obj 'ust-hi))
         (ust-lo (slot-value %obj 'ust-lo))
         (msc-hi (slot-value %obj 'msc-hi))
         (msc-lo (slot-value %obj 'msc-lo))
         (sbc (slot-value %obj 'sbc)))
    (declare
     (ignorable response-type sequence event-type drawable ust-hi ust-lo msc-hi msc-lo sbc))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card16 %buf event-type)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf ust-hi)
    (xcb:buffer-write-card32 %buf ust-lo)
    (xcb:buffer-write-card32 %buf msc-hi)
    (xcb:buffer-write-card32 %buf msc-lo)
    (xcb:buffer-write-card32 %buf sbc)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj buffer-swap-complete))
  (encode-buffer-swap-complete %buf %obj))
(xcb:register-extension-event-decoder "XCB-DRI2" 0 #'decode-buffer-swap-complete)

;;; Event xcb.DRI2.InvalidateBuffers (1)
(defclass invalidate-buffers (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (drawable :initarg :drawable :accessor drawable :type xcb:drawable)))
(defun decode-invalidate-buffers (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence drawable)
    (declare (ignorable %p response-type sequence drawable))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf drawable (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'invalidate-buffers :response-type response-type :sequence sequence :drawable
                    drawable)
     (+ %pos 32))))
(defun encode-invalidate-buffers (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (drawable (slot-value %obj 'drawable)))
    (declare (ignorable response-type sequence drawable))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj invalidate-buffers)) (encode-invalidate-buffers %buf %obj))
(xcb:register-extension-event-decoder "XCB-DRI2" 1 #'decode-invalidate-buffers)
