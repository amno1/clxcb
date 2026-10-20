;;; Generated from xproto.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(in-package #:XCB)

;;; xcb.CHAR2B
(defclass char2-b nil
          ((byte1 :initarg :byte1 :accessor byte1 :type (unsigned-byte 8))
           (byte2 :initarg :byte2 :accessor byte2 :type (unsigned-byte 8))))
(defun encode-char2-b (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((byte1 (slot-value %obj 'byte1)) (byte2 (slot-value %obj 'byte2)))
    (declare (ignorable byte1 byte2))
    (buffer-write-card8 %buf byte1)
    (buffer-write-card8 %buf byte2)))
(defun decode-char2-b (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) byte1 byte2)
    (declare (ignorable %p byte1 byte2))
    (setf byte1 (read-card8-at %buf %p))
    (setf byte2 (read-card8-at %buf (+ %p 1)))
    (cl:values (make-instance 'char2-b :byte1 byte1 :byte2 byte2) (+ %p 2))))
(deftype window () '(unsigned-byte 32))
(deftype pixmap () '(unsigned-byte 32))
(deftype cursor () '(unsigned-byte 32))
(deftype font () '(unsigned-byte 32))
(deftype gcontext () '(unsigned-byte 32))
(deftype colormap () '(unsigned-byte 32))
(deftype atom () '(unsigned-byte 32))
(deftype drawable () '(unsigned-byte 32))
(deftype fontable () '(unsigned-byte 32))
(deftype bool32 () '(unsigned-byte 32))
(deftype visualid () '(unsigned-byte 32))
(deftype timestamp () '(unsigned-byte 32))
(deftype keysym () '(unsigned-byte 32))
(deftype keycode () '(unsigned-byte 8))
(deftype keycode32 () '(unsigned-byte 32))
(deftype button () '(unsigned-byte 8))

;;; xcb.POINT
(defclass point nil
          ((x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))))
(defun encode-point (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x (slot-value %obj 'x)) (y (slot-value %obj 'y)))
    (declare (ignorable x y))
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)))
(defun decode-point (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x y)
    (declare (ignorable %p x y))
    (setf x (read-int16-at %buf %p %order))
    (setf y (read-int16-at %buf (+ %p 2) %order))
    (cl:values (make-instance 'point :x x :y y) (+ %p 4))))

;;; xcb.RECTANGLE
(defclass rectangle nil
          ((x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))))
(defun encode-rectangle (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height)))
    (declare (ignorable x y width height))
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)))
(defun decode-rectangle (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x y width height)
    (declare (ignorable %p x y width height))
    (setf x (read-int16-at %buf %p %order))
    (setf y (read-int16-at %buf (+ %p 2) %order))
    (setf width (read-card16-at %buf (+ %p 4) %order))
    (setf height (read-card16-at %buf (+ %p 6) %order))
    (cl:values (make-instance 'rectangle :x x :y y :width width :height height) (+ %p 8))))

;;; xcb.ARC
(defclass arc nil
          ((x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (angle1 :initarg :angle1 :accessor angle1 :type (signed-byte 16))
           (angle2 :initarg :angle2 :accessor angle2 :type (signed-byte 16))))
(defun encode-arc (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (angle1 (slot-value %obj 'angle1))
         (angle2 (slot-value %obj 'angle2)))
    (declare (ignorable x y width height angle1 angle2))
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf angle1)
    (buffer-write-card16 %buf angle2)))
(defun decode-arc (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x y width height angle1 angle2)
    (declare (ignorable %p x y width height angle1 angle2))
    (setf x (read-int16-at %buf %p %order))
    (setf y (read-int16-at %buf (+ %p 2) %order))
    (setf width (read-card16-at %buf (+ %p 4) %order))
    (setf height (read-card16-at %buf (+ %p 6) %order))
    (setf angle1 (read-int16-at %buf (+ %p 8) %order))
    (setf angle2 (read-int16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'arc :x x :y y :width width :height height :angle1 angle1 :angle2 angle2)
     (+ %p 12))))

;;; xcb.FORMAT
(defclass format nil
          ((depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (bits-per-pixel :initarg :bits-per-pixel :accessor bits-per-pixel :type
            (unsigned-byte 8))
           (scanline-pad :initarg :scanline-pad :accessor scanline-pad :type (unsigned-byte 8))))
(defun encode-format (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((depth (slot-value %obj 'depth))
         (bits-per-pixel (slot-value %obj 'bits-per-pixel))
         (scanline-pad (slot-value %obj 'scanline-pad)))
    (declare (ignorable depth bits-per-pixel scanline-pad))
    (buffer-write-card8 %buf depth)
    (buffer-write-card8 %buf bits-per-pixel)
    (buffer-write-card8 %buf scanline-pad)
    (buffer-write-padding %buf 5)))
(defun decode-format (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) depth bits-per-pixel scanline-pad)
    (declare (ignorable %p depth bits-per-pixel scanline-pad))
    (setf depth (read-card8-at %buf %p))
    (setf bits-per-pixel (read-card8-at %buf (+ %p 1)))
    (setf scanline-pad (read-card8-at %buf (+ %p 2)))
    (cl:values
     (make-instance 'format :depth depth :bits-per-pixel bits-per-pixel :scanline-pad scanline-pad)
     (+ %p 8))))

;;; Enum xcb.VisualClass
(defenum visual-class
  (:static-gray 0)
  (:gray-scale 1)
  (:static-color 2)
  (:pseudo-color 3)
  (:true-color 4)
  (:direct-color 5))

;;; xcb.VISUALTYPE
(defclass visualtype nil
          ((visual-id :initarg :visual-id :accessor visual-id :type visualid)
           (class :initarg :class :accessor class :type (unsigned-byte 8))
           (bits-per-rgb-value :initarg :bits-per-rgb-value :accessor bits-per-rgb-value :type
            (unsigned-byte 8))
           (colormap-entries :initarg :colormap-entries :accessor colormap-entries :type
            (unsigned-byte 16))
           (red-mask :initarg :red-mask :accessor red-mask :type (unsigned-byte 32))
           (green-mask :initarg :green-mask :accessor green-mask :type (unsigned-byte 32))
           (blue-mask :initarg :blue-mask :accessor blue-mask :type (unsigned-byte 32))))
(defun encode-visualtype (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((visual-id (slot-value %obj 'visual-id))
         (class (slot-value %obj 'class))
         (bits-per-rgb-value (slot-value %obj 'bits-per-rgb-value))
         (colormap-entries (slot-value %obj 'colormap-entries))
         (red-mask (slot-value %obj 'red-mask))
         (green-mask (slot-value %obj 'green-mask))
         (blue-mask (slot-value %obj 'blue-mask)))
    (declare
     (ignorable visual-id class bits-per-rgb-value colormap-entries red-mask green-mask blue-mask))
    (buffer-write-card32 %buf visual-id)
    (buffer-write-card8 %buf class)
    (buffer-write-card8 %buf bits-per-rgb-value)
    (buffer-write-card16 %buf colormap-entries)
    (buffer-write-card32 %buf red-mask)
    (buffer-write-card32 %buf green-mask)
    (buffer-write-card32 %buf blue-mask)
    (buffer-write-padding %buf 4)))
(defun decode-visualtype (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) visual-id class bits-per-rgb-value colormap-entries red-mask green-mask blue-mask)
    (declare
     (ignorable %p visual-id class bits-per-rgb-value colormap-entries red-mask green-mask
      blue-mask))
    (setf visual-id (read-card32-at %buf %p %order))
    (setf class (read-card8-at %buf (+ %p 4)))
    (setf bits-per-rgb-value (read-card8-at %buf (+ %p 5)))
    (setf colormap-entries (read-card16-at %buf (+ %p 6) %order))
    (setf red-mask (read-card32-at %buf (+ %p 8) %order))
    (setf green-mask (read-card32-at %buf (+ %p 12) %order))
    (setf blue-mask (read-card32-at %buf (+ %p 16) %order))
    (cl:values
     (make-instance 'visualtype :visual-id visual-id :class class :bits-per-rgb-value
                    bits-per-rgb-value :colormap-entries colormap-entries :red-mask red-mask
                    :green-mask green-mask :blue-mask blue-mask)
     (+ %p 24))))

;;; xcb.DEPTH
(defclass depth nil
          ((depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (visuals-len :initarg :visuals-len :accessor visuals-len :type (unsigned-byte 16))
           (visuals :initarg :visuals :accessor visuals :type cl:sequence)))
(defun encode-depth (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((depth (slot-value %obj 'depth))
         (visuals (slot-value %obj 'visuals))
         (visuals-len (cl:length visuals)))
    (declare (ignorable depth visuals visuals-len))
    (buffer-write-card8 %buf depth)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf visuals-len)
    (buffer-write-padding %buf 4)
    (buffer-write-list %buf visuals visuals-len #'encode-visualtype)))
(defun decode-depth (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) depth visuals-len visuals)
    (declare (ignorable %p depth visuals-len visuals))
    (setf depth (read-card8-at %buf %p))
    (setf visuals-len (read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (visuals %p)
      (read-struct-vector-at %buf %p visuals-len %order #'decode-visualtype))
    (cl:values (make-instance 'depth :depth depth :visuals-len visuals-len :visuals visuals) %p)))

;;; Enum xcb.EventMask
(defenum event-mask
  (:no-event 0)
  (:key-press 1)
  (:key-release 2)
  (:button-press 4)
  (:button-release 8)
  (:enter-window 16)
  (:leave-window 32)
  (:pointer-motion 64)
  (:pointer-motion-hint 128)
  (:button1-motion 256)
  (:button2-motion 512)
  (:button3-motion 1024)
  (:button4-motion 2048)
  (:button5-motion 4096)
  (:button-motion 8192)
  (:keymap-state 16384)
  (:exposure 32768)
  (:visibility-change 65536)
  (:structure-notify 131072)
  (:resize-redirect 262144)
  (:substructure-notify 524288)
  (:substructure-redirect 1048576)
  (:focus-change 2097152)
  (:property-change 4194304)
  (:color-map-change 8388608)
  (:owner-grab-button 16777216))

;;; Enum xcb.BackingStore
(defenum backing-store
  (:not-useful 0)
  (:when-mapped 1)
  (:always 2))

;;; xcb.SCREEN
(defclass screen nil
          ((root :initarg :root :accessor root :type window)
           (default-colormap :initarg :default-colormap :accessor default-colormap :type colormap)
           (white-pixel :initarg :white-pixel :accessor white-pixel :type (unsigned-byte 32))
           (black-pixel :initarg :black-pixel :accessor black-pixel :type (unsigned-byte 32))
           (current-input-masks :initarg :current-input-masks :accessor current-input-masks :type
            (unsigned-byte 32))
           (width-in-pixels :initarg :width-in-pixels :accessor width-in-pixels :type
            (unsigned-byte 16))
           (height-in-pixels :initarg :height-in-pixels :accessor height-in-pixels :type
            (unsigned-byte 16))
           (width-in-millimeters :initarg :width-in-millimeters :accessor width-in-millimeters
            :type (unsigned-byte 16))
           (height-in-millimeters :initarg :height-in-millimeters :accessor height-in-millimeters
            :type (unsigned-byte 16))
           (min-installed-maps :initarg :min-installed-maps :accessor min-installed-maps :type
            (unsigned-byte 16))
           (max-installed-maps :initarg :max-installed-maps :accessor max-installed-maps :type
            (unsigned-byte 16))
           (root-visual :initarg :root-visual :accessor root-visual :type visualid)
           (backing-stores :initarg :backing-stores :accessor backing-stores :type
            (unsigned-byte 8))
           (save-unders :initarg :save-unders :accessor save-unders :type
            (or boolean (unsigned-byte 8)))
           (root-depth :initarg :root-depth :accessor root-depth :type (unsigned-byte 8))
           (allowed-depths-len :initarg :allowed-depths-len :accessor allowed-depths-len :type
            (unsigned-byte 8))
           (allowed-depths :initarg :allowed-depths :accessor allowed-depths :type cl:sequence)))
(defun encode-screen (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((root (slot-value %obj 'root))
         (default-colormap (slot-value %obj 'default-colormap))
         (white-pixel (slot-value %obj 'white-pixel))
         (black-pixel (slot-value %obj 'black-pixel))
         (current-input-masks (slot-value %obj 'current-input-masks))
         (width-in-pixels (slot-value %obj 'width-in-pixels))
         (height-in-pixels (slot-value %obj 'height-in-pixels))
         (width-in-millimeters (slot-value %obj 'width-in-millimeters))
         (height-in-millimeters (slot-value %obj 'height-in-millimeters))
         (min-installed-maps (slot-value %obj 'min-installed-maps))
         (max-installed-maps (slot-value %obj 'max-installed-maps))
         (root-visual (slot-value %obj 'root-visual))
         (backing-stores (slot-value %obj 'backing-stores))
         (save-unders (slot-value %obj 'save-unders))
         (root-depth (slot-value %obj 'root-depth))
         (allowed-depths (slot-value %obj 'allowed-depths))
         (allowed-depths-len (cl:length allowed-depths)))
    (declare
     (ignorable root default-colormap white-pixel black-pixel current-input-masks width-in-pixels
      height-in-pixels width-in-millimeters height-in-millimeters min-installed-maps
      max-installed-maps root-visual backing-stores save-unders root-depth allowed-depths
      allowed-depths-len))
    (buffer-write-card32 %buf root)
    (buffer-write-card32 %buf default-colormap)
    (buffer-write-card32 %buf white-pixel)
    (buffer-write-card32 %buf black-pixel)
    (buffer-write-card32 %buf current-input-masks)
    (buffer-write-card16 %buf width-in-pixels)
    (buffer-write-card16 %buf height-in-pixels)
    (buffer-write-card16 %buf width-in-millimeters)
    (buffer-write-card16 %buf height-in-millimeters)
    (buffer-write-card16 %buf min-installed-maps)
    (buffer-write-card16 %buf max-installed-maps)
    (buffer-write-card32 %buf root-visual)
    (buffer-write-card8 %buf backing-stores)
    (buffer-write-bool %buf save-unders)
    (buffer-write-card8 %buf root-depth)
    (buffer-write-card8 %buf allowed-depths-len)
    (buffer-write-list %buf allowed-depths allowed-depths-len #'encode-depth)))
(defun decode-screen (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        root
        default-colormap
        white-pixel
        black-pixel
        current-input-masks
        width-in-pixels
        height-in-pixels
        width-in-millimeters
        height-in-millimeters
        min-installed-maps
        max-installed-maps
        root-visual
        backing-stores
        save-unders
        root-depth
        allowed-depths-len
        allowed-depths)
    (declare
     (ignorable %p root default-colormap white-pixel black-pixel current-input-masks
      width-in-pixels height-in-pixels width-in-millimeters height-in-millimeters
      min-installed-maps max-installed-maps root-visual backing-stores save-unders root-depth
      allowed-depths-len allowed-depths))
    (setf root (read-card32-at %buf %p %order))
    (setf default-colormap (read-card32-at %buf (+ %p 4) %order))
    (setf white-pixel (read-card32-at %buf (+ %p 8) %order))
    (setf black-pixel (read-card32-at %buf (+ %p 12) %order))
    (setf current-input-masks (read-card32-at %buf (+ %p 16) %order))
    (setf width-in-pixels (read-card16-at %buf (+ %p 20) %order))
    (setf height-in-pixels (read-card16-at %buf (+ %p 22) %order))
    (setf width-in-millimeters (read-card16-at %buf (+ %p 24) %order))
    (setf height-in-millimeters (read-card16-at %buf (+ %p 26) %order))
    (setf min-installed-maps (read-card16-at %buf (+ %p 28) %order))
    (setf max-installed-maps (read-card16-at %buf (+ %p 30) %order))
    (setf root-visual (read-card32-at %buf (+ %p 32) %order))
    (setf backing-stores (read-card8-at %buf (+ %p 36)))
    (setf save-unders (read-card8-at %buf (+ %p 37)))
    (setf root-depth (read-card8-at %buf (+ %p 38)))
    (setf allowed-depths-len (read-card8-at %buf (+ %p 39)))
    (setf %p (+ %p 40))
    (multiple-value-setq (allowed-depths %p)
      (read-struct-vector-at %buf %p allowed-depths-len %order #'decode-depth))
    (cl:values
     (make-instance 'screen :root root :default-colormap default-colormap :white-pixel white-pixel
                    :black-pixel black-pixel :current-input-masks current-input-masks
                    :width-in-pixels width-in-pixels :height-in-pixels height-in-pixels
                    :width-in-millimeters width-in-millimeters :height-in-millimeters
                    height-in-millimeters :min-installed-maps min-installed-maps
                    :max-installed-maps max-installed-maps :root-visual root-visual :backing-stores
                    backing-stores :save-unders save-unders :root-depth root-depth
                    :allowed-depths-len allowed-depths-len :allowed-depths allowed-depths)
     %p)))

;;; xcb.SetupRequest
(defclass setup-request nil
          ((byte-order :initarg :byte-order :accessor byte-order :type (unsigned-byte 8))
           (protocol-major-version :initarg :protocol-major-version :accessor
            protocol-major-version :type (unsigned-byte 16))
           (protocol-minor-version :initarg :protocol-minor-version :accessor
            protocol-minor-version :type (unsigned-byte 16))
           (authorization-protocol-name-len :initarg :authorization-protocol-name-len :accessor
            authorization-protocol-name-len :type (unsigned-byte 16))
           (authorization-protocol-data-len :initarg :authorization-protocol-data-len :accessor
            authorization-protocol-data-len :type (unsigned-byte 16))
           (authorization-protocol-name :initarg :authorization-protocol-name :accessor
            authorization-protocol-name :type cl:sequence)
           (authorization-protocol-data :initarg :authorization-protocol-data :accessor
            authorization-protocol-data :type cl:sequence)))
(defun encode-setup-request (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((byte-order (slot-value %obj 'byte-order))
         (protocol-major-version (slot-value %obj 'protocol-major-version))
         (protocol-minor-version (slot-value %obj 'protocol-minor-version))
         (authorization-protocol-name (slot-value %obj 'authorization-protocol-name))
         (authorization-protocol-data (slot-value %obj 'authorization-protocol-data))
         (authorization-protocol-name-len (cl:length authorization-protocol-name))
         (authorization-protocol-data-len (cl:length authorization-protocol-data)))
    (declare
     (ignorable byte-order protocol-major-version protocol-minor-version
      authorization-protocol-name authorization-protocol-data authorization-protocol-name-len
      authorization-protocol-data-len))
    (buffer-write-card8 %buf byte-order)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf protocol-major-version)
    (buffer-write-card16 %buf protocol-minor-version)
    (buffer-write-card16 %buf authorization-protocol-name-len)
    (buffer-write-card16 %buf authorization-protocol-data-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf authorization-protocol-name authorization-protocol-name-len)
    (buffer-pad-to-align %buf 4)
    (buffer-write-string-octets %buf authorization-protocol-data authorization-protocol-data-len)
    (buffer-pad-to-align %buf 4)))
(defun decode-setup-request (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        byte-order
        protocol-major-version
        protocol-minor-version
        authorization-protocol-name-len
        authorization-protocol-data-len
        authorization-protocol-name
        authorization-protocol-data)
    (declare
     (ignorable %p byte-order protocol-major-version protocol-minor-version
      authorization-protocol-name-len authorization-protocol-data-len authorization-protocol-name
      authorization-protocol-data))
    (setf byte-order (read-card8-at %buf %p))
    (setf protocol-major-version (read-card16-at %buf (+ %p 2) %order))
    (setf protocol-minor-version (read-card16-at %buf (+ %p 4) %order))
    (setf authorization-protocol-name-len (read-card16-at %buf (+ %p 6) %order))
    (setf authorization-protocol-data-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 12))
    (setf authorization-protocol-name (read-string-at %buf %p authorization-protocol-name-len))
    (incf %p (cl:length authorization-protocol-name))
    (setf %p (align-position %p 4))
    (setf authorization-protocol-data (read-string-at %buf %p authorization-protocol-data-len))
    (incf %p (cl:length authorization-protocol-data))
    (setf %p (align-position %p 4))
    (cl:values
     (make-instance 'setup-request :byte-order byte-order :protocol-major-version
                    protocol-major-version :protocol-minor-version protocol-minor-version
                    :authorization-protocol-name-len authorization-protocol-name-len
                    :authorization-protocol-data-len authorization-protocol-data-len
                    :authorization-protocol-name authorization-protocol-name
                    :authorization-protocol-data authorization-protocol-data)
     %p)))

;;; xcb.SetupFailed
(defclass setup-failed nil
          ((status :initarg :status :accessor status :type (unsigned-byte 8))
           (reason-len :initarg :reason-len :accessor reason-len :type (unsigned-byte 8))
           (protocol-major-version :initarg :protocol-major-version :accessor
            protocol-major-version :type (unsigned-byte 16))
           (protocol-minor-version :initarg :protocol-minor-version :accessor
            protocol-minor-version :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 16))
           (reason :initarg :reason :accessor reason :type cl:sequence)))
(defun encode-setup-failed (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((status (slot-value %obj 'status))
         (protocol-major-version (slot-value %obj 'protocol-major-version))
         (protocol-minor-version (slot-value %obj 'protocol-minor-version))
         (length (slot-value %obj 'length))
         (reason (slot-value %obj 'reason))
         (reason-len (cl:length reason)))
    (declare
     (ignorable status protocol-major-version protocol-minor-version length reason reason-len))
    (buffer-write-card8 %buf status)
    (buffer-write-card8 %buf reason-len)
    (buffer-write-card16 %buf protocol-major-version)
    (buffer-write-card16 %buf protocol-minor-version)
    (buffer-write-card16 %buf length)
    (buffer-write-string-octets %buf reason reason-len)))
(defun decode-setup-failed (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) status reason-len protocol-major-version protocol-minor-version length reason)
    (declare
     (ignorable %p status reason-len protocol-major-version protocol-minor-version length reason))
    (setf status (read-card8-at %buf %p))
    (setf reason-len (read-card8-at %buf (+ %p 1)))
    (setf protocol-major-version (read-card16-at %buf (+ %p 2) %order))
    (setf protocol-minor-version (read-card16-at %buf (+ %p 4) %order))
    (setf length (read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (setf reason (read-string-at %buf %p reason-len))
    (incf %p (cl:length reason))
    (cl:values
     (make-instance 'setup-failed :status status :reason-len reason-len :protocol-major-version
                    protocol-major-version :protocol-minor-version protocol-minor-version :length
                    length :reason reason)
     %p)))

;;; xcb.SetupAuthenticate
(defclass setup-authenticate nil
          ((status :initarg :status :accessor status :type (unsigned-byte 8))
           (length :initarg :length :accessor length :type (unsigned-byte 16))
           (reason :initarg :reason :accessor reason :type cl:sequence)))
(defun encode-setup-authenticate (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((status (slot-value %obj 'status))
         (length (slot-value %obj 'length))
         (reason (slot-value %obj 'reason)))
    (declare (ignorable status length reason))
    (buffer-write-card8 %buf status)
    (buffer-write-padding %buf 5)
    (buffer-write-card16 %buf length)
    (buffer-write-string-octets %buf reason (* length 4))))
(defun decode-setup-authenticate (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) status length reason)
    (declare (ignorable %p status length reason))
    (setf status (read-card8-at %buf %p))
    (setf length (read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (setf reason (read-string-at %buf %p (* length 4)))
    (incf %p (cl:length reason))
    (cl:values (make-instance 'setup-authenticate :status status :length length :reason reason)
               %p)))

;;; Enum xcb.ImageOrder
(defenum image-order
  (:lsb-first 0)
  (:msb-first 1))

;;; xcb.Setup
(defclass setup nil
          ((status :initarg :status :accessor status :type (unsigned-byte 8))
           (protocol-major-version :initarg :protocol-major-version :accessor
            protocol-major-version :type (unsigned-byte 16))
           (protocol-minor-version :initarg :protocol-minor-version :accessor
            protocol-minor-version :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 16))
           (release-number :initarg :release-number :accessor release-number :type
            (unsigned-byte 32))
           (resource-id-base :initarg :resource-id-base :accessor resource-id-base :type
            (unsigned-byte 32))
           (resource-id-mask :initarg :resource-id-mask :accessor resource-id-mask :type
            (unsigned-byte 32))
           (motion-buffer-size :initarg :motion-buffer-size :accessor motion-buffer-size :type
            (unsigned-byte 32))
           (vendor-len :initarg :vendor-len :accessor vendor-len :type (unsigned-byte 16))
           (maximum-request-length :initarg :maximum-request-length :accessor
            maximum-request-length :type (unsigned-byte 16))
           (roots-len :initarg :roots-len :accessor roots-len :type (unsigned-byte 8))
           (pixmap-formats-len :initarg :pixmap-formats-len :accessor pixmap-formats-len :type
            (unsigned-byte 8))
           (image-byte-order :initarg :image-byte-order :accessor image-byte-order :type
            (unsigned-byte 8))
           (bitmap-format-bit-order :initarg :bitmap-format-bit-order :accessor
            bitmap-format-bit-order :type (unsigned-byte 8))
           (bitmap-format-scanline-unit :initarg :bitmap-format-scanline-unit :accessor
            bitmap-format-scanline-unit :type (unsigned-byte 8))
           (bitmap-format-scanline-pad :initarg :bitmap-format-scanline-pad :accessor
            bitmap-format-scanline-pad :type (unsigned-byte 8))
           (min-keycode :initarg :min-keycode :accessor min-keycode :type keycode)
           (max-keycode :initarg :max-keycode :accessor max-keycode :type keycode)
           (vendor :initarg :vendor :accessor vendor :type cl:sequence)
           (pixmap-formats :initarg :pixmap-formats :accessor pixmap-formats :type cl:sequence)
           (roots :initarg :roots :accessor roots :type cl:sequence)))
(defun encode-setup (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((status (slot-value %obj 'status))
         (protocol-major-version (slot-value %obj 'protocol-major-version))
         (protocol-minor-version (slot-value %obj 'protocol-minor-version))
         (length (slot-value %obj 'length))
         (release-number (slot-value %obj 'release-number))
         (resource-id-base (slot-value %obj 'resource-id-base))
         (resource-id-mask (slot-value %obj 'resource-id-mask))
         (motion-buffer-size (slot-value %obj 'motion-buffer-size))
         (maximum-request-length (slot-value %obj 'maximum-request-length))
         (image-byte-order (slot-value %obj 'image-byte-order))
         (bitmap-format-bit-order (slot-value %obj 'bitmap-format-bit-order))
         (bitmap-format-scanline-unit (slot-value %obj 'bitmap-format-scanline-unit))
         (bitmap-format-scanline-pad (slot-value %obj 'bitmap-format-scanline-pad))
         (min-keycode (slot-value %obj 'min-keycode))
         (max-keycode (slot-value %obj 'max-keycode))
         (vendor (slot-value %obj 'vendor))
         (pixmap-formats (slot-value %obj 'pixmap-formats))
         (roots (slot-value %obj 'roots))
         (vendor-len (cl:length vendor))
         (pixmap-formats-len (cl:length pixmap-formats))
         (roots-len (cl:length roots)))
    (declare
     (ignorable status protocol-major-version protocol-minor-version length release-number
      resource-id-base resource-id-mask motion-buffer-size maximum-request-length image-byte-order
      bitmap-format-bit-order bitmap-format-scanline-unit bitmap-format-scanline-pad min-keycode
      max-keycode vendor pixmap-formats roots vendor-len pixmap-formats-len roots-len))
    (buffer-write-card8 %buf status)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf protocol-major-version)
    (buffer-write-card16 %buf protocol-minor-version)
    (buffer-write-card16 %buf length)
    (buffer-write-card32 %buf release-number)
    (buffer-write-card32 %buf resource-id-base)
    (buffer-write-card32 %buf resource-id-mask)
    (buffer-write-card32 %buf motion-buffer-size)
    (buffer-write-card16 %buf vendor-len)
    (buffer-write-card16 %buf maximum-request-length)
    (buffer-write-card8 %buf roots-len)
    (buffer-write-card8 %buf pixmap-formats-len)
    (buffer-write-card8 %buf image-byte-order)
    (buffer-write-card8 %buf bitmap-format-bit-order)
    (buffer-write-card8 %buf bitmap-format-scanline-unit)
    (buffer-write-card8 %buf bitmap-format-scanline-pad)
    (buffer-write-card8 %buf min-keycode)
    (buffer-write-card8 %buf max-keycode)
    (buffer-write-padding %buf 4)
    (buffer-write-string-octets %buf vendor vendor-len)
    (buffer-pad-to-align %buf 4)
    (buffer-write-list %buf pixmap-formats pixmap-formats-len #'encode-format)
    (buffer-write-list %buf roots roots-len #'encode-screen)))
(defun decode-setup (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        status
        protocol-major-version
        protocol-minor-version
        length
        release-number
        resource-id-base
        resource-id-mask
        motion-buffer-size
        vendor-len
        maximum-request-length
        roots-len
        pixmap-formats-len
        image-byte-order
        bitmap-format-bit-order
        bitmap-format-scanline-unit
        bitmap-format-scanline-pad
        min-keycode
        max-keycode
        vendor
        pixmap-formats
        roots)
    (declare
     (ignorable %p status protocol-major-version protocol-minor-version length release-number
      resource-id-base resource-id-mask motion-buffer-size vendor-len maximum-request-length
      roots-len pixmap-formats-len image-byte-order bitmap-format-bit-order
      bitmap-format-scanline-unit bitmap-format-scanline-pad min-keycode max-keycode vendor
      pixmap-formats roots))
    (setf status (read-card8-at %buf %p))
    (setf protocol-major-version (read-card16-at %buf (+ %p 2) %order))
    (setf protocol-minor-version (read-card16-at %buf (+ %p 4) %order))
    (setf length (read-card16-at %buf (+ %p 6) %order))
    (setf release-number (read-card32-at %buf (+ %p 8) %order))
    (setf resource-id-base (read-card32-at %buf (+ %p 12) %order))
    (setf resource-id-mask (read-card32-at %buf (+ %p 16) %order))
    (setf motion-buffer-size (read-card32-at %buf (+ %p 20) %order))
    (setf vendor-len (read-card16-at %buf (+ %p 24) %order))
    (setf maximum-request-length (read-card16-at %buf (+ %p 26) %order))
    (setf roots-len (read-card8-at %buf (+ %p 28)))
    (setf pixmap-formats-len (read-card8-at %buf (+ %p 29)))
    (setf image-byte-order (read-card8-at %buf (+ %p 30)))
    (setf bitmap-format-bit-order (read-card8-at %buf (+ %p 31)))
    (setf bitmap-format-scanline-unit (read-card8-at %buf (+ %p 32)))
    (setf bitmap-format-scanline-pad (read-card8-at %buf (+ %p 33)))
    (setf min-keycode (read-card8-at %buf (+ %p 34)))
    (setf max-keycode (read-card8-at %buf (+ %p 35)))
    (setf %p (+ %p 40))
    (setf vendor (read-string-at %buf %p vendor-len))
    (incf %p (cl:length vendor))
    (setf %p (align-position %p 4))
    (multiple-value-setq (pixmap-formats %p)
      (read-struct-vector-at %buf %p pixmap-formats-len %order #'decode-format))
    (multiple-value-setq (roots %p)
      (read-struct-vector-at %buf %p roots-len %order #'decode-screen))
    (cl:values
     (make-instance 'setup :status status :protocol-major-version protocol-major-version
                    :protocol-minor-version protocol-minor-version :length length :release-number
                    release-number :resource-id-base resource-id-base :resource-id-mask
                    resource-id-mask :motion-buffer-size motion-buffer-size :vendor-len vendor-len
                    :maximum-request-length maximum-request-length :roots-len roots-len
                    :pixmap-formats-len pixmap-formats-len :image-byte-order image-byte-order
                    :bitmap-format-bit-order bitmap-format-bit-order :bitmap-format-scanline-unit
                    bitmap-format-scanline-unit :bitmap-format-scanline-pad
                    bitmap-format-scanline-pad :min-keycode min-keycode :max-keycode max-keycode
                    :vendor vendor :pixmap-formats pixmap-formats :roots roots)
     %p)))

;;; Enum xcb.ModMask
(defenum mod-mask
  (:shift 1)
  (:lock 2)
  (:control 4)
  (:n1 8)
  (:n2 16)
  (:n3 32)
  (:n4 64)
  (:n5 128)
  (:any 32768))

;;; Enum xcb.KeyButMask
(defenum key-but-mask
  (:shift 1)
  (:lock 2)
  (:control 4)
  (:mod1 8)
  (:mod2 16)
  (:mod3 32)
  (:mod4 64)
  (:mod5 128)
  (:button1 256)
  (:button2 512)
  (:button3 1024)
  (:button4 2048)
  (:button5 4096))

;;; Enum xcb.Window
(defenum window
  (:none 0))

;;; Event xcb.KeyPress (2)
(defclass key-press (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type keycode)
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a key was pressed/released"))
(defun decode-key-press (%buf %pos %order &optional (%class 'key-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        detail
        sequence
        time
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        state
        same-screen)
    (declare
     (ignorable %p response-type detail sequence time root event child root-x root-y event-x
      event-y state same-screen))
    (setf response-type (read-card8-at %buf %p))
    (setf detail (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf event (read-card32-at %buf (+ %p 12) %order))
    (setf child (read-card32-at %buf (+ %p 16) %order))
    (setf root-x (read-int16-at %buf (+ %p 20) %order))
    (setf root-y (read-int16-at %buf (+ %p 22) %order))
    (setf event-x (read-int16-at %buf (+ %p 24) %order))
    (setf event-y (read-int16-at %buf (+ %p 26) %order))
    (setf state (read-card16-at %buf (+ %p 28) %order))
    (setf same-screen (read-card8-at %buf (+ %p 30)))
    (cl:values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :time
                    time :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :state state :same-screen same-screen)
     (+ %pos 32))))
(defun encode-key-press (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (event (slot-value %obj 'event))
         (child (slot-value %obj 'child))
         (root-x (slot-value %obj 'root-x))
         (root-y (slot-value %obj 'root-y))
         (event-x (slot-value %obj 'event-x))
         (event-y (slot-value %obj 'event-y))
         (state (slot-value %obj 'state))
         (same-screen (slot-value %obj 'same-screen)))
    (declare
     (ignorable response-type detail sequence time root event child root-x root-y event-x event-y
      state same-screen))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf detail)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf root)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf child)
    (buffer-write-card16 %buf root-x)
    (buffer-write-card16 %buf root-y)
    (buffer-write-card16 %buf event-x)
    (buffer-write-card16 %buf event-y)
    (buffer-write-card16 %buf state)
    (buffer-write-bool %buf same-screen)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj key-press)) (encode-key-press %buf %obj))
(register-event-decoder 2 #'decode-key-press)

;;; Event xcb.KeyRelease (3)
(defclass key-release (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type keycode)
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a key was pressed/released"))
(defun decode-key-release (%buf %pos %order) (decode-key-press %buf %pos %order 'key-release))
(defmethod encode-event (%buf (%obj key-release)) (encode-key-press %buf %obj))
(register-event-decoder 3 #'decode-key-release)

;;; Enum xcb.ButtonMask
(defenum button-mask
  (:n1 256)
  (:n2 512)
  (:n3 1024)
  (:n4 2048)
  (:n5 4096)
  (:any 32768))

;;; Event xcb.ButtonPress (4)
(defclass button-press (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type button)
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a mouse button was pressed/released"))
(defun decode-button-press (%buf %pos %order &optional (%class 'button-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        detail
        sequence
        time
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        state
        same-screen)
    (declare
     (ignorable %p response-type detail sequence time root event child root-x root-y event-x
      event-y state same-screen))
    (setf response-type (read-card8-at %buf %p))
    (setf detail (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf event (read-card32-at %buf (+ %p 12) %order))
    (setf child (read-card32-at %buf (+ %p 16) %order))
    (setf root-x (read-int16-at %buf (+ %p 20) %order))
    (setf root-y (read-int16-at %buf (+ %p 22) %order))
    (setf event-x (read-int16-at %buf (+ %p 24) %order))
    (setf event-y (read-int16-at %buf (+ %p 26) %order))
    (setf state (read-card16-at %buf (+ %p 28) %order))
    (setf same-screen (read-card8-at %buf (+ %p 30)))
    (cl:values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :time
                    time :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :state state :same-screen same-screen)
     (+ %pos 32))))
(defun encode-button-press (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (event (slot-value %obj 'event))
         (child (slot-value %obj 'child))
         (root-x (slot-value %obj 'root-x))
         (root-y (slot-value %obj 'root-y))
         (event-x (slot-value %obj 'event-x))
         (event-y (slot-value %obj 'event-y))
         (state (slot-value %obj 'state))
         (same-screen (slot-value %obj 'same-screen)))
    (declare
     (ignorable response-type detail sequence time root event child root-x root-y event-x event-y
      state same-screen))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf detail)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf root)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf child)
    (buffer-write-card16 %buf root-x)
    (buffer-write-card16 %buf root-y)
    (buffer-write-card16 %buf event-x)
    (buffer-write-card16 %buf event-y)
    (buffer-write-card16 %buf state)
    (buffer-write-bool %buf same-screen)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj button-press)) (encode-button-press %buf %obj))
(register-event-decoder 4 #'decode-button-press)

;;; Event xcb.ButtonRelease (5)
(defclass button-release (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type button)
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a mouse button was pressed/released"))
(defun decode-button-release (%buf %pos %order)
  (decode-button-press %buf %pos %order 'button-release))
(defmethod encode-event (%buf (%obj button-release)) (encode-button-press %buf %obj))
(register-event-decoder 5 #'decode-button-release)

;;; Enum xcb.Motion
(defenum motion
  (:normal 0)
  (:hint 1))

;;; Event xcb.MotionNotify (6)
(defclass motion-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a key was pressed"))
(defun decode-motion-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        detail
        sequence
        time
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        state
        same-screen)
    (declare
     (ignorable %p response-type detail sequence time root event child root-x root-y event-x
      event-y state same-screen))
    (setf response-type (read-card8-at %buf %p))
    (setf detail (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf event (read-card32-at %buf (+ %p 12) %order))
    (setf child (read-card32-at %buf (+ %p 16) %order))
    (setf root-x (read-int16-at %buf (+ %p 20) %order))
    (setf root-y (read-int16-at %buf (+ %p 22) %order))
    (setf event-x (read-int16-at %buf (+ %p 24) %order))
    (setf event-y (read-int16-at %buf (+ %p 26) %order))
    (setf state (read-card16-at %buf (+ %p 28) %order))
    (setf same-screen (read-card8-at %buf (+ %p 30)))
    (cl:values
     (make-instance 'motion-notify :response-type response-type :detail detail :sequence sequence
                    :time time :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :state state :same-screen same-screen)
     (+ %pos 32))))
(defun encode-motion-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (event (slot-value %obj 'event))
         (child (slot-value %obj 'child))
         (root-x (slot-value %obj 'root-x))
         (root-y (slot-value %obj 'root-y))
         (event-x (slot-value %obj 'event-x))
         (event-y (slot-value %obj 'event-y))
         (state (slot-value %obj 'state))
         (same-screen (slot-value %obj 'same-screen)))
    (declare
     (ignorable response-type detail sequence time root event child root-x root-y event-x event-y
      state same-screen))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf detail)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf root)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf child)
    (buffer-write-card16 %buf root-x)
    (buffer-write-card16 %buf root-y)
    (buffer-write-card16 %buf event-x)
    (buffer-write-card16 %buf event-y)
    (buffer-write-card16 %buf state)
    (buffer-write-bool %buf same-screen)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj motion-notify)) (encode-motion-notify %buf %obj))
(register-event-decoder 6 #'decode-motion-notify)

;;; Enum xcb.NotifyDetail
(defenum notify-detail
  (:ancestor 0)
  (:virtual 1)
  (:inferior 2)
  (:nonlinear 3)
  (:nonlinear-virtual 4)
  (:pointer 5)
  (:pointer-root 6)
  (:none 7))

;;; Enum xcb.NotifyMode
(defenum notify-mode
  (:normal 0)
  (:grab 1)
  (:ungrab 2)
  (:while-grabbed 3))

;;; Event xcb.EnterNotify (7)
(defclass enter-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (same-screen-focus :initarg :same-screen-focus :accessor same-screen-focus :type
            (unsigned-byte 8)))
          (:documentation "the pointer is in a different window"))
(defun decode-enter-notify (%buf %pos %order &optional (%class 'enter-notify))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        detail
        sequence
        time
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        state
        mode
        same-screen-focus)
    (declare
     (ignorable %p response-type detail sequence time root event child root-x root-y event-x
      event-y state mode same-screen-focus))
    (setf response-type (read-card8-at %buf %p))
    (setf detail (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf event (read-card32-at %buf (+ %p 12) %order))
    (setf child (read-card32-at %buf (+ %p 16) %order))
    (setf root-x (read-int16-at %buf (+ %p 20) %order))
    (setf root-y (read-int16-at %buf (+ %p 22) %order))
    (setf event-x (read-int16-at %buf (+ %p 24) %order))
    (setf event-y (read-int16-at %buf (+ %p 26) %order))
    (setf state (read-card16-at %buf (+ %p 28) %order))
    (setf mode (read-card8-at %buf (+ %p 30)))
    (setf same-screen-focus (read-card8-at %buf (+ %p 31)))
    (cl:values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :time
                    time :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :state state :mode mode :same-screen-focus
                    same-screen-focus)
     (+ %pos 32))))
(defun encode-enter-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (event (slot-value %obj 'event))
         (child (slot-value %obj 'child))
         (root-x (slot-value %obj 'root-x))
         (root-y (slot-value %obj 'root-y))
         (event-x (slot-value %obj 'event-x))
         (event-y (slot-value %obj 'event-y))
         (state (slot-value %obj 'state))
         (mode (slot-value %obj 'mode))
         (same-screen-focus (slot-value %obj 'same-screen-focus)))
    (declare
     (ignorable response-type detail sequence time root event child root-x root-y event-x event-y
      state mode same-screen-focus))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf detail)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf root)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf child)
    (buffer-write-card16 %buf root-x)
    (buffer-write-card16 %buf root-y)
    (buffer-write-card16 %buf event-x)
    (buffer-write-card16 %buf event-y)
    (buffer-write-card16 %buf state)
    (buffer-write-card8 %buf mode)
    (buffer-write-card8 %buf same-screen-focus)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj enter-notify)) (encode-enter-notify %buf %obj))
(register-event-decoder 7 #'decode-enter-notify)

;;; Event xcb.LeaveNotify (8)
(defclass leave-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (root :initarg :root :accessor root :type window)
           (event :initarg :event :accessor event :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (same-screen-focus :initarg :same-screen-focus :accessor same-screen-focus :type
            (unsigned-byte 8)))
          (:documentation "the pointer is in a different window"))
(defun decode-leave-notify (%buf %pos %order) (decode-enter-notify %buf %pos %order 'leave-notify))
(defmethod encode-event (%buf (%obj leave-notify)) (encode-enter-notify %buf %obj))
(register-event-decoder 8 #'decode-leave-notify)

;;; Event xcb.FocusIn (9)
(defclass focus-in (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8)))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-focus-in (%buf %pos %order &optional (%class 'focus-in))
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type detail sequence event mode)
    (declare (ignorable %p response-type detail sequence event mode))
    (setf response-type (read-card8-at %buf %p))
    (setf detail (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf mode (read-card8-at %buf (+ %p 8)))
    (cl:values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :event
                    event :mode mode)
     (+ %pos 32))))
(defun encode-focus-in (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (mode (slot-value %obj 'mode)))
    (declare (ignorable response-type detail sequence event mode))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf detail)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card8 %buf mode)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj focus-in)) (encode-focus-in %buf %obj))
(register-event-decoder 9 #'decode-focus-in)

;;; Event xcb.FocusOut (10)
(defclass focus-out (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8)))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-focus-out (%buf %pos %order) (decode-focus-in %buf %pos %order 'focus-out))
(defmethod encode-event (%buf (%obj focus-out)) (encode-focus-in %buf %obj))
(register-event-decoder 10 #'decode-focus-out)

;;; Event xcb.KeymapNotify (11)
(defclass keymap-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun decode-keymap-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type keys)
    (declare (ignorable %p response-type keys))
    (setf response-type (read-card8-at %buf %p))
    (setf keys (read-vector-at %buf (+ %p 1) 31 %order :card8))
    (cl:values (make-instance 'keymap-notify :response-type response-type :keys keys) (+ %pos 32))))
(defun encode-keymap-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (keys (slot-value %obj 'keys)))
    (declare (ignorable response-type keys))
    (buffer-write-card8 %buf response-type)
    (buffer-write-fixed-list %buf keys 31 #'buffer-write-card8 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj keymap-notify)) (encode-keymap-notify %buf %obj))
(register-event-decoder 11 #'decode-keymap-notify)

;;; Event xcb.Expose (12)
(defclass expose (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (x :initarg :x :accessor x :type (unsigned-byte 16))
           (y :initarg :y :accessor y :type (unsigned-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (count :initarg :count :accessor count :type (unsigned-byte 16)))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-expose (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence window x y width height count)
    (declare (ignorable %p response-type sequence window x y width height count))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf x (read-card16-at %buf (+ %p 8) %order))
    (setf y (read-card16-at %buf (+ %p 10) %order))
    (setf width (read-card16-at %buf (+ %p 12) %order))
    (setf height (read-card16-at %buf (+ %p 14) %order))
    (setf count (read-card16-at %buf (+ %p 16) %order))
    (cl:values
     (make-instance 'expose :response-type response-type :sequence sequence :window window :x x :y
                    y :width width :height height :count count)
     (+ %pos 32))))
(defun encode-expose (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (count (slot-value %obj 'count)))
    (declare (ignorable response-type sequence window x y width height count))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf count)
    (buffer-write-padding %buf 2)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj expose)) (encode-expose %buf %obj))
(register-event-decoder 12 #'decode-expose)

;;; Event xcb.GraphicsExposure (13)
(defclass graphics-exposure (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (drawable :initarg :drawable :accessor drawable :type drawable)
           (x :initarg :x :accessor x :type (unsigned-byte 16))
           (y :initarg :y :accessor y :type (unsigned-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (count :initarg :count :accessor count :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-graphics-exposure (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence drawable x y width height minor-opcode count major-opcode)
    (declare
     (ignorable %p response-type sequence drawable x y width height minor-opcode count
      major-opcode))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf drawable (read-card32-at %buf (+ %p 4) %order))
    (setf x (read-card16-at %buf (+ %p 8) %order))
    (setf y (read-card16-at %buf (+ %p 10) %order))
    (setf width (read-card16-at %buf (+ %p 12) %order))
    (setf height (read-card16-at %buf (+ %p 14) %order))
    (setf minor-opcode (read-card16-at %buf (+ %p 16) %order))
    (setf count (read-card16-at %buf (+ %p 18) %order))
    (setf major-opcode (read-card8-at %buf (+ %p 20)))
    (cl:values
     (make-instance 'graphics-exposure :response-type response-type :sequence sequence :drawable
                    drawable :x x :y y :width width :height height :minor-opcode minor-opcode
                    :count count :major-opcode major-opcode)
     (+ %pos 32))))
(defun encode-graphics-exposure (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (drawable (slot-value %obj 'drawable))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (minor-opcode (slot-value %obj 'minor-opcode))
         (count (slot-value %obj 'count))
         (major-opcode (slot-value %obj 'major-opcode)))
    (declare
     (ignorable response-type sequence drawable x y width height minor-opcode count major-opcode))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf minor-opcode)
    (buffer-write-card16 %buf count)
    (buffer-write-card8 %buf major-opcode)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj graphics-exposure)) (encode-graphics-exposure %buf %obj))
(register-event-decoder 13 #'decode-graphics-exposure)

;;; Event xcb.NoExposure (14)
(defclass no-exposure (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (drawable :initarg :drawable :accessor drawable :type drawable)
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-no-exposure (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence drawable minor-opcode major-opcode)
    (declare (ignorable %p response-type sequence drawable minor-opcode major-opcode))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf drawable (read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'no-exposure :response-type response-type :sequence sequence :drawable drawable
                    :minor-opcode minor-opcode :major-opcode major-opcode)
     (+ %pos 32))))
(defun encode-no-exposure (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (drawable (slot-value %obj 'drawable))
         (minor-opcode (slot-value %obj 'minor-opcode))
         (major-opcode (slot-value %obj 'major-opcode)))
    (declare (ignorable response-type sequence drawable minor-opcode major-opcode))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card16 %buf minor-opcode)
    (buffer-write-card8 %buf major-opcode)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj no-exposure)) (encode-no-exposure %buf %obj))
(register-event-decoder 14 #'decode-no-exposure)

;;; Enum xcb.Visibility
(defenum visibility
  (:unobscured 0)
  (:partially-obscured 1)
  (:fully-obscured 2))

;;; Event xcb.VisibilityNotify (15)
(defclass visibility-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (state :initarg :state :accessor state :type (unsigned-byte 8))))
(defun decode-visibility-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence window state)
    (declare (ignorable %p response-type sequence window state))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf state (read-card8-at %buf (+ %p 8)))
    (cl:values
     (make-instance 'visibility-notify :response-type response-type :sequence sequence :window
                    window :state state)
     (+ %pos 32))))
(defun encode-visibility-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (state (slot-value %obj 'state)))
    (declare (ignorable response-type sequence window state))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card8 %buf state)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj visibility-notify)) (encode-visibility-notify %buf %obj))
(register-event-decoder 15 #'decode-visibility-notify)

;;; Event xcb.CreateNotify (16)
(defclass create-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (parent :initarg :parent :accessor parent :type window)
           (window :initarg :window :accessor window :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (border-width :initarg :border-width :accessor border-width :type (unsigned-byte 16))
           (override-redirect :initarg :override-redirect :accessor override-redirect :type
            (or boolean (unsigned-byte 8)))))
(defun decode-create-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        parent
        window
        x
        y
        width
        height
        border-width
        override-redirect)
    (declare
     (ignorable %p response-type sequence parent window x y width height border-width
      override-redirect))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf parent (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf x (read-int16-at %buf (+ %p 12) %order))
    (setf y (read-int16-at %buf (+ %p 14) %order))
    (setf width (read-card16-at %buf (+ %p 16) %order))
    (setf height (read-card16-at %buf (+ %p 18) %order))
    (setf border-width (read-card16-at %buf (+ %p 20) %order))
    (setf override-redirect (read-card8-at %buf (+ %p 22)))
    (cl:values
     (make-instance 'create-notify :response-type response-type :sequence sequence :parent parent
                    :window window :x x :y y :width width :height height :border-width border-width
                    :override-redirect override-redirect)
     (+ %pos 32))))
(defun encode-create-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (parent (slot-value %obj 'parent))
         (window (slot-value %obj 'window))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (border-width (slot-value %obj 'border-width))
         (override-redirect (slot-value %obj 'override-redirect)))
    (declare
     (ignorable response-type sequence parent window x y width height border-width
      override-redirect))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf parent)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf border-width)
    (buffer-write-bool %buf override-redirect)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj create-notify)) (encode-create-notify %buf %obj))
(register-event-decoder 16 #'decode-create-notify)

;;; Event xcb.DestroyNotify (17)
(defclass destroy-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window))
          (:documentation "a window is destroyed"))
(defun decode-destroy-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window)
    (declare (ignorable %p response-type sequence event window))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'destroy-notify :response-type response-type :sequence sequence :event event
                    :window window)
     (+ %pos 32))))
(defun encode-destroy-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window)))
    (declare (ignorable response-type sequence event window))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj destroy-notify)) (encode-destroy-notify %buf %obj))
(register-event-decoder 17 #'decode-destroy-notify)

;;; Event xcb.UnmapNotify (18)
(defclass unmap-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (from-configure :initarg :from-configure :accessor from-configure :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a window is unmapped"))
(defun decode-unmap-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window from-configure)
    (declare (ignorable %p response-type sequence event window from-configure))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf from-configure (read-card8-at %buf (+ %p 12)))
    (cl:values
     (make-instance 'unmap-notify :response-type response-type :sequence sequence :event event
                    :window window :from-configure from-configure)
     (+ %pos 32))))
(defun encode-unmap-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (from-configure (slot-value %obj 'from-configure)))
    (declare (ignorable response-type sequence event window from-configure))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-bool %buf from-configure)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj unmap-notify)) (encode-unmap-notify %buf %obj))
(register-event-decoder 18 #'decode-unmap-notify)

;;; Event xcb.MapNotify (19)
(defclass map-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (override-redirect :initarg :override-redirect :accessor override-redirect :type
            (or boolean (unsigned-byte 8))))
          (:documentation "a window was mapped"))
(defun decode-map-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window override-redirect)
    (declare (ignorable %p response-type sequence event window override-redirect))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf override-redirect (read-card8-at %buf (+ %p 12)))
    (cl:values
     (make-instance 'map-notify :response-type response-type :sequence sequence :event event
                    :window window :override-redirect override-redirect)
     (+ %pos 32))))
(defun encode-map-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (override-redirect (slot-value %obj 'override-redirect)))
    (declare (ignorable response-type sequence event window override-redirect))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-bool %buf override-redirect)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj map-notify)) (encode-map-notify %buf %obj))
(register-event-decoder 19 #'decode-map-notify)

;;; Event xcb.MapRequest (20)
(defclass map-request (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (parent :initarg :parent :accessor parent :type window)
           (window :initarg :window :accessor window :type window))
          (:documentation "window wants to be mapped"))
(defun decode-map-request (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence parent window)
    (declare (ignorable %p response-type sequence parent window))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf parent (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'map-request :response-type response-type :sequence sequence :parent parent
                    :window window)
     (+ %pos 32))))
(defun encode-map-request (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (parent (slot-value %obj 'parent))
         (window (slot-value %obj 'window)))
    (declare (ignorable response-type sequence parent window))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf parent)
    (buffer-write-card32 %buf window)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj map-request)) (encode-map-request %buf %obj))
(register-event-decoder 20 #'decode-map-request)

;;; Event xcb.ReparentNotify (21)
(defclass reparent-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (parent :initarg :parent :accessor parent :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (override-redirect :initarg :override-redirect :accessor override-redirect :type
            (or boolean (unsigned-byte 8)))))
(defun decode-reparent-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window parent x y override-redirect)
    (declare (ignorable %p response-type sequence event window parent x y override-redirect))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf parent (read-card32-at %buf (+ %p 12) %order))
    (setf x (read-int16-at %buf (+ %p 16) %order))
    (setf y (read-int16-at %buf (+ %p 18) %order))
    (setf override-redirect (read-card8-at %buf (+ %p 20)))
    (cl:values
     (make-instance 'reparent-notify :response-type response-type :sequence sequence :event event
                    :window window :parent parent :x x :y y :override-redirect override-redirect)
     (+ %pos 32))))
(defun encode-reparent-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (parent (slot-value %obj 'parent))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (override-redirect (slot-value %obj 'override-redirect)))
    (declare (ignorable response-type sequence event window parent x y override-redirect))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf parent)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-bool %buf override-redirect)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj reparent-notify)) (encode-reparent-notify %buf %obj))
(register-event-decoder 21 #'decode-reparent-notify)

;;; Event xcb.ConfigureNotify (22)
(defclass configure-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (above-sibling :initarg :above-sibling :accessor above-sibling :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (border-width :initarg :border-width :accessor border-width :type (unsigned-byte 16))
           (override-redirect :initarg :override-redirect :accessor override-redirect :type
            (or boolean (unsigned-byte 8))))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-configure-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        event
        window
        above-sibling
        x
        y
        width
        height
        border-width
        override-redirect)
    (declare
     (ignorable %p response-type sequence event window above-sibling x y width height border-width
      override-redirect))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf above-sibling (read-card32-at %buf (+ %p 12) %order))
    (setf x (read-int16-at %buf (+ %p 16) %order))
    (setf y (read-int16-at %buf (+ %p 18) %order))
    (setf width (read-card16-at %buf (+ %p 20) %order))
    (setf height (read-card16-at %buf (+ %p 22) %order))
    (setf border-width (read-card16-at %buf (+ %p 24) %order))
    (setf override-redirect (read-card8-at %buf (+ %p 26)))
    (cl:values
     (make-instance 'configure-notify :response-type response-type :sequence sequence :event event
                    :window window :above-sibling above-sibling :x x :y y :width width :height
                    height :border-width border-width :override-redirect override-redirect)
     (+ %pos 32))))
(defun encode-configure-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (above-sibling (slot-value %obj 'above-sibling))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (border-width (slot-value %obj 'border-width))
         (override-redirect (slot-value %obj 'override-redirect)))
    (declare
     (ignorable response-type sequence event window above-sibling x y width height border-width
      override-redirect))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf above-sibling)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf border-width)
    (buffer-write-bool %buf override-redirect)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj configure-notify)) (encode-configure-notify %buf %obj))
(register-event-decoder 22 #'decode-configure-notify)

;;; Event xcb.ConfigureRequest (23)
(defclass configure-request (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (stack-mode :initarg :stack-mode :accessor stack-mode :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (parent :initarg :parent :accessor parent :type window)
           (window :initarg :window :accessor window :type window)
           (sibling :initarg :sibling :accessor sibling :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (border-width :initarg :border-width :accessor border-width :type (unsigned-byte 16))
           (value-mask :initarg :value-mask :accessor value-mask :type (unsigned-byte 16))))
(defun decode-configure-request (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        stack-mode
        sequence
        parent
        window
        sibling
        x
        y
        width
        height
        border-width
        value-mask)
    (declare
     (ignorable %p response-type stack-mode sequence parent window sibling x y width height
      border-width value-mask))
    (setf response-type (read-card8-at %buf %p))
    (setf stack-mode (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf parent (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf sibling (read-card32-at %buf (+ %p 12) %order))
    (setf x (read-int16-at %buf (+ %p 16) %order))
    (setf y (read-int16-at %buf (+ %p 18) %order))
    (setf width (read-card16-at %buf (+ %p 20) %order))
    (setf height (read-card16-at %buf (+ %p 22) %order))
    (setf border-width (read-card16-at %buf (+ %p 24) %order))
    (setf value-mask (read-card16-at %buf (+ %p 26) %order))
    (cl:values
     (make-instance 'configure-request :response-type response-type :stack-mode stack-mode
                    :sequence sequence :parent parent :window window :sibling sibling :x x :y y
                    :width width :height height :border-width border-width :value-mask value-mask)
     (+ %pos 32))))
(defun encode-configure-request (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (stack-mode (slot-value %obj 'stack-mode))
         (sequence (slot-value %obj 'sequence))
         (parent (slot-value %obj 'parent))
         (window (slot-value %obj 'window))
         (sibling (slot-value %obj 'sibling))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (border-width (slot-value %obj 'border-width))
         (value-mask (slot-value %obj 'value-mask)))
    (declare
     (ignorable response-type stack-mode sequence parent window sibling x y width height
      border-width value-mask))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf stack-mode)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf parent)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf sibling)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf border-width)
    (buffer-write-card16 %buf value-mask)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj configure-request)) (encode-configure-request %buf %obj))
(register-event-decoder 23 #'decode-configure-request)

;;; Event xcb.GravityNotify (24)
(defclass gravity-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))))
(defun decode-gravity-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window x y)
    (declare (ignorable %p response-type sequence event window x y))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf x (read-int16-at %buf (+ %p 12) %order))
    (setf y (read-int16-at %buf (+ %p 14) %order))
    (cl:values
     (make-instance 'gravity-notify :response-type response-type :sequence sequence :event event
                    :window window :x x :y y)
     (+ %pos 32))))
(defun encode-gravity-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y)))
    (declare (ignorable response-type sequence event window x y))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj gravity-notify)) (encode-gravity-notify %buf %obj))
(register-event-decoder 24 #'decode-gravity-notify)

;;; Event xcb.ResizeRequest (25)
(defclass resize-request (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))))
(defun decode-resize-request (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence window width height)
    (declare (ignorable %p response-type sequence window width height))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf width (read-card16-at %buf (+ %p 8) %order))
    (setf height (read-card16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'resize-request :response-type response-type :sequence sequence :window window
                    :width width :height height)
     (+ %pos 32))))
(defun encode-resize-request (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height)))
    (declare (ignorable response-type sequence window width height))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj resize-request)) (encode-resize-request %buf %obj))
(register-event-decoder 25 #'decode-resize-request)

;;; Enum xcb.Place
(defenum place
  (:on-top 0)
  (:on-bottom 1))

;;; Event xcb.CirculateNotify (26)
(defclass circulate-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (place :initarg :place :accessor place :type (unsigned-byte 8)))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-circulate-notify (%buf %pos %order &optional (%class 'circulate-notify))
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence event window place)
    (declare (ignorable %p response-type sequence event window place))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf event (read-card32-at %buf (+ %p 4) %order))
    (setf window (read-card32-at %buf (+ %p 8) %order))
    (setf place (read-card8-at %buf (+ %p 16)))
    (cl:values
     (make-instance %class :response-type response-type :sequence sequence :event event :window
                    window :place place)
     (+ %pos 32))))
(defun encode-circulate-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (event (slot-value %obj 'event))
         (window (slot-value %obj 'window))
         (place (slot-value %obj 'place)))
    (declare (ignorable response-type sequence event window place))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf event)
    (buffer-write-card32 %buf window)
    (buffer-write-padding %buf 4)
    (buffer-write-card8 %buf place)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj circulate-notify)) (encode-circulate-notify %buf %obj))
(register-event-decoder 26 #'decode-circulate-notify)

;;; Event xcb.CirculateRequest (27)
(defclass circulate-request (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (event :initarg :event :accessor event :type window)
           (window :initarg :window :accessor window :type window)
           (place :initarg :place :accessor place :type (unsigned-byte 8)))
          (:documentation "NOT YET DOCUMENTED"))
(defun decode-circulate-request (%buf %pos %order)
  (decode-circulate-notify %buf %pos %order 'circulate-request))
(defmethod encode-event (%buf (%obj circulate-request)) (encode-circulate-notify %buf %obj))
(register-event-decoder 27 #'decode-circulate-request)

;;; Enum xcb.Property
(defenum property
  (:new-value 0)
  (:delete 1))

;;; Event xcb.PropertyNotify (28)
(defclass property-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (atom :initarg :atom :accessor atom :type atom)
           (time :initarg :time :accessor time :type timestamp)
           (state :initarg :state :accessor state :type (unsigned-byte 8)))
          (:documentation "a window property changed"))
(defun decode-property-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence window atom time state)
    (declare (ignorable %p response-type sequence window atom time state))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf atom (read-card32-at %buf (+ %p 8) %order))
    (setf time (read-card32-at %buf (+ %p 12) %order))
    (setf state (read-card8-at %buf (+ %p 16)))
    (cl:values
     (make-instance 'property-notify :response-type response-type :sequence sequence :window window
                    :atom atom :time time :state state)
     (+ %pos 32))))
(defun encode-property-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (atom (slot-value %obj 'atom))
         (time (slot-value %obj 'time))
         (state (slot-value %obj 'state)))
    (declare (ignorable response-type sequence window atom time state))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf atom)
    (buffer-write-card32 %buf time)
    (buffer-write-card8 %buf state)
    (buffer-write-padding %buf 3)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj property-notify)) (encode-property-notify %buf %obj))
(register-event-decoder 28 #'decode-property-notify)

;;; Event xcb.SelectionClear (29)
(defclass selection-clear (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (owner :initarg :owner :accessor owner :type window)
           (selection :initarg :selection :accessor selection :type atom)))
(defun decode-selection-clear (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence time owner selection)
    (declare (ignorable %p response-type sequence time owner selection))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf owner (read-card32-at %buf (+ %p 8) %order))
    (setf selection (read-card32-at %buf (+ %p 12) %order))
    (cl:values
     (make-instance 'selection-clear :response-type response-type :sequence sequence :time time
                    :owner owner :selection selection)
     (+ %pos 32))))
(defun encode-selection-clear (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (owner (slot-value %obj 'owner))
         (selection (slot-value %obj 'selection)))
    (declare (ignorable response-type sequence time owner selection))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf owner)
    (buffer-write-card32 %buf selection)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj selection-clear)) (encode-selection-clear %buf %obj))
(register-event-decoder 29 #'decode-selection-clear)

;;; Enum xcb.Time
(defenum time
  (:current-time 0))

;;; Enum xcb.Atom
(defenum atom
  (:none 0)
  (:any 0)
  (:primary 1)
  (:secondary 2)
  (:arc 3)
  (:atom 4)
  (:bitmap 5)
  (:cardinal 6)
  (:colormap 7)
  (:cursor 8)
  (:cut-buffer0 9)
  (:cut-buffer1 10)
  (:cut-buffer2 11)
  (:cut-buffer3 12)
  (:cut-buffer4 13)
  (:cut-buffer5 14)
  (:cut-buffer6 15)
  (:cut-buffer7 16)
  (:drawable 17)
  (:font 18)
  (:integer 19)
  (:pixmap 20)
  (:point 21)
  (:rectangle 22)
  (:resource-manager 23)
  (:rgb-color-map 24)
  (:rgb-best-map 25)
  (:rgb-blue-map 26)
  (:rgb-default-map 27)
  (:rgb-gray-map 28)
  (:rgb-green-map 29)
  (:rgb-red-map 30)
  (:string 31)
  (:visualid 32)
  (:window 33)
  (:wm-command 34)
  (:wm-hints 35)
  (:wm-client-machine 36)
  (:wm-icon-name 37)
  (:wm-icon-size 38)
  (:wm-name 39)
  (:wm-normal-hints 40)
  (:wm-size-hints 41)
  (:wm-zoom-hints 42)
  (:min-space 43)
  (:norm-space 44)
  (:max-space 45)
  (:end-space 46)
  (:superscript-x 47)
  (:superscript-y 48)
  (:subscript-x 49)
  (:subscript-y 50)
  (:underline-position 51)
  (:underline-thickness 52)
  (:strikeout-ascent 53)
  (:strikeout-descent 54)
  (:italic-angle 55)
  (:x-height 56)
  (:quad-width 57)
  (:weight 58)
  (:point-size 59)
  (:resolution 60)
  (:copyright 61)
  (:notice 62)
  (:font-name 63)
  (:family-name 64)
  (:full-name 65)
  (:cap-height 66)
  (:wm-class 67)
  (:wm-transient-for 68))

;;; Event xcb.SelectionRequest (30)
(defclass selection-request (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (owner :initarg :owner :accessor owner :type window)
           (requestor :initarg :requestor :accessor requestor :type window)
           (selection :initarg :selection :accessor selection :type atom)
           (target :initarg :target :accessor target :type atom)
           (property :initarg :property :accessor property :type atom)))
(defun decode-selection-request (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence time owner requestor selection target property)
    (declare (ignorable %p response-type sequence time owner requestor selection target property))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf owner (read-card32-at %buf (+ %p 8) %order))
    (setf requestor (read-card32-at %buf (+ %p 12) %order))
    (setf selection (read-card32-at %buf (+ %p 16) %order))
    (setf target (read-card32-at %buf (+ %p 20) %order))
    (setf property (read-card32-at %buf (+ %p 24) %order))
    (cl:values
     (make-instance 'selection-request :response-type response-type :sequence sequence :time time
                    :owner owner :requestor requestor :selection selection :target target :property
                    property)
     (+ %pos 32))))
(defun encode-selection-request (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (owner (slot-value %obj 'owner))
         (requestor (slot-value %obj 'requestor))
         (selection (slot-value %obj 'selection))
         (target (slot-value %obj 'target))
         (property (slot-value %obj 'property)))
    (declare (ignorable response-type sequence time owner requestor selection target property))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf owner)
    (buffer-write-card32 %buf requestor)
    (buffer-write-card32 %buf selection)
    (buffer-write-card32 %buf target)
    (buffer-write-card32 %buf property)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj selection-request)) (encode-selection-request %buf %obj))
(register-event-decoder 30 #'decode-selection-request)

;;; Event xcb.SelectionNotify (31)
(defclass selection-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type timestamp)
           (requestor :initarg :requestor :accessor requestor :type window)
           (selection :initarg :selection :accessor selection :type atom)
           (target :initarg :target :accessor target :type atom)
           (property :initarg :property :accessor property :type atom)))
(defun decode-selection-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence time requestor selection target property)
    (declare (ignorable %p response-type sequence time requestor selection target property))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf time (read-card32-at %buf (+ %p 4) %order))
    (setf requestor (read-card32-at %buf (+ %p 8) %order))
    (setf selection (read-card32-at %buf (+ %p 12) %order))
    (setf target (read-card32-at %buf (+ %p 16) %order))
    (setf property (read-card32-at %buf (+ %p 20) %order))
    (cl:values
     (make-instance 'selection-notify :response-type response-type :sequence sequence :time time
                    :requestor requestor :selection selection :target target :property property)
     (+ %pos 32))))
(defun encode-selection-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (requestor (slot-value %obj 'requestor))
         (selection (slot-value %obj 'selection))
         (target (slot-value %obj 'target))
         (property (slot-value %obj 'property)))
    (declare (ignorable response-type sequence time requestor selection target property))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf time)
    (buffer-write-card32 %buf requestor)
    (buffer-write-card32 %buf selection)
    (buffer-write-card32 %buf target)
    (buffer-write-card32 %buf property)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj selection-notify)) (encode-selection-notify %buf %obj))
(register-event-decoder 31 #'decode-selection-notify)

;;; Enum xcb.ColormapState
(defenum colormap-state
  (:uninstalled 0)
  (:installed 1))

;;; Enum xcb.Colormap
(defenum colormap
  (:none 0))

;;; Event xcb.ColormapNotify (32)
(defclass colormap-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (colormap :initarg :colormap :accessor colormap :type colormap)
           (new :initarg :new :accessor new :type (or boolean (unsigned-byte 8)))
           (state :initarg :state :accessor state :type (unsigned-byte 8)))
          (:documentation "the colormap for some window changed"))
(defun decode-colormap-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence window colormap new state)
    (declare (ignorable %p response-type sequence window colormap new state))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf colormap (read-card32-at %buf (+ %p 8) %order))
    (setf new (read-card8-at %buf (+ %p 12)))
    (setf state (read-card8-at %buf (+ %p 13)))
    (cl:values
     (make-instance 'colormap-notify :response-type response-type :sequence sequence :window window
                    :colormap colormap :new new :state state)
     (+ %pos 32))))
(defun encode-colormap-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (colormap (slot-value %obj 'colormap))
         (new (slot-value %obj 'new))
         (state (slot-value %obj 'state)))
    (declare (ignorable response-type sequence window colormap new state))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf colormap)
    (buffer-write-bool %buf new)
    (buffer-write-card8 %buf state)
    (buffer-write-padding %buf 2)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj colormap-notify)) (encode-colormap-notify %buf %obj))
(register-event-decoder 32 #'decode-colormap-notify)

;;; xcb.ClientMessageData
(defclass client-message-data nil
          ((data8 :initarg :data8 :accessor data8 :type cl:sequence)
           (data16 :initarg :data16 :accessor data16 :type cl:sequence)
           (data32 :initarg :data32 :accessor data32 :type cl:sequence))
          (:documentation "A union: its members are views of the same bytes.
Decoding sets every member, each read from those bytes; encoding writes
the first member that is bound, in the order of the slots.  Re-encoding
a decoded instance therefore writes its first member, which in X's
unions spans the whole union, so the bytes come out the same.  To
encode a particular member, make an instance with only that one bound."))
(defun encode-client-message-data (%buf %obj)
  (let ((%start (buffer-position %buf)))
    (cond
     ((slot-boundp %obj 'data8)
      (buffer-write-fixed-list %buf (slot-value %obj 'data8) 20 #'buffer-write-card8 1))
     ((slot-boundp %obj 'data16)
      (buffer-write-fixed-list %buf (slot-value %obj 'data16) 10 #'buffer-write-card16 2))
     ((slot-boundp %obj 'data32)
      (buffer-write-fixed-list %buf (slot-value %obj 'data32) 5 #'buffer-write-card32 4))
     (t (cl:error "No member of union ~A is set" %obj)))
    (buffer-write-padding %buf (- 20 (- (buffer-position %buf) %start)))))
(defun decode-client-message-data (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) data8 data16 data32)
    (declare (ignorable %p data8 data16 data32))
    (setf data8 (read-vector-at %buf %p 20 %order :card8))
    (setf data16 (read-vector-at %buf %p 10 %order :card16))
    (setf data32 (read-vector-at %buf %p 5 %order :card32))
    (cl:values (make-instance 'client-message-data :data8 data8 :data16 data16 :data32 data32)
               (+ %pos 20))))

;;; Event xcb.ClientMessage (33)
(defclass client-message (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (window :initarg :window :accessor window :type window)
           (type :initarg :type :accessor type :type atom)
           (data :initarg :data :accessor data :type client-message-data))
          (:documentation "NOT YET DOCUMENTED

This event represents a ClientMessage, sent by another X11 client. An example
is a client sending the `_NET_WM_STATE` ClientMessage to the root window
to indicate the fullscreen window state, effectively requesting that the window
manager puts it into fullscreen mode."))
(defun decode-client-message (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type format sequence window type data)
    (declare (ignorable %p response-type format sequence window type data))
    (setf response-type (read-card8-at %buf %p))
    (setf format (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf window (read-card32-at %buf (+ %p 4) %order))
    (setf type (read-card32-at %buf (+ %p 8) %order))
    (setf data (decode-client-message-data %buf (+ %p 12) %order))
    (cl:values
     (make-instance 'client-message :response-type response-type :format format :sequence sequence
                    :window window :type type :data data)
     (+ %pos 32))))
(defun encode-client-message (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (format (slot-value %obj 'format))
         (sequence (slot-value %obj 'sequence))
         (window (slot-value %obj 'window))
         (type (slot-value %obj 'type))
         (data (slot-value %obj 'data)))
    (declare (ignorable response-type format sequence window type data))
    (buffer-write-card8 %buf response-type)
    (buffer-write-card8 %buf format)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf type)
    (encode-client-message-data %buf data)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj client-message)) (encode-client-message %buf %obj))
(register-event-decoder 33 #'decode-client-message)

;;; Enum xcb.Mapping
(defenum mapping
  (:modifier 0)
  (:keyboard 1)
  (:pointer 2))

;;; Event xcb.MappingNotify (34)
(defclass mapping-notify (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (request :initarg :request :accessor request :type (unsigned-byte 8))
           (first-keycode :initarg :first-keycode :accessor first-keycode :type keycode)
           (count :initarg :count :accessor count :type (unsigned-byte 8)))
          (:documentation "keyboard mapping changed"))
(defun decode-mapping-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence request first-keycode count)
    (declare (ignorable %p response-type sequence request first-keycode count))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf request (read-card8-at %buf (+ %p 4)))
    (setf first-keycode (read-card8-at %buf (+ %p 5)))
    (setf count (read-card8-at %buf (+ %p 6)))
    (cl:values
     (make-instance 'mapping-notify :response-type response-type :sequence sequence :request
                    request :first-keycode first-keycode :count count)
     (+ %pos 32))))
(defun encode-mapping-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (request (slot-value %obj 'request))
         (first-keycode (slot-value %obj 'first-keycode))
         (count (slot-value %obj 'count)))
    (declare (ignorable response-type sequence request first-keycode count))
    (buffer-write-card8 %buf response-type)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf sequence)
    (buffer-write-card8 %buf request)
    (buffer-write-card8 %buf first-keycode)
    (buffer-write-card8 %buf count)
    (buffer-write-padding %buf 1)
    (buffer-write-padding %buf (- 32 (- (buffer-position %buf) %start)))))
(defmethod encode-event (%buf (%obj mapping-notify)) (encode-mapping-notify %buf %obj))
(register-event-decoder 34 #'decode-mapping-notify)

;;; Event xcb.GeGeneric (35)
(defclass ge-generic (event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16)))
          (:documentation "generic event (with length)"))
(defun decode-ge-generic (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type extension sequence length event-type)
    (declare (ignorable %p response-type extension sequence length event-type))
    (setf response-type (read-card8-at %buf %p))
    (setf extension (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf event-type (read-card16-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'ge-generic :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type)
     (+ %pos 32 (* 4 length)))))
(register-event-decoder 35 #'decode-ge-generic)

;;; Error xcb.Request (1)
(defclass request-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-request-error (%buf %pos %order &optional (%class 'request-error))
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (read-card8-at %buf %p))
    (setf error-code (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance %class :response-type response-type :error-code error-code :sequence sequence
                    :bad-value bad-value :minor-opcode minor-opcode :major-opcode major-opcode)
     (+ %pos 32))))
(register-error-decoder 1 #'decode-request-error)

;;; Error xcb.Value (2)
(defclass value-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-value-error (%buf %pos %order &optional (%class 'value-error))
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (read-card8-at %buf %p))
    (setf error-code (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance %class :response-type response-type :error-code error-code :sequence sequence
                    :bad-value bad-value :minor-opcode minor-opcode :major-opcode major-opcode)
     (+ %pos 32))))
(register-error-decoder 2 #'decode-value-error)

;;; Error xcb.Window (3)
(defclass window-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-window-error (%buf %pos %order) (decode-value-error %buf %pos %order 'window-error))
(register-error-decoder 3 #'decode-window-error)

;;; Error xcb.Pixmap (4)
(defclass pixmap-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-pixmap-error (%buf %pos %order) (decode-value-error %buf %pos %order 'pixmap-error))
(register-error-decoder 4 #'decode-pixmap-error)

;;; Error xcb.Atom (5)
(defclass atom-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-atom-error (%buf %pos %order) (decode-value-error %buf %pos %order 'atom-error))
(register-error-decoder 5 #'decode-atom-error)

;;; Error xcb.Cursor (6)
(defclass cursor-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-cursor-error (%buf %pos %order) (decode-value-error %buf %pos %order 'cursor-error))
(register-error-decoder 6 #'decode-cursor-error)

;;; Error xcb.Font (7)
(defclass font-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-font-error (%buf %pos %order) (decode-value-error %buf %pos %order 'font-error))
(register-error-decoder 7 #'decode-font-error)

;;; Error xcb.Match (8)
(defclass match-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-match-error (%buf %pos %order) (decode-request-error %buf %pos %order 'match-error))
(register-error-decoder 8 #'decode-match-error)

;;; Error xcb.Drawable (9)
(defclass drawable-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-drawable-error (%buf %pos %order)
  (decode-value-error %buf %pos %order 'drawable-error))
(register-error-decoder 9 #'decode-drawable-error)

;;; Error xcb.Access (10)
(defclass access-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-access-error (%buf %pos %order) (decode-request-error %buf %pos %order 'access-error))
(register-error-decoder 10 #'decode-access-error)

;;; Error xcb.Alloc (11)
(defclass alloc-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-alloc-error (%buf %pos %order) (decode-request-error %buf %pos %order 'alloc-error))
(register-error-decoder 11 #'decode-alloc-error)

;;; Error xcb.Colormap (12)
(defclass colormap-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-colormap-error (%buf %pos %order)
  (decode-value-error %buf %pos %order 'colormap-error))
(register-error-decoder 12 #'decode-colormap-error)

;;; Error xcb.GContext (13)
(defclass g-context-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-g-context-error (%buf %pos %order)
  (decode-value-error %buf %pos %order 'g-context-error))
(register-error-decoder 13 #'decode-g-context-error)

;;; Error xcb.IDChoice (14)
(defclass id-choice-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-id-choice-error (%buf %pos %order)
  (decode-value-error %buf %pos %order 'id-choice-error))
(register-error-decoder 14 #'decode-id-choice-error)

;;; Error xcb.Name (15)
(defclass name-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-name-error (%buf %pos %order) (decode-request-error %buf %pos %order 'name-error))
(register-error-decoder 15 #'decode-name-error)

;;; Error xcb.Length (16)
(defclass length-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-length-error (%buf %pos %order) (decode-request-error %buf %pos %order 'length-error))
(register-error-decoder 16 #'decode-length-error)

;;; Error xcb.Implementation (17)
(defclass implementation-error (error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-implementation-error (%buf %pos %order)
  (decode-request-error %buf %pos %order 'implementation-error))
(register-error-decoder 17 #'decode-implementation-error)

;;; Enum xcb.WindowClass
(defenum window-class
  (:copy-from-parent 0)
  (:input-output 1)
  (:input-only 2))

;;; Enum xcb.CW
(defenum cw
  (:back-pixmap 1)
  (:back-pixel 2)
  (:border-pixmap 4)
  (:border-pixel 8)
  (:bit-gravity 16)
  (:win-gravity 32)
  (:backing-store 64)
  (:backing-planes 128)
  (:backing-pixel 256)
  (:override-redirect 512)
  (:save-under 1024)
  (:event-mask 2048)
  (:dont-propagate 4096)
  (:colormap 8192)
  (:cursor 16384))

;;; Enum xcb.BackPixmap
(defenum back-pixmap
  (:none 0)
  (:parent-relative 1))

;;; Enum xcb.Gravity
(defenum gravity
  (:bit-forget 0)
  (:win-unmap 0)
  (:north-west 1)
  (:north 2)
  (:north-east 3)
  (:west 4)
  (:center 5)
  (:east 6)
  (:south-west 7)
  (:south 8)
  (:south-east 9)
  (:static 10))

;;; Request xcb.CreateWindow
(defun create-window
       (conn depth wid parent x y width height border-width class visual value-mask
        &key background-pixmap background-pixel border-pixmap border-pixel bit-gravity win-gravity
        backing-store backing-planes backing-pixel override-redirect save-under event-mask
        do-not-propogate-mask colormap cursor)
  "Creates a window

Creates an unmapped window as child of the specified `parent` window. A
CreateNotify event will be generated. The new window is placed on top in the
stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with
the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
of pixels, and coincide with pixel centers. Each window and pixmap has its own
coordinate system. For a window, the origin is inside the border at the inside,
upper-left corner.

The created window is not yet displayed (mapped), call `xcb_map_window` to
display it.

The created window will initially use the same cursor as its parent."
  (check-value-mask 'create-window value-mask (1 :background-pixmap background-pixmap nil)
   (2 :background-pixel background-pixel nil) (4 :border-pixmap border-pixmap nil)
   (8 :border-pixel border-pixel nil) (16 :bit-gravity bit-gravity nil)
   (32 :win-gravity win-gravity nil) (64 :backing-store backing-store nil)
   (128 :backing-planes backing-planes nil) (256 :backing-pixel backing-pixel nil)
   (512 :override-redirect override-redirect nil) (1024 :save-under save-under nil)
   (2048 :event-mask event-mask nil) (4096 :do-not-propogate-mask do-not-propogate-mask nil)
   (8192 :colormap colormap nil) (16384 :cursor cursor nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 1)
    (buffer-write-card8 %buf depth)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf wid)
    (buffer-write-card32 %buf parent)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf border-width)
    (buffer-write-card16 %buf class)
    (buffer-write-card32 %buf visual)
    (buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf background-pixmap))
      (when (logtest %mask 2) (buffer-write-card32 %buf background-pixel))
      (when (logtest %mask 4) (buffer-write-card32 %buf border-pixmap))
      (when (logtest %mask 8) (buffer-write-card32 %buf border-pixel))
      (when (logtest %mask 16) (buffer-write-card32 %buf bit-gravity))
      (when (logtest %mask 32) (buffer-write-card32 %buf win-gravity))
      (when (logtest %mask 64) (buffer-write-card32 %buf backing-store))
      (when (logtest %mask 128) (buffer-write-card32 %buf backing-planes))
      (when (logtest %mask 256) (buffer-write-card32 %buf backing-pixel))
      (when (logtest %mask 512) (buffer-write-card32 %buf override-redirect))
      (when (logtest %mask 1024) (buffer-write-card32 %buf save-under))
      (when (logtest %mask 2048) (buffer-write-card32 %buf event-mask))
      (when (logtest %mask 4096) (buffer-write-card32 %buf do-not-propogate-mask))
      (when (logtest %mask 8192) (buffer-write-card32 %buf colormap))
      (when (logtest %mask 16384) (buffer-write-card32 %buf cursor)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-window-request (request)
          ((depth :initarg :depth :type (unsigned-byte 8)) (wid :initarg :wid :type window)
           (parent :initarg :parent :type window) (x :initarg :x :type (signed-byte 16))
           (y :initarg :y :type (signed-byte 16)) (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (border-width :initarg :border-width :type (unsigned-byte 16))
           (class :initarg :class :type (unsigned-byte 16))
           (visual :initarg :visual :type visualid)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (background-pixmap :initarg :background-pixmap :type pixmap)
           (background-pixel :initarg :background-pixel :type (unsigned-byte 32))
           (border-pixmap :initarg :border-pixmap :type pixmap)
           (border-pixel :initarg :border-pixel :type (unsigned-byte 32))
           (bit-gravity :initarg :bit-gravity :type (unsigned-byte 32))
           (win-gravity :initarg :win-gravity :type (unsigned-byte 32))
           (backing-store :initarg :backing-store :type (unsigned-byte 32))
           (backing-planes :initarg :backing-planes :type (unsigned-byte 32))
           (backing-pixel :initarg :backing-pixel :type (unsigned-byte 32))
           (override-redirect :initarg :override-redirect :type bool32)
           (save-under :initarg :save-under :type bool32)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))
           (do-not-propogate-mask :initarg :do-not-propogate-mask :type (unsigned-byte 32))
           (colormap :initarg :colormap :type colormap) (cursor :initarg :cursor :type cursor))
          (:documentation "Creates a window

Creates an unmapped window as child of the specified `parent` window. A
CreateNotify event will be generated. The new window is placed on top in the
stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with
the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms
of pixels, and coincide with pixel centers. Each window and pixmap has its own
coordinate system. For a window, the origin is inside the border at the inside,
upper-left corner.

The created window is not yet displayed (mapped), call `xcb_map_window` to
display it.

The created window will initially use the same cursor as its parent."))
(defmethod send-request (conn (%obj create-window-request))
  (apply #'create-window conn (slot-value %obj 'depth) (slot-value %obj 'wid)
         (slot-value %obj 'parent) (slot-value %obj 'x) (slot-value %obj 'y)
         (slot-value %obj 'width) (slot-value %obj 'height) (slot-value %obj 'border-width)
         (slot-value %obj 'class) (slot-value %obj 'visual) (slot-value %obj 'value-mask)
         (nconc
          (when (slot-boundp %obj 'background-pixmap)
            (list :background-pixmap (slot-value %obj 'background-pixmap)))
          (when (slot-boundp %obj 'background-pixel)
            (list :background-pixel (slot-value %obj 'background-pixel)))
          (when (slot-boundp %obj 'border-pixmap)
            (list :border-pixmap (slot-value %obj 'border-pixmap)))
          (when (slot-boundp %obj 'border-pixel)
            (list :border-pixel (slot-value %obj 'border-pixel)))
          (when (slot-boundp %obj 'bit-gravity) (list :bit-gravity (slot-value %obj 'bit-gravity)))
          (when (slot-boundp %obj 'win-gravity) (list :win-gravity (slot-value %obj 'win-gravity)))
          (when (slot-boundp %obj 'backing-store)
            (list :backing-store (slot-value %obj 'backing-store)))
          (when (slot-boundp %obj 'backing-planes)
            (list :backing-planes (slot-value %obj 'backing-planes)))
          (when (slot-boundp %obj 'backing-pixel)
            (list :backing-pixel (slot-value %obj 'backing-pixel)))
          (when (slot-boundp %obj 'override-redirect)
            (list :override-redirect (slot-value %obj 'override-redirect)))
          (when (slot-boundp %obj 'save-under) (list :save-under (slot-value %obj 'save-under)))
          (when (slot-boundp %obj 'event-mask) (list :event-mask (slot-value %obj 'event-mask)))
          (when (slot-boundp %obj 'do-not-propogate-mask)
            (list :do-not-propogate-mask (slot-value %obj 'do-not-propogate-mask)))
          (when (slot-boundp %obj 'colormap) (list :colormap (slot-value %obj 'colormap)))
          (when (slot-boundp %obj 'cursor) (list :cursor (slot-value %obj 'cursor))))))

;;; Request xcb.ChangeWindowAttributes
(defun change-window-attributes
       (conn window value-mask
        &key background-pixmap background-pixel border-pixmap border-pixel bit-gravity win-gravity
        backing-store backing-planes backing-pixel override-redirect save-under event-mask
        do-not-propogate-mask colormap cursor)
  "change window attributes

Changes the attributes specified by `value_mask` for the specified `window`."
  (check-value-mask 'change-window-attributes value-mask
   (1 :background-pixmap background-pixmap nil) (2 :background-pixel background-pixel nil)
   (4 :border-pixmap border-pixmap nil) (8 :border-pixel border-pixel nil)
   (16 :bit-gravity bit-gravity nil) (32 :win-gravity win-gravity nil)
   (64 :backing-store backing-store nil) (128 :backing-planes backing-planes nil)
   (256 :backing-pixel backing-pixel nil) (512 :override-redirect override-redirect nil)
   (1024 :save-under save-under nil) (2048 :event-mask event-mask nil)
   (4096 :do-not-propogate-mask do-not-propogate-mask nil) (8192 :colormap colormap nil)
   (16384 :cursor cursor nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 2)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf background-pixmap))
      (when (logtest %mask 2) (buffer-write-card32 %buf background-pixel))
      (when (logtest %mask 4) (buffer-write-card32 %buf border-pixmap))
      (when (logtest %mask 8) (buffer-write-card32 %buf border-pixel))
      (when (logtest %mask 16) (buffer-write-card32 %buf bit-gravity))
      (when (logtest %mask 32) (buffer-write-card32 %buf win-gravity))
      (when (logtest %mask 64) (buffer-write-card32 %buf backing-store))
      (when (logtest %mask 128) (buffer-write-card32 %buf backing-planes))
      (when (logtest %mask 256) (buffer-write-card32 %buf backing-pixel))
      (when (logtest %mask 512) (buffer-write-card32 %buf override-redirect))
      (when (logtest %mask 1024) (buffer-write-card32 %buf save-under))
      (when (logtest %mask 2048) (buffer-write-card32 %buf event-mask))
      (when (logtest %mask 4096) (buffer-write-card32 %buf do-not-propogate-mask))
      (when (logtest %mask 8192) (buffer-write-card32 %buf colormap))
      (when (logtest %mask 16384) (buffer-write-card32 %buf cursor)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-window-attributes-request (request)
          ((window :initarg :window :type window)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (background-pixmap :initarg :background-pixmap :type pixmap)
           (background-pixel :initarg :background-pixel :type (unsigned-byte 32))
           (border-pixmap :initarg :border-pixmap :type pixmap)
           (border-pixel :initarg :border-pixel :type (unsigned-byte 32))
           (bit-gravity :initarg :bit-gravity :type (unsigned-byte 32))
           (win-gravity :initarg :win-gravity :type (unsigned-byte 32))
           (backing-store :initarg :backing-store :type (unsigned-byte 32))
           (backing-planes :initarg :backing-planes :type (unsigned-byte 32))
           (backing-pixel :initarg :backing-pixel :type (unsigned-byte 32))
           (override-redirect :initarg :override-redirect :type bool32)
           (save-under :initarg :save-under :type bool32)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))
           (do-not-propogate-mask :initarg :do-not-propogate-mask :type (unsigned-byte 32))
           (colormap :initarg :colormap :type colormap) (cursor :initarg :cursor :type cursor))
          (:documentation "change window attributes

Changes the attributes specified by `value_mask` for the specified `window`."))
(defmethod send-request (conn (%obj change-window-attributes-request))
  (apply #'change-window-attributes conn (slot-value %obj 'window) (slot-value %obj 'value-mask)
         (nconc
          (when (slot-boundp %obj 'background-pixmap)
            (list :background-pixmap (slot-value %obj 'background-pixmap)))
          (when (slot-boundp %obj 'background-pixel)
            (list :background-pixel (slot-value %obj 'background-pixel)))
          (when (slot-boundp %obj 'border-pixmap)
            (list :border-pixmap (slot-value %obj 'border-pixmap)))
          (when (slot-boundp %obj 'border-pixel)
            (list :border-pixel (slot-value %obj 'border-pixel)))
          (when (slot-boundp %obj 'bit-gravity) (list :bit-gravity (slot-value %obj 'bit-gravity)))
          (when (slot-boundp %obj 'win-gravity) (list :win-gravity (slot-value %obj 'win-gravity)))
          (when (slot-boundp %obj 'backing-store)
            (list :backing-store (slot-value %obj 'backing-store)))
          (when (slot-boundp %obj 'backing-planes)
            (list :backing-planes (slot-value %obj 'backing-planes)))
          (when (slot-boundp %obj 'backing-pixel)
            (list :backing-pixel (slot-value %obj 'backing-pixel)))
          (when (slot-boundp %obj 'override-redirect)
            (list :override-redirect (slot-value %obj 'override-redirect)))
          (when (slot-boundp %obj 'save-under) (list :save-under (slot-value %obj 'save-under)))
          (when (slot-boundp %obj 'event-mask) (list :event-mask (slot-value %obj 'event-mask)))
          (when (slot-boundp %obj 'do-not-propogate-mask)
            (list :do-not-propogate-mask (slot-value %obj 'do-not-propogate-mask)))
          (when (slot-boundp %obj 'colormap) (list :colormap (slot-value %obj 'colormap)))
          (when (slot-boundp %obj 'cursor) (list :cursor (slot-value %obj 'cursor))))))

;;; Enum xcb.MapState
(defenum map-state
  (:unmapped 0)
  (:unviewable 1)
  (:viewable 2))

;;; Request xcb.GetWindowAttributes
(defun get-window-attributes (conn window)
  "Gets window attributes

Gets the current attributes for the specified `window`."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 3)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-window-attributes-request (request-with-reply)
          ((window :initarg :window :type window))
          (:documentation "Gets window attributes

Gets the current attributes for the specified `window`."))
(defmethod send-request (conn (%obj get-window-attributes-request))
  (get-window-attributes conn (slot-value %obj 'window)))
(defclass get-window-attributes-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (backing-store :initarg :backing-store :accessor backing-store :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (visual :initarg :visual :accessor visual :type visualid)
           (class :initarg :class :accessor class :type (unsigned-byte 16))
           (bit-gravity :initarg :bit-gravity :accessor bit-gravity :type (unsigned-byte 8))
           (win-gravity :initarg :win-gravity :accessor win-gravity :type (unsigned-byte 8))
           (backing-planes :initarg :backing-planes :accessor backing-planes :type
            (unsigned-byte 32))
           (backing-pixel :initarg :backing-pixel :accessor backing-pixel :type (unsigned-byte 32))
           (save-under :initarg :save-under :accessor save-under :type
            (or boolean (unsigned-byte 8)))
           (map-is-installed :initarg :map-is-installed :accessor map-is-installed :type
            (or boolean (unsigned-byte 8)))
           (map-state :initarg :map-state :accessor map-state :type (unsigned-byte 8))
           (override-redirect :initarg :override-redirect :accessor override-redirect :type
            (or boolean (unsigned-byte 8)))
           (colormap :initarg :colormap :accessor colormap :type colormap)
           (all-event-masks :initarg :all-event-masks :accessor all-event-masks :type
            (unsigned-byte 32))
           (your-event-mask :initarg :your-event-mask :accessor your-event-mask :type
            (unsigned-byte 32))
           (do-not-propagate-mask :initarg :do-not-propagate-mask :accessor do-not-propagate-mask
            :type (unsigned-byte 16))))
(defun decode-get-window-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        backing-store
        sequence
        length
        visual
        class
        bit-gravity
        win-gravity
        backing-planes
        backing-pixel
        save-under
        map-is-installed
        map-state
        override-redirect
        colormap
        all-event-masks
        your-event-mask
        do-not-propagate-mask)
    (declare
     (ignorable %p response-type backing-store sequence length visual class bit-gravity win-gravity
      backing-planes backing-pixel save-under map-is-installed map-state override-redirect colormap
      all-event-masks your-event-mask do-not-propagate-mask))
    (setf response-type (read-card8-at %buf %p))
    (setf backing-store (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf visual (read-card32-at %buf (+ %p 8) %order))
    (setf class (read-card16-at %buf (+ %p 12) %order))
    (setf bit-gravity (read-card8-at %buf (+ %p 14)))
    (setf win-gravity (read-card8-at %buf (+ %p 15)))
    (setf backing-planes (read-card32-at %buf (+ %p 16) %order))
    (setf backing-pixel (read-card32-at %buf (+ %p 20) %order))
    (setf save-under (read-card8-at %buf (+ %p 24)))
    (setf map-is-installed (read-card8-at %buf (+ %p 25)))
    (setf map-state (read-card8-at %buf (+ %p 26)))
    (setf override-redirect (read-card8-at %buf (+ %p 27)))
    (setf colormap (read-card32-at %buf (+ %p 28) %order))
    (setf all-event-masks (read-card32-at %buf (+ %p 32) %order))
    (setf your-event-mask (read-card32-at %buf (+ %p 36) %order))
    (setf do-not-propagate-mask (read-card16-at %buf (+ %p 40) %order))
    (cl:values
     (make-instance 'get-window-attributes-reply :response-type response-type :backing-store
                    backing-store :sequence sequence :length length :visual visual :class class
                    :bit-gravity bit-gravity :win-gravity win-gravity :backing-planes
                    backing-planes :backing-pixel backing-pixel :save-under save-under
                    :map-is-installed map-is-installed :map-state map-state :override-redirect
                    override-redirect :colormap colormap :all-event-masks all-event-masks
                    :your-event-mask your-event-mask :do-not-propagate-mask do-not-propagate-mask)
     (+ %pos 32 (* 4 length)))))
(defun get-window-attributes-reply (conn cookie)
  (read-reply conn cookie #'decode-get-window-attributes-reply))

;;; Request xcb.DestroyWindow
(defun destroy-window (conn window)
  "Destroys a window

Destroys the specified window and all of its subwindows. A DestroyNotify event
is generated for each destroyed window (a DestroyNotify event is first generated
for any given window's inferiors). If the window was mapped, it will be
automatically unmapped before destroying.

Calling DestroyWindow on the root window will do nothing."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 4)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass destroy-window-request (request) ((window :initarg :window :type window))
          (:documentation "Destroys a window

Destroys the specified window and all of its subwindows. A DestroyNotify event
is generated for each destroyed window (a DestroyNotify event is first generated
for any given window's inferiors). If the window was mapped, it will be
automatically unmapped before destroying.

Calling DestroyWindow on the root window will do nothing."))
(defmethod send-request (conn (%obj destroy-window-request))
  (destroy-window conn (slot-value %obj 'window)))

;;; Request xcb.DestroySubwindows
(defun destroy-subwindows (conn window)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 5)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass destroy-subwindows-request (request) ((window :initarg :window :type window)))
(defmethod send-request (conn (%obj destroy-subwindows-request))
  (destroy-subwindows conn (slot-value %obj 'window)))

;;; Enum xcb.SetMode
(defenum set-mode
  (:insert 0)
  (:delete 1))

;;; Request xcb.ChangeSaveSet
(defun change-save-set (conn mode window)
  "Changes a client's save set

TODO: explain what the save set is for.

This function either adds or removes the specified window to the client's (your
application's) save set."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 6)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-save-set-request (request)
          ((mode :initarg :mode :type (unsigned-byte 8)) (window :initarg :window :type window))
          (:documentation "Changes a client's save set

TODO: explain what the save set is for.

This function either adds or removes the specified window to the client's (your
application's) save set."))
(defmethod send-request (conn (%obj change-save-set-request))
  (change-save-set conn (slot-value %obj 'mode) (slot-value %obj 'window)))

;;; Request xcb.ReparentWindow
(defun reparent-window (conn window parent x y)
  "Reparents a window

Makes the specified window a child of the specified parent window. If the
window is mapped, it will automatically be unmapped before reparenting and
re-mapped after reparenting. The window is placed in the stacking order on top
with respect to sibling windows.

After reparenting, a ReparentNotify event is generated."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 7)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf parent)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass reparent-window-request (request)
          ((window :initarg :window :type window) (parent :initarg :parent :type window)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16)))
          (:documentation "Reparents a window

Makes the specified window a child of the specified parent window. If the
window is mapped, it will automatically be unmapped before reparenting and
re-mapped after reparenting. The window is placed in the stacking order on top
with respect to sibling windows.

After reparenting, a ReparentNotify event is generated."))
(defmethod send-request (conn (%obj reparent-window-request))
  (reparent-window conn (slot-value %obj 'window) (slot-value %obj 'parent) (slot-value %obj 'x)
   (slot-value %obj 'y)))

;;; Request xcb.MapWindow
(defun map-window (conn window)
  "Makes a window visible

Maps the specified window. This means making the window visible (as long as its
parent is visible).

This MapWindow request will be translated to a MapRequest request if a window
manager is running. The window manager then decides to either map the window or
not. Set the override-redirect window attribute to true if you want to bypass
this mechanism.

If the window manager decides to map the window (or if no window manager is
running), a MapNotify event is generated.

If the window becomes viewable and no earlier contents for it are remembered,
the X server tiles the window with its background. If the window's background
is undefined, the existing screen contents are not altered, and the X server
generates zero or more Expose events.

If the window type is InputOutput, an Expose event will be generated when the
window becomes visible. The normal response to an Expose event should be to
repaint the window."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 8)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass map-window-request (request) ((window :initarg :window :type window))
          (:documentation "Makes a window visible

Maps the specified window. This means making the window visible (as long as its
parent is visible).

This MapWindow request will be translated to a MapRequest request if a window
manager is running. The window manager then decides to either map the window or
not. Set the override-redirect window attribute to true if you want to bypass
this mechanism.

If the window manager decides to map the window (or if no window manager is
running), a MapNotify event is generated.

If the window becomes viewable and no earlier contents for it are remembered,
the X server tiles the window with its background. If the window's background
is undefined, the existing screen contents are not altered, and the X server
generates zero or more Expose events.

If the window type is InputOutput, an Expose event will be generated when the
window becomes visible. The normal response to an Expose event should be to
repaint the window."))
(defmethod send-request (conn (%obj map-window-request))
  (map-window conn (slot-value %obj 'window)))

;;; Request xcb.MapSubwindows
(defun map-subwindows (conn window)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 9)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass map-subwindows-request (request) ((window :initarg :window :type window)))
(defmethod send-request (conn (%obj map-subwindows-request))
  (map-subwindows conn (slot-value %obj 'window)))

;;; Request xcb.UnmapWindow
(defun unmap-window (conn window)
  "Makes a window invisible

Unmaps the specified window. This means making the window invisible (and all
its child windows).

Unmapping a window leads to the `UnmapNotify` event being generated. Also,
`Expose` events are generated for formerly obscured windows."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 10)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass unmap-window-request (request) ((window :initarg :window :type window))
          (:documentation "Makes a window invisible

Unmaps the specified window. This means making the window invisible (and all
its child windows).

Unmapping a window leads to the `UnmapNotify` event being generated. Also,
`Expose` events are generated for formerly obscured windows."))
(defmethod send-request (conn (%obj unmap-window-request))
  (unmap-window conn (slot-value %obj 'window)))

;;; Request xcb.UnmapSubwindows
(defun unmap-subwindows (conn window)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 11)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass unmap-subwindows-request (request) ((window :initarg :window :type window)))
(defmethod send-request (conn (%obj unmap-subwindows-request))
  (unmap-subwindows conn (slot-value %obj 'window)))

;;; Enum xcb.ConfigWindow
(defenum config-window
  (:x 1)
  (:y 2)
  (:width 4)
  (:height 8)
  (:border-width 16)
  (:sibling 32)
  (:stack-mode 64))

;;; Enum xcb.StackMode
(defenum stack-mode
  (:above 0)
  (:below 1)
  (:top-if 2)
  (:bottom-if 3)
  (:opposite 4))

;;; Request xcb.ConfigureWindow
(defun configure-window
       (conn window value-mask &key x y width height border-width sibling stack-mode)
  "Configures window attributes

Configures a window's size, position, border width and stacking order."
  (check-value-mask 'configure-window value-mask (1 :x x nil) (2 :y y nil) (4 :width width nil)
   (8 :height height nil) (16 :border-width border-width nil) (32 :sibling sibling nil)
   (64 :stack-mode stack-mode nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 12)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf value-mask)
    (buffer-write-padding %buf 2)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf x))
      (when (logtest %mask 2) (buffer-write-card32 %buf y))
      (when (logtest %mask 4) (buffer-write-card32 %buf width))
      (when (logtest %mask 8) (buffer-write-card32 %buf height))
      (when (logtest %mask 16) (buffer-write-card32 %buf border-width))
      (when (logtest %mask 32) (buffer-write-card32 %buf sibling))
      (when (logtest %mask 64) (buffer-write-card32 %buf stack-mode)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass configure-window-request (request)
          ((window :initarg :window :type window)
           (value-mask :initarg :value-mask :type (unsigned-byte 16))
           (x :initarg :x :type (signed-byte 32)) (y :initarg :y :type (signed-byte 32))
           (width :initarg :width :type (unsigned-byte 32))
           (height :initarg :height :type (unsigned-byte 32))
           (border-width :initarg :border-width :type (unsigned-byte 32))
           (sibling :initarg :sibling :type window)
           (stack-mode :initarg :stack-mode :type (unsigned-byte 32)))
          (:documentation "Configures window attributes

Configures a window's size, position, border width and stacking order."))
(defmethod send-request (conn (%obj configure-window-request))
  (apply #'configure-window conn (slot-value %obj 'window) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'x) (list :x (slot-value %obj 'x)))
                (when (slot-boundp %obj 'y) (list :y (slot-value %obj 'y)))
                (when (slot-boundp %obj 'width) (list :width (slot-value %obj 'width)))
                (when (slot-boundp %obj 'height) (list :height (slot-value %obj 'height)))
                (when (slot-boundp %obj 'border-width)
                  (list :border-width (slot-value %obj 'border-width)))
                (when (slot-boundp %obj 'sibling) (list :sibling (slot-value %obj 'sibling)))
                (when (slot-boundp %obj 'stack-mode)
                  (list :stack-mode (slot-value %obj 'stack-mode))))))

;;; Enum xcb.Circulate
(defenum circulate
  (:raise-lowest 0)
  (:lower-highest 1))

;;; Request xcb.CirculateWindow
(defun circulate-window (conn direction window)
  "Change window stacking order

If `direction` is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
any) will be raised to the top of the stack.

If `direction` is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
be lowered to the bottom of the stack."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 13)
    (buffer-write-card8 %buf direction)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass circulate-window-request (request)
          ((direction :initarg :direction :type (unsigned-byte 8))
           (window :initarg :window :type window))
          (:documentation "Change window stacking order

If `direction` is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if
any) will be raised to the top of the stack.

If `direction` is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will
be lowered to the bottom of the stack."))
(defmethod send-request (conn (%obj circulate-window-request))
  (circulate-window conn (slot-value %obj 'direction) (slot-value %obj 'window)))

;;; Request xcb.GetGeometry
(defun get-geometry (conn drawable)
  "Get current window geometry

Gets the current geometry of the specified drawable (either `Window` or `Pixmap`)."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 14)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-geometry-request (request-with-reply) ((drawable :initarg :drawable :type drawable))
          (:documentation "Get current window geometry

Gets the current geometry of the specified drawable (either `Window` or `Pixmap`)."))
(defmethod send-request (conn (%obj get-geometry-request))
  (get-geometry conn (slot-value %obj 'drawable)))
(defclass get-geometry-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type window)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (border-width :initarg :border-width :accessor border-width :type (unsigned-byte 16))))
(defun decode-get-geometry-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type depth sequence length root x y width height border-width)
    (declare (ignorable %p response-type depth sequence length root x y width height border-width))
    (setf response-type (read-card8-at %buf %p))
    (setf depth (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf x (read-int16-at %buf (+ %p 12) %order))
    (setf y (read-int16-at %buf (+ %p 14) %order))
    (setf width (read-card16-at %buf (+ %p 16) %order))
    (setf height (read-card16-at %buf (+ %p 18) %order))
    (setf border-width (read-card16-at %buf (+ %p 20) %order))
    (cl:values
     (make-instance 'get-geometry-reply :response-type response-type :depth depth :sequence
                    sequence :length length :root root :x x :y y :width width :height height
                    :border-width border-width)
     (+ %pos 32 (* 4 length)))))
(defun get-geometry-reply (conn cookie) (read-reply conn cookie #'decode-get-geometry-reply))

;;; Request xcb.QueryTree
(defun query-tree (conn window)
  "query the window tree

Gets the root window ID, parent window ID and list of children windows for the
specified `window`. The children are listed in bottom-to-top stacking order."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 15)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-tree-request (request-with-reply) ((window :initarg :window :type window))
          (:documentation "query the window tree

Gets the root window ID, parent window ID and list of children windows for the
specified `window`. The children are listed in bottom-to-top stacking order."))
(defmethod send-request (conn (%obj query-tree-request))
  (query-tree conn (slot-value %obj 'window)))
(defclass query-tree-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type window)
           (parent :initarg :parent :accessor parent :type window)
           (children-len :initarg :children-len :accessor children-len :type (unsigned-byte 16))
           (children :initarg :children :accessor children :type cl:sequence)))
(defun decode-query-tree-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length root parent children-len children)
    (declare (ignorable %p response-type sequence length root parent children-len children))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf parent (read-card32-at %buf (+ %p 12) %order))
    (setf children-len (read-card16-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (children %p)
      (read-vector-at %buf %p (min children-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'query-tree-reply :response-type response-type :sequence sequence :length
                    length :root root :parent parent :children-len children-len :children children)
     (+ %pos 32 (* 4 length)))))
(defun query-tree-reply (conn cookie) (read-reply conn cookie #'decode-query-tree-reply))

;;; Request xcb.InternAtom
(defun intern-atom (conn only-if-exists name)
  "Get atom identifier by name

Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
name. Atoms are used in protocols like EWMH, for example to store window titles
(`_NET_WM_NAME` atom) as property of a window.

If `only_if_exists` is 0, the atom will be created if it does not already exist.
If `only_if_exists` is 1, `XCB_ATOM_NONE` will be returned if the atom does
not yet exist."
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 16)
    (buffer-write-bool %buf only-if-exists)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass intern-atom-request (request-with-reply)
          ((only-if-exists :initarg :only-if-exists :type (or boolean (unsigned-byte 8)))
           (name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence))
          (:documentation "Get atom identifier by name

Retrieves the identifier (xcb_atom_t TODO) for the atom with the specified
name. Atoms are used in protocols like EWMH, for example to store window titles
(`_NET_WM_NAME` atom) as property of a window.

If `only_if_exists` is 0, the atom will be created if it does not already exist.
If `only_if_exists` is 1, `XCB_ATOM_NONE` will be returned if the atom does
not yet exist."))
(defmethod send-request (conn (%obj intern-atom-request))
  (intern-atom conn (slot-value %obj 'only-if-exists) (slot-value %obj 'name)))
(defclass intern-atom-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (atom :initarg :atom :accessor atom :type atom)))
(defun decode-intern-atom-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length atom)
    (declare (ignorable %p response-type sequence length atom))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf atom (read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'intern-atom-reply :response-type response-type :sequence sequence :length
                    length :atom atom)
     (+ %pos 32 (* 4 length)))))
(defun intern-atom-reply (conn cookie) (read-reply conn cookie #'decode-intern-atom-reply))

;;; Request xcb.GetAtomName
(defun get-atom-name (conn atom)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 17)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf atom)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-atom-name-request (request-with-reply) ((atom :initarg :atom :type atom)))
(defmethod send-request (conn (%obj get-atom-name-request))
  (get-atom-name conn (slot-value %obj 'atom)))
(defclass get-atom-name-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-get-atom-name-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length name-len name)
    (declare (ignorable %p response-type sequence length name-len name))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf name-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf name (read-string-at %buf %p (min name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (cl:values
     (make-instance 'get-atom-name-reply :response-type response-type :sequence sequence :length
                    length :name-len name-len :name name)
     (+ %pos 32 (* 4 length)))))
(defun get-atom-name-reply (conn cookie) (read-reply conn cookie #'decode-get-atom-name-reply))

;;; Enum xcb.PropMode
(defenum prop-mode
  (:replace 0)
  (:prepend 1)
  (:append 2))

;;; Request xcb.ChangeProperty
(defun change-property (conn mode window property type format data-len data)
  "Changes a window property

Sets or updates a property on the specified `window`. Properties are for
example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
Protocols such as EWMH also use properties - for example EWMH defines the
window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 18)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf property)
    (buffer-write-card32 %buf type)
    (buffer-write-card8 %buf format)
    (buffer-write-padding %buf 3)
    (buffer-write-card32 %buf data-len)
    (buffer-write-octets %buf data :end (truncate (* data-len format) 8))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-property-request (request)
          ((mode :initarg :mode :type (unsigned-byte 8)) (window :initarg :window :type window)
           (property :initarg :property :type atom) (type :initarg :type :type atom)
           (format :initarg :format :type (unsigned-byte 8))
           (data-len :initarg :data-len :type (unsigned-byte 32))
           (data :initarg :data :type cl:sequence))
          (:documentation "Changes a window property

Sets or updates a property on the specified `window`. Properties are for
example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
Protocols such as EWMH also use properties - for example EWMH defines the
window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property."))
(defmethod send-request (conn (%obj change-property-request))
  (change-property conn (slot-value %obj 'mode) (slot-value %obj 'window)
   (slot-value %obj 'property) (slot-value %obj 'type) (slot-value %obj 'format)
   (slot-value %obj 'data-len) (slot-value %obj 'data)))

;;; Request xcb.DeleteProperty
(defun delete-property (conn window property)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 19)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf property)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass delete-property-request (request)
          ((window :initarg :window :type window) (property :initarg :property :type atom)))
(defmethod send-request (conn (%obj delete-property-request))
  (delete-property conn (slot-value %obj 'window) (slot-value %obj 'property)))

;;; Enum xcb.GetPropertyType
(defenum get-property-type
  (:any 0))

;;; Request xcb.GetProperty
(defun get-property (conn delete window property type long-offset long-length)
  "Gets a window property

Gets the specified `property` from the specified `window`. Properties are for
example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
Protocols such as EWMH also use properties - for example EWMH defines the
window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

TODO: talk about `type`

TODO: talk about `delete`

TODO: talk about the offset/length thing. what's a valid use case?"
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 20)
    (buffer-write-bool %buf delete)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf property)
    (buffer-write-card32 %buf type)
    (buffer-write-card32 %buf long-offset)
    (buffer-write-card32 %buf long-length)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-property-request (request-with-reply)
          ((delete :initarg :delete :type (or boolean (unsigned-byte 8)))
           (window :initarg :window :type window) (property :initarg :property :type atom)
           (type :initarg :type :type atom)
           (long-offset :initarg :long-offset :type (unsigned-byte 32))
           (long-length :initarg :long-length :type (unsigned-byte 32)))
          (:documentation "Gets a window property

Gets the specified `property` from the specified `window`. Properties are for
example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`).
Protocols such as EWMH also use properties - for example EWMH defines the
window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

TODO: talk about `type`

TODO: talk about `delete`

TODO: talk about the offset/length thing. what's a valid use case?"))
(defmethod send-request (conn (%obj get-property-request))
  (get-property conn (slot-value %obj 'delete) (slot-value %obj 'window)
   (slot-value %obj 'property) (slot-value %obj 'type) (slot-value %obj 'long-offset)
   (slot-value %obj 'long-length)))
(defclass get-property-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type atom)
           (bytes-after :initarg :bytes-after :accessor bytes-after :type (unsigned-byte 32))
           (value-len :initarg :value-len :accessor value-len :type (unsigned-byte 32))
           (value :initarg :value :accessor value :type cl:sequence)))
(defun decode-get-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type format sequence length type bytes-after value-len value)
    (declare (ignorable %p response-type format sequence length type bytes-after value-len value))
    (setf response-type (read-card8-at %buf %p))
    (setf format (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf type (read-card32-at %buf (+ %p 8) %order))
    (setf bytes-after (read-card32-at %buf (+ %p 12) %order))
    (setf value-len (read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (value %p)
      (read-vector-at %buf %p
       (min (* value-len (truncate format 8)) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-property-reply :response-type response-type :format format :sequence
                    sequence :length length :type type :bytes-after bytes-after :value-len
                    value-len :value value)
     (+ %pos 32 (* 4 length)))))
(defun get-property-reply (conn cookie) (read-reply conn cookie #'decode-get-property-reply))

;;; Request xcb.ListProperties
(defun list-properties (conn window)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 21)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-properties-request (request-with-reply) ((window :initarg :window :type window)))
(defmethod send-request (conn (%obj list-properties-request))
  (list-properties conn (slot-value %obj 'window)))
(defclass list-properties-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (atoms-len :initarg :atoms-len :accessor atoms-len :type (unsigned-byte 16))
           (atoms :initarg :atoms :accessor atoms :type cl:sequence)))
(defun decode-list-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length atoms-len atoms)
    (declare (ignorable %p response-type sequence length atoms-len atoms))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf atoms-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (atoms %p)
      (read-vector-at %buf %p (min atoms-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'list-properties-reply :response-type response-type :sequence sequence :length
                    length :atoms-len atoms-len :atoms atoms)
     (+ %pos 32 (* 4 length)))))
(defun list-properties-reply (conn cookie) (read-reply conn cookie #'decode-list-properties-reply))

;;; Request xcb.SetSelectionOwner
(defun set-selection-owner (conn owner selection time)
  "Sets the owner of a selection

Makes `window` the owner of the selection `selection` and updates the
last-change time of the specified selection.

TODO: briefly explain what a selection is."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 22)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf owner)
    (buffer-write-card32 %buf selection)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-selection-owner-request (request)
          ((owner :initarg :owner :type window) (selection :initarg :selection :type atom)
           (time :initarg :time :type timestamp))
          (:documentation "Sets the owner of a selection

Makes `window` the owner of the selection `selection` and updates the
last-change time of the specified selection.

TODO: briefly explain what a selection is."))
(defmethod send-request (conn (%obj set-selection-owner-request))
  (set-selection-owner conn (slot-value %obj 'owner) (slot-value %obj 'selection)
   (slot-value %obj 'time)))

;;; Request xcb.GetSelectionOwner
(defun get-selection-owner (conn selection)
  "Gets the owner of a selection

Gets the owner of the specified selection.

TODO: briefly explain what a selection is."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 23)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf selection)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-selection-owner-request (request-with-reply)
          ((selection :initarg :selection :type atom))
          (:documentation "Gets the owner of a selection

Gets the owner of the specified selection.

TODO: briefly explain what a selection is."))
(defmethod send-request (conn (%obj get-selection-owner-request))
  (get-selection-owner conn (slot-value %obj 'selection)))
(defclass get-selection-owner-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (owner :initarg :owner :accessor owner :type window)))
(defun decode-get-selection-owner-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length owner)
    (declare (ignorable %p response-type sequence length owner))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf owner (read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'get-selection-owner-reply :response-type response-type :sequence sequence
                    :length length :owner owner)
     (+ %pos 32 (* 4 length)))))
(defun get-selection-owner-reply (conn cookie)
  (read-reply conn cookie #'decode-get-selection-owner-reply))

;;; Request xcb.ConvertSelection
(defun convert-selection (conn requestor selection target property time)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 24)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf requestor)
    (buffer-write-card32 %buf selection)
    (buffer-write-card32 %buf target)
    (buffer-write-card32 %buf property)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass convert-selection-request (request)
          ((requestor :initarg :requestor :type window) (selection :initarg :selection :type atom)
           (target :initarg :target :type atom) (property :initarg :property :type atom)
           (time :initarg :time :type timestamp)))
(defmethod send-request (conn (%obj convert-selection-request))
  (convert-selection conn (slot-value %obj 'requestor) (slot-value %obj 'selection)
   (slot-value %obj 'target) (slot-value %obj 'property) (slot-value %obj 'time)))

;;; Enum xcb.SendEventDest
(defenum send-event-dest
  (:pointer-window 0)
  (:item-focus 1))

;;; Request xcb.SendEvent
(defun send-event (conn propagate destination event-mask event)
  "send an event

Identifies the `destination` window, determines which clients should receive
the specified event and ignores any active grabs.

The `event` must be one of the core events or an event defined by an extension,
so that the X server can correctly byte-swap the contents as necessary. The
contents of `event` are otherwise unaltered and unchecked except for the
`send_event` field which is forced to 'true'."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 25)
    (buffer-write-bool %buf propagate)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf destination)
    (buffer-write-card32 %buf event-mask)
    (buffer-write-fixed-list %buf event 32 #'buffer-write-char 1)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass send-event-request (request)
          ((propagate :initarg :propagate :type (or boolean (unsigned-byte 8)))
           (destination :initarg :destination :type window)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))
           (event :initarg :event :type cl:sequence))
          (:documentation "send an event

Identifies the `destination` window, determines which clients should receive
the specified event and ignores any active grabs.

The `event` must be one of the core events or an event defined by an extension,
so that the X server can correctly byte-swap the contents as necessary. The
contents of `event` are otherwise unaltered and unchecked except for the
`send_event` field which is forced to 'true'."))
(defmethod send-request (conn (%obj send-event-request))
  (send-event conn (slot-value %obj 'propagate) (slot-value %obj 'destination)
   (slot-value %obj 'event-mask) (slot-value %obj 'event)))

;;; Enum xcb.GrabMode
(defenum grab-mode
  (:sync 0)
  (:async 1))

;;; Enum xcb.GrabStatus
(defenum grab-status
  (:success 0)
  (:already-grabbed 1)
  (:invalid-time 2)
  (:not-viewable 3)
  (:frozen 4))

;;; Enum xcb.Cursor
(defenum cursor
  (:none 0))

;;; Request xcb.GrabPointer
(defun grab-pointer
       (conn owner-events grab-window event-mask pointer-mode keyboard-mode confine-to cursor time)
  "Grab the pointer

Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 26)
    (buffer-write-bool %buf owner-events)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card16 %buf event-mask)
    (buffer-write-card8 %buf pointer-mode)
    (buffer-write-card8 %buf keyboard-mode)
    (buffer-write-card32 %buf confine-to)
    (buffer-write-card32 %buf cursor)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass grab-pointer-request (request-with-reply)
          ((owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (grab-window :initarg :grab-window :type window)
           (event-mask :initarg :event-mask :type (unsigned-byte 16))
           (pointer-mode :initarg :pointer-mode :type (unsigned-byte 8))
           (keyboard-mode :initarg :keyboard-mode :type (unsigned-byte 8))
           (confine-to :initarg :confine-to :type window) (cursor :initarg :cursor :type cursor)
           (time :initarg :time :type timestamp))
          (:documentation "Grab the pointer

Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client."))
(defmethod send-request (conn (%obj grab-pointer-request))
  (grab-pointer conn (slot-value %obj 'owner-events) (slot-value %obj 'grab-window)
   (slot-value %obj 'event-mask) (slot-value %obj 'pointer-mode) (slot-value %obj 'keyboard-mode)
   (slot-value %obj 'confine-to) (slot-value %obj 'cursor) (slot-value %obj 'time)))
(defclass grab-pointer-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-grab-pointer-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length)
    (declare (ignorable %p response-type status sequence length))
    (setf response-type (read-card8-at %buf %p))
    (setf status (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (cl:values
     (make-instance 'grab-pointer-reply :response-type response-type :status status :sequence
                    sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun grab-pointer-reply (conn cookie) (read-reply conn cookie #'decode-grab-pointer-reply))

;;; Request xcb.UngrabPointer
(defun ungrab-pointer (conn time)
  "release the pointer

Releases the pointer and any queued events if you actively grabbed the pointer
before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
press.

EnterNotify and LeaveNotify events are generated."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 27)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass ungrab-pointer-request (request) ((time :initarg :time :type timestamp))
          (:documentation "release the pointer

Releases the pointer and any queued events if you actively grabbed the pointer
before using `xcb_grab_pointer`, `xcb_grab_button` or within a normal button
press.

EnterNotify and LeaveNotify events are generated."))
(defmethod send-request (conn (%obj ungrab-pointer-request))
  (ungrab-pointer conn (slot-value %obj 'time)))

;;; Enum xcb.ButtonIndex
(defenum button-index
  (:any 0)
  (:n1 1)
  (:n2 2)
  (:n3 3)
  (:n4 4)
  (:n5 5))

;;; Request xcb.GrabButton
(defun grab-button
       (conn owner-events grab-window event-mask pointer-mode keyboard-mode confine-to cursor
        button modifiers)
  "Grab pointer button(s)

This request establishes a passive grab. The pointer is actively grabbed as
described in GrabPointer, the last-pointer-grab time is set to the time at
which the button was pressed (as transmitted in the ButtonPress event), and the
ButtonPress event is reported if all of the following conditions are true:

The pointer is not grabbed and the specified button is logically pressed when
the specified modifier keys are logically down, and no other buttons or
modifier keys are logically down.

The grab-window contains the pointer.

The confine-to window (if any) is viewable.

A passive grab on the same button/key combination does not exist on any
ancestor of grab-window.

The interpretation of the remaining arguments is the same as for GrabPointer.
The active grab is terminated automatically when the logical state of the
pointer has all buttons released, independent of the logical state of modifier
keys. Note that the logical state of a device (as seen by means of the
protocol) may lag the physical state if device event processing is frozen. This
request overrides all previous passive grabs by the same client on the same
button/key combinations on the same window. A modifier of AnyModifier is
equivalent to issuing the request for all possible modifier combinations
(including the combination of no modifiers). It is not required that all
specified modifiers have currently assigned keycodes. A button of AnyButton is
equivalent to issuing the request for all possible buttons. Otherwise, it is
not required that the button specified currently be assigned to a physical
button.

An Access error is generated if some other client has already issued a
GrabButton request with the same button/key combination on the same window.
When using AnyModifier or AnyButton, the request fails completely (no grabs are
established), and an Access error is generated if there is a conflicting grab
for any combination. The request has no effect on an active grab."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 28)
    (buffer-write-bool %buf owner-events)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card16 %buf event-mask)
    (buffer-write-card8 %buf pointer-mode)
    (buffer-write-card8 %buf keyboard-mode)
    (buffer-write-card32 %buf confine-to)
    (buffer-write-card32 %buf cursor)
    (buffer-write-card8 %buf button)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf modifiers)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass grab-button-request (request)
          ((owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (grab-window :initarg :grab-window :type window)
           (event-mask :initarg :event-mask :type (unsigned-byte 16))
           (pointer-mode :initarg :pointer-mode :type (unsigned-byte 8))
           (keyboard-mode :initarg :keyboard-mode :type (unsigned-byte 8))
           (confine-to :initarg :confine-to :type window) (cursor :initarg :cursor :type cursor)
           (button :initarg :button :type (unsigned-byte 8))
           (modifiers :initarg :modifiers :type (unsigned-byte 16)))
          (:documentation "Grab pointer button(s)

This request establishes a passive grab. The pointer is actively grabbed as
described in GrabPointer, the last-pointer-grab time is set to the time at
which the button was pressed (as transmitted in the ButtonPress event), and the
ButtonPress event is reported if all of the following conditions are true:

The pointer is not grabbed and the specified button is logically pressed when
the specified modifier keys are logically down, and no other buttons or
modifier keys are logically down.

The grab-window contains the pointer.

The confine-to window (if any) is viewable.

A passive grab on the same button/key combination does not exist on any
ancestor of grab-window.

The interpretation of the remaining arguments is the same as for GrabPointer.
The active grab is terminated automatically when the logical state of the
pointer has all buttons released, independent of the logical state of modifier
keys. Note that the logical state of a device (as seen by means of the
protocol) may lag the physical state if device event processing is frozen. This
request overrides all previous passive grabs by the same client on the same
button/key combinations on the same window. A modifier of AnyModifier is
equivalent to issuing the request for all possible modifier combinations
(including the combination of no modifiers). It is not required that all
specified modifiers have currently assigned keycodes. A button of AnyButton is
equivalent to issuing the request for all possible buttons. Otherwise, it is
not required that the button specified currently be assigned to a physical
button.

An Access error is generated if some other client has already issued a
GrabButton request with the same button/key combination on the same window.
When using AnyModifier or AnyButton, the request fails completely (no grabs are
established), and an Access error is generated if there is a conflicting grab
for any combination. The request has no effect on an active grab."))
(defmethod send-request (conn (%obj grab-button-request))
  (grab-button conn (slot-value %obj 'owner-events) (slot-value %obj 'grab-window)
   (slot-value %obj 'event-mask) (slot-value %obj 'pointer-mode) (slot-value %obj 'keyboard-mode)
   (slot-value %obj 'confine-to) (slot-value %obj 'cursor) (slot-value %obj 'button)
   (slot-value %obj 'modifiers)))

;;; Request xcb.UngrabButton
(defun ungrab-button (conn button grab-window modifiers)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 29)
    (buffer-write-card8 %buf button)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card16 %buf modifiers)
    (buffer-write-padding %buf 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass ungrab-button-request (request)
          ((button :initarg :button :type (unsigned-byte 8))
           (grab-window :initarg :grab-window :type window)
           (modifiers :initarg :modifiers :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj ungrab-button-request))
  (ungrab-button conn (slot-value %obj 'button) (slot-value %obj 'grab-window)
   (slot-value %obj 'modifiers)))

;;; Request xcb.ChangeActivePointerGrab
(defun change-active-pointer-grab (conn cursor time event-mask)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 30)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cursor)
    (buffer-write-card32 %buf time)
    (buffer-write-card16 %buf event-mask)
    (buffer-write-padding %buf 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-active-pointer-grab-request (request)
          ((cursor :initarg :cursor :type cursor) (time :initarg :time :type timestamp)
           (event-mask :initarg :event-mask :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj change-active-pointer-grab-request))
  (change-active-pointer-grab conn (slot-value %obj 'cursor) (slot-value %obj 'time)
   (slot-value %obj 'event-mask)))

;;; Request xcb.GrabKeyboard
(defun grab-keyboard (conn owner-events grab-window time pointer-mode keyboard-mode)
  "Grab the keyboard

Actively grabs control of the keyboard and generates FocusIn and FocusOut
events. Further key events are reported only to the grabbing client.

Any active keyboard grab by this client is overridden. If the keyboard is
actively grabbed by some other client, `AlreadyGrabbed` is returned. If
`grab_window` is not viewable, `GrabNotViewable` is returned. If the keyboard
is frozen by an active grab of another client, `GrabFrozen` is returned. If the
specified `time` is earlier than the last-keyboard-grab time or later than the
current X server time, `GrabInvalidTime` is returned. Otherwise, the
last-keyboard-grab time is set to the specified time."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 31)
    (buffer-write-bool %buf owner-events)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card32 %buf time)
    (buffer-write-card8 %buf pointer-mode)
    (buffer-write-card8 %buf keyboard-mode)
    (buffer-write-padding %buf 2)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass grab-keyboard-request (request-with-reply)
          ((owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (grab-window :initarg :grab-window :type window) (time :initarg :time :type timestamp)
           (pointer-mode :initarg :pointer-mode :type (unsigned-byte 8))
           (keyboard-mode :initarg :keyboard-mode :type (unsigned-byte 8)))
          (:documentation "Grab the keyboard

Actively grabs control of the keyboard and generates FocusIn and FocusOut
events. Further key events are reported only to the grabbing client.

Any active keyboard grab by this client is overridden. If the keyboard is
actively grabbed by some other client, `AlreadyGrabbed` is returned. If
`grab_window` is not viewable, `GrabNotViewable` is returned. If the keyboard
is frozen by an active grab of another client, `GrabFrozen` is returned. If the
specified `time` is earlier than the last-keyboard-grab time or later than the
current X server time, `GrabInvalidTime` is returned. Otherwise, the
last-keyboard-grab time is set to the specified time."))
(defmethod send-request (conn (%obj grab-keyboard-request))
  (grab-keyboard conn (slot-value %obj 'owner-events) (slot-value %obj 'grab-window)
   (slot-value %obj 'time) (slot-value %obj 'pointer-mode) (slot-value %obj 'keyboard-mode)))
(defclass grab-keyboard-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-grab-keyboard-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length)
    (declare (ignorable %p response-type status sequence length))
    (setf response-type (read-card8-at %buf %p))
    (setf status (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (cl:values
     (make-instance 'grab-keyboard-reply :response-type response-type :status status :sequence
                    sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun grab-keyboard-reply (conn cookie) (read-reply conn cookie #'decode-grab-keyboard-reply))

;;; Request xcb.UngrabKeyboard
(defun ungrab-keyboard (conn time)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 32)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass ungrab-keyboard-request (request) ((time :initarg :time :type timestamp)))
(defmethod send-request (conn (%obj ungrab-keyboard-request))
  (ungrab-keyboard conn (slot-value %obj 'time)))

;;; Enum xcb.Grab
(defenum grab
  (:any 0))

;;; Request xcb.GrabKey
(defun grab-key (conn owner-events grab-window modifiers key pointer-mode keyboard-mode)
  "Grab keyboard key(s)

Establishes a passive grab on the keyboard. In the future, the keyboard is
actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
the time at which the key was pressed (as transmitted in the KeyPress event),
and the KeyPress event is reported if all of the following conditions are true:

The keyboard is not grabbed and the specified key (which can itself be a
modifier key) is logically pressed when the specified modifier keys are
logically down, and no other modifier keys are logically down.

Either the grab_window is an ancestor of (or is) the focus window, or the
grab_window is a descendant of the focus window and contains the pointer.

A passive grab on the same key combination does not exist on any ancestor of
grab_window.

The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
automatically when the logical state of the keyboard has the specified key released (independent of the
logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.

Note that the logical state of a device (as seen by client applications) may lag the physical state if
device event processing is frozen.

A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
and max_keycode in the connection setup, or a BadValue error results.

If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
results (no grabs are established) if there is a conflicting grab for any combination."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 33)
    (buffer-write-bool %buf owner-events)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card16 %buf modifiers)
    (buffer-write-card8 %buf key)
    (buffer-write-card8 %buf pointer-mode)
    (buffer-write-card8 %buf keyboard-mode)
    (buffer-write-padding %buf 3)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass grab-key-request (request)
          ((owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (grab-window :initarg :grab-window :type window)
           (modifiers :initarg :modifiers :type (unsigned-byte 16))
           (key :initarg :key :type keycode)
           (pointer-mode :initarg :pointer-mode :type (unsigned-byte 8))
           (keyboard-mode :initarg :keyboard-mode :type (unsigned-byte 8)))
          (:documentation "Grab keyboard key(s)

Establishes a passive grab on the keyboard. In the future, the keyboard is
actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to
the time at which the key was pressed (as transmitted in the KeyPress event),
and the KeyPress event is reported if all of the following conditions are true:

The keyboard is not grabbed and the specified key (which can itself be a
modifier key) is logically pressed when the specified modifier keys are
logically down, and no other modifier keys are logically down.

Either the grab_window is an ancestor of (or is) the focus window, or the
grab_window is a descendant of the focus window and contains the pointer.

A passive grab on the same key combination does not exist on any ancestor of
grab_window.

The interpretation of the remaining arguments is as for XGrabKeyboard.  The active grab is terminated
automatically when the logical state of the keyboard has the specified key released (independent of the
logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.

Note that the logical state of a device (as seen by client applications) may lag the physical state if
device event processing is frozen.

A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers).  It is not required that all modifiers specified
have currently assigned KeyCodes.  A keycode argument of AnyKey is equivalent to issuing the request for
all possible KeyCodes.  Otherwise, the specified keycode must be in the range specified by min_keycode
and max_keycode in the connection setup, or a BadValue error results.

If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess
error results.  When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error
results (no grabs are established) if there is a conflicting grab for any combination."))
(defmethod send-request (conn (%obj grab-key-request))
  (grab-key conn (slot-value %obj 'owner-events) (slot-value %obj 'grab-window)
   (slot-value %obj 'modifiers) (slot-value %obj 'key) (slot-value %obj 'pointer-mode)
   (slot-value %obj 'keyboard-mode)))

;;; Request xcb.UngrabKey
(defun ungrab-key (conn key grab-window modifiers)
  "release a key combination

Releases the key combination on `grab_window` if you grabbed it using
`xcb_grab_key` before."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 34)
    (buffer-write-card8 %buf key)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf grab-window)
    (buffer-write-card16 %buf modifiers)
    (buffer-write-padding %buf 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass ungrab-key-request (request)
          ((key :initarg :key :type keycode) (grab-window :initarg :grab-window :type window)
           (modifiers :initarg :modifiers :type (unsigned-byte 16)))
          (:documentation "release a key combination

Releases the key combination on `grab_window` if you grabbed it using
`xcb_grab_key` before."))
(defmethod send-request (conn (%obj ungrab-key-request))
  (ungrab-key conn (slot-value %obj 'key) (slot-value %obj 'grab-window)
   (slot-value %obj 'modifiers)))

;;; Enum xcb.Allow
(defenum allow
  (:async-pointer 0)
  (:sync-pointer 1)
  (:replay-pointer 2)
  (:async-keyboard 3)
  (:sync-keyboard 4)
  (:replay-keyboard 5)
  (:async-both 6)
  (:sync-both 7))

;;; Request xcb.AllowEvents
(defun allow-events (conn mode time)
  "release queued events

Releases queued events if the client has caused a device (pointer/keyboard) to
freeze due to grabbing it actively. This request has no effect if `time` is
earlier than the last-grab time of the most recent active grab for this client
or if `time` is later than the current X server time."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 35)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass allow-events-request (request)
          ((mode :initarg :mode :type (unsigned-byte 8)) (time :initarg :time :type timestamp))
          (:documentation "release queued events

Releases queued events if the client has caused a device (pointer/keyboard) to
freeze due to grabbing it actively. This request has no effect if `time` is
earlier than the last-grab time of the most recent active grab for this client
or if `time` is later than the current X server time."))
(defmethod send-request (conn (%obj allow-events-request))
  (allow-events conn (slot-value %obj 'mode) (slot-value %obj 'time)))

;;; Request xcb.GrabServer
(defun grab-server (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 36)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass grab-server-request (request) nil)
(defmethod send-request (conn (%obj grab-server-request)) (grab-server conn))

;;; Request xcb.UngrabServer
(defun ungrab-server (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 37)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass ungrab-server-request (request) nil)
(defmethod send-request (conn (%obj ungrab-server-request)) (ungrab-server conn))

;;; Request xcb.QueryPointer
(defun query-pointer (conn window)
  "get pointer coordinates

Gets the root window the pointer is logically on and the pointer coordinates
relative to the root window's origin."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 38)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-pointer-request (request-with-reply) ((window :initarg :window :type window))
          (:documentation "get pointer coordinates

Gets the root window the pointer is logically on and the pointer coordinates
relative to the root window's origin."))
(defmethod send-request (conn (%obj query-pointer-request))
  (query-pointer conn (slot-value %obj 'window)))
(defclass query-pointer-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type window)
           (child :initarg :child :accessor child :type window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (win-x :initarg :win-x :accessor win-x :type (signed-byte 16))
           (win-y :initarg :win-y :accessor win-y :type (signed-byte 16))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 16))))
(defun decode-query-pointer-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        same-screen
        sequence
        length
        root
        child
        root-x
        root-y
        win-x
        win-y
        mask)
    (declare
     (ignorable %p response-type same-screen sequence length root child root-x root-y win-x win-y
      mask))
    (setf response-type (read-card8-at %buf %p))
    (setf same-screen (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf root (read-card32-at %buf (+ %p 8) %order))
    (setf child (read-card32-at %buf (+ %p 12) %order))
    (setf root-x (read-int16-at %buf (+ %p 16) %order))
    (setf root-y (read-int16-at %buf (+ %p 18) %order))
    (setf win-x (read-int16-at %buf (+ %p 20) %order))
    (setf win-y (read-int16-at %buf (+ %p 22) %order))
    (setf mask (read-card16-at %buf (+ %p 24) %order))
    (cl:values
     (make-instance 'query-pointer-reply :response-type response-type :same-screen same-screen
                    :sequence sequence :length length :root root :child child :root-x root-x
                    :root-y root-y :win-x win-x :win-y win-y :mask mask)
     (+ %pos 32 (* 4 length)))))
(defun query-pointer-reply (conn cookie) (read-reply conn cookie #'decode-query-pointer-reply))

;;; xcb.TIMECOORD
(defclass timecoord nil
          ((time :initarg :time :accessor time :type timestamp)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))))
(defun encode-timecoord (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((time (slot-value %obj 'time)) (x (slot-value %obj 'x)) (y (slot-value %obj 'y)))
    (declare (ignorable time x y))
    (buffer-write-card32 %buf time)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)))
(defun decode-timecoord (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) time x y)
    (declare (ignorable %p time x y))
    (setf time (read-card32-at %buf %p %order))
    (setf x (read-int16-at %buf (+ %p 4) %order))
    (setf y (read-int16-at %buf (+ %p 6) %order))
    (cl:values (make-instance 'timecoord :time time :x x :y y) (+ %p 8))))

;;; Request xcb.GetMotionEvents
(defun get-motion-events (conn window start stop)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 39)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf start)
    (buffer-write-card32 %buf stop)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-motion-events-request (request-with-reply)
          ((window :initarg :window :type window) (start :initarg :start :type timestamp)
           (stop :initarg :stop :type timestamp)))
(defmethod send-request (conn (%obj get-motion-events-request))
  (get-motion-events conn (slot-value %obj 'window) (slot-value %obj 'start)
   (slot-value %obj 'stop)))
(defclass get-motion-events-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (events-len :initarg :events-len :accessor events-len :type (unsigned-byte 32))
           (events :initarg :events :accessor events :type cl:sequence)))
(defun decode-get-motion-events-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length events-len events)
    (declare (ignorable %p response-type sequence length events-len events))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf events-len (read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (events %p)
      (read-struct-vector-at %buf %p (min events-len (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-timecoord))
    (cl:values
     (make-instance 'get-motion-events-reply :response-type response-type :sequence sequence
                    :length length :events-len events-len :events events)
     (+ %pos 32 (* 4 length)))))
(defun get-motion-events-reply (conn cookie)
  (read-reply conn cookie #'decode-get-motion-events-reply))

;;; Request xcb.TranslateCoordinates
(defun translate-coordinates (conn src-window dst-window src-x src-y)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 40)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf src-window)
    (buffer-write-card32 %buf dst-window)
    (buffer-write-card16 %buf src-x)
    (buffer-write-card16 %buf src-y)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass translate-coordinates-request (request-with-reply)
          ((src-window :initarg :src-window :type window)
           (dst-window :initarg :dst-window :type window)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))))
(defmethod send-request (conn (%obj translate-coordinates-request))
  (translate-coordinates conn (slot-value %obj 'src-window) (slot-value %obj 'dst-window)
   (slot-value %obj 'src-x) (slot-value %obj 'src-y)))
(defclass translate-coordinates-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (child :initarg :child :accessor child :type window)
           (dst-x :initarg :dst-x :accessor dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :accessor dst-y :type (signed-byte 16))))
(defun decode-translate-coordinates-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type same-screen sequence length child dst-x dst-y)
    (declare (ignorable %p response-type same-screen sequence length child dst-x dst-y))
    (setf response-type (read-card8-at %buf %p))
    (setf same-screen (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf child (read-card32-at %buf (+ %p 8) %order))
    (setf dst-x (read-int16-at %buf (+ %p 12) %order))
    (setf dst-y (read-int16-at %buf (+ %p 14) %order))
    (cl:values
     (make-instance 'translate-coordinates-reply :response-type response-type :same-screen
                    same-screen :sequence sequence :length length :child child :dst-x dst-x :dst-y
                    dst-y)
     (+ %pos 32 (* 4 length)))))
(defun translate-coordinates-reply (conn cookie)
  (read-reply conn cookie #'decode-translate-coordinates-reply))

;;; Request xcb.WarpPointer
(defun warp-pointer (conn src-window dst-window src-x src-y src-width src-height dst-x dst-y)
  "move mouse pointer

Moves the mouse pointer to the specified position.

If `src_window` is not `XCB_NONE` (TODO), the move will only take place if the
pointer is inside `src_window` and within the rectangle specified by (`src_x`,
`src_y`, `src_width`, `src_height`). The rectangle coordinates are relative to
`src_window`.

If `dst_window` is not `XCB_NONE` (TODO), the pointer will be moved to the
offsets (`dst_x`, `dst_y`) relative to `dst_window`. If `dst_window` is
`XCB_NONE` (TODO), the pointer will be moved by the offsets (`dst_x`, `dst_y`)
relative to the current position of the pointer."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 41)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf src-window)
    (buffer-write-card32 %buf dst-window)
    (buffer-write-card16 %buf src-x)
    (buffer-write-card16 %buf src-y)
    (buffer-write-card16 %buf src-width)
    (buffer-write-card16 %buf src-height)
    (buffer-write-card16 %buf dst-x)
    (buffer-write-card16 %buf dst-y)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass warp-pointer-request (request)
          ((src-window :initarg :src-window :type window)
           (dst-window :initarg :dst-window :type window)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (src-width :initarg :src-width :type (unsigned-byte 16))
           (src-height :initarg :src-height :type (unsigned-byte 16))
           (dst-x :initarg :dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :type (signed-byte 16)))
          (:documentation "move mouse pointer

Moves the mouse pointer to the specified position.

If `src_window` is not `XCB_NONE` (TODO), the move will only take place if the
pointer is inside `src_window` and within the rectangle specified by (`src_x`,
`src_y`, `src_width`, `src_height`). The rectangle coordinates are relative to
`src_window`.

If `dst_window` is not `XCB_NONE` (TODO), the pointer will be moved to the
offsets (`dst_x`, `dst_y`) relative to `dst_window`. If `dst_window` is
`XCB_NONE` (TODO), the pointer will be moved by the offsets (`dst_x`, `dst_y`)
relative to the current position of the pointer."))
(defmethod send-request (conn (%obj warp-pointer-request))
  (warp-pointer conn (slot-value %obj 'src-window) (slot-value %obj 'dst-window)
   (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'src-width)
   (slot-value %obj 'src-height) (slot-value %obj 'dst-x) (slot-value %obj 'dst-y)))

;;; Enum xcb.InputFocus
(defenum input-focus
  (:none 0)
  (:pointer-root 1)
  (:parent 2)
  (:follow-keyboard 3))

;;; Request xcb.SetInputFocus
(defun set-input-focus (conn revert-to focus time)
  "Sets input focus

Changes the input focus and the last-focus-change time. If the specified `time`
is earlier than the current last-focus-change time, the request is ignored (to
avoid race conditions when running X over the network).

A FocusIn and FocusOut event is generated when focus is changed."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 42)
    (buffer-write-card8 %buf revert-to)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf focus)
    (buffer-write-card32 %buf time)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-input-focus-request (request)
          ((revert-to :initarg :revert-to :type (unsigned-byte 8))
           (focus :initarg :focus :type window) (time :initarg :time :type timestamp))
          (:documentation "Sets input focus

Changes the input focus and the last-focus-change time. If the specified `time`
is earlier than the current last-focus-change time, the request is ignored (to
avoid race conditions when running X over the network).

A FocusIn and FocusOut event is generated when focus is changed."))
(defmethod send-request (conn (%obj set-input-focus-request))
  (set-input-focus conn (slot-value %obj 'revert-to) (slot-value %obj 'focus)
   (slot-value %obj 'time)))

;;; Request xcb.GetInputFocus
(defun get-input-focus (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 43)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-input-focus-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-input-focus-request)) (get-input-focus conn))
(defclass get-input-focus-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (revert-to :initarg :revert-to :accessor revert-to :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (focus :initarg :focus :accessor focus :type window)))
(defun decode-get-input-focus-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type revert-to sequence length focus)
    (declare (ignorable %p response-type revert-to sequence length focus))
    (setf response-type (read-card8-at %buf %p))
    (setf revert-to (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf focus (read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'get-input-focus-reply :response-type response-type :revert-to revert-to
                    :sequence sequence :length length :focus focus)
     (+ %pos 32 (* 4 length)))))
(defun get-input-focus-reply (conn cookie) (read-reply conn cookie #'decode-get-input-focus-reply))

;;; Request xcb.QueryKeymap
(defun query-keymap (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 44)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-keymap-request (request-with-reply) nil)
(defmethod send-request (conn (%obj query-keymap-request)) (query-keymap conn))
(defclass query-keymap-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun decode-query-keymap-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length keys)
    (declare (ignorable %p response-type sequence length keys))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf keys (read-vector-at %buf (+ %p 8) 32 %order :card8))
    (cl:values
     (make-instance 'query-keymap-reply :response-type response-type :sequence sequence :length
                    length :keys keys)
     (+ %pos 32 (* 4 length)))))
(defun query-keymap-reply (conn cookie) (read-reply conn cookie #'decode-query-keymap-reply))

;;; Request xcb.OpenFont
(defun open-font (conn fid name)
  "opens a font

Opens any X core font matching the given `name` (for example \"-misc-fixed-*\").

Note that X core fonts are deprecated (but still supported) in favor of
client-side rendering using Xft."
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 45)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf fid)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass open-font-request (request)
          ((fid :initarg :fid :type font) (name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence))
          (:documentation "opens a font

Opens any X core font matching the given `name` (for example \"-misc-fixed-*\").

Note that X core fonts are deprecated (but still supported) in favor of
client-side rendering using Xft."))
(defmethod send-request (conn (%obj open-font-request))
  (open-font conn (slot-value %obj 'fid) (slot-value %obj 'name)))

;;; Request xcb.CloseFont
(defun close-font (conn font)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 46)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf font)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass close-font-request (request) ((font :initarg :font :type font)))
(defmethod send-request (conn (%obj close-font-request)) (close-font conn (slot-value %obj 'font)))

;;; Enum xcb.FontDraw
(defenum font-draw
  (:left-to-right 0)
  (:right-to-left 1))

;;; xcb.FONTPROP
(defclass fontprop nil
          ((name :initarg :name :accessor name :type atom)
           (value :initarg :value :accessor value :type (unsigned-byte 32))))
(defun encode-fontprop (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name)) (value (slot-value %obj 'value)))
    (declare (ignorable name value))
    (buffer-write-card32 %buf name)
    (buffer-write-card32 %buf value)))
(defun decode-fontprop (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name value)
    (declare (ignorable %p name value))
    (setf name (read-card32-at %buf %p %order))
    (setf value (read-card32-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'fontprop :name name :value value) (+ %p 8))))

;;; xcb.CHARINFO
(defclass charinfo nil
          ((left-side-bearing :initarg :left-side-bearing :accessor left-side-bearing :type
            (signed-byte 16))
           (right-side-bearing :initarg :right-side-bearing :accessor right-side-bearing :type
            (signed-byte 16))
           (character-width :initarg :character-width :accessor character-width :type
            (signed-byte 16))
           (ascent :initarg :ascent :accessor ascent :type (signed-byte 16))
           (descent :initarg :descent :accessor descent :type (signed-byte 16))
           (attributes :initarg :attributes :accessor attributes :type (unsigned-byte 16))))
(defun encode-charinfo (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((left-side-bearing (slot-value %obj 'left-side-bearing))
         (right-side-bearing (slot-value %obj 'right-side-bearing))
         (character-width (slot-value %obj 'character-width))
         (ascent (slot-value %obj 'ascent))
         (descent (slot-value %obj 'descent))
         (attributes (slot-value %obj 'attributes)))
    (declare
     (ignorable left-side-bearing right-side-bearing character-width ascent descent attributes))
    (buffer-write-card16 %buf left-side-bearing)
    (buffer-write-card16 %buf right-side-bearing)
    (buffer-write-card16 %buf character-width)
    (buffer-write-card16 %buf ascent)
    (buffer-write-card16 %buf descent)
    (buffer-write-card16 %buf attributes)))
(defun decode-charinfo (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) left-side-bearing right-side-bearing character-width ascent descent attributes)
    (declare
     (ignorable %p left-side-bearing right-side-bearing character-width ascent descent attributes))
    (setf left-side-bearing (read-int16-at %buf %p %order))
    (setf right-side-bearing (read-int16-at %buf (+ %p 2) %order))
    (setf character-width (read-int16-at %buf (+ %p 4) %order))
    (setf ascent (read-int16-at %buf (+ %p 6) %order))
    (setf descent (read-int16-at %buf (+ %p 8) %order))
    (setf attributes (read-card16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'charinfo :left-side-bearing left-side-bearing :right-side-bearing
                    right-side-bearing :character-width character-width :ascent ascent :descent
                    descent :attributes attributes)
     (+ %p 12))))

;;; Request xcb.QueryFont
(defun query-font (conn font)
  "query font metrics

Queries information associated with the font."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 47)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf font)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-font-request (request-with-reply) ((font :initarg :font :type fontable))
          (:documentation "query font metrics

Queries information associated with the font."))
(defmethod send-request (conn (%obj query-font-request)) (query-font conn (slot-value %obj 'font)))
(defclass query-font-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (min-bounds :initarg :min-bounds :accessor min-bounds :type charinfo)
           (max-bounds :initarg :max-bounds :accessor max-bounds :type charinfo)
           (min-char-or-byte2 :initarg :min-char-or-byte2 :accessor min-char-or-byte2 :type
            (unsigned-byte 16))
           (max-char-or-byte2 :initarg :max-char-or-byte2 :accessor max-char-or-byte2 :type
            (unsigned-byte 16))
           (default-char :initarg :default-char :accessor default-char :type (unsigned-byte 16))
           (properties-len :initarg :properties-len :accessor properties-len :type
            (unsigned-byte 16))
           (draw-direction :initarg :draw-direction :accessor draw-direction :type
            (unsigned-byte 8))
           (min-byte1 :initarg :min-byte1 :accessor min-byte1 :type (unsigned-byte 8))
           (max-byte1 :initarg :max-byte1 :accessor max-byte1 :type (unsigned-byte 8))
           (all-chars-exist :initarg :all-chars-exist :accessor all-chars-exist :type
            (or boolean (unsigned-byte 8)))
           (font-ascent :initarg :font-ascent :accessor font-ascent :type (signed-byte 16))
           (font-descent :initarg :font-descent :accessor font-descent :type (signed-byte 16))
           (char-infos-len :initarg :char-infos-len :accessor char-infos-len :type
            (unsigned-byte 32))
           (properties :initarg :properties :accessor properties :type cl:sequence)
           (char-infos :initarg :char-infos :accessor char-infos :type cl:sequence)))
(defun decode-query-font-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        min-bounds
        max-bounds
        min-char-or-byte2
        max-char-or-byte2
        default-char
        properties-len
        draw-direction
        min-byte1
        max-byte1
        all-chars-exist
        font-ascent
        font-descent
        char-infos-len
        properties
        char-infos)
    (declare
     (ignorable %p response-type sequence length min-bounds max-bounds min-char-or-byte2
      max-char-or-byte2 default-char properties-len draw-direction min-byte1 max-byte1
      all-chars-exist font-ascent font-descent char-infos-len properties char-infos))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf min-bounds (decode-charinfo %buf (+ %p 8) %order))
    (setf max-bounds (decode-charinfo %buf (+ %p 24) %order))
    (setf min-char-or-byte2 (read-card16-at %buf (+ %p 40) %order))
    (setf max-char-or-byte2 (read-card16-at %buf (+ %p 42) %order))
    (setf default-char (read-card16-at %buf (+ %p 44) %order))
    (setf properties-len (read-card16-at %buf (+ %p 46) %order))
    (setf draw-direction (read-card8-at %buf (+ %p 48)))
    (setf min-byte1 (read-card8-at %buf (+ %p 49)))
    (setf max-byte1 (read-card8-at %buf (+ %p 50)))
    (setf all-chars-exist (read-card8-at %buf (+ %p 51)))
    (setf font-ascent (read-int16-at %buf (+ %p 52) %order))
    (setf font-descent (read-int16-at %buf (+ %p 54) %order))
    (setf char-infos-len (read-card32-at %buf (+ %p 56) %order))
    (setf %p (+ %p 60))
    (multiple-value-setq (properties %p)
      (read-struct-vector-at %buf %p (min properties-len (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fontprop))
    (multiple-value-setq (char-infos %p)
      (read-struct-vector-at %buf %p
       (min char-infos-len (floor (- (+ %pos 32 (* 4 length)) %p) 12)) %order #'decode-charinfo))
    (cl:values
     (make-instance 'query-font-reply :response-type response-type :sequence sequence :length
                    length :min-bounds min-bounds :max-bounds max-bounds :min-char-or-byte2
                    min-char-or-byte2 :max-char-or-byte2 max-char-or-byte2 :default-char
                    default-char :properties-len properties-len :draw-direction draw-direction
                    :min-byte1 min-byte1 :max-byte1 max-byte1 :all-chars-exist all-chars-exist
                    :font-ascent font-ascent :font-descent font-descent :char-infos-len
                    char-infos-len :properties properties :char-infos char-infos)
     (+ %pos 32 (* 4 length)))))
(defun query-font-reply (conn cookie) (read-reply conn cookie #'decode-query-font-reply))

;;; Request xcb.QueryTextExtents
(defun query-text-extents (conn font string)
  "get text extents

Query text extents from the X11 server. This request returns the bounding box
of the specified 16-bit character string in the specified `font` or the font
contained in the specified graphics context.

`font_ascent` is set to the maximum of the ascent metrics of all characters in
the string. `font_descent` is set to the maximum of the descent metrics.
`overall_width` is set to the sum of the character-width metrics of all
characters in the string. For each character in the string, let W be the sum of
the character-width metrics of all characters preceding it in the string. Let L
be the left-side-bearing metric of the character plus W. Let R be the
right-side-bearing metric of the character plus W. The lbearing member is set
to the minimum L of all characters in the string. The rbearing member is set to
the maximum R.

For fonts defined with linear indexing rather than 2-byte matrix indexing, each
`xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
most significant byte. If the font has no defined default character, undefined
characters in the string are taken to have all zero metrics.

Characters with all zero metrics are ignored. If the font has no defined
default_char, the undefined characters in the string are also ignored."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 48)
    (buffer-write-bool %buf (logand (cl:length string) 1))
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf font)
    (buffer-write-list %buf string nil #'encode-char2-b)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-text-extents-request (request-with-reply)
          ((odd-length :initarg :odd-length) (font :initarg :font :type fontable)
           (string :initarg :string :type cl:sequence))
          (:documentation "get text extents

Query text extents from the X11 server. This request returns the bounding box
of the specified 16-bit character string in the specified `font` or the font
contained in the specified graphics context.

`font_ascent` is set to the maximum of the ascent metrics of all characters in
the string. `font_descent` is set to the maximum of the descent metrics.
`overall_width` is set to the sum of the character-width metrics of all
characters in the string. For each character in the string, let W be the sum of
the character-width metrics of all characters preceding it in the string. Let L
be the left-side-bearing metric of the character plus W. Let R be the
right-side-bearing metric of the character plus W. The lbearing member is set
to the minimum L of all characters in the string. The rbearing member is set to
the maximum R.

For fonts defined with linear indexing rather than 2-byte matrix indexing, each
`xcb_char2b_t` structure is interpreted as a 16-bit number with byte1 as the
most significant byte. If the font has no defined default character, undefined
characters in the string are taken to have all zero metrics.

Characters with all zero metrics are ignored. If the font has no defined
default_char, the undefined characters in the string are also ignored."))
(defmethod send-request (conn (%obj query-text-extents-request))
  (query-text-extents conn (slot-value %obj 'font) (slot-value %obj 'string)))
(defclass query-text-extents-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (draw-direction :initarg :draw-direction :accessor draw-direction :type
            (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (font-ascent :initarg :font-ascent :accessor font-ascent :type (signed-byte 16))
           (font-descent :initarg :font-descent :accessor font-descent :type (signed-byte 16))
           (overall-ascent :initarg :overall-ascent :accessor overall-ascent :type
            (signed-byte 16))
           (overall-descent :initarg :overall-descent :accessor overall-descent :type
            (signed-byte 16))
           (overall-width :initarg :overall-width :accessor overall-width :type (signed-byte 32))
           (overall-left :initarg :overall-left :accessor overall-left :type (signed-byte 32))
           (overall-right :initarg :overall-right :accessor overall-right :type (signed-byte 32))))
(defun decode-query-text-extents-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        draw-direction
        sequence
        length
        font-ascent
        font-descent
        overall-ascent
        overall-descent
        overall-width
        overall-left
        overall-right)
    (declare
     (ignorable %p response-type draw-direction sequence length font-ascent font-descent
      overall-ascent overall-descent overall-width overall-left overall-right))
    (setf response-type (read-card8-at %buf %p))
    (setf draw-direction (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf font-ascent (read-int16-at %buf (+ %p 8) %order))
    (setf font-descent (read-int16-at %buf (+ %p 10) %order))
    (setf overall-ascent (read-int16-at %buf (+ %p 12) %order))
    (setf overall-descent (read-int16-at %buf (+ %p 14) %order))
    (setf overall-width (read-int32-at %buf (+ %p 16) %order))
    (setf overall-left (read-int32-at %buf (+ %p 20) %order))
    (setf overall-right (read-int32-at %buf (+ %p 24) %order))
    (cl:values
     (make-instance 'query-text-extents-reply :response-type response-type :draw-direction
                    draw-direction :sequence sequence :length length :font-ascent font-ascent
                    :font-descent font-descent :overall-ascent overall-ascent :overall-descent
                    overall-descent :overall-width overall-width :overall-left overall-left
                    :overall-right overall-right)
     (+ %pos 32 (* 4 length)))))
(defun query-text-extents-reply (conn cookie)
  (read-reply conn cookie #'decode-query-text-extents-reply))

;;; xcb.STR
(defclass str nil
          ((name-len :initarg :name-len :accessor name-len :type (unsigned-byte 8))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun encode-str (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name)) (name-len (cl:length name)))
    (declare (ignorable name name-len))
    (buffer-write-card8 %buf name-len)
    (buffer-write-string-octets %buf name name-len)))
(defun decode-str (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name-len name)
    (declare (ignorable %p name-len name))
    (setf name-len (read-card8-at %buf %p))
    (setf %p (+ %p 1))
    (setf name (read-string-at %buf %p name-len))
    (incf %p (cl:length name))
    (cl:values (make-instance 'str :name-len name-len :name name) %p)))

;;; Request xcb.ListFonts
(defun list-fonts (conn max-names pattern)
  "get matching font names

Gets a list of available font names which match the given `pattern`."
  (let* ((%buf (conn-send-buffer conn)) (pattern-len (cl:length pattern)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 49)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf max-names)
    (buffer-write-card16 %buf pattern-len)
    (buffer-write-string-octets %buf pattern pattern-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-fonts-request (request-with-reply)
          ((max-names :initarg :max-names :type (unsigned-byte 16))
           (pattern-len :initarg :pattern-len :type (unsigned-byte 16))
           (pattern :initarg :pattern :type cl:sequence))
          (:documentation "get matching font names

Gets a list of available font names which match the given `pattern`."))
(defmethod send-request (conn (%obj list-fonts-request))
  (list-fonts conn (slot-value %obj 'max-names) (slot-value %obj 'pattern)))
(defclass list-fonts-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (names-len :initarg :names-len :accessor names-len :type (unsigned-byte 16))
           (names :initarg :names :accessor names :type cl:sequence)))
(defun decode-list-fonts-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length names-len names)
    (declare (ignorable %p response-type sequence length names-len names))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf names-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (names %p)
      (read-struct-vector-at %buf %p (min names-len (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-str))
    (cl:values
     (make-instance 'list-fonts-reply :response-type response-type :sequence sequence :length
                    length :names-len names-len :names names)
     (+ %pos 32 (* 4 length)))))
(defun list-fonts-reply (conn cookie) (read-reply conn cookie #'decode-list-fonts-reply))

;;; Request xcb.ListFontsWithInfo
(defun list-fonts-with-info (conn max-names pattern)
  "get matching font names and information

Gets a list of available font names which match the given `pattern`."
  (let* ((%buf (conn-send-buffer conn)) (pattern-len (cl:length pattern)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 50)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf max-names)
    (buffer-write-card16 %buf pattern-len)
    (buffer-write-string-octets %buf pattern pattern-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-fonts-with-info-request (request-with-reply)
          ((max-names :initarg :max-names :type (unsigned-byte 16))
           (pattern-len :initarg :pattern-len :type (unsigned-byte 16))
           (pattern :initarg :pattern :type cl:sequence))
          (:documentation "get matching font names and information

Gets a list of available font names which match the given `pattern`."))
(defmethod send-request (conn (%obj list-fonts-with-info-request))
  (list-fonts-with-info conn (slot-value %obj 'max-names) (slot-value %obj 'pattern)))
(defclass list-fonts-with-info-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (min-bounds :initarg :min-bounds :accessor min-bounds :type charinfo)
           (max-bounds :initarg :max-bounds :accessor max-bounds :type charinfo)
           (min-char-or-byte2 :initarg :min-char-or-byte2 :accessor min-char-or-byte2 :type
            (unsigned-byte 16))
           (max-char-or-byte2 :initarg :max-char-or-byte2 :accessor max-char-or-byte2 :type
            (unsigned-byte 16))
           (default-char :initarg :default-char :accessor default-char :type (unsigned-byte 16))
           (properties-len :initarg :properties-len :accessor properties-len :type
            (unsigned-byte 16))
           (draw-direction :initarg :draw-direction :accessor draw-direction :type
            (unsigned-byte 8))
           (min-byte1 :initarg :min-byte1 :accessor min-byte1 :type (unsigned-byte 8))
           (max-byte1 :initarg :max-byte1 :accessor max-byte1 :type (unsigned-byte 8))
           (all-chars-exist :initarg :all-chars-exist :accessor all-chars-exist :type
            (or boolean (unsigned-byte 8)))
           (font-ascent :initarg :font-ascent :accessor font-ascent :type (signed-byte 16))
           (font-descent :initarg :font-descent :accessor font-descent :type (signed-byte 16))
           (replies-hint :initarg :replies-hint :accessor replies-hint :type (unsigned-byte 32))
           (properties :initarg :properties :accessor properties :type cl:sequence)
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-list-fonts-with-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        name-len
        sequence
        length
        min-bounds
        max-bounds
        min-char-or-byte2
        max-char-or-byte2
        default-char
        properties-len
        draw-direction
        min-byte1
        max-byte1
        all-chars-exist
        font-ascent
        font-descent
        replies-hint
        properties
        name)
    (declare
     (ignorable %p response-type name-len sequence length min-bounds max-bounds min-char-or-byte2
      max-char-or-byte2 default-char properties-len draw-direction min-byte1 max-byte1
      all-chars-exist font-ascent font-descent replies-hint properties name))
    (setf response-type (read-card8-at %buf %p))
    (setf name-len (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf min-bounds (decode-charinfo %buf (+ %p 8) %order))
    (setf max-bounds (decode-charinfo %buf (+ %p 24) %order))
    (setf min-char-or-byte2 (read-card16-at %buf (+ %p 40) %order))
    (setf max-char-or-byte2 (read-card16-at %buf (+ %p 42) %order))
    (setf default-char (read-card16-at %buf (+ %p 44) %order))
    (setf properties-len (read-card16-at %buf (+ %p 46) %order))
    (setf draw-direction (read-card8-at %buf (+ %p 48)))
    (setf min-byte1 (read-card8-at %buf (+ %p 49)))
    (setf max-byte1 (read-card8-at %buf (+ %p 50)))
    (setf all-chars-exist (read-card8-at %buf (+ %p 51)))
    (setf font-ascent (read-int16-at %buf (+ %p 52) %order))
    (setf font-descent (read-int16-at %buf (+ %p 54) %order))
    (setf replies-hint (read-card32-at %buf (+ %p 56) %order))
    (setf %p (+ %p 60))
    (multiple-value-setq (properties %p)
      (read-struct-vector-at %buf %p (min properties-len (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fontprop))
    (setf name (read-string-at %buf %p (min name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (cl:values
     (make-instance 'list-fonts-with-info-reply :response-type response-type :name-len name-len
                    :sequence sequence :length length :min-bounds min-bounds :max-bounds max-bounds
                    :min-char-or-byte2 min-char-or-byte2 :max-char-or-byte2 max-char-or-byte2
                    :default-char default-char :properties-len properties-len :draw-direction
                    draw-direction :min-byte1 min-byte1 :max-byte1 max-byte1 :all-chars-exist
                    all-chars-exist :font-ascent font-ascent :font-descent font-descent
                    :replies-hint replies-hint :properties properties :name name)
     (+ %pos 32 (* 4 length)))))
(defun list-fonts-with-info-reply (conn cookie)
  (read-reply conn cookie #'decode-list-fonts-with-info-reply))

;;; Request xcb.SetFontPath
(defun set-font-path (conn font)
  (let* ((%buf (conn-send-buffer conn)) (font-qty (cl:length font)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 51)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf font-qty)
    (buffer-write-padding %buf 2)
    (buffer-write-list %buf font font-qty #'encode-str)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-font-path-request (request)
          ((font-qty :initarg :font-qty :type (unsigned-byte 16))
           (font :initarg :font :type cl:sequence)))
(defmethod send-request (conn (%obj set-font-path-request))
  (set-font-path conn (slot-value %obj 'font)))

;;; Request xcb.GetFontPath
(defun get-font-path (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 52)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-font-path-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-font-path-request)) (get-font-path conn))
(defclass get-font-path-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (path-len :initarg :path-len :accessor path-len :type (unsigned-byte 16))
           (path :initarg :path :accessor path :type cl:sequence)))
(defun decode-get-font-path-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length path-len path)
    (declare (ignorable %p response-type sequence length path-len path))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf path-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (path %p)
      (read-struct-vector-at %buf %p (min path-len (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-str))
    (cl:values
     (make-instance 'get-font-path-reply :response-type response-type :sequence sequence :length
                    length :path-len path-len :path path)
     (+ %pos 32 (* 4 length)))))
(defun get-font-path-reply (conn cookie) (read-reply conn cookie #'decode-get-font-path-reply))

;;; Request xcb.CreatePixmap
(defun create-pixmap (conn depth pid drawable width height)
  "Creates a pixmap

Creates a pixmap. The pixmap can only be used on the same screen as `drawable`
is on and only with drawables of the same `depth`."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 53)
    (buffer-write-card8 %buf depth)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf pid)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-pixmap-request (request)
          ((depth :initarg :depth :type (unsigned-byte 8)) (pid :initarg :pid :type pixmap)
           (drawable :initarg :drawable :type drawable)
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16)))
          (:documentation "Creates a pixmap

Creates a pixmap. The pixmap can only be used on the same screen as `drawable`
is on and only with drawables of the same `depth`."))
(defmethod send-request (conn (%obj create-pixmap-request))
  (create-pixmap conn (slot-value %obj 'depth) (slot-value %obj 'pid) (slot-value %obj 'drawable)
   (slot-value %obj 'width) (slot-value %obj 'height)))

;;; Request xcb.FreePixmap
(defun free-pixmap (conn pixmap)
  "Destroys a pixmap

Deletes the association between the pixmap ID and the pixmap. The pixmap
storage will be freed when there are no more references to it."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 54)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf pixmap)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass free-pixmap-request (request) ((pixmap :initarg :pixmap :type pixmap))
          (:documentation "Destroys a pixmap

Deletes the association between the pixmap ID and the pixmap. The pixmap
storage will be freed when there are no more references to it."))
(defmethod send-request (conn (%obj free-pixmap-request))
  (free-pixmap conn (slot-value %obj 'pixmap)))

;;; Enum xcb.GC
(defenum gc
  (:function 1)
  (:plane-mask 2)
  (:foreground 4)
  (:background 8)
  (:line-width 16)
  (:line-style 32)
  (:cap-style 64)
  (:join-style 128)
  (:fill-style 256)
  (:fill-rule 512)
  (:tile 1024)
  (:stipple 2048)
  (:tile-stipple-origin-x 4096)
  (:tile-stipple-origin-y 8192)
  (:font 16384)
  (:subwindow-mode 32768)
  (:graphics-exposures 65536)
  (:clip-origin-x 131072)
  (:clip-origin-y 262144)
  (:clip-mask 524288)
  (:dash-offset 1048576)
  (:dash-list 2097152)
  (:arc-mode 4194304))

;;; Enum xcb.GX
(defenum gx
  (:clear 0)
  (:and 1)
  (:and-reverse 2)
  (:copy 3)
  (:and-inverted 4)
  (:noop 5)
  (:xor 6)
  (:or 7)
  (:nor 8)
  (:equiv 9)
  (:invert 10)
  (:or-reverse 11)
  (:copy-inverted 12)
  (:or-inverted 13)
  (:nand 14)
  (:set 15))

;;; Enum xcb.LineStyle
(defenum line-style
  (:solid 0)
  (:on-off-dash 1)
  (:double-dash 2))

;;; Enum xcb.CapStyle
(defenum cap-style
  (:not-last 0)
  (:butt 1)
  (:round 2)
  (:projecting 3))

;;; Enum xcb.JoinStyle
(defenum join-style
  (:miter 0)
  (:round 1)
  (:bevel 2))

;;; Enum xcb.FillStyle
(defenum fill-style
  (:solid 0)
  (:tiled 1)
  (:stippled 2)
  (:opaque-stippled 3))

;;; Enum xcb.FillRule
(defenum fill-rule
  (:even-odd 0)
  (:winding 1))

;;; Enum xcb.SubwindowMode
(defenum subwindow-mode
  (:clip-by-children 0)
  (:include-inferiors 1))

;;; Enum xcb.ArcMode
(defenum arc-mode
  (:chord 0)
  (:pie-slice 1))

;;; Request xcb.CreateGC
(defun create-gc
       (conn cid drawable value-mask
        &key function plane-mask foreground background line-width line-style cap-style join-style
        fill-style fill-rule tile stipple tile-stipple-x-origin tile-stipple-y-origin font
        subwindow-mode graphics-exposures clip-x-origin clip-y-origin clip-mask dash-offset dashes
        arc-mode)
  "Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable
that has the same root and depth as the specified drawable."
  (check-value-mask 'create-gc value-mask (1 :function function nil) (2 :plane-mask plane-mask nil)
   (4 :foreground foreground nil) (8 :background background nil) (16 :line-width line-width nil)
   (32 :line-style line-style nil) (64 :cap-style cap-style nil) (128 :join-style join-style nil)
   (256 :fill-style fill-style nil) (512 :fill-rule fill-rule nil) (1024 :tile tile nil)
   (2048 :stipple stipple nil) (4096 :tile-stipple-x-origin tile-stipple-x-origin nil)
   (8192 :tile-stipple-y-origin tile-stipple-y-origin nil) (16384 :font font nil)
   (32768 :subwindow-mode subwindow-mode nil) (65536 :graphics-exposures graphics-exposures nil)
   (131072 :clip-x-origin clip-x-origin nil) (262144 :clip-y-origin clip-y-origin nil)
   (524288 :clip-mask clip-mask nil) (1048576 :dash-offset dash-offset nil)
   (2097152 :dashes dashes nil) (4194304 :arc-mode arc-mode nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 55)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cid)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf function))
      (when (logtest %mask 2) (buffer-write-card32 %buf plane-mask))
      (when (logtest %mask 4) (buffer-write-card32 %buf foreground))
      (when (logtest %mask 8) (buffer-write-card32 %buf background))
      (when (logtest %mask 16) (buffer-write-card32 %buf line-width))
      (when (logtest %mask 32) (buffer-write-card32 %buf line-style))
      (when (logtest %mask 64) (buffer-write-card32 %buf cap-style))
      (when (logtest %mask 128) (buffer-write-card32 %buf join-style))
      (when (logtest %mask 256) (buffer-write-card32 %buf fill-style))
      (when (logtest %mask 512) (buffer-write-card32 %buf fill-rule))
      (when (logtest %mask 1024) (buffer-write-card32 %buf tile))
      (when (logtest %mask 2048) (buffer-write-card32 %buf stipple))
      (when (logtest %mask 4096) (buffer-write-card32 %buf tile-stipple-x-origin))
      (when (logtest %mask 8192) (buffer-write-card32 %buf tile-stipple-y-origin))
      (when (logtest %mask 16384) (buffer-write-card32 %buf font))
      (when (logtest %mask 32768) (buffer-write-card32 %buf subwindow-mode))
      (when (logtest %mask 65536) (buffer-write-card32 %buf graphics-exposures))
      (when (logtest %mask 131072) (buffer-write-card32 %buf clip-x-origin))
      (when (logtest %mask 262144) (buffer-write-card32 %buf clip-y-origin))
      (when (logtest %mask 524288) (buffer-write-card32 %buf clip-mask))
      (when (logtest %mask 1048576) (buffer-write-card32 %buf dash-offset))
      (when (logtest %mask 2097152) (buffer-write-card32 %buf dashes))
      (when (logtest %mask 4194304) (buffer-write-card32 %buf arc-mode)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-gc-request (request)
          ((cid :initarg :cid :type gcontext) (drawable :initarg :drawable :type drawable)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (function :initarg :function :type (unsigned-byte 32))
           (plane-mask :initarg :plane-mask :type (unsigned-byte 32))
           (foreground :initarg :foreground :type (unsigned-byte 32))
           (background :initarg :background :type (unsigned-byte 32))
           (line-width :initarg :line-width :type (unsigned-byte 32))
           (line-style :initarg :line-style :type (unsigned-byte 32))
           (cap-style :initarg :cap-style :type (unsigned-byte 32))
           (join-style :initarg :join-style :type (unsigned-byte 32))
           (fill-style :initarg :fill-style :type (unsigned-byte 32))
           (fill-rule :initarg :fill-rule :type (unsigned-byte 32))
           (tile :initarg :tile :type pixmap) (stipple :initarg :stipple :type pixmap)
           (tile-stipple-x-origin :initarg :tile-stipple-x-origin :type (signed-byte 32))
           (tile-stipple-y-origin :initarg :tile-stipple-y-origin :type (signed-byte 32))
           (font :initarg :font :type font)
           (subwindow-mode :initarg :subwindow-mode :type (unsigned-byte 32))
           (graphics-exposures :initarg :graphics-exposures :type bool32)
           (clip-x-origin :initarg :clip-x-origin :type (signed-byte 32))
           (clip-y-origin :initarg :clip-y-origin :type (signed-byte 32))
           (clip-mask :initarg :clip-mask :type pixmap)
           (dash-offset :initarg :dash-offset :type (unsigned-byte 32))
           (dashes :initarg :dashes :type (unsigned-byte 32))
           (arc-mode :initarg :arc-mode :type (unsigned-byte 32)))
          (:documentation "Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable
that has the same root and depth as the specified drawable."))
(defmethod send-request (conn (%obj create-gc-request))
  (apply #'create-gc conn (slot-value %obj 'cid) (slot-value %obj 'drawable)
         (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'function) (list :function (slot-value %obj 'function)))
                (when (slot-boundp %obj 'plane-mask)
                  (list :plane-mask (slot-value %obj 'plane-mask)))
                (when (slot-boundp %obj 'foreground)
                  (list :foreground (slot-value %obj 'foreground)))
                (when (slot-boundp %obj 'background)
                  (list :background (slot-value %obj 'background)))
                (when (slot-boundp %obj 'line-width)
                  (list :line-width (slot-value %obj 'line-width)))
                (when (slot-boundp %obj 'line-style)
                  (list :line-style (slot-value %obj 'line-style)))
                (when (slot-boundp %obj 'cap-style) (list :cap-style (slot-value %obj 'cap-style)))
                (when (slot-boundp %obj 'join-style)
                  (list :join-style (slot-value %obj 'join-style)))
                (when (slot-boundp %obj 'fill-style)
                  (list :fill-style (slot-value %obj 'fill-style)))
                (when (slot-boundp %obj 'fill-rule) (list :fill-rule (slot-value %obj 'fill-rule)))
                (when (slot-boundp %obj 'tile) (list :tile (slot-value %obj 'tile)))
                (when (slot-boundp %obj 'stipple) (list :stipple (slot-value %obj 'stipple)))
                (when (slot-boundp %obj 'tile-stipple-x-origin)
                  (list :tile-stipple-x-origin (slot-value %obj 'tile-stipple-x-origin)))
                (when (slot-boundp %obj 'tile-stipple-y-origin)
                  (list :tile-stipple-y-origin (slot-value %obj 'tile-stipple-y-origin)))
                (when (slot-boundp %obj 'font) (list :font (slot-value %obj 'font)))
                (when (slot-boundp %obj 'subwindow-mode)
                  (list :subwindow-mode (slot-value %obj 'subwindow-mode)))
                (when (slot-boundp %obj 'graphics-exposures)
                  (list :graphics-exposures (slot-value %obj 'graphics-exposures)))
                (when (slot-boundp %obj 'clip-x-origin)
                  (list :clip-x-origin (slot-value %obj 'clip-x-origin)))
                (when (slot-boundp %obj 'clip-y-origin)
                  (list :clip-y-origin (slot-value %obj 'clip-y-origin)))
                (when (slot-boundp %obj 'clip-mask) (list :clip-mask (slot-value %obj 'clip-mask)))
                (when (slot-boundp %obj 'dash-offset)
                  (list :dash-offset (slot-value %obj 'dash-offset)))
                (when (slot-boundp %obj 'dashes) (list :dashes (slot-value %obj 'dashes)))
                (when (slot-boundp %obj 'arc-mode) (list :arc-mode (slot-value %obj 'arc-mode))))))

;;; Request xcb.ChangeGC
(defun change-gc
       (conn gc value-mask
        &key function plane-mask foreground background line-width line-style cap-style join-style
        fill-style fill-rule tile stipple tile-stipple-x-origin tile-stipple-y-origin font
        subwindow-mode graphics-exposures clip-x-origin clip-y-origin clip-mask dash-offset dashes
        arc-mode)
  "change graphics context components

Changes the components specified by `value_mask` for the specified graphics context."
  (check-value-mask 'change-gc value-mask (1 :function function nil) (2 :plane-mask plane-mask nil)
   (4 :foreground foreground nil) (8 :background background nil) (16 :line-width line-width nil)
   (32 :line-style line-style nil) (64 :cap-style cap-style nil) (128 :join-style join-style nil)
   (256 :fill-style fill-style nil) (512 :fill-rule fill-rule nil) (1024 :tile tile nil)
   (2048 :stipple stipple nil) (4096 :tile-stipple-x-origin tile-stipple-x-origin nil)
   (8192 :tile-stipple-y-origin tile-stipple-y-origin nil) (16384 :font font nil)
   (32768 :subwindow-mode subwindow-mode nil) (65536 :graphics-exposures graphics-exposures nil)
   (131072 :clip-x-origin clip-x-origin nil) (262144 :clip-y-origin clip-y-origin nil)
   (524288 :clip-mask clip-mask nil) (1048576 :dash-offset dash-offset nil)
   (2097152 :dashes dashes nil) (4194304 :arc-mode arc-mode nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 56)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf gc)
    (buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf function))
      (when (logtest %mask 2) (buffer-write-card32 %buf plane-mask))
      (when (logtest %mask 4) (buffer-write-card32 %buf foreground))
      (when (logtest %mask 8) (buffer-write-card32 %buf background))
      (when (logtest %mask 16) (buffer-write-card32 %buf line-width))
      (when (logtest %mask 32) (buffer-write-card32 %buf line-style))
      (when (logtest %mask 64) (buffer-write-card32 %buf cap-style))
      (when (logtest %mask 128) (buffer-write-card32 %buf join-style))
      (when (logtest %mask 256) (buffer-write-card32 %buf fill-style))
      (when (logtest %mask 512) (buffer-write-card32 %buf fill-rule))
      (when (logtest %mask 1024) (buffer-write-card32 %buf tile))
      (when (logtest %mask 2048) (buffer-write-card32 %buf stipple))
      (when (logtest %mask 4096) (buffer-write-card32 %buf tile-stipple-x-origin))
      (when (logtest %mask 8192) (buffer-write-card32 %buf tile-stipple-y-origin))
      (when (logtest %mask 16384) (buffer-write-card32 %buf font))
      (when (logtest %mask 32768) (buffer-write-card32 %buf subwindow-mode))
      (when (logtest %mask 65536) (buffer-write-card32 %buf graphics-exposures))
      (when (logtest %mask 131072) (buffer-write-card32 %buf clip-x-origin))
      (when (logtest %mask 262144) (buffer-write-card32 %buf clip-y-origin))
      (when (logtest %mask 524288) (buffer-write-card32 %buf clip-mask))
      (when (logtest %mask 1048576) (buffer-write-card32 %buf dash-offset))
      (when (logtest %mask 2097152) (buffer-write-card32 %buf dashes))
      (when (logtest %mask 4194304) (buffer-write-card32 %buf arc-mode)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-gc-request (request)
          ((gc :initarg :gc :type gcontext)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (function :initarg :function :type (unsigned-byte 32))
           (plane-mask :initarg :plane-mask :type (unsigned-byte 32))
           (foreground :initarg :foreground :type (unsigned-byte 32))
           (background :initarg :background :type (unsigned-byte 32))
           (line-width :initarg :line-width :type (unsigned-byte 32))
           (line-style :initarg :line-style :type (unsigned-byte 32))
           (cap-style :initarg :cap-style :type (unsigned-byte 32))
           (join-style :initarg :join-style :type (unsigned-byte 32))
           (fill-style :initarg :fill-style :type (unsigned-byte 32))
           (fill-rule :initarg :fill-rule :type (unsigned-byte 32))
           (tile :initarg :tile :type pixmap) (stipple :initarg :stipple :type pixmap)
           (tile-stipple-x-origin :initarg :tile-stipple-x-origin :type (signed-byte 32))
           (tile-stipple-y-origin :initarg :tile-stipple-y-origin :type (signed-byte 32))
           (font :initarg :font :type font)
           (subwindow-mode :initarg :subwindow-mode :type (unsigned-byte 32))
           (graphics-exposures :initarg :graphics-exposures :type bool32)
           (clip-x-origin :initarg :clip-x-origin :type (signed-byte 32))
           (clip-y-origin :initarg :clip-y-origin :type (signed-byte 32))
           (clip-mask :initarg :clip-mask :type pixmap)
           (dash-offset :initarg :dash-offset :type (unsigned-byte 32))
           (dashes :initarg :dashes :type (unsigned-byte 32))
           (arc-mode :initarg :arc-mode :type (unsigned-byte 32)))
          (:documentation "change graphics context components

Changes the components specified by `value_mask` for the specified graphics context."))
(defmethod send-request (conn (%obj change-gc-request))
  (apply #'change-gc conn (slot-value %obj 'gc) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'function) (list :function (slot-value %obj 'function)))
                (when (slot-boundp %obj 'plane-mask)
                  (list :plane-mask (slot-value %obj 'plane-mask)))
                (when (slot-boundp %obj 'foreground)
                  (list :foreground (slot-value %obj 'foreground)))
                (when (slot-boundp %obj 'background)
                  (list :background (slot-value %obj 'background)))
                (when (slot-boundp %obj 'line-width)
                  (list :line-width (slot-value %obj 'line-width)))
                (when (slot-boundp %obj 'line-style)
                  (list :line-style (slot-value %obj 'line-style)))
                (when (slot-boundp %obj 'cap-style) (list :cap-style (slot-value %obj 'cap-style)))
                (when (slot-boundp %obj 'join-style)
                  (list :join-style (slot-value %obj 'join-style)))
                (when (slot-boundp %obj 'fill-style)
                  (list :fill-style (slot-value %obj 'fill-style)))
                (when (slot-boundp %obj 'fill-rule) (list :fill-rule (slot-value %obj 'fill-rule)))
                (when (slot-boundp %obj 'tile) (list :tile (slot-value %obj 'tile)))
                (when (slot-boundp %obj 'stipple) (list :stipple (slot-value %obj 'stipple)))
                (when (slot-boundp %obj 'tile-stipple-x-origin)
                  (list :tile-stipple-x-origin (slot-value %obj 'tile-stipple-x-origin)))
                (when (slot-boundp %obj 'tile-stipple-y-origin)
                  (list :tile-stipple-y-origin (slot-value %obj 'tile-stipple-y-origin)))
                (when (slot-boundp %obj 'font) (list :font (slot-value %obj 'font)))
                (when (slot-boundp %obj 'subwindow-mode)
                  (list :subwindow-mode (slot-value %obj 'subwindow-mode)))
                (when (slot-boundp %obj 'graphics-exposures)
                  (list :graphics-exposures (slot-value %obj 'graphics-exposures)))
                (when (slot-boundp %obj 'clip-x-origin)
                  (list :clip-x-origin (slot-value %obj 'clip-x-origin)))
                (when (slot-boundp %obj 'clip-y-origin)
                  (list :clip-y-origin (slot-value %obj 'clip-y-origin)))
                (when (slot-boundp %obj 'clip-mask) (list :clip-mask (slot-value %obj 'clip-mask)))
                (when (slot-boundp %obj 'dash-offset)
                  (list :dash-offset (slot-value %obj 'dash-offset)))
                (when (slot-boundp %obj 'dashes) (list :dashes (slot-value %obj 'dashes)))
                (when (slot-boundp %obj 'arc-mode) (list :arc-mode (slot-value %obj 'arc-mode))))))

;;; Request xcb.CopyGC
(defun copy-gc (conn src-gc dst-gc value-mask)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 57)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf src-gc)
    (buffer-write-card32 %buf dst-gc)
    (buffer-write-card32 %buf value-mask)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass copy-gc-request (request)
          ((src-gc :initarg :src-gc :type gcontext) (dst-gc :initarg :dst-gc :type gcontext)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))))
(defmethod send-request (conn (%obj copy-gc-request))
  (copy-gc conn (slot-value %obj 'src-gc) (slot-value %obj 'dst-gc) (slot-value %obj 'value-mask)))

;;; Request xcb.SetDashes
(defun set-dashes (conn gc dash-offset dashes)
  (let* ((%buf (conn-send-buffer conn)) (dashes-len (cl:length dashes)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 58)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf dash-offset)
    (buffer-write-card16 %buf dashes-len)
    (buffer-write-octets %buf dashes :end dashes-len)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-dashes-request (request)
          ((gc :initarg :gc :type gcontext)
           (dash-offset :initarg :dash-offset :type (unsigned-byte 16))
           (dashes-len :initarg :dashes-len :type (unsigned-byte 16))
           (dashes :initarg :dashes :type cl:sequence)))
(defmethod send-request (conn (%obj set-dashes-request))
  (set-dashes conn (slot-value %obj 'gc) (slot-value %obj 'dash-offset) (slot-value %obj 'dashes)))

;;; Enum xcb.ClipOrdering
(defenum clip-ordering
  (:unsorted 0)
  (:y-sorted 1)
  (:yx-sorted 2)
  (:yx-banded 3))

;;; Request xcb.SetClipRectangles
(defun set-clip-rectangles (conn ordering gc clip-x-origin clip-y-origin rectangles)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 59)
    (buffer-write-card8 %buf ordering)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf clip-x-origin)
    (buffer-write-card16 %buf clip-y-origin)
    (buffer-write-struct-list-16 %buf rectangles #'encode-rectangle 4)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-clip-rectangles-request (request)
          ((ordering :initarg :ordering :type (unsigned-byte 8)) (gc :initarg :gc :type gcontext)
           (clip-x-origin :initarg :clip-x-origin :type (signed-byte 16))
           (clip-y-origin :initarg :clip-y-origin :type (signed-byte 16))
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod send-request (conn (%obj set-clip-rectangles-request))
  (set-clip-rectangles conn (slot-value %obj 'ordering) (slot-value %obj 'gc)
   (slot-value %obj 'clip-x-origin) (slot-value %obj 'clip-y-origin) (slot-value %obj 'rectangles)))

;;; Request xcb.FreeGC
(defun free-gc (conn gc)
  "Destroys a graphics context

Destroys the specified `gc` and all associated storage."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 60)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf gc)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass free-gc-request (request) ((gc :initarg :gc :type gcontext))
          (:documentation "Destroys a graphics context

Destroys the specified `gc` and all associated storage."))
(defmethod send-request (conn (%obj free-gc-request)) (free-gc conn (slot-value %obj 'gc)))

;;; Request xcb.ClearArea
(defun clear-area (conn exposures window x y width height)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 61)
    (buffer-write-bool %buf exposures)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass clear-area-request (request)
          ((exposures :initarg :exposures :type (or boolean (unsigned-byte 8)))
           (window :initarg :window :type window) (x :initarg :x :type (signed-byte 16))
           (y :initarg :y :type (signed-byte 16)) (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj clear-area-request))
  (clear-area conn (slot-value %obj 'exposures) (slot-value %obj 'window) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'width) (slot-value %obj 'height)))

;;; Request xcb.CopyArea
(defun copy-area (conn src-drawable dst-drawable gc src-x src-y dst-x dst-y width height)
  "copy areas

Copies the specified rectangle from `src_drawable` to `dst_drawable`."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 62)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf src-drawable)
    (buffer-write-card32 %buf dst-drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf src-x)
    (buffer-write-card16 %buf src-y)
    (buffer-write-card16 %buf dst-x)
    (buffer-write-card16 %buf dst-y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass copy-area-request (request)
          ((src-drawable :initarg :src-drawable :type drawable)
           (dst-drawable :initarg :dst-drawable :type drawable) (gc :initarg :gc :type gcontext)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (dst-x :initarg :dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :type (signed-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16)))
          (:documentation "copy areas

Copies the specified rectangle from `src_drawable` to `dst_drawable`."))
(defmethod send-request (conn (%obj copy-area-request))
  (copy-area conn (slot-value %obj 'src-drawable) (slot-value %obj 'dst-drawable)
   (slot-value %obj 'gc) (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'dst-x)
   (slot-value %obj 'dst-y) (slot-value %obj 'width) (slot-value %obj 'height)))

;;; Request xcb.CopyPlane
(defun copy-plane
       (conn src-drawable dst-drawable gc src-x src-y dst-x dst-y width height bit-plane)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 63)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf src-drawable)
    (buffer-write-card32 %buf dst-drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf src-x)
    (buffer-write-card16 %buf src-y)
    (buffer-write-card16 %buf dst-x)
    (buffer-write-card16 %buf dst-y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card32 %buf bit-plane)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass copy-plane-request (request)
          ((src-drawable :initarg :src-drawable :type drawable)
           (dst-drawable :initarg :dst-drawable :type drawable) (gc :initarg :gc :type gcontext)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (dst-x :initarg :dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :type (signed-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (bit-plane :initarg :bit-plane :type (unsigned-byte 32))))
(defmethod send-request (conn (%obj copy-plane-request))
  (copy-plane conn (slot-value %obj 'src-drawable) (slot-value %obj 'dst-drawable)
   (slot-value %obj 'gc) (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'dst-x)
   (slot-value %obj 'dst-y) (slot-value %obj 'width) (slot-value %obj 'height)
   (slot-value %obj 'bit-plane)))

;;; Enum xcb.CoordMode
(defenum coord-mode
  (:origin 0)
  (:previous 1))

;;; Request xcb.PolyPoint
(defun poly-point (conn coordinate-mode drawable gc points)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 64)
    (buffer-write-card8 %buf coordinate-mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf points #'encode-point 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-point-request (request)
          ((coordinate-mode :initarg :coordinate-mode :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (points :initarg :points :type cl:sequence)))
(defmethod send-request (conn (%obj poly-point-request))
  (poly-point conn (slot-value %obj 'coordinate-mode) (slot-value %obj 'drawable)
   (slot-value %obj 'gc) (slot-value %obj 'points)))

;;; Request xcb.PolyLine
(defun poly-line (conn coordinate-mode drawable gc points)
  "draw lines

Draws `points_len`-1 lines between each pair of points (point[i], point[i+1])
in the `points` array. The lines are drawn in the order listed in the array.
They join correctly at all intermediate points, and if the first and last
points coincide, the first and last lines also join correctly. For any given
line, a pixel is not drawn more than once. If thin (zero line-width) lines
intersect, the intersecting pixels are drawn multiple times. If wide lines
intersect, the intersecting pixels are drawn only once, as though the entire
request were a single, filled shape."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 65)
    (buffer-write-card8 %buf coordinate-mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf points #'encode-point 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-line-request (request)
          ((coordinate-mode :initarg :coordinate-mode :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (points :initarg :points :type cl:sequence))
          (:documentation "draw lines

Draws `points_len`-1 lines between each pair of points (point[i], point[i+1])
in the `points` array. The lines are drawn in the order listed in the array.
They join correctly at all intermediate points, and if the first and last
points coincide, the first and last lines also join correctly. For any given
line, a pixel is not drawn more than once. If thin (zero line-width) lines
intersect, the intersecting pixels are drawn multiple times. If wide lines
intersect, the intersecting pixels are drawn only once, as though the entire
request were a single, filled shape."))
(defmethod send-request (conn (%obj poly-line-request))
  (poly-line conn (slot-value %obj 'coordinate-mode) (slot-value %obj 'drawable)
   (slot-value %obj 'gc) (slot-value %obj 'points)))

;;; xcb.SEGMENT
(defclass segment nil
          ((x1 :initarg :x1 :accessor x1 :type (signed-byte 16))
           (y1 :initarg :y1 :accessor y1 :type (signed-byte 16))
           (x2 :initarg :x2 :accessor x2 :type (signed-byte 16))
           (y2 :initarg :y2 :accessor y2 :type (signed-byte 16))))
(defun encode-segment (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x1 (slot-value %obj 'x1))
         (y1 (slot-value %obj 'y1))
         (x2 (slot-value %obj 'x2))
         (y2 (slot-value %obj 'y2)))
    (declare (ignorable x1 y1 x2 y2))
    (buffer-write-card16 %buf x1)
    (buffer-write-card16 %buf y1)
    (buffer-write-card16 %buf x2)
    (buffer-write-card16 %buf y2)))
(defun decode-segment (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x1 y1 x2 y2)
    (declare (ignorable %p x1 y1 x2 y2))
    (setf x1 (read-int16-at %buf %p %order))
    (setf y1 (read-int16-at %buf (+ %p 2) %order))
    (setf x2 (read-int16-at %buf (+ %p 4) %order))
    (setf y2 (read-int16-at %buf (+ %p 6) %order))
    (cl:values (make-instance 'segment :x1 x1 :y1 y1 :x2 x2 :y2 y2) (+ %p 8))))

;;; Request xcb.PolySegment
(defun poly-segment (conn drawable gc segments)
  "draw lines

Draws multiple, unconnected lines. For each segment, a line is drawn between
(x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
`xcb_segment_t` structures and does not perform joining at coincident
endpoints. For any given line, a pixel is not drawn more than once. If lines
intersect, the intersecting pixels are drawn multiple times.

TODO: include the xcb_segment_t data structure

TODO: an example"
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 66)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf segments #'encode-segment 4)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-segment-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (segments :initarg :segments :type cl:sequence))
          (:documentation "draw lines

Draws multiple, unconnected lines. For each segment, a line is drawn between
(x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of
`xcb_segment_t` structures and does not perform joining at coincident
endpoints. For any given line, a pixel is not drawn more than once. If lines
intersect, the intersecting pixels are drawn multiple times.

TODO: include the xcb_segment_t data structure

TODO: an example"))
(defmethod send-request (conn (%obj poly-segment-request))
  (poly-segment conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'segments)))

;;; Request xcb.PolyRectangle
(defun poly-rectangle (conn drawable gc rectangles)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 67)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf rectangles #'encode-rectangle 4)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-rectangle-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod send-request (conn (%obj poly-rectangle-request))
  (poly-rectangle conn (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'rectangles)))

;;; Request xcb.PolyArc
(defun poly-arc (conn drawable gc arcs)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 68)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf arcs #'encode-arc 6)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-arc-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (arcs :initarg :arcs :type cl:sequence)))
(defmethod send-request (conn (%obj poly-arc-request))
  (poly-arc conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'arcs)))

;;; Enum xcb.PolyShape
(defenum poly-shape
  (:complex 0)
  (:nonconvex 1)
  (:convex 2))

;;; Request xcb.FillPoly
(defun fill-poly (conn drawable gc shape coordinate-mode points)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 69)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card8 %buf shape)
    (buffer-write-card8 %buf coordinate-mode)
    (buffer-write-padding %buf 2)
    (buffer-write-struct-list-16 %buf points #'encode-point 2)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass fill-poly-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (shape :initarg :shape :type (unsigned-byte 8))
           (coordinate-mode :initarg :coordinate-mode :type (unsigned-byte 8))
           (points :initarg :points :type cl:sequence)))
(defmethod send-request (conn (%obj fill-poly-request))
  (fill-poly conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'shape)
   (slot-value %obj 'coordinate-mode) (slot-value %obj 'points)))

;;; Request xcb.PolyFillRectangle
(defun poly-fill-rectangle (conn drawable gc rectangles)
  "Fills rectangles

Fills the specified rectangle(s) in the order listed in the array. For any
given rectangle, each pixel is not drawn more than once. If rectangles
intersect, the intersecting pixels are drawn multiple times."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 70)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf rectangles #'encode-rectangle 4)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-fill-rectangle-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (rectangles :initarg :rectangles :type cl:sequence))
          (:documentation "Fills rectangles

Fills the specified rectangle(s) in the order listed in the array. For any
given rectangle, each pixel is not drawn more than once. If rectangles
intersect, the intersecting pixels are drawn multiple times."))
(defmethod send-request (conn (%obj poly-fill-rectangle-request))
  (poly-fill-rectangle conn (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'rectangles)))

;;; Request xcb.PolyFillArc
(defun poly-fill-arc (conn drawable gc arcs)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 71)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-struct-list-16 %buf arcs #'encode-arc 6)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-fill-arc-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (arcs :initarg :arcs :type cl:sequence)))
(defmethod send-request (conn (%obj poly-fill-arc-request))
  (poly-fill-arc conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'arcs)))

;;; Enum xcb.ImageFormat
(defenum image-format
  (:xy-bitmap 0)
  (:xy-pixmap 1)
  (:z-pixmap 2))

;;; Request xcb.PutImage
(defun put-image (conn format drawable gc width height dst-x dst-y left-pad depth data)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 72)
    (buffer-write-card8 %buf format)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card16 %buf dst-x)
    (buffer-write-card16 %buf dst-y)
    (buffer-write-card8 %buf left-pad)
    (buffer-write-card8 %buf depth)
    (buffer-write-padding %buf 2)
    (buffer-write-octets %buf data)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass put-image-request (request)
          ((format :initarg :format :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (dst-x :initarg :dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :type (signed-byte 16))
           (left-pad :initarg :left-pad :type (unsigned-byte 8))
           (depth :initarg :depth :type (unsigned-byte 8)) (data :initarg :data :type cl:sequence)))
(defmethod send-request (conn (%obj put-image-request))
  (put-image conn (slot-value %obj 'format) (slot-value %obj 'drawable) (slot-value %obj 'gc)
   (slot-value %obj 'width) (slot-value %obj 'height) (slot-value %obj 'dst-x)
   (slot-value %obj 'dst-y) (slot-value %obj 'left-pad) (slot-value %obj 'depth)
   (slot-value %obj 'data)))

;;; Request xcb.GetImage
(defun get-image (conn format drawable x y width height plane-mask)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 73)
    (buffer-write-card8 %buf format)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-write-card32 %buf plane-mask)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-image-request (request-with-reply)
          ((format :initarg :format :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (x :initarg :x :type (signed-byte 16))
           (y :initarg :y :type (signed-byte 16)) (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (plane-mask :initarg :plane-mask :type (unsigned-byte 32))))
(defmethod send-request (conn (%obj get-image-request))
  (get-image conn (slot-value %obj 'format) (slot-value %obj 'drawable) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'width) (slot-value %obj 'height)
   (slot-value %obj 'plane-mask)))
(defclass get-image-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (visual :initarg :visual :accessor visual :type visualid)
           (data :initarg :data :accessor data :type cl:sequence)))
(defun decode-get-image-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type depth sequence length visual data)
    (declare (ignorable %p response-type depth sequence length visual data))
    (setf response-type (read-card8-at %buf %p))
    (setf depth (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf visual (read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (data %p)
      (read-vector-at %buf %p (min (* length 4) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-image-reply :response-type response-type :depth depth :sequence sequence
                    :length length :visual visual :data data)
     (+ %pos 32 (* 4 length)))))
(defun get-image-reply (conn cookie) (read-reply conn cookie #'decode-get-image-reply))

;;; Request xcb.PolyText8
(defun poly-text8 (conn drawable gc x y items)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 74)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-octets %buf items)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-text8-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16))
           (items :initarg :items :type cl:sequence)))
(defmethod send-request (conn (%obj poly-text8-request))
  (poly-text8 conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'items)))

;;; Request xcb.PolyText16
(defun poly-text16 (conn drawable gc x y items)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 75)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-octets %buf items)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass poly-text16-request (request)
          ((drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16))
           (items :initarg :items :type cl:sequence)))
(defmethod send-request (conn (%obj poly-text16-request))
  (poly-text16 conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'items)))

;;; Request xcb.ImageText8
(defun image-text8 (conn drawable gc x y string)
  "Draws text

Fills the destination rectangle with the background pixel from `gc`, then
paints the text with the foreground pixel from `gc`. The upper-left corner of
the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
the height is font-ascent + font-descent. The overall-width, font-ascent and
font-descent are as returned by `xcb_query_text_extents` (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of
client-side rendering using Xft."
  (let* ((%buf (conn-send-buffer conn)) (string-len (cl:length string)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 76)
    (buffer-write-card8 %buf string-len)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-string-octets %buf string string-len)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass image-text8-request (request)
          ((string-len :initarg :string-len :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16))
           (string :initarg :string :type cl:sequence))
          (:documentation "Draws text

Fills the destination rectangle with the background pixel from `gc`, then
paints the text with the foreground pixel from `gc`. The upper-left corner of
the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
the height is font-ascent + font-descent. The overall-width, font-ascent and
font-descent are as returned by `xcb_query_text_extents` (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of
client-side rendering using Xft."))
(defmethod send-request (conn (%obj image-text8-request))
  (image-text8 conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'string)))

;;; Request xcb.ImageText16
(defun image-text16 (conn drawable gc x y string)
  "Draws text

Fills the destination rectangle with the background pixel from `gc`, then
paints the text with the foreground pixel from `gc`. The upper-left corner of
the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
the height is font-ascent + font-descent. The overall-width, font-ascent and
font-descent are as returned by `xcb_query_text_extents` (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of
client-side rendering using Xft."
  (let* ((%buf (conn-send-buffer conn)) (string-len (cl:length string)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 77)
    (buffer-write-card8 %buf string-len)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card32 %buf gc)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-write-list %buf string string-len #'encode-char2-b)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass image-text16-request (request)
          ((string-len :initarg :string-len :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable) (gc :initarg :gc :type gcontext)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16))
           (string :initarg :string :type cl:sequence))
          (:documentation "Draws text

Fills the destination rectangle with the background pixel from `gc`, then
paints the text with the foreground pixel from `gc`. The upper-left corner of
the filled rectangle is at [x, y - font-ascent]. The width is overall-width,
the height is font-ascent + font-descent. The overall-width, font-ascent and
font-descent are as returned by `xcb_query_text_extents` (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of
client-side rendering using Xft."))
(defmethod send-request (conn (%obj image-text16-request))
  (image-text16 conn (slot-value %obj 'drawable) (slot-value %obj 'gc) (slot-value %obj 'x)
   (slot-value %obj 'y) (slot-value %obj 'string)))

;;; Enum xcb.ColormapAlloc
(defenum colormap-alloc
  (:none 0)
  (:all 1))

;;; Request xcb.CreateColormap
(defun create-colormap (conn alloc mid window visual)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 78)
    (buffer-write-card8 %buf alloc)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf mid)
    (buffer-write-card32 %buf window)
    (buffer-write-card32 %buf visual)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-colormap-request (request)
          ((alloc :initarg :alloc :type (unsigned-byte 8)) (mid :initarg :mid :type colormap)
           (window :initarg :window :type window) (visual :initarg :visual :type visualid)))
(defmethod send-request (conn (%obj create-colormap-request))
  (create-colormap conn (slot-value %obj 'alloc) (slot-value %obj 'mid) (slot-value %obj 'window)
   (slot-value %obj 'visual)))

;;; Request xcb.FreeColormap
(defun free-colormap (conn cmap)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 79)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass free-colormap-request (request) ((cmap :initarg :cmap :type colormap)))
(defmethod send-request (conn (%obj free-colormap-request))
  (free-colormap conn (slot-value %obj 'cmap)))

;;; Request xcb.CopyColormapAndFree
(defun copy-colormap-and-free (conn mid src-cmap)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 80)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf mid)
    (buffer-write-card32 %buf src-cmap)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass copy-colormap-and-free-request (request)
          ((mid :initarg :mid :type colormap) (src-cmap :initarg :src-cmap :type colormap)))
(defmethod send-request (conn (%obj copy-colormap-and-free-request))
  (copy-colormap-and-free conn (slot-value %obj 'mid) (slot-value %obj 'src-cmap)))

;;; Request xcb.InstallColormap
(defun install-colormap (conn cmap)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 81)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass install-colormap-request (request) ((cmap :initarg :cmap :type colormap)))
(defmethod send-request (conn (%obj install-colormap-request))
  (install-colormap conn (slot-value %obj 'cmap)))

;;; Request xcb.UninstallColormap
(defun uninstall-colormap (conn cmap)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 82)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass uninstall-colormap-request (request) ((cmap :initarg :cmap :type colormap)))
(defmethod send-request (conn (%obj uninstall-colormap-request))
  (uninstall-colormap conn (slot-value %obj 'cmap)))

;;; Request xcb.ListInstalledColormaps
(defun list-installed-colormaps (conn window)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 83)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-installed-colormaps-request (request-with-reply)
          ((window :initarg :window :type window)))
(defmethod send-request (conn (%obj list-installed-colormaps-request))
  (list-installed-colormaps conn (slot-value %obj 'window)))
(defclass list-installed-colormaps-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (cmaps-len :initarg :cmaps-len :accessor cmaps-len :type (unsigned-byte 16))
           (cmaps :initarg :cmaps :accessor cmaps :type cl:sequence)))
(defun decode-list-installed-colormaps-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length cmaps-len cmaps)
    (declare (ignorable %p response-type sequence length cmaps-len cmaps))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf cmaps-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (cmaps %p)
      (read-vector-at %buf %p (min cmaps-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'list-installed-colormaps-reply :response-type response-type :sequence sequence
                    :length length :cmaps-len cmaps-len :cmaps cmaps)
     (+ %pos 32 (* 4 length)))))
(defun list-installed-colormaps-reply (conn cookie)
  (read-reply conn cookie #'decode-list-installed-colormaps-reply))

;;; Request xcb.AllocColor
(defun alloc-color (conn cmap red green blue)
  "Allocate a color

Allocates a read-only colormap entry corresponding to the closest RGB value
supported by the hardware. If you are using TrueColor, you can take a shortcut
and directly calculate the color pixel value to avoid the round trip. But, for
example, on 16-bit color setups (VNC), you can easily get the closest supported
RGB value to the RGB value you are specifying."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 84)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card16 %buf red)
    (buffer-write-card16 %buf green)
    (buffer-write-card16 %buf blue)
    (buffer-write-padding %buf 2)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass alloc-color-request (request-with-reply)
          ((cmap :initarg :cmap :type colormap) (red :initarg :red :type (unsigned-byte 16))
           (green :initarg :green :type (unsigned-byte 16))
           (blue :initarg :blue :type (unsigned-byte 16)))
          (:documentation "Allocate a color

Allocates a read-only colormap entry corresponding to the closest RGB value
supported by the hardware. If you are using TrueColor, you can take a shortcut
and directly calculate the color pixel value to avoid the round trip. But, for
example, on 16-bit color setups (VNC), you can easily get the closest supported
RGB value to the RGB value you are specifying."))
(defmethod send-request (conn (%obj alloc-color-request))
  (alloc-color conn (slot-value %obj 'cmap) (slot-value %obj 'red) (slot-value %obj 'green)
   (slot-value %obj 'blue)))
(defclass alloc-color-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (red :initarg :red :accessor red :type (unsigned-byte 16))
           (green :initarg :green :accessor green :type (unsigned-byte 16))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 16))
           (pixel :initarg :pixel :accessor pixel :type (unsigned-byte 32))))
(defun decode-alloc-color-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length red green blue pixel)
    (declare (ignorable %p response-type sequence length red green blue pixel))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf red (read-card16-at %buf (+ %p 8) %order))
    (setf green (read-card16-at %buf (+ %p 10) %order))
    (setf blue (read-card16-at %buf (+ %p 12) %order))
    (setf pixel (read-card32-at %buf (+ %p 16) %order))
    (cl:values
     (make-instance 'alloc-color-reply :response-type response-type :sequence sequence :length
                    length :red red :green green :blue blue :pixel pixel)
     (+ %pos 32 (* 4 length)))))
(defun alloc-color-reply (conn cookie) (read-reply conn cookie #'decode-alloc-color-reply))

;;; Request xcb.AllocNamedColor
(defun alloc-named-color (conn cmap name)
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 85)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass alloc-named-color-request (request-with-reply)
          ((cmap :initarg :cmap :type colormap)
           (name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod send-request (conn (%obj alloc-named-color-request))
  (alloc-named-color conn (slot-value %obj 'cmap) (slot-value %obj 'name)))
(defclass alloc-named-color-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pixel :initarg :pixel :accessor pixel :type (unsigned-byte 32))
           (exact-red :initarg :exact-red :accessor exact-red :type (unsigned-byte 16))
           (exact-green :initarg :exact-green :accessor exact-green :type (unsigned-byte 16))
           (exact-blue :initarg :exact-blue :accessor exact-blue :type (unsigned-byte 16))
           (visual-red :initarg :visual-red :accessor visual-red :type (unsigned-byte 16))
           (visual-green :initarg :visual-green :accessor visual-green :type (unsigned-byte 16))
           (visual-blue :initarg :visual-blue :accessor visual-blue :type (unsigned-byte 16))))
(defun decode-alloc-named-color-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        pixel
        exact-red
        exact-green
        exact-blue
        visual-red
        visual-green
        visual-blue)
    (declare
     (ignorable %p response-type sequence length pixel exact-red exact-green exact-blue visual-red
      visual-green visual-blue))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf pixel (read-card32-at %buf (+ %p 8) %order))
    (setf exact-red (read-card16-at %buf (+ %p 12) %order))
    (setf exact-green (read-card16-at %buf (+ %p 14) %order))
    (setf exact-blue (read-card16-at %buf (+ %p 16) %order))
    (setf visual-red (read-card16-at %buf (+ %p 18) %order))
    (setf visual-green (read-card16-at %buf (+ %p 20) %order))
    (setf visual-blue (read-card16-at %buf (+ %p 22) %order))
    (cl:values
     (make-instance 'alloc-named-color-reply :response-type response-type :sequence sequence
                    :length length :pixel pixel :exact-red exact-red :exact-green exact-green
                    :exact-blue exact-blue :visual-red visual-red :visual-green visual-green
                    :visual-blue visual-blue)
     (+ %pos 32 (* 4 length)))))
(defun alloc-named-color-reply (conn cookie)
  (read-reply conn cookie #'decode-alloc-named-color-reply))

;;; Request xcb.AllocColorCells
(defun alloc-color-cells (conn contiguous cmap colors planes)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 86)
    (buffer-write-bool %buf contiguous)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card16 %buf colors)
    (buffer-write-card16 %buf planes)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass alloc-color-cells-request (request-with-reply)
          ((contiguous :initarg :contiguous :type (or boolean (unsigned-byte 8)))
           (cmap :initarg :cmap :type colormap) (colors :initarg :colors :type (unsigned-byte 16))
           (planes :initarg :planes :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj alloc-color-cells-request))
  (alloc-color-cells conn (slot-value %obj 'contiguous) (slot-value %obj 'cmap)
   (slot-value %obj 'colors) (slot-value %obj 'planes)))
(defclass alloc-color-cells-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pixels-len :initarg :pixels-len :accessor pixels-len :type (unsigned-byte 16))
           (masks-len :initarg :masks-len :accessor masks-len :type (unsigned-byte 16))
           (pixels :initarg :pixels :accessor pixels :type cl:sequence)
           (masks :initarg :masks :accessor masks :type cl:sequence)))
(defun decode-alloc-color-cells-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length pixels-len masks-len pixels masks)
    (declare (ignorable %p response-type sequence length pixels-len masks-len pixels masks))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf pixels-len (read-card16-at %buf (+ %p 8) %order))
    (setf masks-len (read-card16-at %buf (+ %p 10) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (pixels %p)
      (read-vector-at %buf %p (min pixels-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (masks %p)
      (read-vector-at %buf %p (min masks-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'alloc-color-cells-reply :response-type response-type :sequence sequence
                    :length length :pixels-len pixels-len :masks-len masks-len :pixels pixels
                    :masks masks)
     (+ %pos 32 (* 4 length)))))
(defun alloc-color-cells-reply (conn cookie)
  (read-reply conn cookie #'decode-alloc-color-cells-reply))

;;; Request xcb.AllocColorPlanes
(defun alloc-color-planes (conn contiguous cmap colors reds greens blues)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 87)
    (buffer-write-bool %buf contiguous)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card16 %buf colors)
    (buffer-write-card16 %buf reds)
    (buffer-write-card16 %buf greens)
    (buffer-write-card16 %buf blues)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass alloc-color-planes-request (request-with-reply)
          ((contiguous :initarg :contiguous :type (or boolean (unsigned-byte 8)))
           (cmap :initarg :cmap :type colormap) (colors :initarg :colors :type (unsigned-byte 16))
           (reds :initarg :reds :type (unsigned-byte 16))
           (greens :initarg :greens :type (unsigned-byte 16))
           (blues :initarg :blues :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj alloc-color-planes-request))
  (alloc-color-planes conn (slot-value %obj 'contiguous) (slot-value %obj 'cmap)
   (slot-value %obj 'colors) (slot-value %obj 'reds) (slot-value %obj 'greens)
   (slot-value %obj 'blues)))
(defclass alloc-color-planes-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pixels-len :initarg :pixels-len :accessor pixels-len :type (unsigned-byte 16))
           (red-mask :initarg :red-mask :accessor red-mask :type (unsigned-byte 32))
           (green-mask :initarg :green-mask :accessor green-mask :type (unsigned-byte 32))
           (blue-mask :initarg :blue-mask :accessor blue-mask :type (unsigned-byte 32))
           (pixels :initarg :pixels :accessor pixels :type cl:sequence)))
(defun decode-alloc-color-planes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length pixels-len red-mask green-mask blue-mask pixels)
    (declare
     (ignorable %p response-type sequence length pixels-len red-mask green-mask blue-mask pixels))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf pixels-len (read-card16-at %buf (+ %p 8) %order))
    (setf red-mask (read-card32-at %buf (+ %p 12) %order))
    (setf green-mask (read-card32-at %buf (+ %p 16) %order))
    (setf blue-mask (read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (pixels %p)
      (read-vector-at %buf %p (min pixels-len (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'alloc-color-planes-reply :response-type response-type :sequence sequence
                    :length length :pixels-len pixels-len :red-mask red-mask :green-mask green-mask
                    :blue-mask blue-mask :pixels pixels)
     (+ %pos 32 (* 4 length)))))
(defun alloc-color-planes-reply (conn cookie)
  (read-reply conn cookie #'decode-alloc-color-planes-reply))

;;; Request xcb.FreeColors
(defun free-colors (conn cmap plane-mask pixels)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 88)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card32 %buf plane-mask)
    (buffer-write-list %buf pixels nil #'buffer-write-card32)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass free-colors-request (request)
          ((cmap :initarg :cmap :type colormap)
           (plane-mask :initarg :plane-mask :type (unsigned-byte 32))
           (pixels :initarg :pixels :type cl:sequence)))
(defmethod send-request (conn (%obj free-colors-request))
  (free-colors conn (slot-value %obj 'cmap) (slot-value %obj 'plane-mask)
   (slot-value %obj 'pixels)))

;;; Enum xcb.ColorFlag
(defenum color-flag
  (:red 1)
  (:green 2)
  (:blue 4))

;;; xcb.COLORITEM
(defclass coloritem nil
          ((pixel :initarg :pixel :accessor pixel :type (unsigned-byte 32))
           (red :initarg :red :accessor red :type (unsigned-byte 16))
           (green :initarg :green :accessor green :type (unsigned-byte 16))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))))
(defun encode-coloritem (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((pixel (slot-value %obj 'pixel))
         (red (slot-value %obj 'red))
         (green (slot-value %obj 'green))
         (blue (slot-value %obj 'blue))
         (flags (slot-value %obj 'flags)))
    (declare (ignorable pixel red green blue flags))
    (buffer-write-card32 %buf pixel)
    (buffer-write-card16 %buf red)
    (buffer-write-card16 %buf green)
    (buffer-write-card16 %buf blue)
    (buffer-write-card8 %buf flags)
    (buffer-write-padding %buf 1)))
(defun decode-coloritem (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) pixel red green blue flags)
    (declare (ignorable %p pixel red green blue flags))
    (setf pixel (read-card32-at %buf %p %order))
    (setf red (read-card16-at %buf (+ %p 4) %order))
    (setf green (read-card16-at %buf (+ %p 6) %order))
    (setf blue (read-card16-at %buf (+ %p 8) %order))
    (setf flags (read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'coloritem :pixel pixel :red red :green green :blue blue :flags flags)
     (+ %p 12))))

;;; Request xcb.StoreColors
(defun store-colors (conn cmap items)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 89)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-list %buf items nil #'encode-coloritem)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass store-colors-request (request)
          ((cmap :initarg :cmap :type colormap) (items :initarg :items :type cl:sequence)))
(defmethod send-request (conn (%obj store-colors-request))
  (store-colors conn (slot-value %obj 'cmap) (slot-value %obj 'items)))

;;; Request xcb.StoreNamedColor
(defun store-named-color (conn flags cmap pixel name)
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 90)
    (buffer-write-card8 %buf flags)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card32 %buf pixel)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass store-named-color-request (request)
          ((flags :initarg :flags :type (unsigned-byte 8)) (cmap :initarg :cmap :type colormap)
           (pixel :initarg :pixel :type (unsigned-byte 32))
           (name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod send-request (conn (%obj store-named-color-request))
  (store-named-color conn (slot-value %obj 'flags) (slot-value %obj 'cmap) (slot-value %obj 'pixel)
   (slot-value %obj 'name)))

;;; xcb.RGB
(defclass rgb nil
          ((red :initarg :red :accessor red :type (unsigned-byte 16))
           (green :initarg :green :accessor green :type (unsigned-byte 16))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 16))))
(defun encode-rgb (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((red (slot-value %obj 'red))
         (green (slot-value %obj 'green))
         (blue (slot-value %obj 'blue)))
    (declare (ignorable red green blue))
    (buffer-write-card16 %buf red)
    (buffer-write-card16 %buf green)
    (buffer-write-card16 %buf blue)
    (buffer-write-padding %buf 2)))
(defun decode-rgb (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) red green blue)
    (declare (ignorable %p red green blue))
    (setf red (read-card16-at %buf %p %order))
    (setf green (read-card16-at %buf (+ %p 2) %order))
    (setf blue (read-card16-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'rgb :red red :green green :blue blue) (+ %p 8))))

;;; Request xcb.QueryColors
(defun query-colors (conn cmap pixels)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 91)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-list %buf pixels nil #'buffer-write-card32)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-colors-request (request-with-reply)
          ((cmap :initarg :cmap :type colormap) (pixels :initarg :pixels :type cl:sequence)))
(defmethod send-request (conn (%obj query-colors-request))
  (query-colors conn (slot-value %obj 'cmap) (slot-value %obj 'pixels)))
(defclass query-colors-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (colors-len :initarg :colors-len :accessor colors-len :type (unsigned-byte 16))
           (colors :initarg :colors :accessor colors :type cl:sequence)))
(defun decode-query-colors-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length colors-len colors)
    (declare (ignorable %p response-type sequence length colors-len colors))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf colors-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (colors %p)
      (read-struct-vector-at %buf %p (min colors-len (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-rgb))
    (cl:values
     (make-instance 'query-colors-reply :response-type response-type :sequence sequence :length
                    length :colors-len colors-len :colors colors)
     (+ %pos 32 (* 4 length)))))
(defun query-colors-reply (conn cookie) (read-reply conn cookie #'decode-query-colors-reply))

;;; Request xcb.LookupColor
(defun lookup-color (conn cmap name)
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 92)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cmap)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass lookup-color-request (request-with-reply)
          ((cmap :initarg :cmap :type colormap)
           (name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod send-request (conn (%obj lookup-color-request))
  (lookup-color conn (slot-value %obj 'cmap) (slot-value %obj 'name)))
(defclass lookup-color-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (exact-red :initarg :exact-red :accessor exact-red :type (unsigned-byte 16))
           (exact-green :initarg :exact-green :accessor exact-green :type (unsigned-byte 16))
           (exact-blue :initarg :exact-blue :accessor exact-blue :type (unsigned-byte 16))
           (visual-red :initarg :visual-red :accessor visual-red :type (unsigned-byte 16))
           (visual-green :initarg :visual-green :accessor visual-green :type (unsigned-byte 16))
           (visual-blue :initarg :visual-blue :accessor visual-blue :type (unsigned-byte 16))))
(defun decode-lookup-color-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        exact-red
        exact-green
        exact-blue
        visual-red
        visual-green
        visual-blue)
    (declare
     (ignorable %p response-type sequence length exact-red exact-green exact-blue visual-red
      visual-green visual-blue))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf exact-red (read-card16-at %buf (+ %p 8) %order))
    (setf exact-green (read-card16-at %buf (+ %p 10) %order))
    (setf exact-blue (read-card16-at %buf (+ %p 12) %order))
    (setf visual-red (read-card16-at %buf (+ %p 14) %order))
    (setf visual-green (read-card16-at %buf (+ %p 16) %order))
    (setf visual-blue (read-card16-at %buf (+ %p 18) %order))
    (cl:values
     (make-instance 'lookup-color-reply :response-type response-type :sequence sequence :length
                    length :exact-red exact-red :exact-green exact-green :exact-blue exact-blue
                    :visual-red visual-red :visual-green visual-green :visual-blue visual-blue)
     (+ %pos 32 (* 4 length)))))
(defun lookup-color-reply (conn cookie) (read-reply conn cookie #'decode-lookup-color-reply))

;;; Enum xcb.Pixmap
(defenum pixmap
  (:none 0))

;;; Request xcb.CreateCursor
(defun create-cursor
       (conn cid source mask fore-red fore-green fore-blue back-red back-green back-blue x y)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 93)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cid)
    (buffer-write-card32 %buf source)
    (buffer-write-card32 %buf mask)
    (buffer-write-card16 %buf fore-red)
    (buffer-write-card16 %buf fore-green)
    (buffer-write-card16 %buf fore-blue)
    (buffer-write-card16 %buf back-red)
    (buffer-write-card16 %buf back-green)
    (buffer-write-card16 %buf back-blue)
    (buffer-write-card16 %buf x)
    (buffer-write-card16 %buf y)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-cursor-request (request)
          ((cid :initarg :cid :type cursor) (source :initarg :source :type pixmap)
           (mask :initarg :mask :type pixmap)
           (fore-red :initarg :fore-red :type (unsigned-byte 16))
           (fore-green :initarg :fore-green :type (unsigned-byte 16))
           (fore-blue :initarg :fore-blue :type (unsigned-byte 16))
           (back-red :initarg :back-red :type (unsigned-byte 16))
           (back-green :initarg :back-green :type (unsigned-byte 16))
           (back-blue :initarg :back-blue :type (unsigned-byte 16))
           (x :initarg :x :type (unsigned-byte 16)) (y :initarg :y :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj create-cursor-request))
  (create-cursor conn (slot-value %obj 'cid) (slot-value %obj 'source) (slot-value %obj 'mask)
   (slot-value %obj 'fore-red) (slot-value %obj 'fore-green) (slot-value %obj 'fore-blue)
   (slot-value %obj 'back-red) (slot-value %obj 'back-green) (slot-value %obj 'back-blue)
   (slot-value %obj 'x) (slot-value %obj 'y)))

;;; Enum xcb.Font
(defenum font
  (:none 0))

;;; Request xcb.CreateGlyphCursor
(defun create-glyph-cursor
       (conn cid source-font mask-font source-char mask-char fore-red fore-green fore-blue back-red
        back-green back-blue)
  "create cursor

Creates a cursor from a font glyph. X provides a set of standard cursor shapes
in a special font named cursor. Applications are encouraged to use this
interface for their cursors because the font can be customized for the
individual display type.

All pixels which are set to 1 in the source will use the foreground color (as
specified by `fore_red`, `fore_green` and `fore_blue`). All pixels set to 0
will use the background color (as specified by `back_red`, `back_green` and
`back_blue`)."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 94)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cid)
    (buffer-write-card32 %buf source-font)
    (buffer-write-card32 %buf mask-font)
    (buffer-write-card16 %buf source-char)
    (buffer-write-card16 %buf mask-char)
    (buffer-write-card16 %buf fore-red)
    (buffer-write-card16 %buf fore-green)
    (buffer-write-card16 %buf fore-blue)
    (buffer-write-card16 %buf back-red)
    (buffer-write-card16 %buf back-green)
    (buffer-write-card16 %buf back-blue)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass create-glyph-cursor-request (request)
          ((cid :initarg :cid :type cursor) (source-font :initarg :source-font :type font)
           (mask-font :initarg :mask-font :type font)
           (source-char :initarg :source-char :type (unsigned-byte 16))
           (mask-char :initarg :mask-char :type (unsigned-byte 16))
           (fore-red :initarg :fore-red :type (unsigned-byte 16))
           (fore-green :initarg :fore-green :type (unsigned-byte 16))
           (fore-blue :initarg :fore-blue :type (unsigned-byte 16))
           (back-red :initarg :back-red :type (unsigned-byte 16))
           (back-green :initarg :back-green :type (unsigned-byte 16))
           (back-blue :initarg :back-blue :type (unsigned-byte 16)))
          (:documentation "create cursor

Creates a cursor from a font glyph. X provides a set of standard cursor shapes
in a special font named cursor. Applications are encouraged to use this
interface for their cursors because the font can be customized for the
individual display type.

All pixels which are set to 1 in the source will use the foreground color (as
specified by `fore_red`, `fore_green` and `fore_blue`). All pixels set to 0
will use the background color (as specified by `back_red`, `back_green` and
`back_blue`)."))
(defmethod send-request (conn (%obj create-glyph-cursor-request))
  (create-glyph-cursor conn (slot-value %obj 'cid) (slot-value %obj 'source-font)
   (slot-value %obj 'mask-font) (slot-value %obj 'source-char) (slot-value %obj 'mask-char)
   (slot-value %obj 'fore-red) (slot-value %obj 'fore-green) (slot-value %obj 'fore-blue)
   (slot-value %obj 'back-red) (slot-value %obj 'back-green) (slot-value %obj 'back-blue)))

;;; Request xcb.FreeCursor
(defun free-cursor (conn cursor)
  "Deletes a cursor

Deletes the association between the cursor resource ID and the specified
cursor. The cursor is freed when no other resource references it."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 95)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cursor)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass free-cursor-request (request) ((cursor :initarg :cursor :type cursor))
          (:documentation "Deletes a cursor

Deletes the association between the cursor resource ID and the specified
cursor. The cursor is freed when no other resource references it."))
(defmethod send-request (conn (%obj free-cursor-request))
  (free-cursor conn (slot-value %obj 'cursor)))

;;; Request xcb.RecolorCursor
(defun recolor-cursor (conn cursor fore-red fore-green fore-blue back-red back-green back-blue)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 96)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf cursor)
    (buffer-write-card16 %buf fore-red)
    (buffer-write-card16 %buf fore-green)
    (buffer-write-card16 %buf fore-blue)
    (buffer-write-card16 %buf back-red)
    (buffer-write-card16 %buf back-green)
    (buffer-write-card16 %buf back-blue)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass recolor-cursor-request (request)
          ((cursor :initarg :cursor :type cursor)
           (fore-red :initarg :fore-red :type (unsigned-byte 16))
           (fore-green :initarg :fore-green :type (unsigned-byte 16))
           (fore-blue :initarg :fore-blue :type (unsigned-byte 16))
           (back-red :initarg :back-red :type (unsigned-byte 16))
           (back-green :initarg :back-green :type (unsigned-byte 16))
           (back-blue :initarg :back-blue :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj recolor-cursor-request))
  (recolor-cursor conn (slot-value %obj 'cursor) (slot-value %obj 'fore-red)
   (slot-value %obj 'fore-green) (slot-value %obj 'fore-blue) (slot-value %obj 'back-red)
   (slot-value %obj 'back-green) (slot-value %obj 'back-blue)))

;;; Enum xcb.QueryShapeOf
(defenum query-shape-of
  (:largest-cursor 0)
  (:fastest-tile 1)
  (:fastest-stipple 2))

;;; Request xcb.QueryBestSize
(defun query-best-size (conn class drawable width height)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 97)
    (buffer-write-card8 %buf class)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf drawable)
    (buffer-write-card16 %buf width)
    (buffer-write-card16 %buf height)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-best-size-request (request-with-reply)
          ((class :initarg :class :type (unsigned-byte 8))
           (drawable :initarg :drawable :type drawable)
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))))
(defmethod send-request (conn (%obj query-best-size-request))
  (query-best-size conn (slot-value %obj 'class) (slot-value %obj 'drawable)
   (slot-value %obj 'width) (slot-value %obj 'height)))
(defclass query-best-size-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))))
(defun decode-query-best-size-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length width height)
    (declare (ignorable %p response-type sequence length width height))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf width (read-card16-at %buf (+ %p 8) %order))
    (setf height (read-card16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'query-best-size-reply :response-type response-type :sequence sequence :length
                    length :width width :height height)
     (+ %pos 32 (* 4 length)))))
(defun query-best-size-reply (conn cookie) (read-reply conn cookie #'decode-query-best-size-reply))

;;; Request xcb.QueryExtension
(defun query-extension (conn name)
  "check if extension is present

Determines if the specified extension is present on this X11 server.

Every extension has a unique `major_opcode` to identify requests, the minor
opcodes and request formats are extension-specific. If the extension provides
events and errors, the `first_event` and `first_error` fields in the reply are
set accordingly.

There should rarely be a need to use this request directly, XCB provides the
`xcb_get_extension_data` function instead."
  (let* ((%buf (conn-send-buffer conn)) (name-len (cl:length name)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 98)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf name-len)
    (buffer-write-padding %buf 2)
    (buffer-write-string-octets %buf name name-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass query-extension-request (request-with-reply)
          ((name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence))
          (:documentation "check if extension is present

Determines if the specified extension is present on this X11 server.

Every extension has a unique `major_opcode` to identify requests, the minor
opcodes and request formats are extension-specific. If the extension provides
events and errors, the `first_event` and `first_error` fields in the reply are
set accordingly.

There should rarely be a need to use this request directly, XCB provides the
`xcb_get_extension_data` function instead."))
(defmethod send-request (conn (%obj query-extension-request))
  (query-extension conn (slot-value %obj 'name)))
(defclass query-extension-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (present :initarg :present :accessor present :type (or boolean (unsigned-byte 8)))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))
           (first-event :initarg :first-event :accessor first-event :type (unsigned-byte 8))
           (first-error :initarg :first-error :accessor first-error :type (unsigned-byte 8))))
(defun decode-query-extension-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length present major-opcode first-event first-error)
    (declare
     (ignorable %p response-type sequence length present major-opcode first-event first-error))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf present (read-card8-at %buf (+ %p 8)))
    (setf major-opcode (read-card8-at %buf (+ %p 9)))
    (setf first-event (read-card8-at %buf (+ %p 10)))
    (setf first-error (read-card8-at %buf (+ %p 11)))
    (cl:values
     (make-instance 'query-extension-reply :response-type response-type :sequence sequence :length
                    length :present present :major-opcode major-opcode :first-event first-event
                    :first-error first-error)
     (+ %pos 32 (* 4 length)))))
(defun query-extension-reply (conn cookie) (read-reply conn cookie #'decode-query-extension-reply))

;;; Request xcb.ListExtensions
(defun list-extensions (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 99)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-extensions-request (request-with-reply) nil)
(defmethod send-request (conn (%obj list-extensions-request)) (list-extensions conn))
(defclass list-extensions-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (names-len :initarg :names-len :accessor names-len :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (names :initarg :names :accessor names :type cl:sequence)))
(defun decode-list-extensions-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type names-len sequence length names)
    (declare (ignorable %p response-type names-len sequence length names))
    (setf response-type (read-card8-at %buf %p))
    (setf names-len (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (names %p)
      (read-struct-vector-at %buf %p (min names-len (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-str))
    (cl:values
     (make-instance 'list-extensions-reply :response-type response-type :names-len names-len
                    :sequence sequence :length length :names names)
     (+ %pos 32 (* 4 length)))))
(defun list-extensions-reply (conn cookie) (read-reply conn cookie #'decode-list-extensions-reply))

;;; Request xcb.ChangeKeyboardMapping
(defun change-keyboard-mapping (conn keycode-count first-keycode keysyms-per-keycode keysyms)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 100)
    (buffer-write-card8 %buf keycode-count)
    (buffer-write-card16 %buf 0)
    (buffer-write-card8 %buf first-keycode)
    (buffer-write-card8 %buf keysyms-per-keycode)
    (buffer-write-padding %buf 2)
    (buffer-write-list %buf keysyms (* keycode-count keysyms-per-keycode) #'buffer-write-card32)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-keyboard-mapping-request (request)
          ((keycode-count :initarg :keycode-count :type (unsigned-byte 8))
           (first-keycode :initarg :first-keycode :type keycode)
           (keysyms-per-keycode :initarg :keysyms-per-keycode :type (unsigned-byte 8))
           (keysyms :initarg :keysyms :type cl:sequence)))
(defmethod send-request (conn (%obj change-keyboard-mapping-request))
  (change-keyboard-mapping conn (slot-value %obj 'keycode-count) (slot-value %obj 'first-keycode)
   (slot-value %obj 'keysyms-per-keycode) (slot-value %obj 'keysyms)))

;;; Request xcb.GetKeyboardMapping
(defun get-keyboard-mapping (conn first-keycode count)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 101)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card8 %buf first-keycode)
    (buffer-write-card8 %buf count)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-keyboard-mapping-request (request-with-reply)
          ((first-keycode :initarg :first-keycode :type keycode)
           (count :initarg :count :type (unsigned-byte 8))))
(defmethod send-request (conn (%obj get-keyboard-mapping-request))
  (get-keyboard-mapping conn (slot-value %obj 'first-keycode) (slot-value %obj 'count)))
(defclass get-keyboard-mapping-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (keysyms-per-keycode :initarg :keysyms-per-keycode :accessor keysyms-per-keycode :type
            (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (keysyms :initarg :keysyms :accessor keysyms :type cl:sequence)))
(defun decode-get-keyboard-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type keysyms-per-keycode sequence length keysyms)
    (declare (ignorable %p response-type keysyms-per-keycode sequence length keysyms))
    (setf response-type (read-card8-at %buf %p))
    (setf keysyms-per-keycode (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (keysyms %p)
      (read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'get-keyboard-mapping-reply :response-type response-type :keysyms-per-keycode
                    keysyms-per-keycode :sequence sequence :length length :keysyms keysyms)
     (+ %pos 32 (* 4 length)))))
(defun get-keyboard-mapping-reply (conn cookie)
  (read-reply conn cookie #'decode-get-keyboard-mapping-reply))

;;; Enum xcb.KB
(defenum kb
  (:key-click-percent 1)
  (:bell-percent 2)
  (:bell-pitch 4)
  (:bell-duration 8)
  (:led 16)
  (:led-mode 32)
  (:key 64)
  (:auto-repeat-mode 128))

;;; Enum xcb.LedMode
(defenum led-mode
  (:off 0)
  (:on 1))

;;; Enum xcb.AutoRepeatMode
(defenum auto-repeat-mode
  (:off 0)
  (:on 1)
  (:default 2))

;;; Request xcb.ChangeKeyboardControl
(defun change-keyboard-control
       (conn value-mask
        &key key-click-percent bell-percent bell-pitch bell-duration led led-mode key
        auto-repeat-mode)
  (check-value-mask 'change-keyboard-control value-mask
   (1 :key-click-percent key-click-percent nil) (2 :bell-percent bell-percent nil)
   (4 :bell-pitch bell-pitch nil) (8 :bell-duration bell-duration nil) (16 :led led nil)
   (32 :led-mode led-mode nil) (64 :key key nil) (128 :auto-repeat-mode auto-repeat-mode nil))
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 102)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (buffer-write-card32 %buf key-click-percent))
      (when (logtest %mask 2) (buffer-write-card32 %buf bell-percent))
      (when (logtest %mask 4) (buffer-write-card32 %buf bell-pitch))
      (when (logtest %mask 8) (buffer-write-card32 %buf bell-duration))
      (when (logtest %mask 16) (buffer-write-card32 %buf led))
      (when (logtest %mask 32) (buffer-write-card32 %buf led-mode))
      (when (logtest %mask 64) (buffer-write-card32 %buf key))
      (when (logtest %mask 128) (buffer-write-card32 %buf auto-repeat-mode)))
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-keyboard-control-request (request)
          ((value-mask :initarg :value-mask :type (unsigned-byte 32))
           (key-click-percent :initarg :key-click-percent :type (signed-byte 32))
           (bell-percent :initarg :bell-percent :type (signed-byte 32))
           (bell-pitch :initarg :bell-pitch :type (signed-byte 32))
           (bell-duration :initarg :bell-duration :type (signed-byte 32))
           (led :initarg :led :type (unsigned-byte 32))
           (led-mode :initarg :led-mode :type (unsigned-byte 32))
           (key :initarg :key :type keycode32)
           (auto-repeat-mode :initarg :auto-repeat-mode :type (unsigned-byte 32))))
(defmethod send-request (conn (%obj change-keyboard-control-request))
  (apply #'change-keyboard-control conn (slot-value %obj 'value-mask)
         (nconc
          (when (slot-boundp %obj 'key-click-percent)
            (list :key-click-percent (slot-value %obj 'key-click-percent)))
          (when (slot-boundp %obj 'bell-percent)
            (list :bell-percent (slot-value %obj 'bell-percent)))
          (when (slot-boundp %obj 'bell-pitch) (list :bell-pitch (slot-value %obj 'bell-pitch)))
          (when (slot-boundp %obj 'bell-duration)
            (list :bell-duration (slot-value %obj 'bell-duration)))
          (when (slot-boundp %obj 'led) (list :led (slot-value %obj 'led)))
          (when (slot-boundp %obj 'led-mode) (list :led-mode (slot-value %obj 'led-mode)))
          (when (slot-boundp %obj 'key) (list :key (slot-value %obj 'key)))
          (when (slot-boundp %obj 'auto-repeat-mode)
            (list :auto-repeat-mode (slot-value %obj 'auto-repeat-mode))))))

;;; Request xcb.GetKeyboardControl
(defun get-keyboard-control (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 103)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-keyboard-control-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-keyboard-control-request)) (get-keyboard-control conn))
(defclass get-keyboard-control-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (global-auto-repeat :initarg :global-auto-repeat :accessor global-auto-repeat :type
            (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (led-mask :initarg :led-mask :accessor led-mask :type (unsigned-byte 32))
           (key-click-percent :initarg :key-click-percent :accessor key-click-percent :type
            (unsigned-byte 8))
           (bell-percent :initarg :bell-percent :accessor bell-percent :type (unsigned-byte 8))
           (bell-pitch :initarg :bell-pitch :accessor bell-pitch :type (unsigned-byte 16))
           (bell-duration :initarg :bell-duration :accessor bell-duration :type (unsigned-byte 16))
           (auto-repeats :initarg :auto-repeats :accessor auto-repeats :type cl:sequence)))
(defun decode-get-keyboard-control-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        global-auto-repeat
        sequence
        length
        led-mask
        key-click-percent
        bell-percent
        bell-pitch
        bell-duration
        auto-repeats)
    (declare
     (ignorable %p response-type global-auto-repeat sequence length led-mask key-click-percent
      bell-percent bell-pitch bell-duration auto-repeats))
    (setf response-type (read-card8-at %buf %p))
    (setf global-auto-repeat (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf led-mask (read-card32-at %buf (+ %p 8) %order))
    (setf key-click-percent (read-card8-at %buf (+ %p 12)))
    (setf bell-percent (read-card8-at %buf (+ %p 13)))
    (setf bell-pitch (read-card16-at %buf (+ %p 14) %order))
    (setf bell-duration (read-card16-at %buf (+ %p 16) %order))
    (setf auto-repeats (read-vector-at %buf (+ %p 20) 32 %order :card8))
    (cl:values
     (make-instance 'get-keyboard-control-reply :response-type response-type :global-auto-repeat
                    global-auto-repeat :sequence sequence :length length :led-mask led-mask
                    :key-click-percent key-click-percent :bell-percent bell-percent :bell-pitch
                    bell-pitch :bell-duration bell-duration :auto-repeats auto-repeats)
     (+ %pos 32 (* 4 length)))))
(defun get-keyboard-control-reply (conn cookie)
  (read-reply conn cookie #'decode-get-keyboard-control-reply))

;;; Request xcb.Bell
(defun bell (conn percent)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 104)
    (buffer-write-card8 %buf percent)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass bell-request (request) ((percent :initarg :percent :type (signed-byte 8))))
(defmethod send-request (conn (%obj bell-request)) (bell conn (slot-value %obj 'percent)))

;;; Request xcb.ChangePointerControl
(defun change-pointer-control
       (conn acceleration-numerator acceleration-denominator threshold do-acceleration
        do-threshold)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 105)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf acceleration-numerator)
    (buffer-write-card16 %buf acceleration-denominator)
    (buffer-write-card16 %buf threshold)
    (buffer-write-bool %buf do-acceleration)
    (buffer-write-bool %buf do-threshold)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-pointer-control-request (request)
          ((acceleration-numerator :initarg :acceleration-numerator :type (signed-byte 16))
           (acceleration-denominator :initarg :acceleration-denominator :type (signed-byte 16))
           (threshold :initarg :threshold :type (signed-byte 16))
           (do-acceleration :initarg :do-acceleration :type (or boolean (unsigned-byte 8)))
           (do-threshold :initarg :do-threshold :type (or boolean (unsigned-byte 8)))))
(defmethod send-request (conn (%obj change-pointer-control-request))
  (change-pointer-control conn (slot-value %obj 'acceleration-numerator)
   (slot-value %obj 'acceleration-denominator) (slot-value %obj 'threshold)
   (slot-value %obj 'do-acceleration) (slot-value %obj 'do-threshold)))

;;; Request xcb.GetPointerControl
(defun get-pointer-control (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 106)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-pointer-control-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-pointer-control-request)) (get-pointer-control conn))
(defclass get-pointer-control-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (acceleration-numerator :initarg :acceleration-numerator :accessor
            acceleration-numerator :type (unsigned-byte 16))
           (acceleration-denominator :initarg :acceleration-denominator :accessor
            acceleration-denominator :type (unsigned-byte 16))
           (threshold :initarg :threshold :accessor threshold :type (unsigned-byte 16))))
(defun decode-get-pointer-control-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        acceleration-numerator
        acceleration-denominator
        threshold)
    (declare
     (ignorable %p response-type sequence length acceleration-numerator acceleration-denominator
      threshold))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf acceleration-numerator (read-card16-at %buf (+ %p 8) %order))
    (setf acceleration-denominator (read-card16-at %buf (+ %p 10) %order))
    (setf threshold (read-card16-at %buf (+ %p 12) %order))
    (cl:values
     (make-instance 'get-pointer-control-reply :response-type response-type :sequence sequence
                    :length length :acceleration-numerator acceleration-numerator
                    :acceleration-denominator acceleration-denominator :threshold threshold)
     (+ %pos 32 (* 4 length)))))
(defun get-pointer-control-reply (conn cookie)
  (read-reply conn cookie #'decode-get-pointer-control-reply))

;;; Enum xcb.Blanking
(defenum blanking
  (:not-preferred 0)
  (:preferred 1)
  (:default 2))

;;; Enum xcb.Exposures
(defenum exposures
  (:not-allowed 0)
  (:allowed 1)
  (:default 2))

;;; Request xcb.SetScreenSaver
(defun set-screen-saver (conn timeout interval prefer-blanking allow-exposures)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 107)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card16 %buf timeout)
    (buffer-write-card16 %buf interval)
    (buffer-write-card8 %buf prefer-blanking)
    (buffer-write-card8 %buf allow-exposures)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-screen-saver-request (request)
          ((timeout :initarg :timeout :type (signed-byte 16))
           (interval :initarg :interval :type (signed-byte 16))
           (prefer-blanking :initarg :prefer-blanking :type (unsigned-byte 8))
           (allow-exposures :initarg :allow-exposures :type (unsigned-byte 8))))
(defmethod send-request (conn (%obj set-screen-saver-request))
  (set-screen-saver conn (slot-value %obj 'timeout) (slot-value %obj 'interval)
   (slot-value %obj 'prefer-blanking) (slot-value %obj 'allow-exposures)))

;;; Request xcb.GetScreenSaver
(defun get-screen-saver (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 108)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-screen-saver-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-screen-saver-request)) (get-screen-saver conn))
(defclass get-screen-saver-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timeout :initarg :timeout :accessor timeout :type (unsigned-byte 16))
           (interval :initarg :interval :accessor interval :type (unsigned-byte 16))
           (prefer-blanking :initarg :prefer-blanking :accessor prefer-blanking :type
            (unsigned-byte 8))
           (allow-exposures :initarg :allow-exposures :accessor allow-exposures :type
            (unsigned-byte 8))))
(defun decode-get-screen-saver-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length timeout interval prefer-blanking allow-exposures)
    (declare
     (ignorable %p response-type sequence length timeout interval prefer-blanking allow-exposures))
    (setf response-type (read-card8-at %buf %p))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf timeout (read-card16-at %buf (+ %p 8) %order))
    (setf interval (read-card16-at %buf (+ %p 10) %order))
    (setf prefer-blanking (read-card8-at %buf (+ %p 12)))
    (setf allow-exposures (read-card8-at %buf (+ %p 13)))
    (cl:values
     (make-instance 'get-screen-saver-reply :response-type response-type :sequence sequence :length
                    length :timeout timeout :interval interval :prefer-blanking prefer-blanking
                    :allow-exposures allow-exposures)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-saver-reply (conn cookie)
  (read-reply conn cookie #'decode-get-screen-saver-reply))

;;; Enum xcb.HostMode
(defenum host-mode
  (:insert 0)
  (:delete 1))

;;; Enum xcb.Family
(defenum family
  (:internet 0)
  (:de-cnet 1)
  (:chaos 2)
  (:server-interpreted 5)
  (:internet6 6))

;;; Request xcb.ChangeHosts
(defun change-hosts (conn mode family address)
  (let* ((%buf (conn-send-buffer conn)) (address-len (cl:length address)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 109)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-write-card8 %buf family)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf address-len)
    (buffer-write-octets %buf address :end address-len)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass change-hosts-request (request)
          ((mode :initarg :mode :type (unsigned-byte 8))
           (family :initarg :family :type (unsigned-byte 8))
           (address-len :initarg :address-len :type (unsigned-byte 16))
           (address :initarg :address :type cl:sequence)))
(defmethod send-request (conn (%obj change-hosts-request))
  (change-hosts conn (slot-value %obj 'mode) (slot-value %obj 'family) (slot-value %obj 'address)))

;;; xcb.HOST
(defclass host nil
          ((family :initarg :family :accessor family :type (unsigned-byte 8))
           (address-len :initarg :address-len :accessor address-len :type (unsigned-byte 16))
           (address :initarg :address :accessor address :type cl:sequence)))
(defun encode-host (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((family (slot-value %obj 'family))
         (address (slot-value %obj 'address))
         (address-len (cl:length address)))
    (declare (ignorable family address address-len))
    (buffer-write-card8 %buf family)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf address-len)
    (buffer-write-octets %buf address :end address-len)
    (buffer-pad-to-align %buf 4)))
(defun decode-host (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) family address-len address)
    (declare (ignorable %p family address-len address))
    (setf family (read-card8-at %buf %p))
    (setf address-len (read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (multiple-value-setq (address %p) (read-vector-at %buf %p address-len %order :card8))
    (setf %p (align-position %p 4))
    (cl:values (make-instance 'host :family family :address-len address-len :address address) %p)))

;;; Request xcb.ListHosts
(defun list-hosts (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 110)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass list-hosts-request (request-with-reply) nil)
(defmethod send-request (conn (%obj list-hosts-request)) (list-hosts conn))
(defclass list-hosts-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (hosts-len :initarg :hosts-len :accessor hosts-len :type (unsigned-byte 16))
           (hosts :initarg :hosts :accessor hosts :type cl:sequence)))
(defun decode-list-hosts-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type mode sequence length hosts-len hosts)
    (declare (ignorable %p response-type mode sequence length hosts-len hosts))
    (setf response-type (read-card8-at %buf %p))
    (setf mode (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf hosts-len (read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (hosts %p)
      (read-struct-vector-at %buf %p (min hosts-len (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-host))
    (cl:values
     (make-instance 'list-hosts-reply :response-type response-type :mode mode :sequence sequence
                    :length length :hosts-len hosts-len :hosts hosts)
     (+ %pos 32 (* 4 length)))))
(defun list-hosts-reply (conn cookie) (read-reply conn cookie #'decode-list-hosts-reply))

;;; Enum xcb.AccessControl
(defenum access-control
  (:disable 0)
  (:enable 1))

;;; Request xcb.SetAccessControl
(defun set-access-control (conn mode)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 111)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-access-control-request (request) ((mode :initarg :mode :type (unsigned-byte 8))))
(defmethod send-request (conn (%obj set-access-control-request))
  (set-access-control conn (slot-value %obj 'mode)))

;;; Enum xcb.CloseDown
(defenum close-down
  (:destroy-all 0)
  (:retain-permanent 1)
  (:retain-temporary 2))

;;; Request xcb.SetCloseDownMode
(defun set-close-down-mode (conn mode)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 112)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass set-close-down-mode-request (request) ((mode :initarg :mode :type (unsigned-byte 8))))
(defmethod send-request (conn (%obj set-close-down-mode-request))
  (set-close-down-mode conn (slot-value %obj 'mode)))

;;; Enum xcb.Kill
(defenum kill
  (:all-temporary 0))

;;; Request xcb.KillClient
(defun kill-client (conn resource)
  "kills a client

Forces a close down of the client that created the specified `resource`."
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 113)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf resource)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass kill-client-request (request) ((resource :initarg :resource :type (unsigned-byte 32)))
          (:documentation "kills a client

Forces a close down of the client that created the specified `resource`."))
(defmethod send-request (conn (%obj kill-client-request))
  (kill-client conn (slot-value %obj 'resource)))

;;; Request xcb.RotateProperties
(defun rotate-properties (conn window delta atoms)
  (let* ((%buf (conn-send-buffer conn)) (atoms-len (cl:length atoms)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 114)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-write-card32 %buf window)
    (buffer-write-card16 %buf atoms-len)
    (buffer-write-card16 %buf delta)
    (buffer-write-list %buf atoms atoms-len #'buffer-write-card32)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass rotate-properties-request (request)
          ((window :initarg :window :type window)
           (atoms-len :initarg :atoms-len :type (unsigned-byte 16))
           (delta :initarg :delta :type (signed-byte 16))
           (atoms :initarg :atoms :type cl:sequence)))
(defmethod send-request (conn (%obj rotate-properties-request))
  (rotate-properties conn (slot-value %obj 'window) (slot-value %obj 'delta)
   (slot-value %obj 'atoms)))

;;; Enum xcb.ScreenSaver
(defenum screen-saver
  (:reset 0)
  (:active 1))

;;; Request xcb.ForceScreenSaver
(defun force-screen-saver (conn mode)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 115)
    (buffer-write-card8 %buf mode)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass force-screen-saver-request (request) ((mode :initarg :mode :type (unsigned-byte 8))))
(defmethod send-request (conn (%obj force-screen-saver-request))
  (force-screen-saver conn (slot-value %obj 'mode)))

;;; Enum xcb.MappingStatus
(defenum mapping-status
  (:success 0)
  (:busy 1)
  (:failure 2))

;;; Request xcb.SetPointerMapping
(defun set-pointer-mapping (conn map)
  (let* ((%buf (conn-send-buffer conn)) (map-len (cl:length map)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 116)
    (buffer-write-card8 %buf map-len)
    (buffer-write-card16 %buf 0)
    (buffer-write-octets %buf map :end map-len)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass set-pointer-mapping-request (request-with-reply)
          ((map-len :initarg :map-len :type (unsigned-byte 8))
           (map :initarg :map :type cl:sequence)))
(defmethod send-request (conn (%obj set-pointer-mapping-request))
  (set-pointer-mapping conn (slot-value %obj 'map)))
(defclass set-pointer-mapping-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-set-pointer-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length)
    (declare (ignorable %p response-type status sequence length))
    (setf response-type (read-card8-at %buf %p))
    (setf status (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (cl:values
     (make-instance 'set-pointer-mapping-reply :response-type response-type :status status
                    :sequence sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun set-pointer-mapping-reply (conn cookie)
  (read-reply conn cookie #'decode-set-pointer-mapping-reply))

;;; Request xcb.GetPointerMapping
(defun get-pointer-mapping (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 117)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-pointer-mapping-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-pointer-mapping-request)) (get-pointer-mapping conn))
(defclass get-pointer-mapping-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (map-len :initarg :map-len :accessor map-len :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (map :initarg :map :accessor map :type cl:sequence)))
(defun decode-get-pointer-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type map-len sequence length map)
    (declare (ignorable %p response-type map-len sequence length map))
    (setf response-type (read-card8-at %buf %p))
    (setf map-len (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (map %p)
      (read-vector-at %buf %p (min map-len (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-pointer-mapping-reply :response-type response-type :map-len map-len
                    :sequence sequence :length length :map map)
     (+ %pos 32 (* 4 length)))))
(defun get-pointer-mapping-reply (conn cookie)
  (read-reply conn cookie #'decode-get-pointer-mapping-reply))

;;; Enum xcb.MapIndex
(defenum map-index
  (:shift 0)
  (:lock 1)
  (:control 2)
  (:n1 3)
  (:n2 4)
  (:n3 5)
  (:n4 6)
  (:n5 7))

;;; Request xcb.SetModifierMapping
(defun set-modifier-mapping (conn keycodes-per-modifier keycodes)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 118)
    (buffer-write-card8 %buf keycodes-per-modifier)
    (buffer-write-card16 %buf 0)
    (buffer-write-octets %buf keycodes :end (* keycodes-per-modifier 8))
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass set-modifier-mapping-request (request-with-reply)
          ((keycodes-per-modifier :initarg :keycodes-per-modifier :type (unsigned-byte 8))
           (keycodes :initarg :keycodes :type cl:sequence)))
(defmethod send-request (conn (%obj set-modifier-mapping-request))
  (set-modifier-mapping conn (slot-value %obj 'keycodes-per-modifier) (slot-value %obj 'keycodes)))
(defclass set-modifier-mapping-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))))
(defun decode-set-modifier-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length)
    (declare (ignorable %p response-type status sequence length))
    (setf response-type (read-card8-at %buf %p))
    (setf status (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (cl:values
     (make-instance 'set-modifier-mapping-reply :response-type response-type :status status
                    :sequence sequence :length length)
     (+ %pos 32 (* 4 length)))))
(defun set-modifier-mapping-reply (conn cookie)
  (read-reply conn cookie #'decode-set-modifier-mapping-reply))

;;; Request xcb.GetModifierMapping
(defun get-modifier-mapping (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 119)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn :has-reply t)))
(defclass get-modifier-mapping-request (request-with-reply) nil)
(defmethod send-request (conn (%obj get-modifier-mapping-request)) (get-modifier-mapping conn))
(defclass get-modifier-mapping-reply (reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (keycodes-per-modifier :initarg :keycodes-per-modifier :accessor keycodes-per-modifier
            :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (keycodes :initarg :keycodes :accessor keycodes :type cl:sequence)))
(defun decode-get-modifier-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type keycodes-per-modifier sequence length keycodes)
    (declare (ignorable %p response-type keycodes-per-modifier sequence length keycodes))
    (setf response-type (read-card8-at %buf %p))
    (setf keycodes-per-modifier (read-card8-at %buf (+ %p 1)))
    (setf sequence (read-card16-at %buf (+ %p 2) %order))
    (setf length (read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (keycodes %p)
      (read-vector-at %buf %p
       (min (* keycodes-per-modifier 8) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order :card8))
    (cl:values
     (make-instance 'get-modifier-mapping-reply :response-type response-type :keycodes-per-modifier
                    keycodes-per-modifier :sequence sequence :length length :keycodes keycodes)
     (+ %pos 32 (* 4 length)))))
(defun get-modifier-mapping-reply (conn cookie)
  (read-reply conn cookie #'decode-get-modifier-mapping-reply))

;;; Request xcb.NoOperation
(defun no-operation (conn)
  (let* ((%buf (conn-send-buffer conn)))
    (buffer-reset %buf)
    (buffer-write-card8 %buf 127)
    (buffer-write-padding %buf 1)
    (buffer-write-card16 %buf 0)
    (buffer-finish-request %buf)
    (flush-request conn)))
(defclass no-operation-request (request) nil)
(defmethod send-request (conn (%obj no-operation-request)) (no-operation conn))


;;; Exports

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export
   '(above-sibling acceleration-denominator acceleration-numerator access-error address address-len
     all-chars-exist all-event-masks alloc-color alloc-color-cells alloc-color-cells-reply
     alloc-color-cells-request alloc-color-planes alloc-color-planes-reply
     alloc-color-planes-request alloc-color-reply alloc-color-request alloc-error alloc-named-color
     alloc-named-color-reply alloc-named-color-request allow-events allow-events-request
     allow-exposures allowed-depths allowed-depths-len angle1 angle2 arc ascent atom atom-error
     atoms atoms-len attributes authorization-protocol-data authorization-protocol-data-len
     authorization-protocol-name authorization-protocol-name-len auto-repeats backing-pixel
     backing-planes backing-store backing-stores bad-value bell bell-duration bell-percent
     bell-pitch bell-request bit-gravity bitmap-format-bit-order bitmap-format-scanline-pad
     bitmap-format-scanline-unit bits-per-pixel bits-per-rgb-value black-pixel blue blue-mask
     bool32 border-width button button-press button-release byte-order byte1 byte2 bytes-after
     change-active-pointer-grab change-active-pointer-grab-request change-gc change-gc-request
     change-hosts change-hosts-request change-keyboard-control change-keyboard-control-request
     change-keyboard-mapping change-keyboard-mapping-request change-pointer-control
     change-pointer-control-request change-property change-property-request change-save-set
     change-save-set-request change-window-attributes change-window-attributes-request char-infos
     char-infos-len char2-b character-width charinfo child children children-len circulate-notify
     circulate-request circulate-window circulate-window-request class clear-area
     clear-area-request client-message client-message-data close-font close-font-request cmaps
     cmaps-len coloritem colormap colormap-entries colormap-error colormap-notify colors colors-len
     configure-notify configure-request configure-window configure-window-request convert-selection
     convert-selection-request copy-area copy-area-request copy-colormap-and-free
     copy-colormap-and-free-request copy-gc copy-gc-request copy-plane copy-plane-request count
     create-colormap create-colormap-request create-cursor create-cursor-request create-gc
     create-gc-request create-glyph-cursor create-glyph-cursor-request create-notify create-pixmap
     create-pixmap-request create-window create-window-request current-input-masks cursor
     cursor-error data data16 data32 data8 decode-access-error decode-alloc-color-cells-reply
     decode-alloc-color-planes-reply decode-alloc-color-reply decode-alloc-error
     decode-alloc-named-color-reply decode-arc decode-atom-error decode-button-press
     decode-button-release decode-char2-b decode-charinfo decode-circulate-notify
     decode-circulate-request decode-client-message decode-client-message-data decode-coloritem
     decode-colormap-error decode-colormap-notify decode-configure-notify decode-configure-request
     decode-create-notify decode-cursor-error decode-depth decode-destroy-notify
     decode-drawable-error decode-enter-notify decode-expose decode-focus-in decode-focus-out
     decode-font-error decode-fontprop decode-format decode-g-context-error decode-ge-generic
     decode-get-atom-name-reply decode-get-font-path-reply decode-get-geometry-reply
     decode-get-image-reply decode-get-input-focus-reply decode-get-keyboard-control-reply
     decode-get-keyboard-mapping-reply decode-get-modifier-mapping-reply
     decode-get-motion-events-reply decode-get-pointer-control-reply
     decode-get-pointer-mapping-reply decode-get-property-reply decode-get-screen-saver-reply
     decode-get-selection-owner-reply decode-get-window-attributes-reply decode-grab-keyboard-reply
     decode-grab-pointer-reply decode-graphics-exposure decode-gravity-notify decode-host
     decode-id-choice-error decode-implementation-error decode-intern-atom-reply decode-key-press
     decode-key-release decode-keymap-notify decode-leave-notify decode-length-error
     decode-list-extensions-reply decode-list-fonts-reply decode-list-fonts-with-info-reply
     decode-list-hosts-reply decode-list-installed-colormaps-reply decode-list-properties-reply
     decode-lookup-color-reply decode-map-notify decode-map-request decode-mapping-notify
     decode-match-error decode-motion-notify decode-name-error decode-no-exposure
     decode-pixmap-error decode-point decode-property-notify decode-query-best-size-reply
     decode-query-colors-reply decode-query-extension-reply decode-query-font-reply
     decode-query-keymap-reply decode-query-pointer-reply decode-query-text-extents-reply
     decode-query-tree-reply decode-rectangle decode-reparent-notify decode-request-error
     decode-resize-request decode-rgb decode-screen decode-segment decode-selection-clear
     decode-selection-notify decode-selection-request decode-set-modifier-mapping-reply
     decode-set-pointer-mapping-reply decode-setup decode-setup-authenticate decode-setup-failed
     decode-setup-request decode-str decode-timecoord decode-translate-coordinates-reply
     decode-unmap-notify decode-value-error decode-visibility-notify decode-visualtype
     decode-window-error default-char default-colormap delete-property delete-property-request
     depth descent destroy-notify destroy-subwindows destroy-subwindows-request destroy-window
     destroy-window-request detail do-not-propagate-mask draw-direction drawable drawable-error
     dst-x dst-y encode-arc encode-button-press encode-char2-b encode-charinfo
     encode-circulate-notify encode-client-message encode-client-message-data encode-coloritem
     encode-colormap-notify encode-configure-notify encode-configure-request encode-create-notify
     encode-depth encode-destroy-notify encode-enter-notify encode-expose encode-focus-in
     encode-fontprop encode-format encode-graphics-exposure encode-gravity-notify encode-host
     encode-key-press encode-keymap-notify encode-map-notify encode-map-request
     encode-mapping-notify encode-motion-notify encode-no-exposure encode-point
     encode-property-notify encode-rectangle encode-reparent-notify encode-resize-request
     encode-rgb encode-screen encode-segment encode-selection-clear encode-selection-notify
     encode-selection-request encode-setup encode-setup-authenticate encode-setup-failed
     encode-setup-request encode-str encode-timecoord encode-unmap-notify encode-visibility-notify
     encode-visualtype enter-notify error-code event event-type event-x event-y events events-len
     exact-blue exact-green exact-red expose extension family fill-poly fill-poly-request
     first-error first-event first-keycode flags focus focus-in focus-out font font-ascent
     font-descent font-error fontable fontprop force-screen-saver force-screen-saver-request format
     free-colormap free-colormap-request free-colors free-colors-request free-cursor
     free-cursor-request free-gc free-gc-request free-pixmap free-pixmap-request from-configure
     g-context-error gcontext ge-generic get-atom-name get-atom-name-reply get-atom-name-request
     get-font-path get-font-path-reply get-font-path-request get-geometry get-geometry-reply
     get-geometry-request get-image get-image-reply get-image-request get-input-focus
     get-input-focus-reply get-input-focus-request get-keyboard-control get-keyboard-control-reply
     get-keyboard-control-request get-keyboard-mapping get-keyboard-mapping-reply
     get-keyboard-mapping-request get-modifier-mapping get-modifier-mapping-reply
     get-modifier-mapping-request get-motion-events get-motion-events-reply
     get-motion-events-request get-pointer-control get-pointer-control-reply
     get-pointer-control-request get-pointer-mapping get-pointer-mapping-reply
     get-pointer-mapping-request get-property get-property-reply get-property-request
     get-screen-saver get-screen-saver-reply get-screen-saver-request get-selection-owner
     get-selection-owner-reply get-selection-owner-request get-window-attributes
     get-window-attributes-reply get-window-attributes-request global-auto-repeat grab-button
     grab-button-request grab-key grab-key-request grab-keyboard grab-keyboard-reply
     grab-keyboard-request grab-pointer grab-pointer-reply grab-pointer-request grab-server
     grab-server-request graphics-exposure gravity-notify green green-mask height
     height-in-millimeters height-in-pixels host hosts hosts-len id-choice-error image-byte-order
     image-text16 image-text16-request image-text8 image-text8-request implementation-error
     install-colormap install-colormap-request intern-atom intern-atom-reply intern-atom-request
     interval key-click-percent key-press key-release keycode keycode32 keycodes
     keycodes-per-modifier keymap-notify keys keysym keysyms keysyms-per-keycode kill-client
     kill-client-request leave-notify led-mask left-side-bearing length length-error
     list-extensions list-extensions-reply list-extensions-request list-fonts list-fonts-reply
     list-fonts-request list-fonts-with-info list-fonts-with-info-reply
     list-fonts-with-info-request list-hosts list-hosts-reply list-hosts-request
     list-installed-colormaps list-installed-colormaps-reply list-installed-colormaps-request
     list-properties list-properties-reply list-properties-request lookup-color lookup-color-reply
     lookup-color-request major-opcode map map-is-installed map-len map-notify map-request
     map-state map-subwindows map-subwindows-request map-window map-window-request mapping-notify
     mask masks masks-len match-error max-bounds max-byte1 max-char-or-byte2 max-installed-maps
     max-keycode maximum-request-length min-bounds min-byte1 min-char-or-byte2 min-installed-maps
     min-keycode minor-opcode mode motion-buffer-size motion-notify name name-error name-len names
     names-len new no-exposure no-operation no-operation-request open-font open-font-request
     overall-ascent overall-descent overall-left overall-right overall-width override-redirect
     owner parent path path-len pixel pixels pixels-len pixmap pixmap-error pixmap-formats
     pixmap-formats-len place point poly-arc poly-arc-request poly-fill-arc poly-fill-arc-request
     poly-fill-rectangle poly-fill-rectangle-request poly-line poly-line-request poly-point
     poly-point-request poly-rectangle poly-rectangle-request poly-segment poly-segment-request
     poly-text16 poly-text16-request poly-text8 poly-text8-request prefer-blanking present
     properties properties-len property property-notify protocol-major-version
     protocol-minor-version put-image put-image-request query-best-size query-best-size-reply
     query-best-size-request query-colors query-colors-reply query-colors-request query-extension
     query-extension-reply query-extension-request query-font query-font-reply query-font-request
     query-keymap query-keymap-reply query-keymap-request query-pointer query-pointer-reply
     query-pointer-request query-text-extents query-text-extents-reply query-text-extents-request
     query-tree query-tree-reply query-tree-request reason reason-len recolor-cursor
     recolor-cursor-request rectangle red red-mask release-number reparent-notify reparent-window
     reparent-window-request replies-hint request request-error requestor resize-request
     resource-id-base resource-id-mask response-type revert-to rgb right-side-bearing root
     root-depth root-visual root-x root-y roots roots-len rotate-properties
     rotate-properties-request same-screen same-screen-focus save-under save-unders scanline-pad
     screen segment selection selection-clear selection-notify selection-request send-event
     send-event-request sequence set-access-control set-access-control-request set-clip-rectangles
     set-clip-rectangles-request set-close-down-mode set-close-down-mode-request set-dashes
     set-dashes-request set-font-path set-font-path-request set-input-focus set-input-focus-request
     set-modifier-mapping set-modifier-mapping-reply set-modifier-mapping-request
     set-pointer-mapping set-pointer-mapping-reply set-pointer-mapping-request set-screen-saver
     set-screen-saver-request set-selection-owner set-selection-owner-request setup
     setup-authenticate setup-failed setup-request sibling stack-mode state status store-colors
     store-colors-request store-named-color store-named-color-request str target threshold time
     timecoord timeout timestamp translate-coordinates translate-coordinates-reply
     translate-coordinates-request type ungrab-button ungrab-button-request ungrab-key
     ungrab-key-request ungrab-keyboard ungrab-keyboard-request ungrab-pointer
     ungrab-pointer-request ungrab-server ungrab-server-request uninstall-colormap
     uninstall-colormap-request unmap-notify unmap-subwindows unmap-subwindows-request unmap-window
     unmap-window-request value value-error value-len value-mask vendor vendor-len
     visibility-notify visual visual-blue visual-green visual-id visual-red visualid visuals
     visuals-len visualtype warp-pointer warp-pointer-request white-pixel width
     width-in-millimeters width-in-pixels win-gravity win-x win-y window window-error x x1 x2 y y1
     y2 your-event-mask)))
