;;; Generated from xvmc.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XVMC
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:chroma-format
   #:component-order
   #:context
   #:create-context
   #:create-context-reply
   #:create-context-request
   #:create-subpicture
   #:create-subpicture-reply
   #:create-subpicture-request
   #:create-surface
   #:create-surface-reply
   #:create-surface-request
   #:decode-create-context-reply
   #:decode-create-subpicture-reply
   #:decode-create-surface-reply
   #:decode-list-subpicture-types-reply
   #:decode-list-surface-types-reply
   #:decode-query-version-reply
   #:decode-surface-info
   #:destroy-context
   #:destroy-context-request
   #:destroy-subpicture
   #:destroy-subpicture-request
   #:destroy-surface
   #:destroy-surface-request
   #:encode-surface-info
   #:entry-bytes
   #:flags
   #:flags-return
   #:height-actual
   #:id
   #:length
   #:list-subpicture-types
   #:list-subpicture-types-reply
   #:list-subpicture-types-request
   #:list-surface-types
   #:list-surface-types-reply
   #:list-surface-types-request
   #:major
   #:max-height
   #:max-width
   #:mc-type
   #:minor
   #:num
   #:num-palette-entries
   #:pad0
   #:priv-data
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:sequence
   #:subpicture
   #:subpicture-max-height
   #:subpicture-max-width
   #:surface
   #:surface-info
   #:surfaces
   #:types
   #:width-actual))

(in-package #:XCB-XVMC)

(xcb:register-extension-xname "XCB-XVMC" "XVideo-MotionCompensation")
(deftype context () '(unsigned-byte 32))
(deftype surface () '(unsigned-byte 32))
(deftype subpicture () '(unsigned-byte 32))

;;; xcb.XvMC.SurfaceInfo
(defclass surface-info nil
          ((id :initarg :id :accessor id :type surface)
           (chroma-format :initarg :chroma-format :accessor chroma-format :type (unsigned-byte 16))
           (pad0 :initarg :pad0 :accessor pad0 :type (unsigned-byte 16))
           (max-width :initarg :max-width :accessor max-width :type (unsigned-byte 16))
           (max-height :initarg :max-height :accessor max-height :type (unsigned-byte 16))
           (subpicture-max-width :initarg :subpicture-max-width :accessor subpicture-max-width
            :type (unsigned-byte 16))
           (subpicture-max-height :initarg :subpicture-max-height :accessor subpicture-max-height
            :type (unsigned-byte 16))
           (mc-type :initarg :mc-type :accessor mc-type :type (unsigned-byte 32))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun encode-surface-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((id (slot-value %obj 'id))
         (chroma-format (slot-value %obj 'chroma-format))
         (pad0 (slot-value %obj 'pad0))
         (max-width (slot-value %obj 'max-width))
         (max-height (slot-value %obj 'max-height))
         (subpicture-max-width (slot-value %obj 'subpicture-max-width))
         (subpicture-max-height (slot-value %obj 'subpicture-max-height))
         (mc-type (slot-value %obj 'mc-type))
         (flags (slot-value %obj 'flags)))
    (declare
     (ignorable id chroma-format pad0 max-width max-height subpicture-max-width
      subpicture-max-height mc-type flags))
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card16 %buf chroma-format)
    (xcb:buffer-write-card16 %buf pad0)
    (xcb:buffer-write-card16 %buf max-width)
    (xcb:buffer-write-card16 %buf max-height)
    (xcb:buffer-write-card16 %buf subpicture-max-width)
    (xcb:buffer-write-card16 %buf subpicture-max-height)
    (xcb:buffer-write-card32 %buf mc-type)
    (xcb:buffer-write-card32 %buf flags)))
(defun decode-surface-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        id
        chroma-format
        pad0
        max-width
        max-height
        subpicture-max-width
        subpicture-max-height
        mc-type
        flags)
    (declare
     (ignorable %p id chroma-format pad0 max-width max-height subpicture-max-width
      subpicture-max-height mc-type flags))
    (setf id (xcb:read-card32-at %buf %p %order))
    (setf chroma-format (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf pad0 (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf max-width (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf max-height (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf subpicture-max-width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf subpicture-max-height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf mc-type (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 20) %order))
    (values
     (make-instance 'surface-info :id id :chroma-format chroma-format :pad0 pad0 :max-width
                    max-width :max-height max-height :subpicture-max-width subpicture-max-width
                    :subpicture-max-height subpicture-max-height :mc-type mc-type :flags flags)
     (+ %p 24))))

;;; Request xcb.XvMC.QueryVersion
(defun query-version (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-version-request)) (query-version conn))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major :initarg :major :accessor major :type (unsigned-byte 32))
           (minor :initarg :minor :accessor minor :type (unsigned-byte 32))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major minor)
    (declare (ignorable %p response-type sequence length major minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf minor (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major major :minor minor)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.XvMC.ListSurfaceTypes
(defun list-surface-types (conn port-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-surface-types-request (xcb:request-with-reply)
          ((port-id :initarg :port-id :type xcb-xv:port)))
(defmethod xcb:send-request (conn (%obj list-surface-types-request))
  (list-surface-types conn (slot-value %obj 'port-id)))
(defclass list-surface-types-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num :initarg :num :accessor num :type (unsigned-byte 32))
           (surfaces :initarg :surfaces :accessor surfaces :type cl:sequence)))
(defun decode-list-surface-types-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num surfaces)
    (declare (ignorable %p response-type sequence length num surfaces))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (surfaces %p)
      (xcb:read-struct-vector-at %buf %p (min num (floor (- (+ %pos 32 (* 4 length)) %p) 24))
       %order #'decode-surface-info))
    (values
     (make-instance 'list-surface-types-reply :response-type response-type :sequence sequence
                    :length length :num num :surfaces surfaces)
     (+ %pos 32 (* 4 length)))))
(defun list-surface-types-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-surface-types-reply))

;;; Request xcb.XvMC.CreateContext
(defun create-context (conn context-id port-id surface-id width height flags)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-id)
    (xcb:buffer-write-card32 %buf port-id)
    (xcb:buffer-write-card32 %buf surface-id)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-context-request (xcb:request-with-reply)
          ((context-id :initarg :context-id :type context)
           (port-id :initarg :port-id :type xcb-xv:port)
           (surface-id :initarg :surface-id :type surface)
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj create-context-request))
  (create-context conn (slot-value %obj 'context-id) (slot-value %obj 'port-id)
   (slot-value %obj 'surface-id) (slot-value %obj 'width) (slot-value %obj 'height)
   (slot-value %obj 'flags)))
(defclass create-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width-actual :initarg :width-actual :accessor width-actual :type (unsigned-byte 16))
           (height-actual :initarg :height-actual :accessor height-actual :type (unsigned-byte 16))
           (flags-return :initarg :flags-return :accessor flags-return :type (unsigned-byte 32))
           (priv-data :initarg :priv-data :accessor priv-data :type cl:sequence)))
(defun decode-create-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length width-actual height-actual flags-return priv-data)
    (declare
     (ignorable %p response-type sequence length width-actual height-actual flags-return
      priv-data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width-actual (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf height-actual (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf flags-return (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 36))
    (multiple-value-setq (priv-data %p)
      (xcb:read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'create-context-reply :response-type response-type :sequence sequence :length
                    length :width-actual width-actual :height-actual height-actual :flags-return
                    flags-return :priv-data priv-data)
     (+ %pos 32 (* 4 length)))))
(defun create-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-create-context-reply))

;;; Request xcb.XvMC.DestroyContext
(defun destroy-context (conn context-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-context-request (xcb:request) ((context-id :initarg :context-id :type context)))
(defmethod xcb:send-request (conn (%obj destroy-context-request))
  (destroy-context conn (slot-value %obj 'context-id)))

;;; Request xcb.XvMC.CreateSurface
(defun create-surface (conn surface-id context-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf surface-id)
    (xcb:buffer-write-card32 %buf context-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-surface-request (xcb:request-with-reply)
          ((surface-id :initarg :surface-id :type surface)
           (context-id :initarg :context-id :type context)))
(defmethod xcb:send-request (conn (%obj create-surface-request))
  (create-surface conn (slot-value %obj 'surface-id) (slot-value %obj 'context-id)))
(defclass create-surface-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (priv-data :initarg :priv-data :accessor priv-data :type cl:sequence)))
(defun decode-create-surface-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length priv-data)
    (declare (ignorable %p response-type sequence length priv-data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (priv-data %p)
      (xcb:read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'create-surface-reply :response-type response-type :sequence sequence :length
                    length :priv-data priv-data)
     (+ %pos 32 (* 4 length)))))
(defun create-surface-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-create-surface-reply))

;;; Request xcb.XvMC.DestroySurface
(defun destroy-surface (conn surface-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf surface-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-surface-request (xcb:request) ((surface-id :initarg :surface-id :type surface)))
(defmethod xcb:send-request (conn (%obj destroy-surface-request))
  (destroy-surface conn (slot-value %obj 'surface-id)))

;;; Request xcb.XvMC.CreateSubpicture
(defun create-subpicture (conn subpicture-id context xvimage-id width height)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf subpicture-id)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf xvimage-id)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-subpicture-request (xcb:request-with-reply)
          ((subpicture-id :initarg :subpicture-id :type subpicture)
           (context :initarg :context :type context)
           (xvimage-id :initarg :xvimage-id :type (unsigned-byte 32))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj create-subpicture-request))
  (create-subpicture conn (slot-value %obj 'subpicture-id) (slot-value %obj 'context)
   (slot-value %obj 'xvimage-id) (slot-value %obj 'width) (slot-value %obj 'height)))
(defclass create-subpicture-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width-actual :initarg :width-actual :accessor width-actual :type (unsigned-byte 16))
           (height-actual :initarg :height-actual :accessor height-actual :type (unsigned-byte 16))
           (num-palette-entries :initarg :num-palette-entries :accessor num-palette-entries :type
            (unsigned-byte 16))
           (entry-bytes :initarg :entry-bytes :accessor entry-bytes :type (unsigned-byte 16))
           (component-order :initarg :component-order :accessor component-order :type cl:sequence)
           (priv-data :initarg :priv-data :accessor priv-data :type cl:sequence)))
(defun decode-create-subpicture-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        width-actual
        height-actual
        num-palette-entries
        entry-bytes
        component-order
        priv-data)
    (declare
     (ignorable %p response-type sequence length width-actual height-actual num-palette-entries
      entry-bytes component-order priv-data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width-actual (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf height-actual (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf num-palette-entries (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf entry-bytes (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf component-order (xcb:read-vector-at %buf (+ %p 16) 4 %order :card8))
    (setf %p (+ %p 32))
    (multiple-value-setq (priv-data %p)
      (xcb:read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'create-subpicture-reply :response-type response-type :sequence sequence
                    :length length :width-actual width-actual :height-actual height-actual
                    :num-palette-entries num-palette-entries :entry-bytes entry-bytes
                    :component-order component-order :priv-data priv-data)
     (+ %pos 32 (* 4 length)))))
(defun create-subpicture-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-create-subpicture-reply))

;;; Request xcb.XvMC.DestroySubpicture
(defun destroy-subpicture (conn subpicture-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf subpicture-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-subpicture-request (xcb:request)
          ((subpicture-id :initarg :subpicture-id :type subpicture)))
(defmethod xcb:send-request (conn (%obj destroy-subpicture-request))
  (destroy-subpicture conn (slot-value %obj 'subpicture-id)))

;;; Request xcb.XvMC.ListSubpictureTypes
(defun list-subpicture-types (conn port-id surface-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XVMC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port-id)
    (xcb:buffer-write-card32 %buf surface-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-subpicture-types-request (xcb:request-with-reply)
          ((port-id :initarg :port-id :type xcb-xv:port)
           (surface-id :initarg :surface-id :type surface)))
(defmethod xcb:send-request (conn (%obj list-subpicture-types-request))
  (list-subpicture-types conn (slot-value %obj 'port-id) (slot-value %obj 'surface-id)))
(defclass list-subpicture-types-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num :initarg :num :accessor num :type (unsigned-byte 32))
           (types :initarg :types :accessor types :type cl:sequence)))
(defun decode-list-subpicture-types-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num types)
    (declare (ignorable %p response-type sequence length num types))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (types %p)
      (xcb:read-struct-vector-at %buf %p (min num (floor (- (+ %pos 32 (* 4 length)) %p) 128))
       %order #'xcb-xv:decode-image-format-info))
    (values
     (make-instance 'list-subpicture-types-reply :response-type response-type :sequence sequence
                    :length length :num num :types types)
     (+ %pos 32 (* 4 length)))))
(defun list-subpicture-types-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-subpicture-types-reply))
