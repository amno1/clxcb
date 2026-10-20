;;; Generated from shape.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-SHAPE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:affected-window
   #:bounding-shape-extents-height
   #:bounding-shape-extents-width
   #:bounding-shape-extents-x
   #:bounding-shape-extents-y
   #:bounding-shaped
   #:clip-shape-extents-height
   #:clip-shape-extents-width
   #:clip-shape-extents-x
   #:clip-shape-extents-y
   #:clip-shaped
   #:combine
   #:combine-request
   #:decode-get-rectangles-reply
   #:decode-input-selected-reply
   #:decode-notify
   #:decode-query-extents-reply
   #:decode-query-version-reply
   #:enabled
   #:encode-notify
   #:extents-height
   #:extents-width
   #:extents-x
   #:extents-y
   #:get-rectangles
   #:get-rectangles-reply
   #:get-rectangles-request
   #:input-selected
   #:input-selected-reply
   #:input-selected-request
   #:kind
   #:length
   #:major-version
   #:mask
   #:mask-request
   #:minor-version
   #:notify
   #:offset
   #:offset-request
   #:op
   #:ordering
   #:query-extents
   #:query-extents-reply
   #:query-extents-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:rectangles
   #:rectangles-len
   #:rectangles-request
   #:response-type
   #:select-input
   #:select-input-request
   #:sequence
   #:server-time
   #:shape-kind
   #:shaped))

(in-package #:XCB-SHAPE)

(xcb:register-extension-xname "XCB-SHAPE" "SHAPE")
(deftype op () '(unsigned-byte 8))
(deftype kind () '(unsigned-byte 8))

;;; Enum xcb.Shape.SO
(xcb:defenum shape-so
  (:set 0)
  (:union 1)
  (:intersect 2)
  (:subtract 3)
  (:invert 4))

;;; Enum xcb.Shape.SK
(xcb:defenum shape-sk
  (:bounding 0)
  (:clip 1)
  (:input 2))

;;; Event xcb.Shape.Notify (0)
(defclass notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (shape-kind :initarg :shape-kind :accessor shape-kind :type kind)
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (affected-window :initarg :affected-window :accessor affected-window :type xcb:window)
           (extents-x :initarg :extents-x :accessor extents-x :type (signed-byte 16))
           (extents-y :initarg :extents-y :accessor extents-y :type (signed-byte 16))
           (extents-width :initarg :extents-width :accessor extents-width :type (unsigned-byte 16))
           (extents-height :initarg :extents-height :accessor extents-height :type
            (unsigned-byte 16))
           (server-time :initarg :server-time :accessor server-time :type xcb:timestamp)
           (shaped :initarg :shaped :accessor shaped :type (or boolean (unsigned-byte 8)))))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        shape-kind
        sequence
        affected-window
        extents-x
        extents-y
        extents-width
        extents-height
        server-time
        shaped)
    (declare
     (ignorable %p response-type shape-kind sequence affected-window extents-x extents-y
      extents-width extents-height server-time shaped))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf shape-kind (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf affected-window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf extents-x (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf extents-y (xcb:read-int16-at %buf (+ %p 10) %order))
    (setf extents-width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf extents-height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf server-time (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf shaped (xcb:read-card8-at %buf (+ %p 20)))
    (values
     (make-instance 'notify :response-type response-type :shape-kind shape-kind :sequence sequence
                    :affected-window affected-window :extents-x extents-x :extents-y extents-y
                    :extents-width extents-width :extents-height extents-height :server-time
                    server-time :shaped shaped)
     (+ %pos 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (shape-kind (slot-value %obj 'shape-kind))
         (sequence (slot-value %obj 'sequence))
         (affected-window (slot-value %obj 'affected-window))
         (extents-x (slot-value %obj 'extents-x))
         (extents-y (slot-value %obj 'extents-y))
         (extents-width (slot-value %obj 'extents-width))
         (extents-height (slot-value %obj 'extents-height))
         (server-time (slot-value %obj 'server-time))
         (shaped (slot-value %obj 'shaped)))
    (declare
     (ignorable response-type shape-kind sequence affected-window extents-x extents-y extents-width
      extents-height server-time shaped))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf shape-kind)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf affected-window)
    (xcb:buffer-write-card16 %buf extents-x)
    (xcb:buffer-write-card16 %buf extents-y)
    (xcb:buffer-write-card16 %buf extents-width)
    (xcb:buffer-write-card16 %buf extents-height)
    (xcb:buffer-write-card32 %buf server-time)
    (xcb:buffer-write-bool %buf shaped)
    (xcb:buffer-write-padding %buf 11)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj notify)) (encode-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-SHAPE" 0 #'decode-notify)

;;; Request xcb.Shape.QueryVersion
(defun query-version (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
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

;;; Request xcb.Shape.Rectangles
(defun rectangles
       (conn operation destination-kind ordering destination-window x-offset y-offset rectangles)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf operation)
    (xcb:buffer-write-card8 %buf destination-kind)
    (xcb:buffer-write-card8 %buf ordering)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-write-card16 %buf x-offset)
    (xcb:buffer-write-card16 %buf y-offset)
    (xcb:buffer-write-struct-list-16 %buf rectangles #'xcb:encode-rectangle 4)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass rectangles-request (xcb:request)
          ((operation :initarg :operation :type op)
           (destination-kind :initarg :destination-kind :type kind)
           (ordering :initarg :ordering :type (unsigned-byte 8))
           (destination-window :initarg :destination-window :type xcb:window)
           (x-offset :initarg :x-offset :type (signed-byte 16))
           (y-offset :initarg :y-offset :type (signed-byte 16))
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj rectangles-request))
  (rectangles conn (slot-value %obj 'operation) (slot-value %obj 'destination-kind)
   (slot-value %obj 'ordering) (slot-value %obj 'destination-window) (slot-value %obj 'x-offset)
   (slot-value %obj 'y-offset) (slot-value %obj 'rectangles)))

;;; Request xcb.Shape.Mask
(defun mask (conn operation destination-kind destination-window x-offset y-offset source-bitmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf operation)
    (xcb:buffer-write-card8 %buf destination-kind)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-write-card16 %buf x-offset)
    (xcb:buffer-write-card16 %buf y-offset)
    (xcb:buffer-write-card32 %buf source-bitmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass mask-request (xcb:request)
          ((operation :initarg :operation :type op)
           (destination-kind :initarg :destination-kind :type kind)
           (destination-window :initarg :destination-window :type xcb:window)
           (x-offset :initarg :x-offset :type (signed-byte 16))
           (y-offset :initarg :y-offset :type (signed-byte 16))
           (source-bitmap :initarg :source-bitmap :type xcb:pixmap)))
(defmethod xcb:send-request (conn (%obj mask-request))
  (mask conn (slot-value %obj 'operation) (slot-value %obj 'destination-kind)
   (slot-value %obj 'destination-window) (slot-value %obj 'x-offset) (slot-value %obj 'y-offset)
   (slot-value %obj 'source-bitmap)))

;;; Request xcb.Shape.Combine
(defun combine
       (conn operation destination-kind source-kind destination-window x-offset y-offset
        source-window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf operation)
    (xcb:buffer-write-card8 %buf destination-kind)
    (xcb:buffer-write-card8 %buf source-kind)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-write-card16 %buf x-offset)
    (xcb:buffer-write-card16 %buf y-offset)
    (xcb:buffer-write-card32 %buf source-window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass combine-request (xcb:request)
          ((operation :initarg :operation :type op)
           (destination-kind :initarg :destination-kind :type kind)
           (source-kind :initarg :source-kind :type kind)
           (destination-window :initarg :destination-window :type xcb:window)
           (x-offset :initarg :x-offset :type (signed-byte 16))
           (y-offset :initarg :y-offset :type (signed-byte 16))
           (source-window :initarg :source-window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj combine-request))
  (combine conn (slot-value %obj 'operation) (slot-value %obj 'destination-kind)
   (slot-value %obj 'source-kind) (slot-value %obj 'destination-window) (slot-value %obj 'x-offset)
   (slot-value %obj 'y-offset) (slot-value %obj 'source-window)))

;;; Request xcb.Shape.Offset
(defun offset (conn destination-kind destination-window x-offset y-offset)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf destination-kind)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-write-card16 %buf x-offset)
    (xcb:buffer-write-card16 %buf y-offset)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass offset-request (xcb:request)
          ((destination-kind :initarg :destination-kind :type kind)
           (destination-window :initarg :destination-window :type xcb:window)
           (x-offset :initarg :x-offset :type (signed-byte 16))
           (y-offset :initarg :y-offset :type (signed-byte 16))))
(defmethod xcb:send-request (conn (%obj offset-request))
  (offset conn (slot-value %obj 'destination-kind) (slot-value %obj 'destination-window)
   (slot-value %obj 'x-offset) (slot-value %obj 'y-offset)))

;;; Request xcb.Shape.QueryExtents
(defun query-extents (conn destination-window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-extents-request (xcb:request-with-reply)
          ((destination-window :initarg :destination-window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj query-extents-request))
  (query-extents conn (slot-value %obj 'destination-window)))
(defclass query-extents-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (bounding-shaped :initarg :bounding-shaped :accessor bounding-shaped :type
            (or boolean (unsigned-byte 8)))
           (clip-shaped :initarg :clip-shaped :accessor clip-shaped :type
            (or boolean (unsigned-byte 8)))
           (bounding-shape-extents-x :initarg :bounding-shape-extents-x :accessor
            bounding-shape-extents-x :type (signed-byte 16))
           (bounding-shape-extents-y :initarg :bounding-shape-extents-y :accessor
            bounding-shape-extents-y :type (signed-byte 16))
           (bounding-shape-extents-width :initarg :bounding-shape-extents-width :accessor
            bounding-shape-extents-width :type (unsigned-byte 16))
           (bounding-shape-extents-height :initarg :bounding-shape-extents-height :accessor
            bounding-shape-extents-height :type (unsigned-byte 16))
           (clip-shape-extents-x :initarg :clip-shape-extents-x :accessor clip-shape-extents-x
            :type (signed-byte 16))
           (clip-shape-extents-y :initarg :clip-shape-extents-y :accessor clip-shape-extents-y
            :type (signed-byte 16))
           (clip-shape-extents-width :initarg :clip-shape-extents-width :accessor
            clip-shape-extents-width :type (unsigned-byte 16))
           (clip-shape-extents-height :initarg :clip-shape-extents-height :accessor
            clip-shape-extents-height :type (unsigned-byte 16))))
(defun decode-query-extents-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        bounding-shaped
        clip-shaped
        bounding-shape-extents-x
        bounding-shape-extents-y
        bounding-shape-extents-width
        bounding-shape-extents-height
        clip-shape-extents-x
        clip-shape-extents-y
        clip-shape-extents-width
        clip-shape-extents-height)
    (declare
     (ignorable %p response-type sequence length bounding-shaped clip-shaped
      bounding-shape-extents-x bounding-shape-extents-y bounding-shape-extents-width
      bounding-shape-extents-height clip-shape-extents-x clip-shape-extents-y
      clip-shape-extents-width clip-shape-extents-height))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf bounding-shaped (xcb:read-card8-at %buf (+ %p 8)))
    (setf clip-shaped (xcb:read-card8-at %buf (+ %p 9)))
    (setf bounding-shape-extents-x (xcb:read-int16-at %buf (+ %p 12) %order))
    (setf bounding-shape-extents-y (xcb:read-int16-at %buf (+ %p 14) %order))
    (setf bounding-shape-extents-width (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf bounding-shape-extents-height (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf clip-shape-extents-x (xcb:read-int16-at %buf (+ %p 20) %order))
    (setf clip-shape-extents-y (xcb:read-int16-at %buf (+ %p 22) %order))
    (setf clip-shape-extents-width (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf clip-shape-extents-height (xcb:read-card16-at %buf (+ %p 26) %order))
    (values
     (make-instance 'query-extents-reply :response-type response-type :sequence sequence :length
                    length :bounding-shaped bounding-shaped :clip-shaped clip-shaped
                    :bounding-shape-extents-x bounding-shape-extents-x :bounding-shape-extents-y
                    bounding-shape-extents-y :bounding-shape-extents-width
                    bounding-shape-extents-width :bounding-shape-extents-height
                    bounding-shape-extents-height :clip-shape-extents-x clip-shape-extents-x
                    :clip-shape-extents-y clip-shape-extents-y :clip-shape-extents-width
                    clip-shape-extents-width :clip-shape-extents-height clip-shape-extents-height)
     (+ %pos 32 (* 4 length)))))
(defun query-extents-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-extents-reply))

;;; Request xcb.Shape.SelectInput
(defun select-input (conn destination-window enable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-write-bool %buf enable)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-input-request (xcb:request)
          ((destination-window :initarg :destination-window :type xcb:window)
           (enable :initarg :enable :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'destination-window) (slot-value %obj 'enable)))

;;; Request xcb.Shape.InputSelected
(defun input-selected (conn destination-window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf destination-window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass input-selected-request (xcb:request-with-reply)
          ((destination-window :initarg :destination-window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj input-selected-request))
  (input-selected conn (slot-value %obj 'destination-window)))
(defclass input-selected-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (enabled :initarg :enabled :accessor enabled :type (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-input-selected-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type enabled sequence length)
    (declare (ignorable %p response-type enabled sequence length))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf enabled (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'input-selected-reply :response-type response-type :enabled enabled :sequence
                    sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun input-selected-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-input-selected-reply))

;;; Request xcb.Shape.GetRectangles
(defun get-rectangles (conn window source-kind)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SHAPE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf source-kind)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-rectangles-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (source-kind :initarg :source-kind :type kind)))
(defmethod xcb:send-request (conn (%obj get-rectangles-request))
  (get-rectangles conn (slot-value %obj 'window) (slot-value %obj 'source-kind)))
(defclass get-rectangles-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (ordering :initarg :ordering :accessor ordering :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (rectangles-len :initarg :rectangles-len :accessor rectangles-len :type
            (unsigned-byte 32))
           (rectangles :initarg :rectangles :type cl:sequence)))
(defun decode-get-rectangles-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type ordering sequence length rectangles-len rectangles)
    (declare (ignorable %p response-type ordering sequence length rectangles-len rectangles))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf ordering (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf rectangles-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (rectangles %p)
      (xcb:read-struct-vector-at %buf %p
       (min rectangles-len (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
       #'xcb:decode-rectangle))
    (values
     (make-instance 'get-rectangles-reply :response-type response-type :ordering ordering :sequence
                    sequence :length length :rectangles-len rectangles-len :rectangles rectangles)
     (+ %pos 32 (* 4 length)))))
(defun get-rectangles-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-rectangles-reply))
