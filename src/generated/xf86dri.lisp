;;; Generated from xf86dri.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XF86DRI
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:auth-connection
   #:auth-connection-reply
   #:auth-connection-request
   #:authenticated
   #:back-clip-rects
   #:back-x
   #:back-y
   #:bus-id
   #:bus-id-len
   #:client-driver-major-version
   #:client-driver-minor-version
   #:client-driver-name
   #:client-driver-name-len
   #:client-driver-patch-version
   #:clip-rects
   #:close-connection
   #:close-connection-request
   #:create-context
   #:create-context-reply
   #:create-context-request
   #:create-drawable
   #:create-drawable-reply
   #:create-drawable-request
   #:decode-auth-connection-reply
   #:decode-create-context-reply
   #:decode-create-drawable-reply
   #:decode-drm-clip-rect
   #:decode-get-client-driver-name-reply
   #:decode-get-device-info-reply
   #:decode-get-drawable-info-reply
   #:decode-open-connection-reply
   #:decode-query-direct-rendering-capable-reply
   #:decode-query-version-reply
   #:destroy-context
   #:destroy-context-request
   #:destroy-drawable
   #:destroy-drawable-request
   #:device-private
   #:device-private-size
   #:drawable-origin-x
   #:drawable-origin-y
   #:drawable-size-h
   #:drawable-size-w
   #:drawable-table-index
   #:drawable-table-stamp
   #:dri-major-version
   #:dri-minor-patch
   #:dri-minor-version
   #:drm-clip-rect
   #:encode-drm-clip-rect
   #:framebuffer-handle-high
   #:framebuffer-handle-low
   #:framebuffer-origin-offset
   #:framebuffer-size
   #:framebuffer-stride
   #:get-client-driver-name
   #:get-client-driver-name-reply
   #:get-client-driver-name-request
   #:get-device-info
   #:get-device-info-reply
   #:get-device-info-request
   #:get-drawable-info
   #:get-drawable-info-reply
   #:get-drawable-info-request
   #:hw-context
   #:hw-drawable-handle
   #:is-capable
   #:length
   #:num-back-clip-rects
   #:num-clip-rects
   #:open-connection
   #:open-connection-reply
   #:open-connection-request
   #:query-direct-rendering-capable
   #:query-direct-rendering-capable-reply
   #:query-direct-rendering-capable-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:sarea-handle-high
   #:sarea-handle-low
   #:sequence
   #:x1
   #:x2
   #:x3
   #:y1))

(in-package #:XCB-XF86DRI)

(xcb:register-extension-xname "XCB-XF86DRI" "XFree86-DRI")

;;; xcb.XF86Dri.DrmClipRect
(defclass drm-clip-rect nil
          ((x1 :initarg :x1 :accessor x1 :type (signed-byte 16))
           (y1 :initarg :y1 :accessor y1 :type (signed-byte 16))
           (x2 :initarg :x2 :accessor x2 :type (signed-byte 16))
           (x3 :initarg :x3 :accessor x3 :type (signed-byte 16))))
(defun encode-drm-clip-rect (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x1 (slot-value %obj 'x1))
         (y1 (slot-value %obj 'y1))
         (x2 (slot-value %obj 'x2))
         (x3 (slot-value %obj 'x3)))
    (declare (ignorable x1 y1 x2 x3))
    (xcb:buffer-write-card16 %buf x1)
    (xcb:buffer-write-card16 %buf y1)
    (xcb:buffer-write-card16 %buf x2)
    (xcb:buffer-write-card16 %buf x3)))
(defun decode-drm-clip-rect (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x1 y1 x2 x3)
    (declare (ignorable %p x1 y1 x2 x3))
    (setf x1 (xcb:read-int16-at %buf %p %order))
    (setf y1 (xcb:read-int16-at %buf (+ %p 2) %order))
    (setf x2 (xcb:read-int16-at %buf (+ %p 4) %order))
    (setf x3 (xcb:read-int16-at %buf (+ %p 6) %order))
    (values (make-instance 'drm-clip-rect :x1 x1 :y1 y1 :x2 x2 :x3 x3) (+ %p 8))))

;;; Request xcb.XF86Dri.QueryVersion
(defun query-version (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-version-request)) (query-version conn))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (dri-major-version :initarg :dri-major-version :accessor dri-major-version :type
            (unsigned-byte 16))
           (dri-minor-version :initarg :dri-minor-version :accessor dri-minor-version :type
            (unsigned-byte 16))
           (dri-minor-patch :initarg :dri-minor-patch :accessor dri-minor-patch :type
            (unsigned-byte 32))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length dri-major-version dri-minor-version dri-minor-patch)
    (declare
     (ignorable %p response-type sequence length dri-major-version dri-minor-version
      dri-minor-patch))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf dri-major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf dri-minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf dri-minor-patch (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :dri-major-version dri-major-version :dri-minor-version
                    dri-minor-version :dri-minor-patch dri-minor-patch)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.XF86Dri.QueryDirectRenderingCapable
(defun query-direct-rendering-capable (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-direct-rendering-capable-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-direct-rendering-capable-request))
  (query-direct-rendering-capable conn (slot-value %obj 'screen)))
(defclass query-direct-rendering-capable-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (is-capable :initarg :is-capable :accessor is-capable :type
            (or boolean (unsigned-byte 8)))))
(defun decode-query-direct-rendering-capable-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length is-capable)
    (declare (ignorable %p response-type sequence length is-capable))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf is-capable (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'query-direct-rendering-capable-reply :response-type response-type :sequence
                    sequence :length length :is-capable is-capable)
     (+ %pos 32 (* 4 length)))))
(defun query-direct-rendering-capable-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-direct-rendering-capable-reply))

;;; Request xcb.XF86Dri.OpenConnection
(defun open-connection (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass open-connection-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj open-connection-request))
  (open-connection conn (slot-value %obj 'screen)))
(defclass open-connection-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (sarea-handle-low :initarg :sarea-handle-low :accessor sarea-handle-low :type
            (unsigned-byte 32))
           (sarea-handle-high :initarg :sarea-handle-high :accessor sarea-handle-high :type
            (unsigned-byte 32))
           (bus-id-len :initarg :bus-id-len :accessor bus-id-len :type (unsigned-byte 32))
           (bus-id :initarg :bus-id :accessor bus-id :type cl:sequence)))
(defun decode-open-connection-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        sarea-handle-low
        sarea-handle-high
        bus-id-len
        bus-id)
    (declare
     (ignorable %p response-type sequence length sarea-handle-low sarea-handle-high bus-id-len
      bus-id))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf sarea-handle-low (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf sarea-handle-high (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf bus-id-len (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (setf bus-id
            (xcb:read-string-at %buf %p
             (min bus-id-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length bus-id))
    (values
     (make-instance 'open-connection-reply :response-type response-type :sequence sequence :length
                    length :sarea-handle-low sarea-handle-low :sarea-handle-high sarea-handle-high
                    :bus-id-len bus-id-len :bus-id bus-id)
     (+ %pos 32 (* 4 length)))))
(defun open-connection-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-open-connection-reply))

;;; Request xcb.XF86Dri.CloseConnection
(defun close-connection (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass close-connection-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj close-connection-request))
  (close-connection conn (slot-value %obj 'screen)))

;;; Request xcb.XF86Dri.GetClientDriverName
(defun get-client-driver-name (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-client-driver-name-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-client-driver-name-request))
  (get-client-driver-name conn (slot-value %obj 'screen)))
(defclass get-client-driver-name-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (client-driver-major-version :initarg :client-driver-major-version :accessor
            client-driver-major-version :type (unsigned-byte 32))
           (client-driver-minor-version :initarg :client-driver-minor-version :accessor
            client-driver-minor-version :type (unsigned-byte 32))
           (client-driver-patch-version :initarg :client-driver-patch-version :accessor
            client-driver-patch-version :type (unsigned-byte 32))
           (client-driver-name-len :initarg :client-driver-name-len :accessor
            client-driver-name-len :type (unsigned-byte 32))
           (client-driver-name :initarg :client-driver-name :accessor client-driver-name :type
            cl:sequence)))
(defun decode-get-client-driver-name-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        client-driver-major-version
        client-driver-minor-version
        client-driver-patch-version
        client-driver-name-len
        client-driver-name)
    (declare
     (ignorable %p response-type sequence length client-driver-major-version
      client-driver-minor-version client-driver-patch-version client-driver-name-len
      client-driver-name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf client-driver-major-version (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf client-driver-minor-version (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf client-driver-patch-version (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf client-driver-name-len (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (setf client-driver-name
            (xcb:read-string-at %buf %p
             (min client-driver-name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length client-driver-name))
    (values
     (make-instance 'get-client-driver-name-reply :response-type response-type :sequence sequence
                    :length length :client-driver-major-version client-driver-major-version
                    :client-driver-minor-version client-driver-minor-version
                    :client-driver-patch-version client-driver-patch-version
                    :client-driver-name-len client-driver-name-len :client-driver-name
                    client-driver-name)
     (+ %pos 32 (* 4 length)))))
(defun get-client-driver-name-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-client-driver-name-reply))

;;; Request xcb.XF86Dri.CreateContext
(defun create-context (conn screen visual context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf visual)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-context-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (visual :initarg :visual :type (unsigned-byte 32))
           (context :initarg :context :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj create-context-request))
  (create-context conn (slot-value %obj 'screen) (slot-value %obj 'visual)
   (slot-value %obj 'context)))
(defclass create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (hw-context :initarg :hw-context :accessor hw-context :type (unsigned-byte 32))))
(defun decode-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length hw-context)
    (declare (ignorable %p response-type sequence length hw-context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf hw-context (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'create-context-reply :response-type response-type :sequence sequence :length
                    length :hw-context hw-context)
     (+ %pos 32 (* 4 length)))))
(defun create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-create-context-reply))

;;; Request xcb.XF86Dri.DestroyContext
(defun destroy-context (conn screen context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-context-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (context :initarg :context :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj destroy-context-request))
  (destroy-context conn (slot-value %obj 'screen) (slot-value %obj 'context)))

;;; Request xcb.XF86Dri.CreateDrawable
(defun create-drawable (conn screen drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-drawable-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (drawable :initarg :drawable :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj create-drawable-request))
  (create-drawable conn (slot-value %obj 'screen) (slot-value %obj 'drawable)))
(defclass create-drawable-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (hw-drawable-handle :initarg :hw-drawable-handle :accessor hw-drawable-handle :type
            (unsigned-byte 32))))
(defun decode-create-drawable-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length hw-drawable-handle)
    (declare (ignorable %p response-type sequence length hw-drawable-handle))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf hw-drawable-handle (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'create-drawable-reply :response-type response-type :sequence sequence :length
                    length :hw-drawable-handle hw-drawable-handle)
     (+ %pos 32 (* 4 length)))))
(defun create-drawable-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-create-drawable-reply))

;;; Request xcb.XF86Dri.DestroyDrawable
(defun destroy-drawable (conn screen drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-drawable-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (drawable :initarg :drawable :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj destroy-drawable-request))
  (destroy-drawable conn (slot-value %obj 'screen) (slot-value %obj 'drawable)))

;;; Request xcb.XF86Dri.GetDrawableInfo
(defun get-drawable-info (conn screen drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-drawable-info-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (drawable :initarg :drawable :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-drawable-info-request))
  (get-drawable-info conn (slot-value %obj 'screen) (slot-value %obj 'drawable)))
(defclass get-drawable-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (drawable-table-index :initarg :drawable-table-index :accessor drawable-table-index
            :type (unsigned-byte 32))
           (drawable-table-stamp :initarg :drawable-table-stamp :accessor drawable-table-stamp
            :type (unsigned-byte 32))
           (drawable-origin-x :initarg :drawable-origin-x :accessor drawable-origin-x :type
            (signed-byte 16))
           (drawable-origin-y :initarg :drawable-origin-y :accessor drawable-origin-y :type
            (signed-byte 16))
           (drawable-size-w :initarg :drawable-size-w :accessor drawable-size-w :type
            (signed-byte 16))
           (drawable-size-h :initarg :drawable-size-h :accessor drawable-size-h :type
            (signed-byte 16))
           (num-clip-rects :initarg :num-clip-rects :accessor num-clip-rects :type
            (unsigned-byte 32))
           (back-x :initarg :back-x :accessor back-x :type (signed-byte 16))
           (back-y :initarg :back-y :accessor back-y :type (signed-byte 16))
           (num-back-clip-rects :initarg :num-back-clip-rects :accessor num-back-clip-rects :type
            (unsigned-byte 32))
           (clip-rects :initarg :clip-rects :accessor clip-rects :type cl:sequence)
           (back-clip-rects :initarg :back-clip-rects :accessor back-clip-rects :type cl:sequence)))
(defun decode-get-drawable-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        drawable-table-index
        drawable-table-stamp
        drawable-origin-x
        drawable-origin-y
        drawable-size-w
        drawable-size-h
        num-clip-rects
        back-x
        back-y
        num-back-clip-rects
        clip-rects
        back-clip-rects)
    (declare
     (ignorable %p response-type sequence length drawable-table-index drawable-table-stamp
      drawable-origin-x drawable-origin-y drawable-size-w drawable-size-h num-clip-rects back-x
      back-y num-back-clip-rects clip-rects back-clip-rects))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf drawable-table-index (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf drawable-table-stamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf drawable-origin-x (xcb:read-int16-at %buf (+ %p 16) %order))
    (setf drawable-origin-y (xcb:read-int16-at %buf (+ %p 18) %order))
    (setf drawable-size-w (xcb:read-int16-at %buf (+ %p 20) %order))
    (setf drawable-size-h (xcb:read-int16-at %buf (+ %p 22) %order))
    (setf num-clip-rects (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf back-x (xcb:read-int16-at %buf (+ %p 28) %order))
    (setf back-y (xcb:read-int16-at %buf (+ %p 30) %order))
    (setf num-back-clip-rects (xcb:read-card32-at %buf (+ %p 32) %order))
    (setf %p (+ %p 36))
    (multiple-value-setq (clip-rects %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-clip-rects (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
       #'decode-drm-clip-rect))
    (multiple-value-setq (back-clip-rects %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-back-clip-rects (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
       #'decode-drm-clip-rect))
    (values
     (make-instance 'get-drawable-info-reply :response-type response-type :sequence sequence
                    :length length :drawable-table-index drawable-table-index :drawable-table-stamp
                    drawable-table-stamp :drawable-origin-x drawable-origin-x :drawable-origin-y
                    drawable-origin-y :drawable-size-w drawable-size-w :drawable-size-h
                    drawable-size-h :num-clip-rects num-clip-rects :back-x back-x :back-y back-y
                    :num-back-clip-rects num-back-clip-rects :clip-rects clip-rects
                    :back-clip-rects back-clip-rects)
     (+ %pos 32 (* 4 length)))))
(defun get-drawable-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-drawable-info-reply))

;;; Request xcb.XF86Dri.GetDeviceInfo
(defun get-device-info (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-info-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-device-info-request))
  (get-device-info conn (slot-value %obj 'screen)))
(defclass get-device-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (framebuffer-handle-low :initarg :framebuffer-handle-low :accessor
            framebuffer-handle-low :type (unsigned-byte 32))
           (framebuffer-handle-high :initarg :framebuffer-handle-high :accessor
            framebuffer-handle-high :type (unsigned-byte 32))
           (framebuffer-origin-offset :initarg :framebuffer-origin-offset :accessor
            framebuffer-origin-offset :type (unsigned-byte 32))
           (framebuffer-size :initarg :framebuffer-size :accessor framebuffer-size :type
            (unsigned-byte 32))
           (framebuffer-stride :initarg :framebuffer-stride :accessor framebuffer-stride :type
            (unsigned-byte 32))
           (device-private-size :initarg :device-private-size :accessor device-private-size :type
            (unsigned-byte 32))
           (device-private :initarg :device-private :accessor device-private :type cl:sequence)))
(defun decode-get-device-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        framebuffer-handle-low
        framebuffer-handle-high
        framebuffer-origin-offset
        framebuffer-size
        framebuffer-stride
        device-private-size
        device-private)
    (declare
     (ignorable %p response-type sequence length framebuffer-handle-low framebuffer-handle-high
      framebuffer-origin-offset framebuffer-size framebuffer-stride device-private-size
      device-private))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf framebuffer-handle-low (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf framebuffer-handle-high (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf framebuffer-origin-offset (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf framebuffer-size (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf framebuffer-stride (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf device-private-size (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (device-private %p)
      (xcb:read-vector-at %buf %p
       (min device-private-size (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (values
     (make-instance 'get-device-info-reply :response-type response-type :sequence sequence :length
                    length :framebuffer-handle-low framebuffer-handle-low :framebuffer-handle-high
                    framebuffer-handle-high :framebuffer-origin-offset framebuffer-origin-offset
                    :framebuffer-size framebuffer-size :framebuffer-stride framebuffer-stride
                    :device-private-size device-private-size :device-private device-private)
     (+ %pos 32 (* 4 length)))))
(defun get-device-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-info-reply))

;;; Request xcb.XF86Dri.AuthConnection
(defun auth-connection (conn screen magic)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86DRI"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf magic)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass auth-connection-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (magic :initarg :magic :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj auth-connection-request))
  (auth-connection conn (slot-value %obj 'screen) (slot-value %obj 'magic)))
(defclass auth-connection-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (authenticated :initarg :authenticated :accessor authenticated :type
            (unsigned-byte 32))))
(defun decode-auth-connection-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length authenticated)
    (declare (ignorable %p response-type sequence length authenticated))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf authenticated (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'auth-connection-reply :response-type response-type :sequence sequence :length
                    length :authenticated authenticated)
     (+ %pos 32 (* 4 length)))))
(defun auth-connection-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-auth-connection-reply))
