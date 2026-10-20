;;; Generated from xselinux.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-SELINUX
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:context
   #:context-len
   #:data-context
   #:data-context-len
   #:decode-get-client-context-reply
   #:decode-get-device-context-reply
   #:decode-get-device-create-context-reply
   #:decode-get-property-context-reply
   #:decode-get-property-create-context-reply
   #:decode-get-property-data-context-reply
   #:decode-get-property-use-context-reply
   #:decode-get-selection-context-reply
   #:decode-get-selection-create-context-reply
   #:decode-get-selection-data-context-reply
   #:decode-get-selection-use-context-reply
   #:decode-get-window-context-reply
   #:decode-get-window-create-context-reply
   #:decode-list-item
   #:decode-list-properties-reply
   #:decode-list-selections-reply
   #:decode-query-version-reply
   #:encode-list-item
   #:get-client-context
   #:get-client-context-reply
   #:get-client-context-request
   #:get-device-context
   #:get-device-context-reply
   #:get-device-context-request
   #:get-device-create-context
   #:get-device-create-context-reply
   #:get-device-create-context-request
   #:get-property-context
   #:get-property-context-reply
   #:get-property-context-request
   #:get-property-create-context
   #:get-property-create-context-reply
   #:get-property-create-context-request
   #:get-property-data-context
   #:get-property-data-context-reply
   #:get-property-data-context-request
   #:get-property-use-context
   #:get-property-use-context-reply
   #:get-property-use-context-request
   #:get-selection-context
   #:get-selection-context-reply
   #:get-selection-context-request
   #:get-selection-create-context
   #:get-selection-create-context-reply
   #:get-selection-create-context-request
   #:get-selection-data-context
   #:get-selection-data-context-reply
   #:get-selection-data-context-request
   #:get-selection-use-context
   #:get-selection-use-context-reply
   #:get-selection-use-context-request
   #:get-window-context
   #:get-window-context-reply
   #:get-window-context-request
   #:get-window-create-context
   #:get-window-create-context-reply
   #:get-window-create-context-request
   #:length
   #:list-item
   #:list-properties
   #:list-properties-reply
   #:list-properties-request
   #:list-selections
   #:list-selections-reply
   #:list-selections-request
   #:name
   #:object-context
   #:object-context-len
   #:properties
   #:properties-len
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:selections
   #:selections-len
   #:sequence
   #:server-major
   #:server-minor
   #:set-device-context
   #:set-device-context-request
   #:set-device-create-context
   #:set-device-create-context-request
   #:set-property-create-context
   #:set-property-create-context-request
   #:set-property-use-context
   #:set-property-use-context-request
   #:set-selection-create-context
   #:set-selection-create-context-request
   #:set-selection-use-context
   #:set-selection-use-context-request
   #:set-window-create-context
   #:set-window-create-context-request))

(in-package #:XCB-SELINUX)

(xcb:register-extension-xname "XCB-SELINUX" "SELinux")

;;; Request xcb.SELinux.QueryVersion
(defun query-version (conn client-major client-minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf client-major)
    (xcb:buffer-write-card8 %buf client-minor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((client-major :initarg :client-major :type (unsigned-byte 8))
           (client-minor :initarg :client-minor :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'client-major) (slot-value %obj 'client-minor)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major :initarg :server-major :accessor server-major :type (unsigned-byte 16))
           (server-minor :initarg :server-minor :accessor server-minor :type (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length server-major server-minor)
    (declare (ignorable %p response-type sequence length server-major server-minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf server-major (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf server-minor (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :server-major server-major :server-minor server-minor)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.SELinux.SetDeviceCreateContext
(defun set-device-create-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-device-create-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-create-context-request))
  (set-device-create-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetDeviceCreateContext
(defun get-device-create-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-create-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-device-create-context-request))
  (get-device-create-context conn))
(defclass get-device-create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-device-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-device-create-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-device-create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-create-context-reply))

;;; Request xcb.SELinux.SetDeviceContext
(defun set-device-context (conn device context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf device)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-device-context-request (xcb:request)
          ((device :initarg :device :type (unsigned-byte 32))
           (context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-context-request))
  (set-device-context conn (slot-value %obj 'device) (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetDeviceContext
(defun get-device-context (conn device)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf device)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-context-request (xcb:request-with-reply)
          ((device :initarg :device :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-device-context-request))
  (get-device-context conn (slot-value %obj 'device)))
(defclass get-device-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-device-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-device-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-device-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-context-reply))

;;; Request xcb.SELinux.SetWindowCreateContext
(defun set-window-create-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-window-create-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-window-create-context-request))
  (set-window-create-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetWindowCreateContext
(defun get-window-create-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-window-create-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-window-create-context-request))
  (get-window-create-context conn))
(defclass get-window-create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-window-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-window-create-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-window-create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-window-create-context-reply))

;;; Request xcb.SELinux.GetWindowContext
(defun get-window-context (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-window-context-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-window-context-request))
  (get-window-context conn (slot-value %obj 'window)))
(defclass get-window-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-window-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-window-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-window-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-window-context-reply))

;;; xcb.SELinux.ListItem
(defclass list-item nil
          ((name :initarg :name :accessor name :type xcb:atom)
           (object-context-len :initarg :object-context-len :accessor object-context-len :type
            (unsigned-byte 32))
           (data-context-len :initarg :data-context-len :accessor data-context-len :type
            (unsigned-byte 32))
           (object-context :initarg :object-context :accessor object-context :type cl:sequence)
           (data-context :initarg :data-context :accessor data-context :type cl:sequence)))
(defun encode-list-item (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name))
         (object-context (slot-value %obj 'object-context))
         (data-context (slot-value %obj 'data-context))
         (object-context-len (cl:length object-context))
         (data-context-len (cl:length data-context)))
    (declare (ignorable name object-context data-context object-context-len data-context-len))
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card32 %buf object-context-len)
    (xcb:buffer-write-card32 %buf data-context-len)
    (xcb:buffer-write-string-octets %buf object-context object-context-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-string-octets %buf data-context data-context-len)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-list-item (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name object-context-len data-context-len object-context data-context)
    (declare (ignorable %p name object-context-len data-context-len object-context data-context))
    (setf name (xcb:read-card32-at %buf %p %order))
    (setf object-context-len (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf data-context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 12))
    (setf object-context (xcb:read-string-at %buf %p object-context-len))
    (incf %p (cl:length object-context))
    (setf %p (xcb:align-position %p 4))
    (setf data-context (xcb:read-string-at %buf %p data-context-len))
    (incf %p (cl:length data-context))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'list-item :name name :object-context-len object-context-len :data-context-len
                    data-context-len :object-context object-context :data-context data-context)
     %p)))

;;; Request xcb.SELinux.SetPropertyCreateContext
(defun set-property-create-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-property-create-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-property-create-context-request))
  (set-property-create-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetPropertyCreateContext
(defun get-property-create-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-property-create-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-property-create-context-request))
  (get-property-create-context conn))
(defclass get-property-create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-property-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-property-create-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-property-create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-property-create-context-reply))

;;; Request xcb.SELinux.SetPropertyUseContext
(defun set-property-use-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-property-use-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-property-use-context-request))
  (set-property-use-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetPropertyUseContext
(defun get-property-use-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-property-use-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-property-use-context-request))
  (get-property-use-context conn))
(defclass get-property-use-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-property-use-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-property-use-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-property-use-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-property-use-context-reply))

;;; Request xcb.SELinux.GetPropertyContext
(defun get-property-context (conn window property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-property-context-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window) (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-property-context-request))
  (get-property-context conn (slot-value %obj 'window) (slot-value %obj 'property)))
(defclass get-property-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-property-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-property-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-property-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-property-context-reply))

;;; Request xcb.SELinux.GetPropertyDataContext
(defun get-property-data-context (conn window property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-property-data-context-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window) (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-property-data-context-request))
  (get-property-data-context conn (slot-value %obj 'window) (slot-value %obj 'property)))
(defclass get-property-data-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-property-data-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-property-data-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-property-data-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-property-data-context-reply))

;;; Request xcb.SELinux.ListProperties
(defun list-properties (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-properties-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj list-properties-request))
  (list-properties conn (slot-value %obj 'window)))
(defclass list-properties-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (properties-len :initarg :properties-len :accessor properties-len :type
            (unsigned-byte 32))
           (properties :initarg :properties :accessor properties :type cl:sequence)))
(defun decode-list-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length properties-len properties)
    (declare (ignorable %p response-type sequence length properties-len properties))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf properties-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (properties %p)
      (xcb:read-struct-vector-at %buf %p (min properties-len (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-list-item))
    (values
     (make-instance 'list-properties-reply :response-type response-type :sequence sequence :length
                    length :properties-len properties-len :properties properties)
     (+ %pos 32 (* 4 length)))))
(defun list-properties-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-properties-reply))

;;; Request xcb.SELinux.SetSelectionCreateContext
(defun set-selection-create-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-selection-create-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-selection-create-context-request))
  (set-selection-create-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetSelectionCreateContext
(defun get-selection-create-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-selection-create-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-selection-create-context-request))
  (get-selection-create-context conn))
(defclass get-selection-create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-selection-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-selection-create-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-selection-create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-selection-create-context-reply))

;;; Request xcb.SELinux.SetSelectionUseContext
(defun set-selection-use-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn))
         (context-len (cl:length context)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-len)
    (xcb:buffer-write-string-octets %buf context context-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-selection-use-context-request (xcb:request)
          ((context-len :initarg :context-len :type (unsigned-byte 32))
           (context :initarg :context :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-selection-use-context-request))
  (set-selection-use-context conn (slot-value %obj 'context)))

;;; Request xcb.SELinux.GetSelectionUseContext
(defun get-selection-use-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-selection-use-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-selection-use-context-request))
  (get-selection-use-context conn))
(defclass get-selection-use-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-selection-use-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-selection-use-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-selection-use-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-selection-use-context-reply))

;;; Request xcb.SELinux.GetSelectionContext
(defun get-selection-context (conn selection)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf selection)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-selection-context-request (xcb:request-with-reply)
          ((selection :initarg :selection :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-selection-context-request))
  (get-selection-context conn (slot-value %obj 'selection)))
(defclass get-selection-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-selection-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-selection-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-selection-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-selection-context-reply))

;;; Request xcb.SELinux.GetSelectionDataContext
(defun get-selection-data-context (conn selection)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf selection)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-selection-data-context-request (xcb:request-with-reply)
          ((selection :initarg :selection :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-selection-data-context-request))
  (get-selection-data-context conn (slot-value %obj 'selection)))
(defclass get-selection-data-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-selection-data-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-selection-data-context-reply :response-type response-type :sequence
                    sequence :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-selection-data-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-selection-data-context-reply))

;;; Request xcb.SELinux.ListSelections
(defun list-selections (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-selections-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj list-selections-request)) (list-selections conn))
(defclass list-selections-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (selections-len :initarg :selections-len :accessor selections-len :type
            (unsigned-byte 32))
           (selections :initarg :selections :accessor selections :type cl:sequence)))
(defun decode-list-selections-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length selections-len selections)
    (declare (ignorable %p response-type sequence length selections-len selections))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf selections-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (selections %p)
      (xcb:read-struct-vector-at %buf %p (min selections-len (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-list-item))
    (values
     (make-instance 'list-selections-reply :response-type response-type :sequence sequence :length
                    length :selections-len selections-len :selections selections)
     (+ %pos 32 (* 4 length)))))
(defun list-selections-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-selections-reply))

;;; Request xcb.SELinux.GetClientContext
(defun get-client-context (conn resource)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SELINUX"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf resource)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-client-context-request (xcb:request-with-reply)
          ((resource :initarg :resource :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-client-context-request))
  (get-client-context conn (slot-value %obj 'resource)))
(defclass get-client-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context-len :initarg :context-len :accessor context-len :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type cl:sequence)))
(defun decode-get-client-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context-len context)
    (declare (ignorable %p response-type sequence length context-len context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf context
            (xcb:read-string-at %buf %p
             (min context-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length context))
    (values
     (make-instance 'get-client-context-reply :response-type response-type :sequence sequence
                    :length length :context-len context-len :context context)
     (+ %pos 32 (* 4 length)))))
(defun get-client-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-client-context-reply))
