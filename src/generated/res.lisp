;;; Generated from res.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-RES
  (:use #:cl)
  (:shadow #:COUNT #:LENGTH #:SEQUENCE #:TYPE)
  (:export
   #:bytes
   #:bytes-overflow
   #:client
   #:client-id-spec
   #:client-id-value
   #:clients
   #:count
   #:cross-references
   #:decode-client
   #:decode-client-id-spec
   #:decode-client-id-value
   #:decode-query-client-ids-reply
   #:decode-query-client-pixmap-bytes-reply
   #:decode-query-client-resources-reply
   #:decode-query-clients-reply
   #:decode-query-resource-bytes-reply
   #:decode-query-version-reply
   #:decode-resource-id-spec
   #:decode-resource-size-spec
   #:decode-resource-size-value
   #:decode-type
   #:encode-client
   #:encode-client-id-spec
   #:encode-client-id-value
   #:encode-resource-id-spec
   #:encode-resource-size-spec
   #:encode-resource-size-value
   #:encode-type
   #:ids
   #:length
   #:mask
   #:num-clients
   #:num-cross-references
   #:num-ids
   #:num-sizes
   #:num-types
   #:query-client-ids
   #:query-client-ids-reply
   #:query-client-ids-request
   #:query-client-pixmap-bytes
   #:query-client-pixmap-bytes-reply
   #:query-client-pixmap-bytes-request
   #:query-client-resources
   #:query-client-resources-reply
   #:query-client-resources-request
   #:query-clients
   #:query-clients-reply
   #:query-clients-request
   #:query-resource-bytes
   #:query-resource-bytes-reply
   #:query-resource-bytes-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:ref-count
   #:resource
   #:resource-base
   #:resource-id-spec
   #:resource-mask
   #:resource-size-spec
   #:resource-size-value
   #:resource-type
   #:response-type
   #:sequence
   #:server-major
   #:server-minor
   #:size
   #:sizes
   #:spec
   #:type
   #:types
   #:use-count
   #:value))

(in-package #:XCB-RES)

(xcb:register-extension-xname "XCB-RES" "X-Resource")

;;; xcb.Res.Client
(defclass client nil
          ((resource-base :initarg :resource-base :accessor resource-base :type (unsigned-byte 32))
           (resource-mask :initarg :resource-mask :accessor resource-mask :type
            (unsigned-byte 32))))
(defun encode-client (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((resource-base (slot-value %obj 'resource-base))
         (resource-mask (slot-value %obj 'resource-mask)))
    (declare (ignorable resource-base resource-mask))
    (xcb:buffer-write-card32 %buf resource-base)
    (xcb:buffer-write-card32 %buf resource-mask)))
(defun decode-client (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) resource-base resource-mask)
    (declare (ignorable %p resource-base resource-mask))
    (setf resource-base (xcb:read-card32-at %buf %p %order))
    (setf resource-mask (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'client :resource-base resource-base :resource-mask resource-mask)
            (+ %p 8))))

;;; xcb.Res.Type
(defclass type nil
          ((resource-type :initarg :resource-type :accessor resource-type :type xcb:atom)
           (count :initarg :count :accessor count :type (unsigned-byte 32))))
(defun encode-type (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((resource-type (slot-value %obj 'resource-type)) (count (slot-value %obj 'count)))
    (declare (ignorable resource-type count))
    (xcb:buffer-write-card32 %buf resource-type)
    (xcb:buffer-write-card32 %buf count)))
(defun decode-type (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) resource-type count)
    (declare (ignorable %p resource-type count))
    (setf resource-type (xcb:read-card32-at %buf %p %order))
    (setf count (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'type :resource-type resource-type :count count) (+ %p 8))))

;;; Enum xcb.Res.ClientIdMask
(xcb:defenum res-client-id-mask
  (:client-xid 1)
  (:local-client-pid 2))

;;; xcb.Res.ClientIdSpec
(defclass client-id-spec nil
          ((client :initarg :client :accessor client :type (unsigned-byte 32))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 32))))
(defun encode-client-id-spec (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((client (slot-value %obj 'client)) (mask (slot-value %obj 'mask)))
    (declare (ignorable client mask))
    (xcb:buffer-write-card32 %buf client)
    (xcb:buffer-write-card32 %buf mask)))
(defun decode-client-id-spec (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) client mask)
    (declare (ignorable %p client mask))
    (setf client (xcb:read-card32-at %buf %p %order))
    (setf mask (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'client-id-spec :client client :mask mask) (+ %p 8))))

;;; xcb.Res.ClientIdValue
(defclass client-id-value nil
          ((spec :initarg :spec :accessor spec :type client-id-spec)
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (value :initarg :value :accessor value :type cl:sequence)))
(defun encode-client-id-value (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((spec (slot-value %obj 'spec))
         (length (slot-value %obj 'length))
         (value (slot-value %obj 'value)))
    (declare (ignorable spec length value))
    (encode-client-id-spec %buf spec)
    (xcb:buffer-write-card32 %buf length)
    (xcb:buffer-write-list %buf value (truncate length 4) #'xcb:buffer-write-card32)))
(defun decode-client-id-value (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) spec length value)
    (declare (ignorable %p spec length value))
    (setf spec (decode-client-id-spec %buf %p %order))
    (setf length (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 12))
    (multiple-value-setq (value %p)
      (xcb:read-vector-at %buf %p (truncate length 4) %order :card32))
    (values (make-instance 'client-id-value :spec spec :length length :value value) %p)))

;;; xcb.Res.ResourceIdSpec
(defclass resource-id-spec nil
          ((resource :initarg :resource :accessor resource :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type (unsigned-byte 32))))
(defun encode-resource-id-spec (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((resource (slot-value %obj 'resource)) (type (slot-value %obj 'type)))
    (declare (ignorable resource type))
    (xcb:buffer-write-card32 %buf resource)
    (xcb:buffer-write-card32 %buf type)))
(defun decode-resource-id-spec (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) resource type)
    (declare (ignorable %p resource type))
    (setf resource (xcb:read-card32-at %buf %p %order))
    (setf type (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'resource-id-spec :resource resource :type type) (+ %p 8))))

;;; xcb.Res.ResourceSizeSpec
(defclass resource-size-spec nil
          ((spec :initarg :spec :accessor spec :type resource-id-spec)
           (bytes :initarg :bytes :accessor bytes :type (unsigned-byte 32))
           (ref-count :initarg :ref-count :accessor ref-count :type (unsigned-byte 32))
           (use-count :initarg :use-count :accessor use-count :type (unsigned-byte 32))))
(defun encode-resource-size-spec (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((spec (slot-value %obj 'spec))
         (bytes (slot-value %obj 'bytes))
         (ref-count (slot-value %obj 'ref-count))
         (use-count (slot-value %obj 'use-count)))
    (declare (ignorable spec bytes ref-count use-count))
    (encode-resource-id-spec %buf spec)
    (xcb:buffer-write-card32 %buf bytes)
    (xcb:buffer-write-card32 %buf ref-count)
    (xcb:buffer-write-card32 %buf use-count)))
(defun decode-resource-size-spec (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) spec bytes ref-count use-count)
    (declare (ignorable %p spec bytes ref-count use-count))
    (setf spec (decode-resource-id-spec %buf %p %order))
    (setf bytes (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ref-count (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf use-count (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'resource-size-spec :spec spec :bytes bytes :ref-count ref-count :use-count
                    use-count)
     (+ %p 20))))

;;; xcb.Res.ResourceSizeValue
(defclass resource-size-value nil
          ((size :initarg :size :accessor size :type resource-size-spec)
           (num-cross-references :initarg :num-cross-references :accessor num-cross-references
            :type (unsigned-byte 32))
           (cross-references :initarg :cross-references :accessor cross-references :type
            cl:sequence)))
(defun encode-resource-size-value (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((size (slot-value %obj 'size))
         (cross-references (slot-value %obj 'cross-references))
         (num-cross-references (cl:length cross-references)))
    (declare (ignorable size cross-references num-cross-references))
    (encode-resource-size-spec %buf size)
    (xcb:buffer-write-card32 %buf num-cross-references)
    (xcb:buffer-write-list %buf cross-references num-cross-references #'encode-resource-size-spec)))
(defun decode-resource-size-value (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) size num-cross-references cross-references)
    (declare (ignorable %p size num-cross-references cross-references))
    (setf size (decode-resource-size-spec %buf %p %order))
    (setf num-cross-references (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 24))
    (multiple-value-setq (cross-references %p)
      (xcb:read-struct-vector-at %buf %p num-cross-references %order #'decode-resource-size-spec))
    (values
     (make-instance 'resource-size-value :size size :num-cross-references num-cross-references
                    :cross-references cross-references)
     %p)))

;;; Request xcb.Res.QueryVersion
(defun query-version (conn client-major client-minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES")) (%buf (xcb:conn-send-buffer conn)))
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

;;; Request xcb.Res.QueryClients
(defun query-clients (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-clients-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-clients-request)) (query-clients conn))
(defclass query-clients-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-clients :initarg :num-clients :accessor num-clients :type (unsigned-byte 32))
           (clients :initarg :clients :accessor clients :type cl:sequence)))
(defun decode-query-clients-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-clients clients)
    (declare (ignorable %p response-type sequence length num-clients clients))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-clients (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (clients %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-clients (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order #'decode-client))
    (values
     (make-instance 'query-clients-reply :response-type response-type :sequence sequence :length
                    length :num-clients num-clients :clients clients)
     (+ %pos 32 (* 4 length)))))
(defun query-clients-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-clients-reply))

;;; Request xcb.Res.QueryClientResources
(defun query-client-resources (conn xid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf xid)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-client-resources-request (xcb:request-with-reply)
          ((xid :initarg :xid :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-client-resources-request))
  (query-client-resources conn (slot-value %obj 'xid)))
(defclass query-client-resources-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-types :initarg :num-types :accessor num-types :type (unsigned-byte 32))
           (types :initarg :types :accessor types :type cl:sequence)))
(defun decode-query-client-resources-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-types types)
    (declare (ignorable %p response-type sequence length num-types types))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-types (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (types %p)
      (xcb:read-struct-vector-at %buf %p (min num-types (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-type))
    (values
     (make-instance 'query-client-resources-reply :response-type response-type :sequence sequence
                    :length length :num-types num-types :types types)
     (+ %pos 32 (* 4 length)))))
(defun query-client-resources-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-client-resources-reply))

;;; Request xcb.Res.QueryClientPixmapBytes
(defun query-client-pixmap-bytes (conn xid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf xid)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-client-pixmap-bytes-request (xcb:request-with-reply)
          ((xid :initarg :xid :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-client-pixmap-bytes-request))
  (query-client-pixmap-bytes conn (slot-value %obj 'xid)))
(defclass query-client-pixmap-bytes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (bytes :initarg :bytes :accessor bytes :type (unsigned-byte 32))
           (bytes-overflow :initarg :bytes-overflow :accessor bytes-overflow :type
            (unsigned-byte 32))))
(defun decode-query-client-pixmap-bytes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length bytes bytes-overflow)
    (declare (ignorable %p response-type sequence length bytes bytes-overflow))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf bytes (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf bytes-overflow (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-client-pixmap-bytes-reply :response-type response-type :sequence
                    sequence :length length :bytes bytes :bytes-overflow bytes-overflow)
     (+ %pos 32 (* 4 length)))))
(defun query-client-pixmap-bytes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-client-pixmap-bytes-reply))

;;; Request xcb.Res.QueryClientIds
(defun query-client-ids (conn specs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES"))
         (%buf (xcb:conn-send-buffer conn))
         (num-specs (cl:length specs)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf num-specs)
    (xcb:buffer-write-list %buf specs num-specs #'encode-client-id-spec)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-client-ids-request (xcb:request-with-reply)
          ((num-specs :initarg :num-specs :type (unsigned-byte 32))
           (specs :initarg :specs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj query-client-ids-request))
  (query-client-ids conn (slot-value %obj 'specs)))
(defclass query-client-ids-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-ids :initarg :num-ids :accessor num-ids :type (unsigned-byte 32))
           (ids :initarg :ids :accessor ids :type cl:sequence)))
(defun decode-query-client-ids-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-ids ids)
    (declare (ignorable %p response-type sequence length num-ids ids))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-ids (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (ids %p)
      (xcb:read-struct-vector-at %buf %p (min num-ids (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-client-id-value))
    (values
     (make-instance 'query-client-ids-reply :response-type response-type :sequence sequence :length
                    length :num-ids num-ids :ids ids)
     (+ %pos 32 (* 4 length)))))
(defun query-client-ids-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-client-ids-reply))

;;; Request xcb.Res.QueryResourceBytes
(defun query-resource-bytes (conn client specs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RES"))
         (%buf (xcb:conn-send-buffer conn))
         (num-specs (cl:length specs)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf client)
    (xcb:buffer-write-card32 %buf num-specs)
    (xcb:buffer-write-list %buf specs num-specs #'encode-resource-id-spec)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-resource-bytes-request (xcb:request-with-reply)
          ((client :initarg :client :type (unsigned-byte 32))
           (num-specs :initarg :num-specs :type (unsigned-byte 32))
           (specs :initarg :specs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj query-resource-bytes-request))
  (query-resource-bytes conn (slot-value %obj 'client) (slot-value %obj 'specs)))
(defclass query-resource-bytes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-sizes :initarg :num-sizes :accessor num-sizes :type (unsigned-byte 32))
           (sizes :initarg :sizes :accessor sizes :type cl:sequence)))
(defun decode-query-resource-bytes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-sizes sizes)
    (declare (ignorable %p response-type sequence length num-sizes sizes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-sizes (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (sizes %p)
      (xcb:read-struct-vector-at %buf %p (min num-sizes (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-resource-size-value))
    (values
     (make-instance 'query-resource-bytes-reply :response-type response-type :sequence sequence
                    :length length :num-sizes num-sizes :sizes sizes)
     (+ %pos 32 (* 4 length)))))
(defun query-resource-bytes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-resource-bytes-reply))
