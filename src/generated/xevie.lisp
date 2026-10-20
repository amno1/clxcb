;;; Generated from xevie.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XEVIE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:decode-end-reply
   #:decode-event
   #:decode-query-version-reply
   #:decode-select-input-reply
   #:decode-send-reply
   #:decode-start-reply
   #:encode-event
   #:end
   #:end-reply
   #:end-request
   #:event
   #:length
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:select-input
   #:select-input-reply
   #:select-input-request
   #:send
   #:send-reply
   #:send-request
   #:sequence
   #:server-major-version
   #:server-minor-version
   #:start
   #:start-reply
   #:start-request))

(in-package #:XCB-XEVIE)

(xcb:register-extension-xname "XCB-XEVIE" "XEVIE")

;;; Request xcb.Xevie.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XEVIE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf client-major-version)
    (xcb:buffer-write-card16 %buf client-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 16))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major-version :initarg :server-major-version :accessor server-major-version
            :type (unsigned-byte 16))
           (server-minor-version :initarg :server-minor-version :accessor server-minor-version
            :type (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length server-major-version server-minor-version)
    (declare
     (ignorable %p response-type sequence length server-major-version server-minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf server-major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf server-minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :server-major-version server-major-version :server-minor-version
                    server-minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Xevie.Start
(defun start (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XEVIE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass start-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj start-request)) (start conn (slot-value %obj 'screen)))
(defclass start-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-start-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length)
    (declare (ignorable %p response-type sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'start-reply :response-type response-type :sequence sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun start-reply (conn cookie) (xcb:read-reply conn cookie #'decode-start-reply))

;;; Request xcb.Xevie.End
(defun end (conn cmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XEVIE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf cmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass end-request (xcb:request-with-reply) ((cmap :initarg :cmap :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj end-request)) (end conn (slot-value %obj 'cmap)))
(defclass end-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-end-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length)
    (declare (ignorable %p response-type sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'end-reply :response-type response-type :sequence sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun end-reply (conn cookie) (xcb:read-reply conn cookie #'decode-end-reply))

;;; Enum xcb.Xevie.Datatype
(xcb:defenum xevie-datatype
  (:unmodified 0)
  (:modified 1))

;;; xcb.Xevie.Event
(defclass event nil nil)
(defun encode-event (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ()
    (declare (ignorable))
    (xcb:buffer-write-padding %buf 32)))
(defun decode-event (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos))
    (declare (ignorable %p))
    (values (make-instance 'event) (+ %p 32))))

;;; Request xcb.Xevie.Send
(defun send (conn event data-type)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XEVIE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (encode-event %buf event)
    (xcb:buffer-write-card32 %buf data-type)
    (xcb:buffer-write-padding %buf 64)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass send-request (xcb:request-with-reply)
          ((event :initarg :event :type event)
           (data-type :initarg :data-type :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj send-request))
  (send conn (slot-value %obj 'event) (slot-value %obj 'data-type)))
(defclass send-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-send-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length)
    (declare (ignorable %p response-type sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'send-reply :response-type response-type :sequence sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun send-reply (conn cookie) (xcb:read-reply conn cookie #'decode-send-reply))

;;; Request xcb.Xevie.SelectInput
(defun select-input (conn event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XEVIE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass select-input-request (xcb:request-with-reply)
          ((event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'event-mask)))
(defclass select-input-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-select-input-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length)
    (declare (ignorable %p response-type sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'select-input-reply :response-type response-type :sequence sequence :length
                    length)
     (+ %pos 32 (* 4 length)))))
(defun select-input-reply (conn cookie) (xcb:read-reply conn cookie #'decode-select-input-reply))
