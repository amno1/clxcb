;;; Generated from xtest.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-TEST
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE #:TIME #:TYPE)
  (:export
   #:compare-cursor
   #:compare-cursor-reply
   #:compare-cursor-request
   #:decode-compare-cursor-reply
   #:decode-get-version-reply
   #:fake-input
   #:fake-input-request
   #:get-version
   #:get-version-reply
   #:get-version-request
   #:grab-control
   #:grab-control-request
   #:length
   #:major-version
   #:minor-version
   #:response-type
   #:same
   #:sequence))

(in-package #:XCB-TEST)

(xcb:register-extension-xname "XCB-TEST" "XTEST")

;;; Request xcb.Test.GetVersion
(defun get-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-TEST")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf major-version)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 8))
           (minor-version :initarg :minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-version-request))
  (get-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass get-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 16))))
(defun decode-get-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type major-version sequence length minor-version)
    (declare (ignorable %p response-type major-version sequence length minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf major-version (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-version-reply :response-type response-type :major-version major-version
                    :sequence sequence :length length :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun get-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-version-reply))

;;; Enum xcb.Test.Cursor
(xcb:defenum test-cursor
  (:none 0)
  (:current 1))

;;; Request xcb.Test.CompareCursor
(defun compare-cursor (conn window cursor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-TEST")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass compare-cursor-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window) (cursor :initarg :cursor :type xcb:cursor)))
(defmethod xcb:send-request (conn (%obj compare-cursor-request))
  (compare-cursor conn (slot-value %obj 'window) (slot-value %obj 'cursor)))
(defclass compare-cursor-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (same :initarg :same :accessor same :type (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-compare-cursor-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type same sequence length)
    (declare (ignorable %p response-type same sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf same (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'compare-cursor-reply :response-type response-type :same same :sequence
                    sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun compare-cursor-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-compare-cursor-reply))

;;; Request xcb.Test.FakeInput
(defun fake-input (conn type detail time root root-x root-y deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-TEST")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf detail)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf root)
    (xcb:buffer-write-padding %buf 8)
    (xcb:buffer-write-card16 %buf root-x)
    (xcb:buffer-write-card16 %buf root-y)
    (xcb:buffer-write-padding %buf 7)
    (xcb:buffer-write-card8 %buf deviceid)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass fake-input-request (xcb:request)
          ((type :initarg :type :type (unsigned-byte 8))
           (detail :initarg :detail :type (unsigned-byte 8))
           (time :initarg :time :type (unsigned-byte 32)) (root :initarg :root :type xcb:window)
           (root-x :initarg :root-x :type (signed-byte 16))
           (root-y :initarg :root-y :type (signed-byte 16))
           (deviceid :initarg :deviceid :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj fake-input-request))
  (fake-input conn (slot-value %obj 'type) (slot-value %obj 'detail) (slot-value %obj 'time)
   (slot-value %obj 'root) (slot-value %obj 'root-x) (slot-value %obj 'root-y)
   (slot-value %obj 'deviceid)))

;;; Request xcb.Test.GrabControl
(defun grab-control (conn impervious)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-TEST")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-bool %buf impervious)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass grab-control-request (xcb:request)
          ((impervious :initarg :impervious :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj grab-control-request))
  (grab-control conn (slot-value %obj 'impervious)))
