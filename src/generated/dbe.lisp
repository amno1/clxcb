;;; Generated from dbe.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-DBE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:allocate-back-buffer
   #:allocate-back-buffer-request
   #:attributes
   #:back-buffer
   #:bad-buffer
   #:bad-buffer-error
   #:begin-idiom
   #:begin-idiom-request
   #:buffer-attributes
   #:deallocate-back-buffer
   #:deallocate-back-buffer-request
   #:decode-bad-buffer-error
   #:decode-buffer-attributes
   #:decode-get-back-buffer-attributes-reply
   #:decode-get-visual-info-reply
   #:decode-query-version-reply
   #:decode-swap-info
   #:decode-visual-info
   #:decode-visual-infos
   #:depth
   #:encode-buffer-attributes
   #:encode-swap-info
   #:encode-visual-info
   #:encode-visual-infos
   #:end-idiom
   #:end-idiom-request
   #:error-code
   #:get-back-buffer-attributes
   #:get-back-buffer-attributes-reply
   #:get-back-buffer-attributes-request
   #:get-visual-info
   #:get-visual-info-reply
   #:get-visual-info-request
   #:infos
   #:length
   #:major-opcode
   #:major-version
   #:minor-opcode
   #:minor-version
   #:n-infos
   #:n-supported-visuals
   #:perf-level
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:sequence
   #:supported-visuals
   #:swap-action
   #:swap-buffers
   #:swap-buffers-request
   #:swap-info
   #:visual-id
   #:visual-info
   #:visual-infos
   #:window))

(in-package #:XCB-DBE)

(xcb:register-extension-xname "XCB-DBE" "DOUBLE-BUFFER")
(deftype back-buffer () '(unsigned-byte 32))

;;; Enum xcb.Dbe.SwapAction
(xcb:defenum dbe-swap-action
  (:undefined 0)
  (:background 1)
  (:untouched 2)
  (:copied 3))

;;; xcb.Dbe.SwapInfo
(defclass swap-info nil
          ((window :initarg :window :accessor window :type xcb:window)
           (swap-action :initarg :swap-action :accessor swap-action :type (unsigned-byte 8))))
(defun encode-swap-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((window (slot-value %obj 'window)) (swap-action (slot-value %obj 'swap-action)))
    (declare (ignorable window swap-action))
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf swap-action)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-swap-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) window swap-action)
    (declare (ignorable %p window swap-action))
    (setf window (xcb:read-card32-at %buf %p %order))
    (setf swap-action (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'swap-info :window window :swap-action swap-action) (+ %p 8))))

;;; xcb.Dbe.BufferAttributes
(defclass buffer-attributes nil ((window :initarg :window :accessor window :type xcb:window)))
(defun encode-buffer-attributes (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((window (slot-value %obj 'window)))
    (declare (ignorable window))
    (xcb:buffer-write-card32 %buf window)))
(defun decode-buffer-attributes (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) window)
    (declare (ignorable %p window))
    (setf window (xcb:read-card32-at %buf %p %order))
    (values (make-instance 'buffer-attributes :window window) (+ %p 4))))

;;; xcb.Dbe.VisualInfo
(defclass visual-info nil
          ((visual-id :initarg :visual-id :accessor visual-id :type xcb:visualid)
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (perf-level :initarg :perf-level :accessor perf-level :type (unsigned-byte 8))))
(defun encode-visual-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((visual-id (slot-value %obj 'visual-id))
         (depth (slot-value %obj 'depth))
         (perf-level (slot-value %obj 'perf-level)))
    (declare (ignorable visual-id depth perf-level))
    (xcb:buffer-write-card32 %buf visual-id)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-card8 %buf perf-level)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-visual-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) visual-id depth perf-level)
    (declare (ignorable %p visual-id depth perf-level))
    (setf visual-id (xcb:read-card32-at %buf %p %order))
    (setf depth (xcb:read-card8-at %buf (+ %p 4)))
    (setf perf-level (xcb:read-card8-at %buf (+ %p 5)))
    (values (make-instance 'visual-info :visual-id visual-id :depth depth :perf-level perf-level)
            (+ %p 8))))

;;; xcb.Dbe.VisualInfos
(defclass visual-infos nil
          ((n-infos :initarg :n-infos :accessor n-infos :type (unsigned-byte 32))
           (infos :initarg :infos :accessor infos :type cl:sequence)))
(defun encode-visual-infos (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((infos (slot-value %obj 'infos)) (n-infos (cl:length infos)))
    (declare (ignorable infos n-infos))
    (xcb:buffer-write-card32 %buf n-infos)
    (xcb:buffer-write-list %buf infos n-infos #'encode-visual-info)))
(defun decode-visual-infos (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) n-infos infos)
    (declare (ignorable %p n-infos infos))
    (setf n-infos (xcb:read-card32-at %buf %p %order))
    (setf %p (+ %p 4))
    (multiple-value-setq (infos %p)
      (xcb:read-struct-vector-at %buf %p n-infos %order #'decode-visual-info))
    (values (make-instance 'visual-infos :n-infos n-infos :infos infos) %p)))

;;; Error xcb.Dbe.BadBuffer (0)
(defclass bad-buffer-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-buffer :initarg :bad-buffer :accessor bad-buffer :type back-buffer)
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-buffer-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-buffer minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-buffer minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-buffer (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'bad-buffer-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-buffer bad-buffer :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-DBE" 0 #'decode-bad-buffer-error)

;;; Request xcb.Dbe.QueryVersion
(defun query-version (conn major-version minor-version)
  "Queries the version of this extension

Queries the version of this extension. You must do this before using any functionality it provides."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf major-version)
    (xcb:buffer-write-card8 %buf minor-version)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 8))
           (minor-version :initarg :minor-version :type (unsigned-byte 8)))
          (:documentation "Queries the version of this extension

Queries the version of this extension. You must do this before using any functionality it provides."))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 8))
           (minor-version :initarg :minor-version :accessor minor-version :type (unsigned-byte 8))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card8-at %buf (+ %p 8)))
    (setf minor-version (xcb:read-card8-at %buf (+ %p 9)))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Dbe.AllocateBackBuffer
(defun allocate-back-buffer (conn window buffer swap-action)
  "Allocates a back buffer

Associates `buffer` with the back buffer of `window`. Multiple ids may be associated with the back buffer, which is created by the first allocate call and destroyed by the last deallocate."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf buffer)
    (xcb:buffer-write-card8 %buf swap-action)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass allocate-back-buffer-request (xcb:request)
          ((window :initarg :window :type xcb:window) (buffer :initarg :buffer :type back-buffer)
           (swap-action :initarg :swap-action :type (unsigned-byte 8)))
          (:documentation "Allocates a back buffer

Associates `buffer` with the back buffer of `window`. Multiple ids may be associated with the back buffer, which is created by the first allocate call and destroyed by the last deallocate."))
(defmethod xcb:send-request (conn (%obj allocate-back-buffer-request))
  (allocate-back-buffer conn (slot-value %obj 'window) (slot-value %obj 'buffer)
   (slot-value %obj 'swap-action)))

;;; Request xcb.Dbe.DeallocateBackBuffer
(defun deallocate-back-buffer (conn buffer)
  "Deallocates a back buffer

Deallocates the given `buffer`. If `buffer` is an invalid id, a `BadBuffer` error is returned. Because a window may have allocated multiple back buffer ids, the back buffer itself is not deleted until all these ids are deallocated by this call."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf buffer)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass deallocate-back-buffer-request (xcb:request)
          ((buffer :initarg :buffer :type back-buffer))
          (:documentation "Deallocates a back buffer

Deallocates the given `buffer`. If `buffer` is an invalid id, a `BadBuffer` error is returned. Because a window may have allocated multiple back buffer ids, the back buffer itself is not deleted until all these ids are deallocated by this call."))
(defmethod xcb:send-request (conn (%obj deallocate-back-buffer-request))
  (deallocate-back-buffer conn (slot-value %obj 'buffer)))

;;; Request xcb.Dbe.SwapBuffers
(defun swap-buffers (conn actions)
  "Swaps front and back buffers

Swaps the front and back buffers on the specified windows. The front and back buffers retain their ids, so that the window id continues to refer to the front buffer, while the back buffer id created by this extension continues to refer to the back buffer. Back buffer contents is moved to the front buffer. Back buffer contents after the operation depends on the given swap action. The optimal swap action depends on how each frame is rendered. For example, if the buffer is cleared and fully overwritten on every frame, the \"untouched\" action, which throws away the buffer contents, would provide the best performance. To eliminate visual artifacts, the swap will occure during the monitor VSync, if the X server supports detecting it."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE"))
         (%buf (xcb:conn-send-buffer conn))
         (n-actions (cl:length actions)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf n-actions)
    (xcb:buffer-write-list %buf actions n-actions #'encode-swap-info)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass swap-buffers-request (xcb:request)
          ((n-actions :initarg :n-actions :type (unsigned-byte 32))
           (actions :initarg :actions :type cl:sequence))
          (:documentation "Swaps front and back buffers

Swaps the front and back buffers on the specified windows. The front and back buffers retain their ids, so that the window id continues to refer to the front buffer, while the back buffer id created by this extension continues to refer to the back buffer. Back buffer contents is moved to the front buffer. Back buffer contents after the operation depends on the given swap action. The optimal swap action depends on how each frame is rendered. For example, if the buffer is cleared and fully overwritten on every frame, the \"untouched\" action, which throws away the buffer contents, would provide the best performance. To eliminate visual artifacts, the swap will occure during the monitor VSync, if the X server supports detecting it."))
(defmethod xcb:send-request (conn (%obj swap-buffers-request))
  (swap-buffers conn (slot-value %obj 'actions)))

;;; Request xcb.Dbe.BeginIdiom
(defun begin-idiom (conn)
  "Begins a logical swap block

Creates a block of operations intended to occur together. This may be needed if window presentation requires changing buffers unknown to this extension, such as depth or stencil buffers."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass begin-idiom-request (xcb:request) nil
          (:documentation "Begins a logical swap block

Creates a block of operations intended to occur together. This may be needed if window presentation requires changing buffers unknown to this extension, such as depth or stencil buffers."))
(defmethod xcb:send-request (conn (%obj begin-idiom-request)) (begin-idiom conn))

;;; Request xcb.Dbe.EndIdiom
(defun end-idiom (conn)
  "Ends a logical swap block"
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass end-idiom-request (xcb:request) nil (:documentation "Ends a logical swap block"))
(defmethod xcb:send-request (conn (%obj end-idiom-request)) (end-idiom conn))

;;; Request xcb.Dbe.GetVisualInfo
(defun get-visual-info (conn drawables)
  "Requests visuals that support double buffering"
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE"))
         (%buf (xcb:conn-send-buffer conn))
         (n-drawables (cl:length drawables)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf n-drawables)
    (xcb:buffer-write-list %buf drawables n-drawables #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-visual-info-request (xcb:request-with-reply)
          ((n-drawables :initarg :n-drawables :type (unsigned-byte 32))
           (drawables :initarg :drawables :type cl:sequence))
          (:documentation "Requests visuals that support double buffering"))
(defmethod xcb:send-request (conn (%obj get-visual-info-request))
  (get-visual-info conn (slot-value %obj 'drawables)))
(defclass get-visual-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (n-supported-visuals :initarg :n-supported-visuals :accessor n-supported-visuals :type
            (unsigned-byte 32))
           (supported-visuals :initarg :supported-visuals :accessor supported-visuals :type
            cl:sequence)))
(defun decode-get-visual-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length n-supported-visuals supported-visuals)
    (declare (ignorable %p response-type sequence length n-supported-visuals supported-visuals))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf n-supported-visuals (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (supported-visuals %p)
      (xcb:read-struct-vector-at %buf %p (min n-supported-visuals (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-visual-infos))
    (values
     (make-instance 'get-visual-info-reply :response-type response-type :sequence sequence :length
                    length :n-supported-visuals n-supported-visuals :supported-visuals
                    supported-visuals)
     (+ %pos 32 (* 4 length)))))
(defun get-visual-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-visual-info-reply))

;;; Request xcb.Dbe.GetBackBufferAttributes
(defun get-back-buffer-attributes (conn buffer)
  "Gets back buffer attributes

Returns the attributes of the specified `buffer`."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DBE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf buffer)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-back-buffer-attributes-request (xcb:request-with-reply)
          ((buffer :initarg :buffer :type back-buffer))
          (:documentation "Gets back buffer attributes

Returns the attributes of the specified `buffer`."))
(defmethod xcb:send-request (conn (%obj get-back-buffer-attributes-request))
  (get-back-buffer-attributes conn (slot-value %obj 'buffer)))
(defclass get-back-buffer-attributes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (attributes :initarg :attributes :accessor attributes :type buffer-attributes)))
(defun decode-get-back-buffer-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length attributes)
    (declare (ignorable %p response-type sequence length attributes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf attributes (decode-buffer-attributes %buf (+ %p 8) %order))
    (values
     (make-instance 'get-back-buffer-attributes-reply :response-type response-type :sequence
                    sequence :length length :attributes attributes)
     (+ %pos 32 (* 4 length)))))
(defun get-back-buffer-attributes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-back-buffer-attributes-reply))
