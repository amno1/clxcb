;;; Generated from xv.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XV
  (:use #:cl)
  (:shadow #:DENOMINATOR #:FORMAT #:LENGTH #:MAX #:MIN #:NUMERATOR #:RATIONAL #:SEQUENCE #:TIME #:TYPE)
  (:export
   #:actual-height
   #:actual-width
   #:adaptor-info
   #:attribute
   #:attribute-info
   #:attributes
   #:bad-control-error
   #:bad-encoding-error
   #:bad-port-error
   #:bad-value
   #:base-id
   #:blue-mask
   #:bpp
   #:byte-order
   #:data
   #:data-size
   #:decode-adaptor-info
   #:decode-attribute-info
   #:decode-bad-control-error
   #:decode-bad-encoding-error
   #:decode-bad-port-error
   #:decode-encoding-info
   #:decode-format
   #:decode-get-port-attribute-reply
   #:decode-grab-port-reply
   #:decode-image
   #:decode-image-format-info
   #:decode-list-image-formats-reply
   #:decode-port-notify
   #:decode-query-adaptors-reply
   #:decode-query-best-size-reply
   #:decode-query-encodings-reply
   #:decode-query-extension-reply
   #:decode-query-image-attributes-reply
   #:decode-query-port-attributes-reply
   #:decode-rational
   #:decode-video-notify
   #:denominator
   #:depth
   #:drawable
   #:encode-adaptor-info
   #:encode-attribute-info
   #:encode-encoding-info
   #:encode-format
   #:encode-image
   #:encode-image-format-info
   #:encode-port-notify
   #:encode-rational
   #:encode-video-notify
   #:encoding
   #:encoding-info
   #:error-code
   #:flags
   #:format
   #:formats
   #:get-port-attribute
   #:get-port-attribute-reply
   #:get-port-attribute-request
   #:get-still
   #:get-still-request
   #:get-video
   #:get-video-request
   #:grab-port
   #:grab-port-reply
   #:grab-port-request
   #:green-mask
   #:guid
   #:height
   #:id
   #:image
   #:image-format-info
   #:info
   #:length
   #:list-image-formats
   #:list-image-formats-reply
   #:list-image-formats-request
   #:major
   #:major-opcode
   #:max
   #:min
   #:minor
   #:minor-opcode
   #:name
   #:name-size
   #:num-adaptors
   #:num-attributes
   #:num-encodings
   #:num-formats
   #:num-planes
   #:num-ports
   #:numerator
   #:offsets
   #:pitches
   #:port
   #:port-notify
   #:put-image
   #:put-image-request
   #:put-still
   #:put-still-request
   #:put-video
   #:put-video-request
   #:query-adaptors
   #:query-adaptors-reply
   #:query-adaptors-request
   #:query-best-size
   #:query-best-size-reply
   #:query-best-size-request
   #:query-encodings
   #:query-encodings-reply
   #:query-encodings-request
   #:query-extension
   #:query-extension-reply
   #:query-extension-request
   #:query-image-attributes
   #:query-image-attributes-reply
   #:query-image-attributes-request
   #:query-port-attributes
   #:query-port-attributes-reply
   #:query-port-attributes-request
   #:rate
   #:rational
   #:reason
   #:red-mask
   #:response-type
   #:result
   #:select-port-notify
   #:select-port-notify-request
   #:select-video-notify
   #:select-video-notify-request
   #:sequence
   #:set-port-attribute
   #:set-port-attribute-request
   #:shm-put-image
   #:shm-put-image-request
   #:size
   #:stop-video
   #:stop-video-request
   #:text-size
   #:time
   #:type
   #:u-sample-bits
   #:ungrab-port
   #:ungrab-port-request
   #:v-sample-bits
   #:value
   #:vcomp-order
   #:vhorz-u-period
   #:vhorz-v-period
   #:vhorz-y-period
   #:video-notify
   #:visual
   #:vscanline-order
   #:vvert-u-period
   #:vvert-v-period
   #:vvert-y-period
   #:width
   #:y-sample-bits))

(in-package #:XCB-XV)

(xcb:register-extension-xname "XCB-XV" "XVideo")
(deftype port () '(unsigned-byte 32))
(deftype encoding () '(unsigned-byte 32))

;;; Enum xcb.Xv.Type
(xcb:defenum xv-type
  (:input-mask 1)
  (:output-mask 2)
  (:video-mask 4)
  (:still-mask 8)
  (:image-mask 16))

;;; Enum xcb.Xv.ImageFormatInfoType
(xcb:defenum xv-image-format-info-type
  (:rgb 0)
  (:yuv 1))

;;; Enum xcb.Xv.ImageFormatInfoFormat
(xcb:defenum xv-image-format-info-format
  (:packed 0)
  (:planar 1))

;;; Enum xcb.Xv.AttributeFlag
(xcb:defenum xv-attribute-flag
  (:gettable 1)
  (:settable 2))

;;; Enum xcb.Xv.VideoNotifyReason
(xcb:defenum xv-video-notify-reason
  (:started 0)
  (:stopped 1)
  (:busy 2)
  (:preempted 3)
  (:hard-error 4))

;;; Enum xcb.Xv.ScanlineOrder
(xcb:defenum xv-scanline-order
  (:top-to-bottom 0)
  (:bottom-to-top 1))

;;; Enum xcb.Xv.GrabPortStatus
(xcb:defenum xv-grab-port-status
  (:success 0)
  (:bad-extension 1)
  (:already-grabbed 2)
  (:invalid-time 3)
  (:bad-reply 4)
  (:bad-alloc 5))

;;; xcb.Xv.Rational
(defclass rational nil
          ((numerator :initarg :numerator :accessor numerator :type (signed-byte 32))
           (denominator :initarg :denominator :accessor denominator :type (signed-byte 32))))
(defun encode-rational (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((numerator (slot-value %obj 'numerator)) (denominator (slot-value %obj 'denominator)))
    (declare (ignorable numerator denominator))
    (xcb:buffer-write-card32 %buf numerator)
    (xcb:buffer-write-card32 %buf denominator)))
(defun decode-rational (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) numerator denominator)
    (declare (ignorable %p numerator denominator))
    (setf numerator (xcb:read-int32-at %buf %p %order))
    (setf denominator (xcb:read-int32-at %buf (+ %p 4) %order))
    (values (make-instance 'rational :numerator numerator :denominator denominator) (+ %p 8))))

;;; xcb.Xv.Format
(defclass format nil
          ((visual :initarg :visual :accessor visual :type xcb:visualid)
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))))
(defun encode-format (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((visual (slot-value %obj 'visual)) (depth (slot-value %obj 'depth)))
    (declare (ignorable visual depth))
    (xcb:buffer-write-card32 %buf visual)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-format (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) visual depth)
    (declare (ignorable %p visual depth))
    (setf visual (xcb:read-card32-at %buf %p %order))
    (setf depth (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'format :visual visual :depth depth) (+ %p 8))))

;;; xcb.Xv.AdaptorInfo
(defclass adaptor-info nil
          ((base-id :initarg :base-id :accessor base-id :type port)
           (name-size :initarg :name-size :accessor name-size :type (unsigned-byte 16))
           (num-ports :initarg :num-ports :accessor num-ports :type (unsigned-byte 16))
           (num-formats :initarg :num-formats :accessor num-formats :type (unsigned-byte 16))
           (type :initarg :type :accessor type :type (unsigned-byte 8))
           (name :initarg :name :accessor name :type cl:sequence)
           (formats :initarg :formats :accessor formats :type cl:sequence)))
(defun encode-adaptor-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((base-id (slot-value %obj 'base-id))
         (num-ports (slot-value %obj 'num-ports))
         (type (slot-value %obj 'type))
         (name (slot-value %obj 'name))
         (formats (slot-value %obj 'formats))
         (name-size (cl:length name))
         (num-formats (cl:length formats)))
    (declare (ignorable base-id num-ports type name formats name-size num-formats))
    (xcb:buffer-write-card32 %buf base-id)
    (xcb:buffer-write-card16 %buf name-size)
    (xcb:buffer-write-card16 %buf num-ports)
    (xcb:buffer-write-card16 %buf num-formats)
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-string-octets %buf name name-size)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-list %buf formats num-formats #'encode-format)))
(defun decode-adaptor-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) base-id name-size num-ports num-formats type name formats)
    (declare (ignorable %p base-id name-size num-ports num-formats type name formats))
    (setf base-id (xcb:read-card32-at %buf %p %order))
    (setf name-size (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-ports (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf num-formats (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf type (xcb:read-card8-at %buf (+ %p 10)))
    (setf %p (+ %p 12))
    (setf name (xcb:read-string-at %buf %p name-size))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (multiple-value-setq (formats %p)
      (xcb:read-struct-vector-at %buf %p num-formats %order #'decode-format))
    (values
     (make-instance 'adaptor-info :base-id base-id :name-size name-size :num-ports num-ports
                    :num-formats num-formats :type type :name name :formats formats)
     %p)))

;;; xcb.Xv.EncodingInfo
(defclass encoding-info nil
          ((encoding :initarg :encoding :accessor encoding :type encoding)
           (name-size :initarg :name-size :accessor name-size :type (unsigned-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (rate :initarg :rate :accessor rate :type rational)
           (name :initarg :name :accessor name :type cl:sequence)))
(defun encode-encoding-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((encoding (slot-value %obj 'encoding))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (rate (slot-value %obj 'rate))
         (name (slot-value %obj 'name))
         (name-size (cl:length name)))
    (declare (ignorable encoding width height rate name name-size))
    (xcb:buffer-write-card32 %buf encoding)
    (xcb:buffer-write-card16 %buf name-size)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-padding %buf 2)
    (encode-rational %buf rate)
    (xcb:buffer-write-string-octets %buf name name-size)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-encoding-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) encoding name-size width height rate name)
    (declare (ignorable %p encoding name-size width height rate name))
    (setf encoding (xcb:read-card32-at %buf %p %order))
    (setf name-size (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf rate (decode-rational %buf (+ %p 12) %order))
    (setf %p (+ %p 20))
    (setf name (xcb:read-string-at %buf %p name-size))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'encoding-info :encoding encoding :name-size name-size :width width :height
                    height :rate rate :name name)
     %p)))

;;; xcb.Xv.Image
(defclass image nil
          ((id :initarg :id :accessor id :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (data-size :initarg :data-size :accessor data-size :type (unsigned-byte 32))
           (num-planes :initarg :num-planes :accessor num-planes :type (unsigned-byte 32))
           (pitches :initarg :pitches :accessor pitches :type cl:sequence)
           (offsets :initarg :offsets :accessor offsets :type cl:sequence)
           (data :initarg :data :accessor data :type cl:sequence)))
(defun encode-image (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((id (slot-value %obj 'id))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (pitches (slot-value %obj 'pitches))
         (offsets (slot-value %obj 'offsets))
         (data (slot-value %obj 'data))
         (num-planes (cl:length pitches))
         (data-size (cl:length data)))
    (declare (ignorable id width height pitches offsets data num-planes data-size))
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf data-size)
    (xcb:buffer-write-card32 %buf num-planes)
    (xcb:buffer-write-list %buf pitches num-planes #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf offsets num-planes #'xcb:buffer-write-card32)
    (xcb:buffer-write-octets %buf data :end data-size)))
(defun decode-image (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) id width height data-size num-planes pitches offsets data)
    (declare (ignorable %p id width height data-size num-planes pitches offsets data))
    (setf id (xcb:read-card32-at %buf %p %order))
    (setf width (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf data-size (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-planes (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 16))
    (multiple-value-setq (pitches %p) (xcb:read-vector-at %buf %p num-planes %order :card32))
    (multiple-value-setq (offsets %p) (xcb:read-vector-at %buf %p num-planes %order :card32))
    (multiple-value-setq (data %p) (xcb:read-vector-at %buf %p data-size %order :card8))
    (values
     (make-instance 'image :id id :width width :height height :data-size data-size :num-planes
                    num-planes :pitches pitches :offsets offsets :data data)
     %p)))

;;; xcb.Xv.AttributeInfo
(defclass attribute-info nil
          ((flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (min :initarg :min :accessor min :type (signed-byte 32))
           (max :initarg :max :accessor max :type (signed-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 32))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun encode-attribute-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((flags (slot-value %obj 'flags))
         (min (slot-value %obj 'min))
         (max (slot-value %obj 'max))
         (name (slot-value %obj 'name))
         (size (cl:length name)))
    (declare (ignorable flags min max name size))
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-card32 %buf min)
    (xcb:buffer-write-card32 %buf max)
    (xcb:buffer-write-card32 %buf size)
    (xcb:buffer-write-string-octets %buf name size)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-attribute-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) flags min max size name)
    (declare (ignorable %p flags min max size name))
    (setf flags (xcb:read-card32-at %buf %p %order))
    (setf min (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf max (xcb:read-int32-at %buf (+ %p 8) %order))
    (setf size (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 16))
    (setf name (xcb:read-string-at %buf %p size))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (values (make-instance 'attribute-info :flags flags :min min :max max :size size :name name)
            %p)))

;;; xcb.Xv.ImageFormatInfo
(defclass image-format-info nil
          ((id :initarg :id :accessor id :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type (unsigned-byte 8))
           (byte-order :initarg :byte-order :accessor byte-order :type (unsigned-byte 8))
           (guid :initarg :guid :accessor guid :type cl:sequence)
           (bpp :initarg :bpp :accessor bpp :type (unsigned-byte 8))
           (num-planes :initarg :num-planes :accessor num-planes :type (unsigned-byte 8))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (red-mask :initarg :red-mask :accessor red-mask :type (unsigned-byte 32))
           (green-mask :initarg :green-mask :accessor green-mask :type (unsigned-byte 32))
           (blue-mask :initarg :blue-mask :accessor blue-mask :type (unsigned-byte 32))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (y-sample-bits :initarg :y-sample-bits :accessor y-sample-bits :type (unsigned-byte 32))
           (u-sample-bits :initarg :u-sample-bits :accessor u-sample-bits :type (unsigned-byte 32))
           (v-sample-bits :initarg :v-sample-bits :accessor v-sample-bits :type (unsigned-byte 32))
           (vhorz-y-period :initarg :vhorz-y-period :accessor vhorz-y-period :type
            (unsigned-byte 32))
           (vhorz-u-period :initarg :vhorz-u-period :accessor vhorz-u-period :type
            (unsigned-byte 32))
           (vhorz-v-period :initarg :vhorz-v-period :accessor vhorz-v-period :type
            (unsigned-byte 32))
           (vvert-y-period :initarg :vvert-y-period :accessor vvert-y-period :type
            (unsigned-byte 32))
           (vvert-u-period :initarg :vvert-u-period :accessor vvert-u-period :type
            (unsigned-byte 32))
           (vvert-v-period :initarg :vvert-v-period :accessor vvert-v-period :type
            (unsigned-byte 32))
           (vcomp-order :initarg :vcomp-order :accessor vcomp-order :type cl:sequence)
           (vscanline-order :initarg :vscanline-order :accessor vscanline-order :type
            (unsigned-byte 8))))
(defun encode-image-format-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((id (slot-value %obj 'id))
         (type (slot-value %obj 'type))
         (byte-order (slot-value %obj 'byte-order))
         (guid (slot-value %obj 'guid))
         (bpp (slot-value %obj 'bpp))
         (num-planes (slot-value %obj 'num-planes))
         (depth (slot-value %obj 'depth))
         (red-mask (slot-value %obj 'red-mask))
         (green-mask (slot-value %obj 'green-mask))
         (blue-mask (slot-value %obj 'blue-mask))
         (format (slot-value %obj 'format))
         (y-sample-bits (slot-value %obj 'y-sample-bits))
         (u-sample-bits (slot-value %obj 'u-sample-bits))
         (v-sample-bits (slot-value %obj 'v-sample-bits))
         (vhorz-y-period (slot-value %obj 'vhorz-y-period))
         (vhorz-u-period (slot-value %obj 'vhorz-u-period))
         (vhorz-v-period (slot-value %obj 'vhorz-v-period))
         (vvert-y-period (slot-value %obj 'vvert-y-period))
         (vvert-u-period (slot-value %obj 'vvert-u-period))
         (vvert-v-period (slot-value %obj 'vvert-v-period))
         (vcomp-order (slot-value %obj 'vcomp-order))
         (vscanline-order (slot-value %obj 'vscanline-order)))
    (declare
     (ignorable id type byte-order guid bpp num-planes depth red-mask green-mask blue-mask format
      y-sample-bits u-sample-bits v-sample-bits vhorz-y-period vhorz-u-period vhorz-v-period
      vvert-y-period vvert-u-period vvert-v-period vcomp-order vscanline-order))
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf byte-order)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-fixed-list %buf guid 16 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-card8 %buf bpp)
    (xcb:buffer-write-card8 %buf num-planes)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf red-mask)
    (xcb:buffer-write-card32 %buf green-mask)
    (xcb:buffer-write-card32 %buf blue-mask)
    (xcb:buffer-write-card8 %buf format)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf y-sample-bits)
    (xcb:buffer-write-card32 %buf u-sample-bits)
    (xcb:buffer-write-card32 %buf v-sample-bits)
    (xcb:buffer-write-card32 %buf vhorz-y-period)
    (xcb:buffer-write-card32 %buf vhorz-u-period)
    (xcb:buffer-write-card32 %buf vhorz-v-period)
    (xcb:buffer-write-card32 %buf vvert-y-period)
    (xcb:buffer-write-card32 %buf vvert-u-period)
    (xcb:buffer-write-card32 %buf vvert-v-period)
    (xcb:buffer-write-fixed-list %buf vcomp-order 32 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-card8 %buf vscanline-order)
    (xcb:buffer-write-padding %buf 11)))
(defun decode-image-format-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        id
        type
        byte-order
        guid
        bpp
        num-planes
        depth
        red-mask
        green-mask
        blue-mask
        format
        y-sample-bits
        u-sample-bits
        v-sample-bits
        vhorz-y-period
        vhorz-u-period
        vhorz-v-period
        vvert-y-period
        vvert-u-period
        vvert-v-period
        vcomp-order
        vscanline-order)
    (declare
     (ignorable %p id type byte-order guid bpp num-planes depth red-mask green-mask blue-mask
      format y-sample-bits u-sample-bits v-sample-bits vhorz-y-period vhorz-u-period vhorz-v-period
      vvert-y-period vvert-u-period vvert-v-period vcomp-order vscanline-order))
    (setf id (xcb:read-card32-at %buf %p %order))
    (setf type (xcb:read-card8-at %buf (+ %p 4)))
    (setf byte-order (xcb:read-card8-at %buf (+ %p 5)))
    (setf guid (xcb:read-vector-at %buf (+ %p 8) 16 %order :card8))
    (setf bpp (xcb:read-card8-at %buf (+ %p 24)))
    (setf num-planes (xcb:read-card8-at %buf (+ %p 25)))
    (setf depth (xcb:read-card8-at %buf (+ %p 28)))
    (setf red-mask (xcb:read-card32-at %buf (+ %p 32) %order))
    (setf green-mask (xcb:read-card32-at %buf (+ %p 36) %order))
    (setf blue-mask (xcb:read-card32-at %buf (+ %p 40) %order))
    (setf format (xcb:read-card8-at %buf (+ %p 44)))
    (setf y-sample-bits (xcb:read-card32-at %buf (+ %p 48) %order))
    (setf u-sample-bits (xcb:read-card32-at %buf (+ %p 52) %order))
    (setf v-sample-bits (xcb:read-card32-at %buf (+ %p 56) %order))
    (setf vhorz-y-period (xcb:read-card32-at %buf (+ %p 60) %order))
    (setf vhorz-u-period (xcb:read-card32-at %buf (+ %p 64) %order))
    (setf vhorz-v-period (xcb:read-card32-at %buf (+ %p 68) %order))
    (setf vvert-y-period (xcb:read-card32-at %buf (+ %p 72) %order))
    (setf vvert-u-period (xcb:read-card32-at %buf (+ %p 76) %order))
    (setf vvert-v-period (xcb:read-card32-at %buf (+ %p 80) %order))
    (setf vcomp-order (xcb:read-vector-at %buf (+ %p 84) 32 %order :card8))
    (setf vscanline-order (xcb:read-card8-at %buf (+ %p 116)))
    (values
     (make-instance 'image-format-info :id id :type type :byte-order byte-order :guid guid :bpp bpp
                    :num-planes num-planes :depth depth :red-mask red-mask :green-mask green-mask
                    :blue-mask blue-mask :format format :y-sample-bits y-sample-bits :u-sample-bits
                    u-sample-bits :v-sample-bits v-sample-bits :vhorz-y-period vhorz-y-period
                    :vhorz-u-period vhorz-u-period :vhorz-v-period vhorz-v-period :vvert-y-period
                    vvert-y-period :vvert-u-period vvert-u-period :vvert-v-period vvert-v-period
                    :vcomp-order vcomp-order :vscanline-order vscanline-order)
     (+ %p 128))))

;;; Error xcb.Xv.BadPort (0)
(defclass bad-port-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-port-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'bad-port-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XV" 0 #'decode-bad-port-error)

;;; Error xcb.Xv.BadEncoding (1)
(defclass bad-encoding-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-encoding-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'bad-encoding-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XV" 1 #'decode-bad-encoding-error)

;;; Error xcb.Xv.BadControl (2)
(defclass bad-control-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-control-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'bad-control-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XV" 2 #'decode-bad-control-error)

;;; Event xcb.Xv.VideoNotify (0)
(defclass video-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (reason :initarg :reason :accessor reason :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (drawable :initarg :drawable :accessor drawable :type xcb:drawable)
           (port :initarg :port :accessor port :type port)))
(defun decode-video-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type reason sequence time drawable port)
    (declare (ignorable %p response-type reason sequence time drawable port))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf reason (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf drawable (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf port (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'video-notify :response-type response-type :reason reason :sequence sequence
                    :time time :drawable drawable :port port)
     (+ %pos 32))))
(defun encode-video-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (reason (slot-value %obj 'reason))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (drawable (slot-value %obj 'drawable))
         (port (slot-value %obj 'port)))
    (declare (ignorable response-type reason sequence time drawable port))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf reason)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj video-notify)) (encode-video-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XV" 0 #'decode-video-notify)

;;; Event xcb.Xv.PortNotify (1)
(defclass port-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (port :initarg :port :accessor port :type port)
           (attribute :initarg :attribute :accessor attribute :type xcb:atom)
           (value :initarg :value :accessor value :type (signed-byte 32))))
(defun decode-port-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence time port attribute value)
    (declare (ignorable %p response-type sequence time port attribute value))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf port (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf attribute (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf value (xcb:read-int32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'port-notify :response-type response-type :sequence sequence :time time :port
                    port :attribute attribute :value value)
     (+ %pos 32))))
(defun encode-port-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (port (slot-value %obj 'port))
         (attribute (slot-value %obj 'attribute))
         (value (slot-value %obj 'value)))
    (declare (ignorable response-type sequence time port attribute value))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf attribute)
    (xcb:buffer-write-card32 %buf value)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj port-notify)) (encode-port-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XV" 1 #'decode-port-notify)

;;; Request xcb.Xv.QueryExtension
(defun query-extension (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-extension-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-extension-request)) (query-extension conn))
(defclass query-extension-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major :initarg :major :accessor major :type (unsigned-byte 16))
           (minor :initarg :minor :accessor minor :type (unsigned-byte 16))))
(defun decode-query-extension-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major minor)
    (declare (ignorable %p response-type sequence length major minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-extension-reply :response-type response-type :sequence sequence :length
                    length :major major :minor minor)
     (+ %pos 32 (* 4 length)))))
(defun query-extension-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-extension-reply))

;;; Request xcb.Xv.QueryAdaptors
(defun query-adaptors (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-adaptors-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj query-adaptors-request))
  (query-adaptors conn (slot-value %obj 'window)))
(defclass query-adaptors-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-adaptors :initarg :num-adaptors :accessor num-adaptors :type (unsigned-byte 16))
           (info :initarg :info :accessor info :type cl:sequence)))
(defun decode-query-adaptors-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-adaptors info)
    (declare (ignorable %p response-type sequence length num-adaptors info))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-adaptors (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (info %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-adaptors (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-adaptor-info))
    (values
     (make-instance 'query-adaptors-reply :response-type response-type :sequence sequence :length
                    length :num-adaptors num-adaptors :info info)
     (+ %pos 32 (* 4 length)))))
(defun query-adaptors-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-adaptors-reply))

;;; Request xcb.Xv.QueryEncodings
(defun query-encodings (conn port)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-encodings-request (xcb:request-with-reply) ((port :initarg :port :type port)))
(defmethod xcb:send-request (conn (%obj query-encodings-request))
  (query-encodings conn (slot-value %obj 'port)))
(defclass query-encodings-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-encodings :initarg :num-encodings :accessor num-encodings :type (unsigned-byte 16))
           (info :initarg :info :accessor info :type cl:sequence)))
(defun decode-query-encodings-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-encodings info)
    (declare (ignorable %p response-type sequence length num-encodings info))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-encodings (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (info %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-encodings (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-encoding-info))
    (values
     (make-instance 'query-encodings-reply :response-type response-type :sequence sequence :length
                    length :num-encodings num-encodings :info info)
     (+ %pos 32 (* 4 length)))))
(defun query-encodings-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-encodings-reply))

;;; Request xcb.Xv.GrabPort
(defun grab-port (conn port time)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass grab-port-request (xcb:request-with-reply)
          ((port :initarg :port :type port) (time :initarg :time :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj grab-port-request))
  (grab-port conn (slot-value %obj 'port) (slot-value %obj 'time)))
(defclass grab-port-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (result :initarg :result :accessor result :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-grab-port-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type result sequence length)
    (declare (ignorable %p response-type result sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf result (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'grab-port-reply :response-type response-type :result result :sequence sequence
                    :length length)
     (+ %pos 32 (* 4 length)))))
(defun grab-port-reply (conn cookie) (xcb:read-reply conn cookie #'decode-grab-port-reply))

;;; Request xcb.Xv.UngrabPort
(defun ungrab-port (conn port time)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass ungrab-port-request (xcb:request)
          ((port :initarg :port :type port) (time :initarg :time :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj ungrab-port-request))
  (ungrab-port conn (slot-value %obj 'port) (slot-value %obj 'time)))

;;; Request xcb.Xv.PutVideo
(defun put-video (conn port drawable gc vid-x vid-y vid-w vid-h drw-x drw-y drw-w drw-h)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card16 %buf vid-x)
    (xcb:buffer-write-card16 %buf vid-y)
    (xcb:buffer-write-card16 %buf vid-w)
    (xcb:buffer-write-card16 %buf vid-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass put-video-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (vid-x :initarg :vid-x :type (signed-byte 16))
           (vid-y :initarg :vid-y :type (signed-byte 16))
           (vid-w :initarg :vid-w :type (unsigned-byte 16))
           (vid-h :initarg :vid-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj put-video-request))
  (put-video conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'vid-x) (slot-value %obj 'vid-y) (slot-value %obj 'vid-w)
   (slot-value %obj 'vid-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h)))

;;; Request xcb.Xv.PutStill
(defun put-still (conn port drawable gc vid-x vid-y vid-w vid-h drw-x drw-y drw-w drw-h)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card16 %buf vid-x)
    (xcb:buffer-write-card16 %buf vid-y)
    (xcb:buffer-write-card16 %buf vid-w)
    (xcb:buffer-write-card16 %buf vid-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass put-still-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (vid-x :initarg :vid-x :type (signed-byte 16))
           (vid-y :initarg :vid-y :type (signed-byte 16))
           (vid-w :initarg :vid-w :type (unsigned-byte 16))
           (vid-h :initarg :vid-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj put-still-request))
  (put-still conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'vid-x) (slot-value %obj 'vid-y) (slot-value %obj 'vid-w)
   (slot-value %obj 'vid-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h)))

;;; Request xcb.Xv.GetVideo
(defun get-video (conn port drawable gc vid-x vid-y vid-w vid-h drw-x drw-y drw-w drw-h)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card16 %buf vid-x)
    (xcb:buffer-write-card16 %buf vid-y)
    (xcb:buffer-write-card16 %buf vid-w)
    (xcb:buffer-write-card16 %buf vid-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass get-video-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (vid-x :initarg :vid-x :type (signed-byte 16))
           (vid-y :initarg :vid-y :type (signed-byte 16))
           (vid-w :initarg :vid-w :type (unsigned-byte 16))
           (vid-h :initarg :vid-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-video-request))
  (get-video conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'vid-x) (slot-value %obj 'vid-y) (slot-value %obj 'vid-w)
   (slot-value %obj 'vid-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h)))

;;; Request xcb.Xv.GetStill
(defun get-still (conn port drawable gc vid-x vid-y vid-w vid-h drw-x drw-y drw-w drw-h)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card16 %buf vid-x)
    (xcb:buffer-write-card16 %buf vid-y)
    (xcb:buffer-write-card16 %buf vid-w)
    (xcb:buffer-write-card16 %buf vid-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass get-still-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (vid-x :initarg :vid-x :type (signed-byte 16))
           (vid-y :initarg :vid-y :type (signed-byte 16))
           (vid-w :initarg :vid-w :type (unsigned-byte 16))
           (vid-h :initarg :vid-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-still-request))
  (get-still conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'vid-x) (slot-value %obj 'vid-y) (slot-value %obj 'vid-w)
   (slot-value %obj 'vid-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h)))

;;; Request xcb.Xv.StopVideo
(defun stop-video (conn port drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass stop-video-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj stop-video-request))
  (stop-video conn (slot-value %obj 'port) (slot-value %obj 'drawable)))

;;; Request xcb.Xv.SelectVideoNotify
(defun select-video-notify (conn drawable onoff)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-bool %buf onoff)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-video-notify-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (onoff :initarg :onoff :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj select-video-notify-request))
  (select-video-notify conn (slot-value %obj 'drawable) (slot-value %obj 'onoff)))

;;; Request xcb.Xv.SelectPortNotify
(defun select-port-notify (conn port onoff)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-bool %buf onoff)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-port-notify-request (xcb:request)
          ((port :initarg :port :type port)
           (onoff :initarg :onoff :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj select-port-notify-request))
  (select-port-notify conn (slot-value %obj 'port) (slot-value %obj 'onoff)))

;;; Request xcb.Xv.QueryBestSize
(defun query-best-size (conn port vid-w vid-h drw-w drw-h motion)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card16 %buf vid-w)
    (xcb:buffer-write-card16 %buf vid-h)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-write-bool %buf motion)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-best-size-request (xcb:request-with-reply)
          ((port :initarg :port :type port) (vid-w :initarg :vid-w :type (unsigned-byte 16))
           (vid-h :initarg :vid-h :type (unsigned-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))
           (motion :initarg :motion :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj query-best-size-request))
  (query-best-size conn (slot-value %obj 'port) (slot-value %obj 'vid-w) (slot-value %obj 'vid-h)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h) (slot-value %obj 'motion)))
(defclass query-best-size-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (actual-width :initarg :actual-width :accessor actual-width :type (unsigned-byte 16))
           (actual-height :initarg :actual-height :accessor actual-height :type
            (unsigned-byte 16))))
(defun decode-query-best-size-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length actual-width actual-height)
    (declare (ignorable %p response-type sequence length actual-width actual-height))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf actual-width (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf actual-height (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-best-size-reply :response-type response-type :sequence sequence :length
                    length :actual-width actual-width :actual-height actual-height)
     (+ %pos 32 (* 4 length)))))
(defun query-best-size-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-best-size-reply))

;;; Request xcb.Xv.SetPortAttribute
(defun set-port-attribute (conn port attribute value)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf attribute)
    (xcb:buffer-write-card32 %buf value)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-port-attribute-request (xcb:request)
          ((port :initarg :port :type port) (attribute :initarg :attribute :type xcb:atom)
           (value :initarg :value :type (signed-byte 32))))
(defmethod xcb:send-request (conn (%obj set-port-attribute-request))
  (set-port-attribute conn (slot-value %obj 'port) (slot-value %obj 'attribute)
   (slot-value %obj 'value)))

;;; Request xcb.Xv.GetPortAttribute
(defun get-port-attribute (conn port attribute)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf attribute)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-port-attribute-request (xcb:request-with-reply)
          ((port :initarg :port :type port) (attribute :initarg :attribute :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-port-attribute-request))
  (get-port-attribute conn (slot-value %obj 'port) (slot-value %obj 'attribute)))
(defclass get-port-attribute-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (value :initarg :value :accessor value :type (signed-byte 32))))
(defun decode-get-port-attribute-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length value)
    (declare (ignorable %p response-type sequence length value))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf value (xcb:read-int32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-port-attribute-reply :response-type response-type :sequence sequence
                    :length length :value value)
     (+ %pos 32 (* 4 length)))))
(defun get-port-attribute-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-port-attribute-reply))

;;; Request xcb.Xv.QueryPortAttributes
(defun query-port-attributes (conn port)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-port-attributes-request (xcb:request-with-reply) ((port :initarg :port :type port)))
(defmethod xcb:send-request (conn (%obj query-port-attributes-request))
  (query-port-attributes conn (slot-value %obj 'port)))
(defclass query-port-attributes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-attributes :initarg :num-attributes :accessor num-attributes :type
            (unsigned-byte 32))
           (text-size :initarg :text-size :accessor text-size :type (unsigned-byte 32))
           (attributes :initarg :attributes :accessor attributes :type cl:sequence)))
(defun decode-query-port-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-attributes text-size attributes)
    (declare (ignorable %p response-type sequence length num-attributes text-size attributes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-attributes (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf text-size (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (attributes %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-attributes (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-attribute-info))
    (values
     (make-instance 'query-port-attributes-reply :response-type response-type :sequence sequence
                    :length length :num-attributes num-attributes :text-size text-size :attributes
                    attributes)
     (+ %pos 32 (* 4 length)))))
(defun query-port-attributes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-port-attributes-reply))

;;; Request xcb.Xv.ListImageFormats
(defun list-image-formats (conn port)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-image-formats-request (xcb:request-with-reply) ((port :initarg :port :type port)))
(defmethod xcb:send-request (conn (%obj list-image-formats-request))
  (list-image-formats conn (slot-value %obj 'port)))
(defclass list-image-formats-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-formats :initarg :num-formats :accessor num-formats :type (unsigned-byte 32))
           (format :initarg :format :accessor format :type cl:sequence)))
(defun decode-list-image-formats-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-formats format)
    (declare (ignorable %p response-type sequence length num-formats format))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-formats (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (format %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min num-formats (floor (- (+ %pos 32 (* 4 length)) %p) 128)) %order
       #'decode-image-format-info))
    (values
     (make-instance 'list-image-formats-reply :response-type response-type :sequence sequence
                    :length length :num-formats num-formats :format format)
     (+ %pos 32 (* 4 length)))))
(defun list-image-formats-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-image-formats-reply))

;;; Request xcb.Xv.QueryImageAttributes
(defun query-image-attributes (conn port id width height)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-image-attributes-request (xcb:request-with-reply)
          ((port :initarg :port :type port) (id :initarg :id :type (unsigned-byte 32))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj query-image-attributes-request))
  (query-image-attributes conn (slot-value %obj 'port) (slot-value %obj 'id)
   (slot-value %obj 'width) (slot-value %obj 'height)))
(defclass query-image-attributes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-planes :initarg :num-planes :accessor num-planes :type (unsigned-byte 32))
           (data-size :initarg :data-size :accessor data-size :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (pitches :initarg :pitches :accessor pitches :type cl:sequence)
           (offsets :initarg :offsets :accessor offsets :type cl:sequence)))
(defun decode-query-image-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-planes data-size width height pitches offsets)
    (declare
     (ignorable %p response-type sequence length num-planes data-size width height pitches
      offsets))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-planes (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf data-size (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (pitches %p)
      (xcb:read-vector-at %buf %p (cl:min num-planes (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (offsets %p)
      (xcb:read-vector-at %buf %p (cl:min num-planes (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'query-image-attributes-reply :response-type response-type :sequence sequence
                    :length length :num-planes num-planes :data-size data-size :width width :height
                    height :pitches pitches :offsets offsets)
     (+ %pos 32 (* 4 length)))))
(defun query-image-attributes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-image-attributes-reply))

;;; Request xcb.Xv.PutImage
(defun put-image
       (conn port drawable gc id src-x src-y src-w src-h drw-x drw-y drw-w drw-h width height data)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-card16 %buf src-w)
    (xcb:buffer-write-card16 %buf src-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-octets %buf data)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass put-image-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (id :initarg :id :type (unsigned-byte 32))
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (src-w :initarg :src-w :type (unsigned-byte 16))
           (src-h :initarg :src-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (data :initarg :data :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj put-image-request))
  (put-image conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'id) (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'src-w)
   (slot-value %obj 'src-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h) (slot-value %obj 'width)
   (slot-value %obj 'height) (slot-value %obj 'data)))

;;; Request xcb.Xv.ShmPutImage
(defun shm-put-image
       (conn port drawable gc shmseg id offset src-x src-y src-w src-h drw-x drw-y drw-w drw-h
        width height send-event)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XV")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf port)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card32 %buf shmseg)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card32 %buf offset)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-card16 %buf src-w)
    (xcb:buffer-write-card16 %buf src-h)
    (xcb:buffer-write-card16 %buf drw-x)
    (xcb:buffer-write-card16 %buf drw-y)
    (xcb:buffer-write-card16 %buf drw-w)
    (xcb:buffer-write-card16 %buf drw-h)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card8 %buf send-event)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass shm-put-image-request (xcb:request)
          ((port :initarg :port :type port) (drawable :initarg :drawable :type xcb:drawable)
           (gc :initarg :gc :type xcb:gcontext) (shmseg :initarg :shmseg :type xcb-shm:seg)
           (id :initarg :id :type (unsigned-byte 32))
           (offset :initarg :offset :type (unsigned-byte 32))
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (src-w :initarg :src-w :type (unsigned-byte 16))
           (src-h :initarg :src-h :type (unsigned-byte 16))
           (drw-x :initarg :drw-x :type (signed-byte 16))
           (drw-y :initarg :drw-y :type (signed-byte 16))
           (drw-w :initarg :drw-w :type (unsigned-byte 16))
           (drw-h :initarg :drw-h :type (unsigned-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (send-event :initarg :send-event :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj shm-put-image-request))
  (shm-put-image conn (slot-value %obj 'port) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'shmseg) (slot-value %obj 'id) (slot-value %obj 'offset)
   (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'src-w)
   (slot-value %obj 'src-h) (slot-value %obj 'drw-x) (slot-value %obj 'drw-y)
   (slot-value %obj 'drw-w) (slot-value %obj 'drw-h) (slot-value %obj 'width)
   (slot-value %obj 'height) (slot-value %obj 'send-event)))
