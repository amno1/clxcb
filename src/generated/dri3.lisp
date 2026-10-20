;;; Generated from dri3.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-DRI3
  (:use #:cl)
  (:shadow #:LENGTH #:OPEN #:SEQUENCE)
  (:export
   #:bpp
   #:buffer-from-pixmap
   #:buffer-from-pixmap-reply
   #:buffer-from-pixmap-request
   #:buffers
   #:buffers-from-pixmap
   #:buffers-from-pixmap-reply
   #:buffers-from-pixmap-request
   #:decode-buffer-from-pixmap-reply
   #:decode-buffers-from-pixmap-reply
   #:decode-fd-from-fence-reply
   #:decode-get-supported-modifiers-reply
   #:decode-open-reply
   #:decode-query-version-reply
   #:depth
   #:device-fd
   #:fd-from-fence
   #:fd-from-fence-reply
   #:fd-from-fence-request
   #:fence-fd
   #:fence-from-fd
   #:fence-from-fd-request
   #:get-supported-modifiers
   #:get-supported-modifiers-reply
   #:get-supported-modifiers-request
   #:height
   #:length
   #:major-version
   #:minor-version
   #:modifier
   #:nfd
   #:num-screen-modifiers
   #:num-window-modifiers
   #:offsets
   #:open
   #:open-reply
   #:open-request
   #:pixmap-fd
   #:pixmap-from-buffer
   #:pixmap-from-buffer-request
   #:pixmap-from-buffers
   #:pixmap-from-buffers-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:screen-modifiers
   #:sequence
   #:set-drm-device-in-use
   #:set-drm-device-in-use-request
   #:size
   #:stride
   #:strides
   #:width
   #:window-modifiers))

(in-package #:XCB-DRI3)

(xcb:register-extension-xname "XCB-DRI3" "DRI3")

;;; Request xcb.DRI3.QueryVersion
(defun query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
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

;;; Request xcb.DRI3.Open
(defun open (conn drawable provider)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t :reply-fds t)))
(defclass open-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (provider :initarg :provider :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj open-request))
  (open conn (slot-value %obj 'drawable) (slot-value %obj 'provider)))
(defclass open-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (nfd :initarg :nfd :accessor nfd :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (device-fd :initarg :device-fd :accessor device-fd :type integer)))
(defun decode-open-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type nfd sequence length device-fd)
    (declare (ignorable %p response-type nfd sequence length device-fd))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf nfd (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-fd (xcb:take-pending-fd))
    (values
     (make-instance 'open-reply :response-type response-type :nfd nfd :sequence sequence :length
                    length :device-fd device-fd)
     (+ %pos 32 (* 4 length)))))
(defun open-reply (conn cookie) (xcb:read-reply conn cookie #'decode-open-reply))

;;; Request xcb.DRI3.PixmapFromBuffer
(defun pixmap-from-buffer (conn pixmap drawable size width height stride depth bpp pixmap-fd)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf size)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf stride)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-card8 %buf bpp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :fds (list pixmap-fd))))
(defclass pixmap-from-buffer-request (xcb:request)
          ((pixmap :initarg :pixmap :type xcb:pixmap)
           (drawable :initarg :drawable :type xcb:drawable)
           (size :initarg :size :type (unsigned-byte 32))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (stride :initarg :stride :type (unsigned-byte 16))
           (depth :initarg :depth :type (unsigned-byte 8))
           (bpp :initarg :bpp :type (unsigned-byte 8))
           (pixmap-fd :initarg :pixmap-fd :type integer)))
(defmethod xcb:send-request (conn (%obj pixmap-from-buffer-request))
  (pixmap-from-buffer conn (slot-value %obj 'pixmap) (slot-value %obj 'drawable)
   (slot-value %obj 'size) (slot-value %obj 'width) (slot-value %obj 'height)
   (slot-value %obj 'stride) (slot-value %obj 'depth) (slot-value %obj 'bpp)
   (slot-value %obj 'pixmap-fd)))

;;; Request xcb.DRI3.BufferFromPixmap
(defun buffer-from-pixmap (conn pixmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t :reply-fds t)))
(defclass buffer-from-pixmap-request (xcb:request-with-reply)
          ((pixmap :initarg :pixmap :type xcb:pixmap)))
(defmethod xcb:send-request (conn (%obj buffer-from-pixmap-request))
  (buffer-from-pixmap conn (slot-value %obj 'pixmap)))
(defclass buffer-from-pixmap-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (nfd :initarg :nfd :accessor nfd :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (stride :initarg :stride :accessor stride :type (unsigned-byte 16))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (bpp :initarg :bpp :accessor bpp :type (unsigned-byte 8))
           (pixmap-fd :initarg :pixmap-fd :accessor pixmap-fd :type integer)))
(defun decode-buffer-from-pixmap-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type nfd sequence length size width height stride depth bpp pixmap-fd)
    (declare
     (ignorable %p response-type nfd sequence length size width height stride depth bpp pixmap-fd))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf nfd (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf size (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf stride (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf depth (xcb:read-card8-at %buf (+ %p 18)))
    (setf bpp (xcb:read-card8-at %buf (+ %p 19)))
    (setf pixmap-fd (xcb:take-pending-fd))
    (values
     (make-instance 'buffer-from-pixmap-reply :response-type response-type :nfd nfd :sequence
                    sequence :length length :size size :width width :height height :stride stride
                    :depth depth :bpp bpp :pixmap-fd pixmap-fd)
     (+ %pos 32 (* 4 length)))))
(defun buffer-from-pixmap-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-buffer-from-pixmap-reply))

;;; Request xcb.DRI3.FenceFromFD
(defun fence-from-fd (conn drawable fence initially-triggered fence-fd)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-write-bool %buf initially-triggered)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :fds (list fence-fd))))
(defclass fence-from-fd-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (fence :initarg :fence :type (unsigned-byte 32))
           (initially-triggered :initarg :initially-triggered :type (or boolean (unsigned-byte 8)))
           (fence-fd :initarg :fence-fd :type integer)))
(defmethod xcb:send-request (conn (%obj fence-from-fd-request))
  (fence-from-fd conn (slot-value %obj 'drawable) (slot-value %obj 'fence)
   (slot-value %obj 'initially-triggered) (slot-value %obj 'fence-fd)))

;;; Request xcb.DRI3.FDFromFence
(defun fd-from-fence (conn drawable fence)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t :reply-fds t)))
(defclass fd-from-fence-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)
           (fence :initarg :fence :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj fd-from-fence-request))
  (fd-from-fence conn (slot-value %obj 'drawable) (slot-value %obj 'fence)))
(defclass fd-from-fence-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (nfd :initarg :nfd :accessor nfd :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (fence-fd :initarg :fence-fd :accessor fence-fd :type integer)))
(defun decode-fd-from-fence-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type nfd sequence length fence-fd)
    (declare (ignorable %p response-type nfd sequence length fence-fd))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf nfd (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf fence-fd (xcb:take-pending-fd))
    (values
     (make-instance 'fd-from-fence-reply :response-type response-type :nfd nfd :sequence sequence
                    :length length :fence-fd fence-fd)
     (+ %pos 32 (* 4 length)))))
(defun fd-from-fence-reply (conn cookie) (xcb:read-reply conn cookie #'decode-fd-from-fence-reply))

;;; Request xcb.DRI3.GetSupportedModifiers
(defun get-supported-modifiers (conn window depth bpp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-card8 %buf bpp)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-supported-modifiers-request (xcb:request-with-reply)
          ((window :initarg :window :type (unsigned-byte 32))
           (depth :initarg :depth :type (unsigned-byte 8))
           (bpp :initarg :bpp :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-supported-modifiers-request))
  (get-supported-modifiers conn (slot-value %obj 'window) (slot-value %obj 'depth)
   (slot-value %obj 'bpp)))
(defclass get-supported-modifiers-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-window-modifiers :initarg :num-window-modifiers :accessor num-window-modifiers
            :type (unsigned-byte 32))
           (num-screen-modifiers :initarg :num-screen-modifiers :accessor num-screen-modifiers
            :type (unsigned-byte 32))
           (window-modifiers :initarg :window-modifiers :accessor window-modifiers :type
            cl:sequence)
           (screen-modifiers :initarg :screen-modifiers :accessor screen-modifiers :type
            cl:sequence)))
(defun decode-get-supported-modifiers-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        num-window-modifiers
        num-screen-modifiers
        window-modifiers
        screen-modifiers)
    (declare
     (ignorable %p response-type sequence length num-window-modifiers num-screen-modifiers
      window-modifiers screen-modifiers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-window-modifiers (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-screen-modifiers (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (window-modifiers %p)
      (xcb:read-vector-at %buf %p
       (min num-window-modifiers (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order :card64))
    (multiple-value-setq (screen-modifiers %p)
      (xcb:read-vector-at %buf %p
       (min num-screen-modifiers (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order :card64))
    (values
     (make-instance 'get-supported-modifiers-reply :response-type response-type :sequence sequence
                    :length length :num-window-modifiers num-window-modifiers :num-screen-modifiers
                    num-screen-modifiers :window-modifiers window-modifiers :screen-modifiers
                    screen-modifiers)
     (+ %pos 32 (* 4 length)))))
(defun get-supported-modifiers-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-supported-modifiers-reply))

;;; Request xcb.DRI3.PixmapFromBuffers
(defun pixmap-from-buffers
       (conn pixmap window width height stride0 offset0 stride1 offset1 stride2 offset2 stride3
        offset3 depth bpp modifier buffers)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3"))
         (%buf (xcb:conn-send-buffer conn))
         (num-buffers (cl:length buffers)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf num-buffers)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf stride0)
    (xcb:buffer-write-card32 %buf offset0)
    (xcb:buffer-write-card32 %buf stride1)
    (xcb:buffer-write-card32 %buf offset1)
    (xcb:buffer-write-card32 %buf stride2)
    (xcb:buffer-write-card32 %buf offset2)
    (xcb:buffer-write-card32 %buf stride3)
    (xcb:buffer-write-card32 %buf offset3)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-card8 %buf bpp)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card64 %buf modifier)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :fds buffers)))
(defclass pixmap-from-buffers-request (xcb:request)
          ((pixmap :initarg :pixmap :type xcb:pixmap) (window :initarg :window :type xcb:window)
           (num-buffers :initarg :num-buffers :type (unsigned-byte 8))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (stride0 :initarg :stride0 :type (unsigned-byte 32))
           (offset0 :initarg :offset0 :type (unsigned-byte 32))
           (stride1 :initarg :stride1 :type (unsigned-byte 32))
           (offset1 :initarg :offset1 :type (unsigned-byte 32))
           (stride2 :initarg :stride2 :type (unsigned-byte 32))
           (offset2 :initarg :offset2 :type (unsigned-byte 32))
           (stride3 :initarg :stride3 :type (unsigned-byte 32))
           (offset3 :initarg :offset3 :type (unsigned-byte 32))
           (depth :initarg :depth :type (unsigned-byte 8))
           (bpp :initarg :bpp :type (unsigned-byte 8))
           (modifier :initarg :modifier :type (unsigned-byte 64))
           (buffers :initarg :buffers :type integer)))
(defmethod xcb:send-request (conn (%obj pixmap-from-buffers-request))
  (pixmap-from-buffers conn (slot-value %obj 'pixmap) (slot-value %obj 'window)
   (slot-value %obj 'width) (slot-value %obj 'height) (slot-value %obj 'stride0)
   (slot-value %obj 'offset0) (slot-value %obj 'stride1) (slot-value %obj 'offset1)
   (slot-value %obj 'stride2) (slot-value %obj 'offset2) (slot-value %obj 'stride3)
   (slot-value %obj 'offset3) (slot-value %obj 'depth) (slot-value %obj 'bpp)
   (slot-value %obj 'modifier) (slot-value %obj 'buffers)))

;;; Request xcb.DRI3.BuffersFromPixmap
(defun buffers-from-pixmap (conn pixmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t :reply-fds t)))
(defclass buffers-from-pixmap-request (xcb:request-with-reply)
          ((pixmap :initarg :pixmap :type xcb:pixmap)))
(defmethod xcb:send-request (conn (%obj buffers-from-pixmap-request))
  (buffers-from-pixmap conn (slot-value %obj 'pixmap)))
(defclass buffers-from-pixmap-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (nfd :initarg :nfd :accessor nfd :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (modifier :initarg :modifier :accessor modifier :type (unsigned-byte 64))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (bpp :initarg :bpp :accessor bpp :type (unsigned-byte 8))
           (strides :initarg :strides :accessor strides :type cl:sequence)
           (offsets :initarg :offsets :accessor offsets :type cl:sequence)
           (buffers :initarg :buffers :accessor buffers :type integer)))
(defun decode-buffers-from-pixmap-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        nfd
        sequence
        length
        width
        height
        modifier
        depth
        bpp
        strides
        offsets
        buffers)
    (declare
     (ignorable %p response-type nfd sequence length width height modifier depth bpp strides
      offsets buffers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf nfd (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf modifier (xcb:read-card64-at %buf (+ %p 16) %order))
    (setf depth (xcb:read-card8-at %buf (+ %p 24)))
    (setf bpp (xcb:read-card8-at %buf (+ %p 25)))
    (setf %p (+ %p 32))
    (multiple-value-setq (strides %p)
      (xcb:read-vector-at %buf %p (min nfd (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (offsets %p)
      (xcb:read-vector-at %buf %p (min nfd (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (setf buffers (xcb:take-pending-fds nfd))
    (values
     (make-instance 'buffers-from-pixmap-reply :response-type response-type :nfd nfd :sequence
                    sequence :length length :width width :height height :modifier modifier :depth
                    depth :bpp bpp :strides strides :offsets offsets :buffers buffers)
     (+ %pos 32 (* 4 length)))))
(defun buffers-from-pixmap-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-buffers-from-pixmap-reply))

;;; Request xcb.DRI3.SetDRMDeviceInUse
(defun set-drm-device-in-use (conn window drm-major drm-minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DRI3")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf drm-major)
    (xcb:buffer-write-card32 %buf drm-minor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-drm-device-in-use-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (drm-major :initarg :drm-major :type (unsigned-byte 32))
           (drm-minor :initarg :drm-minor :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj set-drm-device-in-use-request))
  (set-drm-device-in-use conn (slot-value %obj 'window) (slot-value %obj 'drm-major)
   (slot-value %obj 'drm-minor)))
