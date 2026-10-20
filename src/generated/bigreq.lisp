;;; Generated from bigreq.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-BIGREQUESTS
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:decode-enable-reply
   #:enable
   #:enable-reply
   #:enable-request
   #:length
   #:maximum-request-length
   #:response-type
   #:sequence))

(in-package #:XCB-BIGREQUESTS)

(xcb:register-extension-xname "XCB-BIGREQUESTS" "BIG-REQUESTS")

;;; Request xcb.BigRequests.Enable
(defun enable (conn)
  "Enable the BIG-REQUESTS extension

This enables the BIG-REQUESTS extension, which allows for requests larger than
262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
is immediately followed by a 32-bit length field specifying the length of the
request in 4-byte units."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-BIGREQUESTS"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass enable-request (xcb:request-with-reply) nil
          (:documentation "Enable the BIG-REQUESTS extension

This enables the BIG-REQUESTS extension, which allows for requests larger than
262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
is immediately followed by a 32-bit length field specifying the length of the
request in 4-byte units."))
(defmethod xcb:send-request (conn (%obj enable-request)) (enable conn))
(defclass enable-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (maximum-request-length :initarg :maximum-request-length :accessor
            maximum-request-length :type (unsigned-byte 32))))
(defun decode-enable-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length maximum-request-length)
    (declare (ignorable %p response-type sequence length maximum-request-length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf maximum-request-length (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'enable-reply :response-type response-type :sequence sequence :length length
                    :maximum-request-length maximum-request-length)
     (+ %pos 32 (* 4 length)))))
(defun enable-reply (conn cookie) (xcb:read-reply conn cookie #'decode-enable-reply))
