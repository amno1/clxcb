;;; Generated from xinerama.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XINERAMA
  (:use #:cl)
  (:shadow #:LENGTH #:NUMBER #:SEQUENCE)
  (:export
   #:decode-get-screen-count-reply
   #:decode-get-screen-size-reply
   #:decode-get-state-reply
   #:decode-is-active-reply
   #:decode-query-screens-reply
   #:decode-query-version-reply
   #:decode-screen-info
   #:encode-screen-info
   #:get-screen-count
   #:get-screen-count-reply
   #:get-screen-count-request
   #:get-screen-size
   #:get-screen-size-reply
   #:get-screen-size-request
   #:get-state
   #:get-state-reply
   #:get-state-request
   #:height
   #:is-active
   #:is-active-reply
   #:is-active-request
   #:length
   #:major
   #:minor
   #:number
   #:query-screens
   #:query-screens-reply
   #:query-screens-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:screen
   #:screen-count
   #:screen-info
   #:sequence
   #:state
   #:width
   #:window
   #:x-org
   #:y-org))

(in-package #:XCB-XINERAMA)

(xcb:register-extension-xname "XCB-XINERAMA" "XINERAMA")

;;; xcb.Xinerama.ScreenInfo
(defclass screen-info nil
          ((x-org :initarg :x-org :accessor x-org :type (signed-byte 16))
           (y-org :initarg :y-org :accessor y-org :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))))
(defun encode-screen-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x-org (slot-value %obj 'x-org))
         (y-org (slot-value %obj 'y-org))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height)))
    (declare (ignorable x-org y-org width height))
    (xcb:buffer-write-card16 %buf x-org)
    (xcb:buffer-write-card16 %buf y-org)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)))
(defun decode-screen-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x-org y-org width height)
    (declare (ignorable %p x-org y-org width height))
    (setf x-org (xcb:read-int16-at %buf %p %order))
    (setf y-org (xcb:read-int16-at %buf (+ %p 2) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 6) %order))
    (values (make-instance 'screen-info :x-org x-org :y-org y-org :width width :height height)
            (+ %p 8))))

;;; Request xcb.Xinerama.QueryVersion
(defun query-version (conn major minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf major)
    (xcb:buffer-write-card8 %buf minor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((major :initarg :major :type (unsigned-byte 8))
           (minor :initarg :minor :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'major) (slot-value %obj 'minor)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major :initarg :major :accessor major :type (unsigned-byte 16))
           (minor :initarg :minor :accessor minor :type (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major minor)
    (declare (ignorable %p response-type sequence length major minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major major :minor minor)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Xinerama.GetState
(defun get-state (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-state-request (xcb:request-with-reply) ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-state-request))
  (get-state conn (slot-value %obj 'window)))
(defclass get-state-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (window :initarg :window :accessor window :type xcb:window)))
(defun decode-get-state-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type state sequence length window)
    (declare (ignorable %p response-type state sequence length window))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf state (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-state-reply :response-type response-type :state state :sequence sequence
                    :length length :window window)
     (+ %pos 32 (* 4 length)))))
(defun get-state-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-state-reply))

;;; Request xcb.Xinerama.GetScreenCount
(defun get-screen-count (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-count-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-screen-count-request))
  (get-screen-count conn (slot-value %obj 'window)))
(defclass get-screen-count-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (screen-count :initarg :screen-count :accessor screen-count :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (window :initarg :window :accessor window :type xcb:window)))
(defun decode-get-screen-count-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type screen-count sequence length window)
    (declare (ignorable %p response-type screen-count sequence length window))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf screen-count (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-screen-count-reply :response-type response-type :screen-count screen-count
                    :sequence sequence :length length :window window)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-count-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-count-reply))

;;; Request xcb.Xinerama.GetScreenSize
(defun get-screen-size (conn window screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-size-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-screen-size-request))
  (get-screen-size conn (slot-value %obj 'window) (slot-value %obj 'screen)))
(defclass get-screen-size-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 32))
           (height :initarg :height :accessor height :type (unsigned-byte 32))
           (window :initarg :window :accessor window :type xcb:window)
           (screen :initarg :screen :accessor screen :type (unsigned-byte 32))))
(defun decode-get-screen-size-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length width height window screen)
    (declare (ignorable %p response-type sequence length width height window screen))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf height (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf screen (xcb:read-card32-at %buf (+ %p 20) %order))
    (values
     (make-instance 'get-screen-size-reply :response-type response-type :sequence sequence :length
                    length :width width :height height :window window :screen screen)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-size-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-size-reply))

;;; Request xcb.Xinerama.IsActive
(defun is-active (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass is-active-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj is-active-request)) (is-active conn))
(defclass is-active-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (state :initarg :state :accessor state :type (unsigned-byte 32))))
(defun decode-is-active-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length state)
    (declare (ignorable %p response-type sequence length state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf state (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'is-active-reply :response-type response-type :sequence sequence :length length
                    :state state)
     (+ %pos 32 (* 4 length)))))
(defun is-active-reply (conn cookie) (xcb:read-reply conn cookie #'decode-is-active-reply))

;;; Request xcb.Xinerama.QueryScreens
(defun query-screens (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XINERAMA"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-screens-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-screens-request)) (query-screens conn))
(defclass query-screens-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (number :initarg :number :accessor number :type (unsigned-byte 32))
           (screen-info :initarg :screen-info :accessor screen-info :type cl:sequence)))
(defun decode-query-screens-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length number screen-info)
    (declare (ignorable %p response-type sequence length number screen-info))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf number (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (screen-info %p)
      (xcb:read-struct-vector-at %buf %p (min number (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-screen-info))
    (values
     (make-instance 'query-screens-reply :response-type response-type :sequence sequence :length
                    length :number number :screen-info screen-info)
     (+ %pos 32 (* 4 length)))))
(defun query-screens-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-screens-reply))
