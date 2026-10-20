;;; Generated from xfixes.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XFIXES
  (:use #:cl)
  (:shadow #:ATOM #:LENGTH #:MAP #:SEQUENCE)
  (:export
   #:atom
   #:bad-region-error
   #:bad-value
   #:barrier
   #:change-cursor
   #:change-cursor-by-name
   #:change-cursor-by-name-request
   #:change-cursor-request
   #:change-save-set
   #:change-save-set-request
   #:copy-region
   #:copy-region-request
   #:create-pointer-barrier
   #:create-pointer-barrier-request
   #:create-region
   #:create-region-from-bitmap
   #:create-region-from-bitmap-request
   #:create-region-from-gc
   #:create-region-from-gc-request
   #:create-region-from-picture
   #:create-region-from-picture-request
   #:create-region-from-window
   #:create-region-from-window-request
   #:create-region-request
   #:cursor-atom
   #:cursor-image
   #:cursor-notify
   #:cursor-serial
   #:decode-bad-region-error
   #:decode-cursor-notify
   #:decode-fetch-region-reply
   #:decode-get-client-disconnect-mode-reply
   #:decode-get-cursor-image-and-name-reply
   #:decode-get-cursor-image-reply
   #:decode-get-cursor-name-reply
   #:decode-query-version-reply
   #:decode-selection-notify
   #:delete-pointer-barrier
   #:delete-pointer-barrier-request
   #:destroy-region
   #:destroy-region-request
   #:disconnect-mode
   #:encode-cursor-notify
   #:encode-selection-notify
   #:error-code
   #:expand-region
   #:expand-region-request
   #:extents
   #:fetch-region
   #:fetch-region-reply
   #:fetch-region-request
   #:get-client-disconnect-mode
   #:get-client-disconnect-mode-reply
   #:get-client-disconnect-mode-request
   #:get-cursor-image
   #:get-cursor-image-and-name
   #:get-cursor-image-and-name-reply
   #:get-cursor-image-and-name-request
   #:get-cursor-image-reply
   #:get-cursor-image-request
   #:get-cursor-name
   #:get-cursor-name-reply
   #:get-cursor-name-request
   #:height
   #:hide-cursor
   #:hide-cursor-request
   #:intersect-region
   #:intersect-region-request
   #:invert-region
   #:invert-region-request
   #:length
   #:major-opcode
   #:major-version
   #:minor-opcode
   #:minor-version
   #:name
   #:nbytes
   #:owner
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:rectangles
   #:region
   #:region-extents
   #:region-extents-request
   #:response-type
   #:select-cursor-input
   #:select-cursor-input-request
   #:select-selection-input
   #:select-selection-input-request
   #:selection
   #:selection-notify
   #:selection-timestamp
   #:sequence
   #:set-client-disconnect-mode
   #:set-client-disconnect-mode-request
   #:set-cursor-name
   #:set-cursor-name-request
   #:set-gc-clip-region
   #:set-gc-clip-region-request
   #:set-picture-clip-region
   #:set-picture-clip-region-request
   #:set-region
   #:set-region-request
   #:set-window-shape-region
   #:set-window-shape-region-request
   #:show-cursor
   #:show-cursor-request
   #:subtract-region
   #:subtract-region-request
   #:subtype
   #:timestamp
   #:translate-region
   #:translate-region-request
   #:union-region
   #:union-region-request
   #:width
   #:window
   #:x
   #:xhot
   #:y
   #:yhot))

(in-package #:XCB-XFIXES)

(xcb:register-extension-xname "XCB-XFIXES" "XFIXES")

;;; Request xcb.XFixes.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf client-major-version)
    (xcb:buffer-write-card32 %buf client-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 32))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 32))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Enum xcb.XFixes.SaveSetMode
(xcb:defenum x-fixes-save-set-mode
  (:insert 0)
  (:delete 1))

;;; Enum xcb.XFixes.SaveSetTarget
(xcb:defenum x-fixes-save-set-target
  (:nearest 0)
  (:root 1))

;;; Enum xcb.XFixes.SaveSetMapping
(xcb:defenum x-fixes-save-set-mapping
  (:map 0)
  (:unmap 1))

;;; Request xcb.XFixes.ChangeSaveSet
(defun change-save-set (conn mode target map window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf target)
    (xcb:buffer-write-card8 %buf map)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-save-set-request (xcb:request)
          ((mode :initarg :mode :type (unsigned-byte 8))
           (target :initarg :target :type (unsigned-byte 8))
           (map :initarg :map :type (unsigned-byte 8)) (window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj change-save-set-request))
  (change-save-set conn (slot-value %obj 'mode) (slot-value %obj 'target) (slot-value %obj 'map)
   (slot-value %obj 'window)))

;;; Enum xcb.XFixes.SelectionEvent
(xcb:defenum x-fixes-selection-event
  (:set-selection-owner 0)
  (:selection-window-destroy 1)
  (:selection-client-close 2))

;;; Enum xcb.XFixes.SelectionEventMask
(xcb:defenum x-fixes-selection-event-mask
  (:set-selection-owner 1)
  (:selection-window-destroy 2)
  (:selection-client-close 4))

;;; Event xcb.XFixes.SelectionNotify (0)
(defclass selection-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (subtype :initarg :subtype :accessor subtype :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type xcb:window)
           (owner :initarg :owner :accessor owner :type xcb:window)
           (selection :initarg :selection :accessor selection :type xcb:atom)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (selection-timestamp :initarg :selection-timestamp :accessor selection-timestamp :type
            xcb:timestamp)))
(defun decode-selection-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        subtype
        sequence
        window
        owner
        selection
        timestamp
        selection-timestamp)
    (declare
     (ignorable %p response-type subtype sequence window owner selection timestamp
      selection-timestamp))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf subtype (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf owner (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf selection (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf selection-timestamp (xcb:read-card32-at %buf (+ %p 20) %order))
    (values
     (make-instance 'selection-notify :response-type response-type :subtype subtype :sequence
                    sequence :window window :owner owner :selection selection :timestamp timestamp
                    :selection-timestamp selection-timestamp)
     (+ %pos 32))))
(defun encode-selection-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (subtype (slot-value %obj 'subtype))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (owner (slot-value %obj 'owner))
         (selection (slot-value %obj 'selection))
         (timestamp (slot-value %obj 'timestamp))
         (selection-timestamp (slot-value %obj 'selection-timestamp)))
    (declare
     (ignorable response-type subtype sequence window owner selection timestamp
      selection-timestamp))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf subtype)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf owner)
    (xcb:buffer-write-card32 %buf selection)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf selection-timestamp)
    (xcb:buffer-write-padding %buf 8)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj selection-notify)) (encode-selection-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XFIXES" 0 #'decode-selection-notify)

;;; Request xcb.XFixes.SelectSelectionInput
(defun select-selection-input (conn window selection event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf selection)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-selection-input-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (selection :initarg :selection :type xcb:atom)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-selection-input-request))
  (select-selection-input conn (slot-value %obj 'window) (slot-value %obj 'selection)
   (slot-value %obj 'event-mask)))

;;; Enum xcb.XFixes.CursorNotify
(xcb:defenum x-fixes-cursor-notify
  (:display-cursor 0))

;;; Enum xcb.XFixes.CursorNotifyMask
(xcb:defenum x-fixes-cursor-notify-mask
  (:display-cursor 1))

;;; Event xcb.XFixes.CursorNotify (1)
(defclass cursor-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (subtype :initarg :subtype :accessor subtype :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type xcb:window)
           (cursor-serial :initarg :cursor-serial :accessor cursor-serial :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (name :initarg :name :accessor name :type xcb:atom)))
(defun decode-cursor-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type subtype sequence window cursor-serial timestamp name)
    (declare (ignorable %p response-type subtype sequence window cursor-serial timestamp name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf subtype (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf cursor-serial (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf name (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'cursor-notify :response-type response-type :subtype subtype :sequence sequence
                    :window window :cursor-serial cursor-serial :timestamp timestamp :name name)
     (+ %pos 32))))
(defun encode-cursor-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (subtype (slot-value %obj 'subtype))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (cursor-serial (slot-value %obj 'cursor-serial))
         (timestamp (slot-value %obj 'timestamp))
         (name (slot-value %obj 'name)))
    (declare (ignorable response-type subtype sequence window cursor-serial timestamp name))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf subtype)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf cursor-serial)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj cursor-notify)) (encode-cursor-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XFIXES" 1 #'decode-cursor-notify)

;;; Request xcb.XFixes.SelectCursorInput
(defun select-cursor-input (conn window event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-cursor-input-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-cursor-input-request))
  (select-cursor-input conn (slot-value %obj 'window) (slot-value %obj 'event-mask)))

;;; Request xcb.XFixes.GetCursorImage
(defun get-cursor-image (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-cursor-image-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-cursor-image-request)) (get-cursor-image conn))
(defclass get-cursor-image-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (xhot :initarg :xhot :accessor xhot :type (unsigned-byte 16))
           (yhot :initarg :yhot :accessor yhot :type (unsigned-byte 16))
           (cursor-serial :initarg :cursor-serial :accessor cursor-serial :type (unsigned-byte 32))
           (cursor-image :initarg :cursor-image :accessor cursor-image :type cl:sequence)))
(defun decode-get-cursor-image-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        x
        y
        width
        height
        xhot
        yhot
        cursor-serial
        cursor-image)
    (declare
     (ignorable %p response-type sequence length x y width height xhot yhot cursor-serial
      cursor-image))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 10) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf xhot (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf yhot (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf cursor-serial (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (cursor-image %p)
      (xcb:read-vector-at %buf %p (min (* width height) (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'get-cursor-image-reply :response-type response-type :sequence sequence :length
                    length :x x :y y :width width :height height :xhot xhot :yhot yhot
                    :cursor-serial cursor-serial :cursor-image cursor-image)
     (+ %pos 32 (* 4 length)))))
(defun get-cursor-image-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-cursor-image-reply))
(deftype region () '(unsigned-byte 32))

;;; Error xcb.XFixes.BadRegion (0)
(defclass bad-region-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-region-error (%buf %pos %order)
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
     (make-instance 'bad-region-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XFIXES" 0 #'decode-bad-region-error)

;;; Enum xcb.XFixes.Region
(xcb:defenum x-fixes-region
  (:none 0))

;;; Request xcb.XFixes.CreateRegion
(defun create-region (conn region rectangles)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-struct-list-16 %buf rectangles #'xcb:encode-rectangle 4)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-request (xcb:request)
          ((region :initarg :region :type region)
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-region-request))
  (create-region conn (slot-value %obj 'region) (slot-value %obj 'rectangles)))

;;; Request xcb.XFixes.CreateRegionFromBitmap
(defun create-region-from-bitmap (conn region bitmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf bitmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-from-bitmap-request (xcb:request)
          ((region :initarg :region :type region) (bitmap :initarg :bitmap :type xcb:pixmap)))
(defmethod xcb:send-request (conn (%obj create-region-from-bitmap-request))
  (create-region-from-bitmap conn (slot-value %obj 'region) (slot-value %obj 'bitmap)))

;;; Request xcb.XFixes.CreateRegionFromWindow
(defun create-region-from-window (conn region window kind)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf kind)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-from-window-request (xcb:request)
          ((region :initarg :region :type region) (window :initarg :window :type xcb:window)
           (kind :initarg :kind :type xcb-shape:kind)))
(defmethod xcb:send-request (conn (%obj create-region-from-window-request))
  (create-region-from-window conn (slot-value %obj 'region) (slot-value %obj 'window)
   (slot-value %obj 'kind)))

;;; Request xcb.XFixes.CreateRegionFromGC
(defun create-region-from-gc (conn region gc)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-from-gc-request (xcb:request)
          ((region :initarg :region :type region) (gc :initarg :gc :type xcb:gcontext)))
(defmethod xcb:send-request (conn (%obj create-region-from-gc-request))
  (create-region-from-gc conn (slot-value %obj 'region) (slot-value %obj 'gc)))

;;; Request xcb.XFixes.CreateRegionFromPicture
(defun create-region-from-picture (conn region picture)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-from-picture-request (xcb:request)
          ((region :initarg :region :type region)
           (picture :initarg :picture :type xcb-render:picture)))
(defmethod xcb:send-request (conn (%obj create-region-from-picture-request))
  (create-region-from-picture conn (slot-value %obj 'region) (slot-value %obj 'picture)))

;;; Request xcb.XFixes.DestroyRegion
(defun destroy-region (conn region)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-region-request (xcb:request) ((region :initarg :region :type region)))
(defmethod xcb:send-request (conn (%obj destroy-region-request))
  (destroy-region conn (slot-value %obj 'region)))

;;; Request xcb.XFixes.SetRegion
(defun set-region (conn region rectangles)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-struct-list-16 %buf rectangles #'xcb:encode-rectangle 4)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-region-request (xcb:request)
          ((region :initarg :region :type region)
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-region-request))
  (set-region conn (slot-value %obj 'region) (slot-value %obj 'rectangles)))

;;; Request xcb.XFixes.CopyRegion
(defun copy-region (conn source destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass copy-region-request (xcb:request)
          ((source :initarg :source :type region) (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj copy-region-request))
  (copy-region conn (slot-value %obj 'source) (slot-value %obj 'destination)))

;;; Request xcb.XFixes.UnionRegion
(defun union-region (conn source1 source2 destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source1)
    (xcb:buffer-write-card32 %buf source2)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass union-region-request (xcb:request)
          ((source1 :initarg :source1 :type region) (source2 :initarg :source2 :type region)
           (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj union-region-request))
  (union-region conn (slot-value %obj 'source1) (slot-value %obj 'source2)
   (slot-value %obj 'destination)))

;;; Request xcb.XFixes.IntersectRegion
(defun intersect-region (conn source1 source2 destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source1)
    (xcb:buffer-write-card32 %buf source2)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass intersect-region-request (xcb:request)
          ((source1 :initarg :source1 :type region) (source2 :initarg :source2 :type region)
           (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj intersect-region-request))
  (intersect-region conn (slot-value %obj 'source1) (slot-value %obj 'source2)
   (slot-value %obj 'destination)))

;;; Request xcb.XFixes.SubtractRegion
(defun subtract-region (conn source1 source2 destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source1)
    (xcb:buffer-write-card32 %buf source2)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass subtract-region-request (xcb:request)
          ((source1 :initarg :source1 :type region) (source2 :initarg :source2 :type region)
           (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj subtract-region-request))
  (subtract-region conn (slot-value %obj 'source1) (slot-value %obj 'source2)
   (slot-value %obj 'destination)))

;;; Request xcb.XFixes.InvertRegion
(defun invert-region (conn source bounds destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source)
    (xcb:encode-rectangle %buf bounds)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass invert-region-request (xcb:request)
          ((source :initarg :source :type region) (bounds :initarg :bounds :type xcb:rectangle)
           (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj invert-region-request))
  (invert-region conn (slot-value %obj 'source) (slot-value %obj 'bounds)
   (slot-value %obj 'destination)))

;;; Request xcb.XFixes.TranslateRegion
(defun translate-region (conn region dx dy)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card16 %buf dx)
    (xcb:buffer-write-card16 %buf dy)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass translate-region-request (xcb:request)
          ((region :initarg :region :type region) (dx :initarg :dx :type (signed-byte 16))
           (dy :initarg :dy :type (signed-byte 16))))
(defmethod xcb:send-request (conn (%obj translate-region-request))
  (translate-region conn (slot-value %obj 'region) (slot-value %obj 'dx) (slot-value %obj 'dy)))

;;; Request xcb.XFixes.RegionExtents
(defun region-extents (conn source destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass region-extents-request (xcb:request)
          ((source :initarg :source :type region) (destination :initarg :destination :type region)))
(defmethod xcb:send-request (conn (%obj region-extents-request))
  (region-extents conn (slot-value %obj 'source) (slot-value %obj 'destination)))

;;; Request xcb.XFixes.FetchRegion
(defun fetch-region (conn region)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass fetch-region-request (xcb:request-with-reply) ((region :initarg :region :type region)))
(defmethod xcb:send-request (conn (%obj fetch-region-request))
  (fetch-region conn (slot-value %obj 'region)))
(defclass fetch-region-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (extents :initarg :extents :accessor extents :type xcb:rectangle)
           (rectangles :initarg :rectangles :accessor rectangles :type cl:sequence)))
(defun decode-fetch-region-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length extents rectangles)
    (declare (ignorable %p response-type sequence length extents rectangles))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf extents (xcb:decode-rectangle %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (rectangles %p)
      (xcb:read-struct-vector-at %buf %p
       (min (truncate length 2) (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
       #'xcb:decode-rectangle))
    (values
     (make-instance 'fetch-region-reply :response-type response-type :sequence sequence :length
                    length :extents extents :rectangles rectangles)
     (+ %pos 32 (* 4 length)))))
(defun fetch-region-reply (conn cookie) (xcb:read-reply conn cookie #'decode-fetch-region-reply))

;;; Request xcb.XFixes.SetGCClipRegion
(defun set-gc-clip-region (conn gc region x-origin y-origin)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf gc)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card16 %buf x-origin)
    (xcb:buffer-write-card16 %buf y-origin)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-gc-clip-region-request (xcb:request)
          ((gc :initarg :gc :type xcb:gcontext) (region :initarg :region :type region)
           (x-origin :initarg :x-origin :type (signed-byte 16))
           (y-origin :initarg :y-origin :type (signed-byte 16))))
(defmethod xcb:send-request (conn (%obj set-gc-clip-region-request))
  (set-gc-clip-region conn (slot-value %obj 'gc) (slot-value %obj 'region)
   (slot-value %obj 'x-origin) (slot-value %obj 'y-origin)))

;;; Request xcb.XFixes.SetWindowShapeRegion
(defun set-window-shape-region (conn dest dest-kind x-offset y-offset region)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf dest)
    (xcb:buffer-write-card8 %buf dest-kind)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card16 %buf x-offset)
    (xcb:buffer-write-card16 %buf y-offset)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-window-shape-region-request (xcb:request)
          ((dest :initarg :dest :type xcb:window)
           (dest-kind :initarg :dest-kind :type xcb-shape:kind)
           (x-offset :initarg :x-offset :type (signed-byte 16))
           (y-offset :initarg :y-offset :type (signed-byte 16))
           (region :initarg :region :type region)))
(defmethod xcb:send-request (conn (%obj set-window-shape-region-request))
  (set-window-shape-region conn (slot-value %obj 'dest) (slot-value %obj 'dest-kind)
   (slot-value %obj 'x-offset) (slot-value %obj 'y-offset) (slot-value %obj 'region)))

;;; Request xcb.XFixes.SetPictureClipRegion
(defun set-picture-clip-region (conn picture region x-origin y-origin)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card16 %buf x-origin)
    (xcb:buffer-write-card16 %buf y-origin)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-picture-clip-region-request (xcb:request)
          ((picture :initarg :picture :type xcb-render:picture)
           (region :initarg :region :type region)
           (x-origin :initarg :x-origin :type (signed-byte 16))
           (y-origin :initarg :y-origin :type (signed-byte 16))))
(defmethod xcb:send-request (conn (%obj set-picture-clip-region-request))
  (set-picture-clip-region conn (slot-value %obj 'picture) (slot-value %obj 'region)
   (slot-value %obj 'x-origin) (slot-value %obj 'y-origin)))

;;; Request xcb.XFixes.SetCursorName
(defun set-cursor-name (conn cursor name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES"))
         (%buf (xcb:conn-send-buffer conn))
         (nbytes (cl:length name)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-write-card16 %buf nbytes)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf name nbytes)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-cursor-name-request (xcb:request)
          ((cursor :initarg :cursor :type xcb:cursor)
           (nbytes :initarg :nbytes :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-cursor-name-request))
  (set-cursor-name conn (slot-value %obj 'cursor) (slot-value %obj 'name)))

;;; Request xcb.XFixes.GetCursorName
(defun get-cursor-name (conn cursor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-cursor-name-request (xcb:request-with-reply)
          ((cursor :initarg :cursor :type xcb:cursor)))
(defmethod xcb:send-request (conn (%obj get-cursor-name-request))
  (get-cursor-name conn (slot-value %obj 'cursor)))
(defclass get-cursor-name-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (atom :initarg :atom :accessor atom :type xcb:atom)
           (nbytes :initarg :nbytes :accessor nbytes :type (unsigned-byte 16))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-get-cursor-name-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length atom nbytes name)
    (declare (ignorable %p response-type sequence length atom nbytes name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf atom (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf nbytes (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (setf name (xcb:read-string-at %buf %p (min nbytes (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (values
     (make-instance 'get-cursor-name-reply :response-type response-type :sequence sequence :length
                    length :atom atom :nbytes nbytes :name name)
     (+ %pos 32 (* 4 length)))))
(defun get-cursor-name-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-cursor-name-reply))

;;; Request xcb.XFixes.GetCursorImageAndName
(defun get-cursor-image-and-name (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 25)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-cursor-image-and-name-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-cursor-image-and-name-request))
  (get-cursor-image-and-name conn))
(defclass get-cursor-image-and-name-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (xhot :initarg :xhot :accessor xhot :type (unsigned-byte 16))
           (yhot :initarg :yhot :accessor yhot :type (unsigned-byte 16))
           (cursor-serial :initarg :cursor-serial :accessor cursor-serial :type (unsigned-byte 32))
           (cursor-atom :initarg :cursor-atom :accessor cursor-atom :type xcb:atom)
           (nbytes :initarg :nbytes :accessor nbytes :type (unsigned-byte 16))
           (cursor-image :initarg :cursor-image :accessor cursor-image :type cl:sequence)
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-get-cursor-image-and-name-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        x
        y
        width
        height
        xhot
        yhot
        cursor-serial
        cursor-atom
        nbytes
        cursor-image
        name)
    (declare
     (ignorable %p response-type sequence length x y width height xhot yhot cursor-serial
      cursor-atom nbytes cursor-image name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 10) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf xhot (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf yhot (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf cursor-serial (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf cursor-atom (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf nbytes (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (cursor-image %p)
      (xcb:read-vector-at %buf %p (min (* width height) (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (setf name (xcb:read-string-at %buf %p (min nbytes (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (values
     (make-instance 'get-cursor-image-and-name-reply :response-type response-type :sequence
                    sequence :length length :x x :y y :width width :height height :xhot xhot :yhot
                    yhot :cursor-serial cursor-serial :cursor-atom cursor-atom :nbytes nbytes
                    :cursor-image cursor-image :name name)
     (+ %pos 32 (* 4 length)))))
(defun get-cursor-image-and-name-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-cursor-image-and-name-reply))

;;; Request xcb.XFixes.ChangeCursor
(defun change-cursor (conn source destination)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 26)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-cursor-request (xcb:request)
          ((source :initarg :source :type xcb:cursor)
           (destination :initarg :destination :type xcb:cursor)))
(defmethod xcb:send-request (conn (%obj change-cursor-request))
  (change-cursor conn (slot-value %obj 'source) (slot-value %obj 'destination)))

;;; Request xcb.XFixes.ChangeCursorByName
(defun change-cursor-by-name (conn src name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES"))
         (%buf (xcb:conn-send-buffer conn))
         (nbytes (cl:length name)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 27)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card16 %buf nbytes)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf name nbytes)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-cursor-by-name-request (xcb:request)
          ((src :initarg :src :type xcb:cursor) (nbytes :initarg :nbytes :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-cursor-by-name-request))
  (change-cursor-by-name conn (slot-value %obj 'src) (slot-value %obj 'name)))

;;; Request xcb.XFixes.ExpandRegion
(defun expand-region (conn source destination left right top bottom)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 28)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf source)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-write-card16 %buf left)
    (xcb:buffer-write-card16 %buf right)
    (xcb:buffer-write-card16 %buf top)
    (xcb:buffer-write-card16 %buf bottom)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass expand-region-request (xcb:request)
          ((source :initarg :source :type region) (destination :initarg :destination :type region)
           (left :initarg :left :type (unsigned-byte 16))
           (right :initarg :right :type (unsigned-byte 16))
           (top :initarg :top :type (unsigned-byte 16))
           (bottom :initarg :bottom :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj expand-region-request))
  (expand-region conn (slot-value %obj 'source) (slot-value %obj 'destination)
   (slot-value %obj 'left) (slot-value %obj 'right) (slot-value %obj 'top)
   (slot-value %obj 'bottom)))

;;; Request xcb.XFixes.HideCursor
(defun hide-cursor (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 29)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass hide-cursor-request (xcb:request) ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj hide-cursor-request))
  (hide-cursor conn (slot-value %obj 'window)))

;;; Request xcb.XFixes.ShowCursor
(defun show-cursor (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 30)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass show-cursor-request (xcb:request) ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj show-cursor-request))
  (show-cursor conn (slot-value %obj 'window)))
(deftype barrier () '(unsigned-byte 32))

;;; Enum xcb.XFixes.BarrierDirections
(xcb:defenum x-fixes-barrier-directions
  (:positive-x 1)
  (:positive-y 2)
  (:negative-x 4)
  (:negative-y 8))

;;; Request xcb.XFixes.CreatePointerBarrier
(defun create-pointer-barrier (conn barrier window x1 y1 x2 y2 directions devices)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES"))
         (%buf (xcb:conn-send-buffer conn))
         (num-devices (cl:length devices)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 31)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf barrier)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf x1)
    (xcb:buffer-write-card16 %buf y1)
    (xcb:buffer-write-card16 %buf x2)
    (xcb:buffer-write-card16 %buf y2)
    (xcb:buffer-write-card32 %buf directions)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card16 %buf num-devices)
    (xcb:buffer-write-list %buf devices num-devices #'xcb:buffer-write-card16)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-pointer-barrier-request (xcb:request)
          ((barrier :initarg :barrier :type barrier) (window :initarg :window :type xcb:window)
           (x1 :initarg :x1 :type (unsigned-byte 16)) (y1 :initarg :y1 :type (unsigned-byte 16))
           (x2 :initarg :x2 :type (unsigned-byte 16)) (y2 :initarg :y2 :type (unsigned-byte 16))
           (directions :initarg :directions :type (unsigned-byte 32))
           (num-devices :initarg :num-devices :type (unsigned-byte 16))
           (devices :initarg :devices :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-pointer-barrier-request))
  (create-pointer-barrier conn (slot-value %obj 'barrier) (slot-value %obj 'window)
   (slot-value %obj 'x1) (slot-value %obj 'y1) (slot-value %obj 'x2) (slot-value %obj 'y2)
   (slot-value %obj 'directions) (slot-value %obj 'devices)))

;;; Request xcb.XFixes.DeletePointerBarrier
(defun delete-pointer-barrier (conn barrier)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 32)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf barrier)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-pointer-barrier-request (xcb:request) ((barrier :initarg :barrier :type barrier)))
(defmethod xcb:send-request (conn (%obj delete-pointer-barrier-request))
  (delete-pointer-barrier conn (slot-value %obj 'barrier)))

;;; Enum xcb.XFixes.ClientDisconnectFlags
(xcb:defenum x-fixes-client-disconnect-flags
  (:default 0)
  (:terminate 1))

;;; Request xcb.XFixes.SetClientDisconnectMode
(defun set-client-disconnect-mode (conn disconnect-mode)
  "Sets the disconnect mode for the client."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 33)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf disconnect-mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-client-disconnect-mode-request (xcb:request)
          ((disconnect-mode :initarg :disconnect-mode :type (unsigned-byte 32)))
          (:documentation "Sets the disconnect mode for the client."))
(defmethod xcb:send-request (conn (%obj set-client-disconnect-mode-request))
  (set-client-disconnect-mode conn (slot-value %obj 'disconnect-mode)))

;;; Request xcb.XFixes.GetClientDisconnectMode
(defun get-client-disconnect-mode (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XFIXES")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 34)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-client-disconnect-mode-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-client-disconnect-mode-request))
  (get-client-disconnect-mode conn))
(defclass get-client-disconnect-mode-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (disconnect-mode :initarg :disconnect-mode :accessor disconnect-mode :type
            (unsigned-byte 32)))
          (:documentation "Gets the disconnect mode for the client."))
(defun decode-get-client-disconnect-mode-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length disconnect-mode)
    (declare (ignorable %p response-type sequence length disconnect-mode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf disconnect-mode (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-client-disconnect-mode-reply :response-type response-type :sequence
                    sequence :length length :disconnect-mode disconnect-mode)
     (+ %pos 32 (* 4 length)))))
(defun get-client-disconnect-mode-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-client-disconnect-mode-reply))
