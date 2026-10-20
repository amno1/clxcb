;;; Generated from record.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-RECORD
  (:use #:cl)
  (:shadow #:FIRST #:LAST #:LENGTH #:SEQUENCE)
  (:export
   #:bad-context-error
   #:category
   #:client-died
   #:client-info
   #:client-resource
   #:client-spec
   #:client-started
   #:client-swapped
   #:context
   #:core-replies
   #:core-requests
   #:create-context
   #:create-context-request
   #:data
   #:decode-bad-context-error
   #:decode-client-info
   #:decode-enable-context-reply
   #:decode-ext-range
   #:decode-get-context-reply
   #:decode-query-version-reply
   #:decode-range
   #:decode-range16
   #:decode-range8
   #:delivered-events
   #:device-events
   #:disable-context
   #:disable-context-request
   #:element-header
   #:enable-context
   #:enable-context-reply
   #:enable-context-request
   #:enabled
   #:encode-client-info
   #:encode-ext-range
   #:encode-range
   #:encode-range16
   #:encode-range8
   #:error-code
   #:errors
   #:ext-range
   #:ext-replies
   #:ext-requests
   #:first
   #:free-context
   #:free-context-request
   #:get-context
   #:get-context-reply
   #:get-context-request
   #:intercepted-clients
   #:invalid-record
   #:last
   #:length
   #:major
   #:major-opcode
   #:major-version
   #:minor
   #:minor-opcode
   #:minor-version
   #:num-intercepted-clients
   #:num-ranges
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:range
   #:range16
   #:range8
   #:ranges
   #:rec-sequence-num
   #:register-clients
   #:register-clients-request
   #:response-type
   #:sequence
   #:server-time
   #:unregister-clients
   #:unregister-clients-request
   #:xid-base))

(in-package #:XCB-RECORD)

(xcb:register-extension-xname "XCB-RECORD" "RECORD")
(deftype context () '(unsigned-byte 32))

;;; xcb.Record.Range8
(defclass range8 nil
          ((first :initarg :first :accessor first :type (unsigned-byte 8))
           (last :initarg :last :accessor last :type (unsigned-byte 8))))
(defun encode-range8 (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((first (slot-value %obj 'first)) (last (slot-value %obj 'last)))
    (declare (ignorable first last))
    (xcb:buffer-write-card8 %buf first)
    (xcb:buffer-write-card8 %buf last)))
(defun decode-range8 (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) first last)
    (declare (ignorable %p first last))
    (setf first (xcb:read-card8-at %buf %p))
    (setf last (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'range8 :first first :last last) (+ %p 2))))

;;; xcb.Record.Range16
(defclass range16 nil
          ((first :initarg :first :accessor first :type (unsigned-byte 16))
           (last :initarg :last :accessor last :type (unsigned-byte 16))))
(defun encode-range16 (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((first (slot-value %obj 'first)) (last (slot-value %obj 'last)))
    (declare (ignorable first last))
    (xcb:buffer-write-card16 %buf first)
    (xcb:buffer-write-card16 %buf last)))
(defun decode-range16 (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) first last)
    (declare (ignorable %p first last))
    (setf first (xcb:read-card16-at %buf %p %order))
    (setf last (xcb:read-card16-at %buf (+ %p 2) %order))
    (values (make-instance 'range16 :first first :last last) (+ %p 4))))

;;; xcb.Record.ExtRange
(defclass ext-range nil
          ((major :initarg :major :accessor major :type range8)
           (minor :initarg :minor :accessor minor :type range16)))
(defun encode-ext-range (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((major (slot-value %obj 'major)) (minor (slot-value %obj 'minor)))
    (declare (ignorable major minor))
    (encode-range8 %buf major)
    (encode-range16 %buf minor)))
(defun decode-ext-range (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) major minor)
    (declare (ignorable %p major minor))
    (setf major (decode-range8 %buf %p %order))
    (setf minor (decode-range16 %buf (+ %p 2) %order))
    (values (make-instance 'ext-range :major major :minor minor) (+ %p 6))))

;;; xcb.Record.Range
(defclass range nil
          ((core-requests :initarg :core-requests :accessor core-requests :type range8)
           (core-replies :initarg :core-replies :accessor core-replies :type range8)
           (ext-requests :initarg :ext-requests :accessor ext-requests :type ext-range)
           (ext-replies :initarg :ext-replies :accessor ext-replies :type ext-range)
           (delivered-events :initarg :delivered-events :accessor delivered-events :type range8)
           (device-events :initarg :device-events :accessor device-events :type range8)
           (errors :initarg :errors :accessor errors :type range8)
           (client-started :initarg :client-started :accessor client-started :type
            (or boolean (unsigned-byte 8)))
           (client-died :initarg :client-died :accessor client-died :type
            (or boolean (unsigned-byte 8)))))
(defun encode-range (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((core-requests (slot-value %obj 'core-requests))
         (core-replies (slot-value %obj 'core-replies))
         (ext-requests (slot-value %obj 'ext-requests))
         (ext-replies (slot-value %obj 'ext-replies))
         (delivered-events (slot-value %obj 'delivered-events))
         (device-events (slot-value %obj 'device-events))
         (errors (slot-value %obj 'errors))
         (client-started (slot-value %obj 'client-started))
         (client-died (slot-value %obj 'client-died)))
    (declare
     (ignorable core-requests core-replies ext-requests ext-replies delivered-events device-events
      errors client-started client-died))
    (encode-range8 %buf core-requests)
    (encode-range8 %buf core-replies)
    (encode-ext-range %buf ext-requests)
    (encode-ext-range %buf ext-replies)
    (encode-range8 %buf delivered-events)
    (encode-range8 %buf device-events)
    (encode-range8 %buf errors)
    (xcb:buffer-write-bool %buf client-started)
    (xcb:buffer-write-bool %buf client-died)))
(defun decode-range (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        core-requests
        core-replies
        ext-requests
        ext-replies
        delivered-events
        device-events
        errors
        client-started
        client-died)
    (declare
     (ignorable %p core-requests core-replies ext-requests ext-replies delivered-events
      device-events errors client-started client-died))
    (setf core-requests (decode-range8 %buf %p %order))
    (setf core-replies (decode-range8 %buf (+ %p 2) %order))
    (setf ext-requests (decode-ext-range %buf (+ %p 4) %order))
    (setf ext-replies (decode-ext-range %buf (+ %p 10) %order))
    (setf delivered-events (decode-range8 %buf (+ %p 16) %order))
    (setf device-events (decode-range8 %buf (+ %p 18) %order))
    (setf errors (decode-range8 %buf (+ %p 20) %order))
    (setf client-started (xcb:read-card8-at %buf (+ %p 22)))
    (setf client-died (xcb:read-card8-at %buf (+ %p 23)))
    (values
     (make-instance 'range :core-requests core-requests :core-replies core-replies :ext-requests
                    ext-requests :ext-replies ext-replies :delivered-events delivered-events
                    :device-events device-events :errors errors :client-started client-started
                    :client-died client-died)
     (+ %p 24))))
(deftype element-header () '(unsigned-byte 8))

;;; Enum xcb.Record.HType
(xcb:defenum record-h-type
  (:from-server-time 1)
  (:from-client-time 2)
  (:from-client-sequence 4))
(deftype client-spec () '(unsigned-byte 32))

;;; Enum xcb.Record.CS
(xcb:defenum record-cs
  (:current-clients 1)
  (:future-clients 2)
  (:all-clients 3))

;;; xcb.Record.ClientInfo
(defclass client-info nil
          ((client-resource :initarg :client-resource :accessor client-resource :type client-spec)
           (num-ranges :initarg :num-ranges :accessor num-ranges :type (unsigned-byte 32))
           (ranges :initarg :ranges :accessor ranges :type cl:sequence)))
(defun encode-client-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((client-resource (slot-value %obj 'client-resource))
         (ranges (slot-value %obj 'ranges))
         (num-ranges (cl:length ranges)))
    (declare (ignorable client-resource ranges num-ranges))
    (xcb:buffer-write-card32 %buf client-resource)
    (xcb:buffer-write-card32 %buf num-ranges)
    (xcb:buffer-write-list %buf ranges num-ranges #'encode-range)))
(defun decode-client-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) client-resource num-ranges ranges)
    (declare (ignorable %p client-resource num-ranges ranges))
    (setf client-resource (xcb:read-card32-at %buf %p %order))
    (setf num-ranges (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (ranges %p)
      (xcb:read-struct-vector-at %buf %p num-ranges %order #'decode-range))
    (values
     (make-instance 'client-info :client-resource client-resource :num-ranges num-ranges :ranges
                    ranges)
     %p)))

;;; Error xcb.Record.BadContext (0)
(defclass bad-context-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (invalid-record :initarg :invalid-record :accessor invalid-record :type
            (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-context-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence invalid-record minor-opcode major-opcode)
    (declare
     (ignorable %p response-type error-code sequence invalid-record minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf invalid-record (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'bad-context-error :response-type response-type :error-code error-code
                    :sequence sequence :invalid-record invalid-record :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RECORD" 0 #'decode-bad-context-error)

;;; Request xcb.Record.QueryVersion
(defun query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf major-version)
    (xcb:buffer-write-card16 %buf minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Record.CreateContext
(defun create-context (conn context element-header client-specs ranges)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD"))
         (%buf (xcb:conn-send-buffer conn))
         (num-client-specs (cl:length client-specs))
         (num-ranges (cl:length ranges)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card8 %buf element-header)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf num-client-specs)
    (xcb:buffer-write-card32 %buf num-ranges)
    (xcb:buffer-write-list %buf client-specs num-client-specs #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf ranges num-ranges #'encode-range)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-context-request (xcb:request)
          ((context :initarg :context :type context)
           (element-header :initarg :element-header :type element-header)
           (num-client-specs :initarg :num-client-specs :type (unsigned-byte 32))
           (num-ranges :initarg :num-ranges :type (unsigned-byte 32))
           (client-specs :initarg :client-specs :type cl:sequence)
           (ranges :initarg :ranges :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-context-request))
  (create-context conn (slot-value %obj 'context) (slot-value %obj 'element-header)
   (slot-value %obj 'client-specs) (slot-value %obj 'ranges)))

;;; Request xcb.Record.RegisterClients
(defun register-clients (conn context element-header client-specs ranges)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD"))
         (%buf (xcb:conn-send-buffer conn))
         (num-client-specs (cl:length client-specs))
         (num-ranges (cl:length ranges)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card8 %buf element-header)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf num-client-specs)
    (xcb:buffer-write-card32 %buf num-ranges)
    (xcb:buffer-write-list %buf client-specs num-client-specs #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf ranges num-ranges #'encode-range)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass register-clients-request (xcb:request)
          ((context :initarg :context :type context)
           (element-header :initarg :element-header :type element-header)
           (num-client-specs :initarg :num-client-specs :type (unsigned-byte 32))
           (num-ranges :initarg :num-ranges :type (unsigned-byte 32))
           (client-specs :initarg :client-specs :type cl:sequence)
           (ranges :initarg :ranges :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj register-clients-request))
  (register-clients conn (slot-value %obj 'context) (slot-value %obj 'element-header)
   (slot-value %obj 'client-specs) (slot-value %obj 'ranges)))

;;; Request xcb.Record.UnregisterClients
(defun unregister-clients (conn context client-specs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD"))
         (%buf (xcb:conn-send-buffer conn))
         (num-client-specs (cl:length client-specs)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf num-client-specs)
    (xcb:buffer-write-list %buf client-specs num-client-specs #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass unregister-clients-request (xcb:request)
          ((context :initarg :context :type context)
           (num-client-specs :initarg :num-client-specs :type (unsigned-byte 32))
           (client-specs :initarg :client-specs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj unregister-clients-request))
  (unregister-clients conn (slot-value %obj 'context) (slot-value %obj 'client-specs)))

;;; Request xcb.Record.GetContext
(defun get-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-context-request (xcb:request-with-reply) ((context :initarg :context :type context)))
(defmethod xcb:send-request (conn (%obj get-context-request))
  (get-context conn (slot-value %obj 'context)))
(defclass get-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (enabled :initarg :enabled :accessor enabled :type (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (element-header :initarg :element-header :accessor element-header :type element-header)
           (num-intercepted-clients :initarg :num-intercepted-clients :accessor
            num-intercepted-clients :type (unsigned-byte 32))
           (intercepted-clients :initarg :intercepted-clients :accessor intercepted-clients :type
            cl:sequence)))
(defun decode-get-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        enabled
        sequence
        length
        element-header
        num-intercepted-clients
        intercepted-clients)
    (declare
     (ignorable %p response-type enabled sequence length element-header num-intercepted-clients
      intercepted-clients))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf enabled (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf element-header (xcb:read-card8-at %buf (+ %p 8)))
    (setf num-intercepted-clients (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (intercepted-clients %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-intercepted-clients (- (+ %pos 32 (* 4 length)) %p)) %order #'decode-client-info))
    (values
     (make-instance 'get-context-reply :response-type response-type :enabled enabled :sequence
                    sequence :length length :element-header element-header :num-intercepted-clients
                    num-intercepted-clients :intercepted-clients intercepted-clients)
     (+ %pos 32 (* 4 length)))))
(defun get-context-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-context-reply))

;;; Request xcb.Record.EnableContext
(defun enable-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass enable-context-request (xcb:request-with-reply)
          ((context :initarg :context :type context)))
(defmethod xcb:send-request (conn (%obj enable-context-request))
  (enable-context conn (slot-value %obj 'context)))
(defclass enable-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (category :initarg :category :accessor category :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (element-header :initarg :element-header :accessor element-header :type element-header)
           (client-swapped :initarg :client-swapped :accessor client-swapped :type
            (or boolean (unsigned-byte 8)))
           (xid-base :initarg :xid-base :accessor xid-base :type (unsigned-byte 32))
           (server-time :initarg :server-time :accessor server-time :type (unsigned-byte 32))
           (rec-sequence-num :initarg :rec-sequence-num :accessor rec-sequence-num :type
            (unsigned-byte 32))
           (data :initarg :data :accessor data :type cl:sequence)))
(defun decode-enable-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        category
        sequence
        length
        element-header
        client-swapped
        xid-base
        server-time
        rec-sequence-num
        data)
    (declare
     (ignorable %p response-type category sequence length element-header client-swapped xid-base
      server-time rec-sequence-num data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf category (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf element-header (xcb:read-card8-at %buf (+ %p 8)))
    (setf client-swapped (xcb:read-card8-at %buf (+ %p 9)))
    (setf xid-base (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf server-time (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf rec-sequence-num (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (data %p)
      (xcb:read-vector-at %buf %p (min (* length 4) (floor (- (+ %pos 32 (* 4 length)) %p) 1))
       %order :card8))
    (values
     (make-instance 'enable-context-reply :response-type response-type :category category :sequence
                    sequence :length length :element-header element-header :client-swapped
                    client-swapped :xid-base xid-base :server-time server-time :rec-sequence-num
                    rec-sequence-num :data data)
     (+ %pos 32 (* 4 length)))))
(defun enable-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-enable-context-reply))

;;; Request xcb.Record.DisableContext
(defun disable-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass disable-context-request (xcb:request) ((context :initarg :context :type context)))
(defmethod xcb:send-request (conn (%obj disable-context-request))
  (disable-context conn (slot-value %obj 'context)))

;;; Request xcb.Record.FreeContext
(defun free-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RECORD")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass free-context-request (xcb:request) ((context :initarg :context :type context)))
(defmethod xcb:send-request (conn (%obj free-context-request))
  (free-context conn (slot-value %obj 'context)))
