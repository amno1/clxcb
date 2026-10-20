;;; Generated from xc_misc.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XCMISC
  (:use #:cl)
  (:shadow #:COUNT #:LENGTH #:SEQUENCE)
  (:export
   #:count
   #:decode-get-version-reply
   #:decode-get-xid-list-reply
   #:decode-get-xid-range-reply
   #:get-version
   #:get-version-reply
   #:get-version-request
   #:get-xid-list
   #:get-xid-list-reply
   #:get-xid-list-request
   #:get-xid-range
   #:get-xid-range-reply
   #:get-xid-range-request
   #:ids
   #:ids-len
   #:length
   #:response-type
   #:sequence
   #:server-major-version
   #:server-minor-version
   #:start-id))

(in-package #:XCB-XCMISC)

(xcb:register-extension-xname "XCB-XCMISC" "XC-MISC")

;;; Request xcb.XCMisc.GetVersion
(defun get-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XCMISC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf client-major-version)
    (xcb:buffer-write-card16 %buf client-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 16))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-version-request))
  (get-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass get-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major-version :initarg :server-major-version :accessor server-major-version
            :type (unsigned-byte 16))
           (server-minor-version :initarg :server-minor-version :accessor server-minor-version
            :type (unsigned-byte 16))))
(defun decode-get-version-reply (%buf %pos %order)
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
     (make-instance 'get-version-reply :response-type response-type :sequence sequence :length
                    length :server-major-version server-major-version :server-minor-version
                    server-minor-version)
     (+ %pos 32 (* 4 length)))))
(defun get-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-version-reply))

;;; Request xcb.XCMisc.GetXIDRange
(defun get-xid-range (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XCMISC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-xid-range-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-xid-range-request)) (get-xid-range conn))
(defclass get-xid-range-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (start-id :initarg :start-id :accessor start-id :type (unsigned-byte 32))
           (count :initarg :count :accessor count :type (unsigned-byte 32))))
(defun decode-get-xid-range-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length start-id count)
    (declare (ignorable %p response-type sequence length start-id count))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf start-id (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf count (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'get-xid-range-reply :response-type response-type :sequence sequence :length
                    length :start-id start-id :count count)
     (+ %pos 32 (* 4 length)))))
(defun get-xid-range-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-xid-range-reply))

;;; Request xcb.XCMisc.GetXIDList
(defun get-xid-list (conn count)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XCMISC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf count)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-xid-list-request (xcb:request-with-reply)
          ((count :initarg :count :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-xid-list-request))
  (get-xid-list conn (slot-value %obj 'count)))
(defclass get-xid-list-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (ids-len :initarg :ids-len :accessor ids-len :type (unsigned-byte 32))
           (ids :initarg :ids :accessor ids :type cl:sequence)))
(defun decode-get-xid-list-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length ids-len ids)
    (declare (ignorable %p response-type sequence length ids-len ids))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf ids-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (ids %p)
      (xcb:read-vector-at %buf %p (min ids-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'get-xid-list-reply :response-type response-type :sequence sequence :length
                    length :ids-len ids-len :ids ids)
     (+ %pos 32 (* 4 length)))))
(defun get-xid-list-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-xid-list-reply))
