;;; Generated from render.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-RENDER
  (:use #:cl)
  (:shadow #:FORMAT #:LENGTH #:SEQUENCE #:TYPE #:VALUES)
  (:export
   #:add-glyphs
   #:add-glyphs-request
   #:add-traps
   #:add-traps-request
   #:aliases
   #:alpha
   #:alpha-mask
   #:alpha-shift
   #:animcursorelt
   #:bad-value
   #:blue
   #:blue-mask
   #:blue-shift
   #:bot
   #:bottom
   #:change-picture
   #:change-picture-request
   #:color
   #:colormap
   #:composite
   #:composite-glyphs16
   #:composite-glyphs16-request
   #:composite-glyphs32
   #:composite-glyphs32-request
   #:composite-glyphs8
   #:composite-glyphs8-request
   #:composite-request
   #:create-anim-cursor
   #:create-anim-cursor-request
   #:create-conical-gradient
   #:create-conical-gradient-request
   #:create-cursor
   #:create-cursor-request
   #:create-glyph-set
   #:create-glyph-set-request
   #:create-linear-gradient
   #:create-linear-gradient-request
   #:create-picture
   #:create-picture-request
   #:create-radial-gradient
   #:create-radial-gradient-request
   #:create-solid-fill
   #:create-solid-fill-request
   #:cursor
   #:decode-animcursorelt
   #:decode-color
   #:decode-directformat
   #:decode-glyph-error
   #:decode-glyph-set-error
   #:decode-glyphinfo
   #:decode-indexvalue
   #:decode-linefix
   #:decode-pict-format-error
   #:decode-pict-op-error
   #:decode-pictdepth
   #:decode-pictforminfo
   #:decode-pictscreen
   #:decode-picture-error
   #:decode-pictvisual
   #:decode-pointfix
   #:decode-query-filters-reply
   #:decode-query-pict-formats-reply
   #:decode-query-pict-index-values-reply
   #:decode-query-version-reply
   #:decode-spanfix
   #:decode-transform
   #:decode-trap
   #:decode-trapezoid
   #:decode-triangle
   #:delay
   #:depth
   #:depths
   #:direct
   #:directformat
   #:encode-animcursorelt
   #:encode-color
   #:encode-directformat
   #:encode-glyphinfo
   #:encode-indexvalue
   #:encode-linefix
   #:encode-pictdepth
   #:encode-pictforminfo
   #:encode-pictscreen
   #:encode-pictvisual
   #:encode-pointfix
   #:encode-spanfix
   #:encode-transform
   #:encode-trap
   #:encode-trapezoid
   #:encode-triangle
   #:error-code
   #:fallback
   #:fill-rectangles
   #:fill-rectangles-request
   #:filters
   #:fixed
   #:format
   #:formats
   #:free-glyph-set
   #:free-glyph-set-request
   #:free-glyphs
   #:free-glyphs-request
   #:free-picture
   #:free-picture-request
   #:glyph
   #:glyph-error
   #:glyph-set-error
   #:glyphinfo
   #:glyphset
   #:green
   #:green-mask
   #:green-shift
   #:height
   #:id
   #:indexvalue
   #:l
   #:left
   #:length
   #:linefix
   #:major-opcode
   #:major-version
   #:matrix11
   #:matrix12
   #:matrix13
   #:matrix21
   #:matrix22
   #:matrix23
   #:matrix31
   #:matrix32
   #:matrix33
   #:minor-opcode
   #:minor-version
   #:num-aliases
   #:num-depths
   #:num-filters
   #:num-formats
   #:num-screens
   #:num-subpixel
   #:num-values
   #:num-visuals
   #:p1
   #:p2
   #:p3
   #:pict-format-error
   #:pict-op-error
   #:pictdepth
   #:pictformat
   #:pictforminfo
   #:pictscreen
   #:picture
   #:picture-error
   #:pictvisual
   #:pixel
   #:pointfix
   #:query-filters
   #:query-filters-reply
   #:query-filters-request
   #:query-pict-formats
   #:query-pict-formats-reply
   #:query-pict-formats-request
   #:query-pict-index-values
   #:query-pict-index-values-reply
   #:query-pict-index-values-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:r
   #:red
   #:red-mask
   #:red-shift
   #:reference-glyph-set
   #:reference-glyph-set-request
   #:response-type
   #:right
   #:screens
   #:sequence
   #:set-picture-clip-rectangles
   #:set-picture-clip-rectangles-request
   #:set-picture-filter
   #:set-picture-filter-request
   #:set-picture-transform
   #:set-picture-transform-request
   #:spanfix
   #:subpixels
   #:top
   #:transform
   #:trap
   #:trapezoid
   #:trapezoids
   #:trapezoids-request
   #:tri-fan
   #:tri-fan-request
   #:tri-strip
   #:tri-strip-request
   #:triangle
   #:triangles
   #:triangles-request
   #:type
   #:values
   #:visual
   #:visuals
   #:width
   #:x
   #:x-off
   #:y
   #:y-off))

(in-package #:XCB-RENDER)

(xcb:register-extension-xname "XCB-RENDER" "RENDER")

;;; Enum xcb.Render.PictType
(xcb:defenum render-pict-type
  (:indexed 0)
  (:direct 1))

;;; Enum xcb.Render.Picture
(xcb:defenum render-picture
  (:none 0))

;;; Enum xcb.Render.PictOp
(xcb:defenum render-pict-op
  (:clear 0)
  (:src 1)
  (:dst 2)
  (:over 3)
  (:over-reverse 4)
  (:in 5)
  (:in-reverse 6)
  (:out 7)
  (:out-reverse 8)
  (:atop 9)
  (:atop-reverse 10)
  (:xor 11)
  (:add 12)
  (:saturate 13)
  (:disjoint-clear 16)
  (:disjoint-src 17)
  (:disjoint-dst 18)
  (:disjoint-over 19)
  (:disjoint-over-reverse 20)
  (:disjoint-in 21)
  (:disjoint-in-reverse 22)
  (:disjoint-out 23)
  (:disjoint-out-reverse 24)
  (:disjoint-atop 25)
  (:disjoint-atop-reverse 26)
  (:disjoint-xor 27)
  (:conjoint-clear 32)
  (:conjoint-src 33)
  (:conjoint-dst 34)
  (:conjoint-over 35)
  (:conjoint-over-reverse 36)
  (:conjoint-in 37)
  (:conjoint-in-reverse 38)
  (:conjoint-out 39)
  (:conjoint-out-reverse 40)
  (:conjoint-atop 41)
  (:conjoint-atop-reverse 42)
  (:conjoint-xor 43)
  (:multiply 48)
  (:screen 49)
  (:overlay 50)
  (:darken 51)
  (:lighten 52)
  (:color-dodge 53)
  (:color-burn 54)
  (:hard-light 55)
  (:soft-light 56)
  (:difference 57)
  (:exclusion 58)
  (:hsl-hue 59)
  (:hsl-saturation 60)
  (:hsl-color 61)
  (:hsl-luminosity 62))

;;; Enum xcb.Render.PolyEdge
(xcb:defenum render-poly-edge
  (:sharp 0)
  (:smooth 1))

;;; Enum xcb.Render.PolyMode
(xcb:defenum render-poly-mode
  (:precise 0)
  (:imprecise 1))

;;; Enum xcb.Render.CP
(xcb:defenum render-cp
  (:repeat 1)
  (:alpha-map 2)
  (:alpha-x-origin 4)
  (:alpha-y-origin 8)
  (:clip-x-origin 16)
  (:clip-y-origin 32)
  (:clip-mask 64)
  (:graphics-exposure 128)
  (:subwindow-mode 256)
  (:poly-edge 512)
  (:poly-mode 1024)
  (:dither 2048)
  (:component-alpha 4096))

;;; Enum xcb.Render.SubPixel
(xcb:defenum render-sub-pixel
  (:unknown 0)
  (:horizontal-rgb 1)
  (:horizontal-bgr 2)
  (:vertical-rgb 3)
  (:vertical-bgr 4)
  (:none 5))

;;; Enum xcb.Render.Repeat
(xcb:defenum render-repeat
  (:none 0)
  (:normal 1)
  (:pad 2)
  (:reflect 3))
(deftype glyph () '(unsigned-byte 32))
(deftype glyphset () '(unsigned-byte 32))
(deftype picture () '(unsigned-byte 32))
(deftype pictformat () '(unsigned-byte 32))
(deftype fixed () '(signed-byte 32))

;;; Error xcb.Render.PictFormat (0)
(defclass pict-format-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-pict-format-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'pict-format-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RENDER" 0 #'decode-pict-format-error)

;;; Error xcb.Render.Picture (1)
(defclass picture-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-picture-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'picture-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RENDER" 1 #'decode-picture-error)

;;; Error xcb.Render.PictOp (2)
(defclass pict-op-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-pict-op-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'pict-op-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RENDER" 2 #'decode-pict-op-error)

;;; Error xcb.Render.GlyphSet (3)
(defclass glyph-set-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-glyph-set-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'glyph-set-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RENDER" 3 #'decode-glyph-set-error)

;;; Error xcb.Render.Glyph (4)
(defclass glyph-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-glyph-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'glyph-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RENDER" 4 #'decode-glyph-error)

;;; xcb.Render.DIRECTFORMAT
(defclass directformat nil
          ((red-shift :initarg :red-shift :accessor red-shift :type (unsigned-byte 16))
           (red-mask :initarg :red-mask :accessor red-mask :type (unsigned-byte 16))
           (green-shift :initarg :green-shift :accessor green-shift :type (unsigned-byte 16))
           (green-mask :initarg :green-mask :accessor green-mask :type (unsigned-byte 16))
           (blue-shift :initarg :blue-shift :accessor blue-shift :type (unsigned-byte 16))
           (blue-mask :initarg :blue-mask :accessor blue-mask :type (unsigned-byte 16))
           (alpha-shift :initarg :alpha-shift :accessor alpha-shift :type (unsigned-byte 16))
           (alpha-mask :initarg :alpha-mask :accessor alpha-mask :type (unsigned-byte 16))))
(defun encode-directformat (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((red-shift (slot-value %obj 'red-shift))
         (red-mask (slot-value %obj 'red-mask))
         (green-shift (slot-value %obj 'green-shift))
         (green-mask (slot-value %obj 'green-mask))
         (blue-shift (slot-value %obj 'blue-shift))
         (blue-mask (slot-value %obj 'blue-mask))
         (alpha-shift (slot-value %obj 'alpha-shift))
         (alpha-mask (slot-value %obj 'alpha-mask)))
    (declare
     (ignorable red-shift red-mask green-shift green-mask blue-shift blue-mask alpha-shift
      alpha-mask))
    (xcb:buffer-write-card16 %buf red-shift)
    (xcb:buffer-write-card16 %buf red-mask)
    (xcb:buffer-write-card16 %buf green-shift)
    (xcb:buffer-write-card16 %buf green-mask)
    (xcb:buffer-write-card16 %buf blue-shift)
    (xcb:buffer-write-card16 %buf blue-mask)
    (xcb:buffer-write-card16 %buf alpha-shift)
    (xcb:buffer-write-card16 %buf alpha-mask)))
(defun decode-directformat (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        red-shift
        red-mask
        green-shift
        green-mask
        blue-shift
        blue-mask
        alpha-shift
        alpha-mask)
    (declare
     (ignorable %p red-shift red-mask green-shift green-mask blue-shift blue-mask alpha-shift
      alpha-mask))
    (setf red-shift (xcb:read-card16-at %buf %p %order))
    (setf red-mask (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf green-shift (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf green-mask (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf blue-shift (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf blue-mask (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf alpha-shift (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf alpha-mask (xcb:read-card16-at %buf (+ %p 14) %order))
    (cl:values
     (make-instance 'directformat :red-shift red-shift :red-mask red-mask :green-shift green-shift
                    :green-mask green-mask :blue-shift blue-shift :blue-mask blue-mask :alpha-shift
                    alpha-shift :alpha-mask alpha-mask)
     (+ %p 16))))

;;; xcb.Render.PICTFORMINFO
(defclass pictforminfo nil
          ((id :initarg :id :accessor id :type pictformat)
           (type :initarg :type :accessor type :type (unsigned-byte 8))
           (depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (direct :initarg :direct :accessor direct :type directformat)
           (colormap :initarg :colormap :accessor colormap :type xcb:colormap)))
(defun encode-pictforminfo (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((id (slot-value %obj 'id))
         (type (slot-value %obj 'type))
         (depth (slot-value %obj 'depth))
         (direct (slot-value %obj 'direct))
         (colormap (slot-value %obj 'colormap)))
    (declare (ignorable id type depth direct colormap))
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-padding %buf 2)
    (encode-directformat %buf direct)
    (xcb:buffer-write-card32 %buf colormap)))
(defun decode-pictforminfo (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) id type depth direct colormap)
    (declare (ignorable %p id type depth direct colormap))
    (setf id (xcb:read-card32-at %buf %p %order))
    (setf type (xcb:read-card8-at %buf (+ %p 4)))
    (setf depth (xcb:read-card8-at %buf (+ %p 5)))
    (setf direct (decode-directformat %buf (+ %p 8) %order))
    (setf colormap (xcb:read-card32-at %buf (+ %p 24) %order))
    (cl:values
     (make-instance 'pictforminfo :id id :type type :depth depth :direct direct :colormap colormap)
     (+ %p 28))))

;;; xcb.Render.PICTVISUAL
(defclass pictvisual nil
          ((visual :initarg :visual :accessor visual :type xcb:visualid)
           (format :initarg :format :accessor format :type pictformat)))
(defun encode-pictvisual (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((visual (slot-value %obj 'visual)) (format (slot-value %obj 'format)))
    (declare (ignorable visual format))
    (xcb:buffer-write-card32 %buf visual)
    (xcb:buffer-write-card32 %buf format)))
(defun decode-pictvisual (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) visual format)
    (declare (ignorable %p visual format))
    (setf visual (xcb:read-card32-at %buf %p %order))
    (setf format (xcb:read-card32-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'pictvisual :visual visual :format format) (+ %p 8))))

;;; xcb.Render.PICTDEPTH
(defclass pictdepth nil
          ((depth :initarg :depth :accessor depth :type (unsigned-byte 8))
           (num-visuals :initarg :num-visuals :accessor num-visuals :type (unsigned-byte 16))
           (visuals :initarg :visuals :accessor visuals :type cl:sequence)))
(defun encode-pictdepth (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((depth (slot-value %obj 'depth))
         (visuals (slot-value %obj 'visuals))
         (num-visuals (cl:length visuals)))
    (declare (ignorable depth visuals num-visuals))
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf num-visuals)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-list %buf visuals num-visuals #'encode-pictvisual)))
(defun decode-pictdepth (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) depth num-visuals visuals)
    (declare (ignorable %p depth num-visuals visuals))
    (setf depth (xcb:read-card8-at %buf %p))
    (setf num-visuals (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (visuals %p)
      (xcb:read-struct-vector-at %buf %p num-visuals %order #'decode-pictvisual))
    (cl:values (make-instance 'pictdepth :depth depth :num-visuals num-visuals :visuals visuals)
               %p)))

;;; xcb.Render.PICTSCREEN
(defclass pictscreen nil
          ((num-depths :initarg :num-depths :accessor num-depths :type (unsigned-byte 32))
           (fallback :initarg :fallback :accessor fallback :type pictformat)
           (depths :initarg :depths :accessor depths :type cl:sequence)))
(defun encode-pictscreen (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((fallback (slot-value %obj 'fallback))
         (depths (slot-value %obj 'depths))
         (num-depths (cl:length depths)))
    (declare (ignorable fallback depths num-depths))
    (xcb:buffer-write-card32 %buf num-depths)
    (xcb:buffer-write-card32 %buf fallback)
    (xcb:buffer-write-list %buf depths num-depths #'encode-pictdepth)))
(defun decode-pictscreen (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) num-depths fallback depths)
    (declare (ignorable %p num-depths fallback depths))
    (setf num-depths (xcb:read-card32-at %buf %p %order))
    (setf fallback (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (depths %p)
      (xcb:read-struct-vector-at %buf %p num-depths %order #'decode-pictdepth))
    (cl:values (make-instance 'pictscreen :num-depths num-depths :fallback fallback :depths depths)
               %p)))

;;; xcb.Render.INDEXVALUE
(defclass indexvalue nil
          ((pixel :initarg :pixel :accessor pixel :type (unsigned-byte 32))
           (red :initarg :red :accessor red :type (unsigned-byte 16))
           (green :initarg :green :accessor green :type (unsigned-byte 16))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 16))
           (alpha :initarg :alpha :accessor alpha :type (unsigned-byte 16))))
(defun encode-indexvalue (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((pixel (slot-value %obj 'pixel))
         (red (slot-value %obj 'red))
         (green (slot-value %obj 'green))
         (blue (slot-value %obj 'blue))
         (alpha (slot-value %obj 'alpha)))
    (declare (ignorable pixel red green blue alpha))
    (xcb:buffer-write-card32 %buf pixel)
    (xcb:buffer-write-card16 %buf red)
    (xcb:buffer-write-card16 %buf green)
    (xcb:buffer-write-card16 %buf blue)
    (xcb:buffer-write-card16 %buf alpha)))
(defun decode-indexvalue (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) pixel red green blue alpha)
    (declare (ignorable %p pixel red green blue alpha))
    (setf pixel (xcb:read-card32-at %buf %p %order))
    (setf red (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf green (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf blue (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf alpha (xcb:read-card16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'indexvalue :pixel pixel :red red :green green :blue blue :alpha alpha)
     (+ %p 12))))

;;; xcb.Render.COLOR
(defclass color nil
          ((red :initarg :red :accessor red :type (unsigned-byte 16))
           (green :initarg :green :accessor green :type (unsigned-byte 16))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 16))
           (alpha :initarg :alpha :accessor alpha :type (unsigned-byte 16))))
(defun encode-color (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((red (slot-value %obj 'red))
         (green (slot-value %obj 'green))
         (blue (slot-value %obj 'blue))
         (alpha (slot-value %obj 'alpha)))
    (declare (ignorable red green blue alpha))
    (xcb:buffer-write-card16 %buf red)
    (xcb:buffer-write-card16 %buf green)
    (xcb:buffer-write-card16 %buf blue)
    (xcb:buffer-write-card16 %buf alpha)))
(defun decode-color (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) red green blue alpha)
    (declare (ignorable %p red green blue alpha))
    (setf red (xcb:read-card16-at %buf %p %order))
    (setf green (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf blue (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf alpha (xcb:read-card16-at %buf (+ %p 6) %order))
    (cl:values (make-instance 'color :red red :green green :blue blue :alpha alpha) (+ %p 8))))

;;; xcb.Render.POINTFIX
(defclass pointfix nil
          ((x :initarg :x :accessor x :type fixed) (y :initarg :y :accessor y :type fixed)))
(defun encode-pointfix (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((x (slot-value %obj 'x)) (y (slot-value %obj 'y)))
    (declare (ignorable x y))
    (xcb:buffer-write-card32 %buf x)
    (xcb:buffer-write-card32 %buf y)))
(defun decode-pointfix (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) x y)
    (declare (ignorable %p x y))
    (setf x (xcb:read-int32-at %buf %p %order))
    (setf y (xcb:read-int32-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'pointfix :x x :y y) (+ %p 8))))

;;; xcb.Render.LINEFIX
(defclass linefix nil
          ((p1 :initarg :p1 :accessor p1 :type pointfix)
           (p2 :initarg :p2 :accessor p2 :type pointfix)))
(defun encode-linefix (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((p1 (slot-value %obj 'p1)) (p2 (slot-value %obj 'p2)))
    (declare (ignorable p1 p2))
    (encode-pointfix %buf p1)
    (encode-pointfix %buf p2)))
(defun decode-linefix (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) p1 p2)
    (declare (ignorable %p p1 p2))
    (setf p1 (decode-pointfix %buf %p %order))
    (setf p2 (decode-pointfix %buf (+ %p 8) %order))
    (cl:values (make-instance 'linefix :p1 p1 :p2 p2) (+ %p 16))))

;;; xcb.Render.TRIANGLE
(defclass triangle nil
          ((p1 :initarg :p1 :accessor p1 :type pointfix)
           (p2 :initarg :p2 :accessor p2 :type pointfix)
           (p3 :initarg :p3 :accessor p3 :type pointfix)))
(defun encode-triangle (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((p1 (slot-value %obj 'p1)) (p2 (slot-value %obj 'p2)) (p3 (slot-value %obj 'p3)))
    (declare (ignorable p1 p2 p3))
    (encode-pointfix %buf p1)
    (encode-pointfix %buf p2)
    (encode-pointfix %buf p3)))
(defun decode-triangle (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) p1 p2 p3)
    (declare (ignorable %p p1 p2 p3))
    (setf p1 (decode-pointfix %buf %p %order))
    (setf p2 (decode-pointfix %buf (+ %p 8) %order))
    (setf p3 (decode-pointfix %buf (+ %p 16) %order))
    (cl:values (make-instance 'triangle :p1 p1 :p2 p2 :p3 p3) (+ %p 24))))

;;; xcb.Render.TRAPEZOID
(defclass trapezoid nil
          ((top :initarg :top :accessor top :type fixed)
           (bottom :initarg :bottom :accessor bottom :type fixed)
           (left :initarg :left :accessor left :type linefix)
           (right :initarg :right :accessor right :type linefix)))
(defun encode-trapezoid (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((top (slot-value %obj 'top))
         (bottom (slot-value %obj 'bottom))
         (left (slot-value %obj 'left))
         (right (slot-value %obj 'right)))
    (declare (ignorable top bottom left right))
    (xcb:buffer-write-card32 %buf top)
    (xcb:buffer-write-card32 %buf bottom)
    (encode-linefix %buf left)
    (encode-linefix %buf right)))
(defun decode-trapezoid (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) top bottom left right)
    (declare (ignorable %p top bottom left right))
    (setf top (xcb:read-int32-at %buf %p %order))
    (setf bottom (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf left (decode-linefix %buf (+ %p 8) %order))
    (setf right (decode-linefix %buf (+ %p 24) %order))
    (cl:values (make-instance 'trapezoid :top top :bottom bottom :left left :right right)
               (+ %p 40))))

;;; xcb.Render.GLYPHINFO
(defclass glyphinfo nil
          ((width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (x-off :initarg :x-off :accessor x-off :type (signed-byte 16))
           (y-off :initarg :y-off :accessor y-off :type (signed-byte 16))))
(defun encode-glyphinfo (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (x-off (slot-value %obj 'x-off))
         (y-off (slot-value %obj 'y-off)))
    (declare (ignorable width height x y x-off y-off))
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-write-card16 %buf x-off)
    (xcb:buffer-write-card16 %buf y-off)))
(defun decode-glyphinfo (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) width height x y x-off y-off)
    (declare (ignorable %p width height x y x-off y-off))
    (setf width (xcb:read-card16-at %buf %p %order))
    (setf height (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 4) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 6) %order))
    (setf x-off (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf y-off (xcb:read-int16-at %buf (+ %p 10) %order))
    (cl:values
     (make-instance 'glyphinfo :width width :height height :x x :y y :x-off x-off :y-off y-off)
     (+ %p 12))))

;;; Request xcb.Render.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
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
    (cl:values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Render.QueryPictFormats
(defun query-pict-formats (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-pict-formats-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-pict-formats-request)) (query-pict-formats conn))
(defclass query-pict-formats-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-formats :initarg :num-formats :accessor num-formats :type (unsigned-byte 32))
           (num-screens :initarg :num-screens :accessor num-screens :type (unsigned-byte 32))
           (num-depths :initarg :num-depths :accessor num-depths :type (unsigned-byte 32))
           (num-visuals :initarg :num-visuals :accessor num-visuals :type (unsigned-byte 32))
           (num-subpixel :initarg :num-subpixel :accessor num-subpixel :type (unsigned-byte 32))
           (formats :initarg :formats :accessor formats :type cl:sequence)
           (screens :initarg :screens :accessor screens :type cl:sequence)
           (subpixels :initarg :subpixels :accessor subpixels :type cl:sequence)))
(defun decode-query-pict-formats-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        num-formats
        num-screens
        num-depths
        num-visuals
        num-subpixel
        formats
        screens
        subpixels)
    (declare
     (ignorable %p response-type sequence length num-formats num-screens num-depths num-visuals
      num-subpixel formats screens subpixels))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-formats (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-screens (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-depths (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf num-visuals (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf num-subpixel (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (formats %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-formats (floor (- (+ %pos 32 (* 4 length)) %p) 28)) %order #'decode-pictforminfo))
    (multiple-value-setq (screens %p)
      (xcb:read-struct-vector-at %buf %p (min num-screens (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-pictscreen))
    (multiple-value-setq (subpixels %p)
      (xcb:read-vector-at %buf %p (min num-subpixel (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (cl:values
     (make-instance 'query-pict-formats-reply :response-type response-type :sequence sequence
                    :length length :num-formats num-formats :num-screens num-screens :num-depths
                    num-depths :num-visuals num-visuals :num-subpixel num-subpixel :formats formats
                    :screens screens :subpixels subpixels)
     (+ %pos 32 (* 4 length)))))
(defun query-pict-formats-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-pict-formats-reply))

;;; Request xcb.Render.QueryPictIndexValues
(defun query-pict-index-values (conn format)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf format)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-pict-index-values-request (xcb:request-with-reply)
          ((format :initarg :format :type pictformat)))
(defmethod xcb:send-request (conn (%obj query-pict-index-values-request))
  (query-pict-index-values conn (slot-value %obj 'format)))
(defclass query-pict-index-values-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-values :initarg :num-values :accessor num-values :type (unsigned-byte 32))
           (values :initarg :values :accessor values :type cl:sequence)))
(defun decode-query-pict-index-values-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-values values)
    (declare (ignorable %p response-type sequence length num-values values))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-values (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (values %p)
      (xcb:read-struct-vector-at %buf %p
       (min num-values (floor (- (+ %pos 32 (* 4 length)) %p) 12)) %order #'decode-indexvalue))
    (cl:values
     (make-instance 'query-pict-index-values-reply :response-type response-type :sequence sequence
                    :length length :num-values num-values :values values)
     (+ %pos 32 (* 4 length)))))
(defun query-pict-index-values-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-pict-index-values-reply))

;;; Request xcb.Render.CreatePicture
(defun create-picture
       (conn pid drawable format value-mask
        &key repeat alphamap alphaxorigin alphayorigin clipxorigin clipyorigin clipmask
        graphicsexposure subwindowmode polyedge polymode dither componentalpha)
  (xcb:check-value-mask 'create-picture value-mask (1 :repeat repeat nil)
   (2 :alphamap alphamap nil) (4 :alphaxorigin alphaxorigin nil) (8 :alphayorigin alphayorigin nil)
   (16 :clipxorigin clipxorigin nil) (32 :clipyorigin clipyorigin nil) (64 :clipmask clipmask nil)
   (128 :graphicsexposure graphicsexposure nil) (256 :subwindowmode subwindowmode nil)
   (512 :polyedge polyedge nil) (1024 :polymode polymode nil) (2048 :dither dither nil)
   (4096 :componentalpha componentalpha nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf pid)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf format)
    (xcb:buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf repeat))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf alphamap))
      (when (logtest %mask 4) (xcb:buffer-write-card32 %buf alphaxorigin))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf alphayorigin))
      (when (logtest %mask 16) (xcb:buffer-write-card32 %buf clipxorigin))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf clipyorigin))
      (when (logtest %mask 64) (xcb:buffer-write-card32 %buf clipmask))
      (when (logtest %mask 128) (xcb:buffer-write-card32 %buf graphicsexposure))
      (when (logtest %mask 256) (xcb:buffer-write-card32 %buf subwindowmode))
      (when (logtest %mask 512) (xcb:buffer-write-card32 %buf polyedge))
      (when (logtest %mask 1024) (xcb:buffer-write-card32 %buf polymode))
      (when (logtest %mask 2048) (xcb:buffer-write-card32 %buf dither))
      (when (logtest %mask 4096) (xcb:buffer-write-card32 %buf componentalpha)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-picture-request (xcb:request)
          ((pid :initarg :pid :type picture) (drawable :initarg :drawable :type xcb:drawable)
           (format :initarg :format :type pictformat)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (repeat :initarg :repeat :type (unsigned-byte 32))
           (alphamap :initarg :alphamap :type picture)
           (alphaxorigin :initarg :alphaxorigin :type (signed-byte 32))
           (alphayorigin :initarg :alphayorigin :type (signed-byte 32))
           (clipxorigin :initarg :clipxorigin :type (signed-byte 32))
           (clipyorigin :initarg :clipyorigin :type (signed-byte 32))
           (clipmask :initarg :clipmask :type xcb:pixmap)
           (graphicsexposure :initarg :graphicsexposure :type (unsigned-byte 32))
           (subwindowmode :initarg :subwindowmode :type (unsigned-byte 32))
           (polyedge :initarg :polyedge :type (unsigned-byte 32))
           (polymode :initarg :polymode :type (unsigned-byte 32))
           (dither :initarg :dither :type xcb:atom)
           (componentalpha :initarg :componentalpha :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj create-picture-request))
  (apply #'create-picture conn (slot-value %obj 'pid) (slot-value %obj 'drawable)
         (slot-value %obj 'format) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'repeat) (list :repeat (slot-value %obj 'repeat)))
                (when (slot-boundp %obj 'alphamap) (list :alphamap (slot-value %obj 'alphamap)))
                (when (slot-boundp %obj 'alphaxorigin)
                  (list :alphaxorigin (slot-value %obj 'alphaxorigin)))
                (when (slot-boundp %obj 'alphayorigin)
                  (list :alphayorigin (slot-value %obj 'alphayorigin)))
                (when (slot-boundp %obj 'clipxorigin)
                  (list :clipxorigin (slot-value %obj 'clipxorigin)))
                (when (slot-boundp %obj 'clipyorigin)
                  (list :clipyorigin (slot-value %obj 'clipyorigin)))
                (when (slot-boundp %obj 'clipmask) (list :clipmask (slot-value %obj 'clipmask)))
                (when (slot-boundp %obj 'graphicsexposure)
                  (list :graphicsexposure (slot-value %obj 'graphicsexposure)))
                (when (slot-boundp %obj 'subwindowmode)
                  (list :subwindowmode (slot-value %obj 'subwindowmode)))
                (when (slot-boundp %obj 'polyedge) (list :polyedge (slot-value %obj 'polyedge)))
                (when (slot-boundp %obj 'polymode) (list :polymode (slot-value %obj 'polymode)))
                (when (slot-boundp %obj 'dither) (list :dither (slot-value %obj 'dither)))
                (when (slot-boundp %obj 'componentalpha)
                  (list :componentalpha (slot-value %obj 'componentalpha))))))

;;; Request xcb.Render.ChangePicture
(defun change-picture
       (conn picture value-mask
        &key repeat alphamap alphaxorigin alphayorigin clipxorigin clipyorigin clipmask
        graphicsexposure subwindowmode polyedge polymode dither componentalpha)
  (xcb:check-value-mask 'change-picture value-mask (1 :repeat repeat nil)
   (2 :alphamap alphamap nil) (4 :alphaxorigin alphaxorigin nil) (8 :alphayorigin alphayorigin nil)
   (16 :clipxorigin clipxorigin nil) (32 :clipyorigin clipyorigin nil) (64 :clipmask clipmask nil)
   (128 :graphicsexposure graphicsexposure nil) (256 :subwindowmode subwindowmode nil)
   (512 :polyedge polyedge nil) (1024 :polymode polymode nil) (2048 :dither dither nil)
   (4096 :componentalpha componentalpha nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf repeat))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf alphamap))
      (when (logtest %mask 4) (xcb:buffer-write-card32 %buf alphaxorigin))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf alphayorigin))
      (when (logtest %mask 16) (xcb:buffer-write-card32 %buf clipxorigin))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf clipyorigin))
      (when (logtest %mask 64) (xcb:buffer-write-card32 %buf clipmask))
      (when (logtest %mask 128) (xcb:buffer-write-card32 %buf graphicsexposure))
      (when (logtest %mask 256) (xcb:buffer-write-card32 %buf subwindowmode))
      (when (logtest %mask 512) (xcb:buffer-write-card32 %buf polyedge))
      (when (logtest %mask 1024) (xcb:buffer-write-card32 %buf polymode))
      (when (logtest %mask 2048) (xcb:buffer-write-card32 %buf dither))
      (when (logtest %mask 4096) (xcb:buffer-write-card32 %buf componentalpha)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-picture-request (xcb:request)
          ((picture :initarg :picture :type picture)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (repeat :initarg :repeat :type (unsigned-byte 32))
           (alphamap :initarg :alphamap :type picture)
           (alphaxorigin :initarg :alphaxorigin :type (signed-byte 32))
           (alphayorigin :initarg :alphayorigin :type (signed-byte 32))
           (clipxorigin :initarg :clipxorigin :type (signed-byte 32))
           (clipyorigin :initarg :clipyorigin :type (signed-byte 32))
           (clipmask :initarg :clipmask :type xcb:pixmap)
           (graphicsexposure :initarg :graphicsexposure :type (unsigned-byte 32))
           (subwindowmode :initarg :subwindowmode :type (unsigned-byte 32))
           (polyedge :initarg :polyedge :type (unsigned-byte 32))
           (polymode :initarg :polymode :type (unsigned-byte 32))
           (dither :initarg :dither :type xcb:atom)
           (componentalpha :initarg :componentalpha :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj change-picture-request))
  (apply #'change-picture conn (slot-value %obj 'picture) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'repeat) (list :repeat (slot-value %obj 'repeat)))
                (when (slot-boundp %obj 'alphamap) (list :alphamap (slot-value %obj 'alphamap)))
                (when (slot-boundp %obj 'alphaxorigin)
                  (list :alphaxorigin (slot-value %obj 'alphaxorigin)))
                (when (slot-boundp %obj 'alphayorigin)
                  (list :alphayorigin (slot-value %obj 'alphayorigin)))
                (when (slot-boundp %obj 'clipxorigin)
                  (list :clipxorigin (slot-value %obj 'clipxorigin)))
                (when (slot-boundp %obj 'clipyorigin)
                  (list :clipyorigin (slot-value %obj 'clipyorigin)))
                (when (slot-boundp %obj 'clipmask) (list :clipmask (slot-value %obj 'clipmask)))
                (when (slot-boundp %obj 'graphicsexposure)
                  (list :graphicsexposure (slot-value %obj 'graphicsexposure)))
                (when (slot-boundp %obj 'subwindowmode)
                  (list :subwindowmode (slot-value %obj 'subwindowmode)))
                (when (slot-boundp %obj 'polyedge) (list :polyedge (slot-value %obj 'polyedge)))
                (when (slot-boundp %obj 'polymode) (list :polymode (slot-value %obj 'polymode)))
                (when (slot-boundp %obj 'dither) (list :dither (slot-value %obj 'dither)))
                (when (slot-boundp %obj 'componentalpha)
                  (list :componentalpha (slot-value %obj 'componentalpha))))))

;;; Request xcb.Render.SetPictureClipRectangles
(defun set-picture-clip-rectangles (conn picture clip-x-origin clip-y-origin rectangles)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-write-card16 %buf clip-x-origin)
    (xcb:buffer-write-card16 %buf clip-y-origin)
    (xcb:buffer-write-struct-list-16 %buf rectangles #'xcb:encode-rectangle 4)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-picture-clip-rectangles-request (xcb:request)
          ((picture :initarg :picture :type picture)
           (clip-x-origin :initarg :clip-x-origin :type (signed-byte 16))
           (clip-y-origin :initarg :clip-y-origin :type (signed-byte 16))
           (rectangles :initarg :rectangles :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-picture-clip-rectangles-request))
  (set-picture-clip-rectangles conn (slot-value %obj 'picture) (slot-value %obj 'clip-x-origin)
   (slot-value %obj 'clip-y-origin) (slot-value %obj 'rectangles)))

;;; Request xcb.Render.FreePicture
(defun free-picture (conn picture)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass free-picture-request (xcb:request) ((picture :initarg :picture :type picture)))
(defmethod xcb:send-request (conn (%obj free-picture-request))
  (free-picture conn (slot-value %obj 'picture)))

;;; Request xcb.Render.Composite
(defun composite (conn op src mask dst src-x src-y mask-x mask-y dst-x dst-y width height)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf mask)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-card16 %buf mask-x)
    (xcb:buffer-write-card16 %buf mask-y)
    (xcb:buffer-write-card16 %buf dst-x)
    (xcb:buffer-write-card16 %buf dst-y)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass composite-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (mask :initarg :mask :type picture) (dst :initarg :dst :type picture)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (mask-x :initarg :mask-x :type (signed-byte 16))
           (mask-y :initarg :mask-y :type (signed-byte 16))
           (dst-x :initarg :dst-x :type (signed-byte 16))
           (dst-y :initarg :dst-y :type (signed-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj composite-request))
  (composite conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'mask)
   (slot-value %obj 'dst) (slot-value %obj 'src-x) (slot-value %obj 'src-y)
   (slot-value %obj 'mask-x) (slot-value %obj 'mask-y) (slot-value %obj 'dst-x)
   (slot-value %obj 'dst-y) (slot-value %obj 'width) (slot-value %obj 'height)))

;;; Request xcb.Render.Trapezoids
(defun trapezoids (conn op src dst mask-format src-x src-y traps)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-list %buf traps nil #'encode-trapezoid)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass trapezoids-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (traps :initarg :traps :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj trapezoids-request))
  (trapezoids conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'src-x) (slot-value %obj 'src-y)
   (slot-value %obj 'traps)))

;;; Request xcb.Render.Triangles
(defun triangles (conn op src dst mask-format src-x src-y triangles)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-list %buf triangles nil #'encode-triangle)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass triangles-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (triangles :initarg :triangles :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj triangles-request))
  (triangles conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'src-x) (slot-value %obj 'src-y)
   (slot-value %obj 'triangles)))

;;; Request xcb.Render.TriStrip
(defun tri-strip (conn op src dst mask-format src-x src-y points)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-list %buf points nil #'encode-pointfix)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass tri-strip-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (points :initarg :points :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj tri-strip-request))
  (tri-strip conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'src-x) (slot-value %obj 'src-y)
   (slot-value %obj 'points)))

;;; Request xcb.Render.TriFan
(defun tri-fan (conn op src dst mask-format src-x src-y points)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-list %buf points nil #'encode-pointfix)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass tri-fan-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (points :initarg :points :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj tri-fan-request))
  (tri-fan conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'src-x) (slot-value %obj 'src-y)
   (slot-value %obj 'points)))

;;; Request xcb.Render.CreateGlyphSet
(defun create-glyph-set (conn gsid format)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf gsid)
    (xcb:buffer-write-card32 %buf format)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-glyph-set-request (xcb:request)
          ((gsid :initarg :gsid :type glyphset) (format :initarg :format :type pictformat)))
(defmethod xcb:send-request (conn (%obj create-glyph-set-request))
  (create-glyph-set conn (slot-value %obj 'gsid) (slot-value %obj 'format)))

;;; Request xcb.Render.ReferenceGlyphSet
(defun reference-glyph-set (conn gsid existing)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf gsid)
    (xcb:buffer-write-card32 %buf existing)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass reference-glyph-set-request (xcb:request)
          ((gsid :initarg :gsid :type glyphset) (existing :initarg :existing :type glyphset)))
(defmethod xcb:send-request (conn (%obj reference-glyph-set-request))
  (reference-glyph-set conn (slot-value %obj 'gsid) (slot-value %obj 'existing)))

;;; Request xcb.Render.FreeGlyphSet
(defun free-glyph-set (conn glyphset)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass free-glyph-set-request (xcb:request) ((glyphset :initarg :glyphset :type glyphset)))
(defmethod xcb:send-request (conn (%obj free-glyph-set-request))
  (free-glyph-set conn (slot-value %obj 'glyphset)))

;;; Request xcb.Render.AddGlyphs
(defun add-glyphs (conn glyphset glyphids glyphs data)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER"))
         (%buf (xcb:conn-send-buffer conn))
         (glyphs-len (cl:length glyphids)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-write-card32 %buf glyphs-len)
    (xcb:buffer-write-list %buf glyphids glyphs-len #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf glyphs glyphs-len #'encode-glyphinfo)
    (xcb:buffer-write-octets %buf data)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass add-glyphs-request (xcb:request)
          ((glyphset :initarg :glyphset :type glyphset)
           (glyphs-len :initarg :glyphs-len :type (unsigned-byte 32))
           (glyphids :initarg :glyphids :type cl:sequence)
           (glyphs :initarg :glyphs :type cl:sequence) (data :initarg :data :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj add-glyphs-request))
  (add-glyphs conn (slot-value %obj 'glyphset) (slot-value %obj 'glyphids)
   (slot-value %obj 'glyphs) (slot-value %obj 'data)))

;;; Request xcb.Render.FreeGlyphs
(defun free-glyphs (conn glyphset glyphs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-write-list %buf glyphs nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass free-glyphs-request (xcb:request)
          ((glyphset :initarg :glyphset :type glyphset)
           (glyphs :initarg :glyphs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj free-glyphs-request))
  (free-glyphs conn (slot-value %obj 'glyphset) (slot-value %obj 'glyphs)))

;;; Request xcb.Render.CompositeGlyphs8
(defun composite-glyphs8 (conn op src dst mask-format glyphset src-x src-y glyphcmds)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-octets %buf glyphcmds)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass composite-glyphs8-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (glyphset :initarg :glyphset :type glyphset)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (glyphcmds :initarg :glyphcmds :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj composite-glyphs8-request))
  (composite-glyphs8 conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'glyphset) (slot-value %obj 'src-x)
   (slot-value %obj 'src-y) (slot-value %obj 'glyphcmds)))

;;; Request xcb.Render.CompositeGlyphs16
(defun composite-glyphs16 (conn op src dst mask-format glyphset src-x src-y glyphcmds)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-octets %buf glyphcmds)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass composite-glyphs16-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (glyphset :initarg :glyphset :type glyphset)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (glyphcmds :initarg :glyphcmds :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj composite-glyphs16-request))
  (composite-glyphs16 conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'glyphset) (slot-value %obj 'src-x)
   (slot-value %obj 'src-y) (slot-value %obj 'glyphcmds)))

;;; Request xcb.Render.CompositeGlyphs32
(defun composite-glyphs32 (conn op src dst mask-format glyphset src-x src-y glyphcmds)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 25)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf src)
    (xcb:buffer-write-card32 %buf dst)
    (xcb:buffer-write-card32 %buf mask-format)
    (xcb:buffer-write-card32 %buf glyphset)
    (xcb:buffer-write-card16 %buf src-x)
    (xcb:buffer-write-card16 %buf src-y)
    (xcb:buffer-write-octets %buf glyphcmds)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass composite-glyphs32-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (src :initarg :src :type picture)
           (dst :initarg :dst :type picture) (mask-format :initarg :mask-format :type pictformat)
           (glyphset :initarg :glyphset :type glyphset)
           (src-x :initarg :src-x :type (signed-byte 16))
           (src-y :initarg :src-y :type (signed-byte 16))
           (glyphcmds :initarg :glyphcmds :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj composite-glyphs32-request))
  (composite-glyphs32 conn (slot-value %obj 'op) (slot-value %obj 'src) (slot-value %obj 'dst)
   (slot-value %obj 'mask-format) (slot-value %obj 'glyphset) (slot-value %obj 'src-x)
   (slot-value %obj 'src-y) (slot-value %obj 'glyphcmds)))

;;; Request xcb.Render.FillRectangles
(defun fill-rectangles (conn op dst color rects)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 26)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf op)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf dst)
    (encode-color %buf color)
    (xcb:buffer-write-struct-list-16 %buf rects #'xcb:encode-rectangle 4)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass fill-rectangles-request (xcb:request)
          ((op :initarg :op :type (unsigned-byte 8)) (dst :initarg :dst :type picture)
           (color :initarg :color :type color) (rects :initarg :rects :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj fill-rectangles-request))
  (fill-rectangles conn (slot-value %obj 'op) (slot-value %obj 'dst) (slot-value %obj 'color)
   (slot-value %obj 'rects)))

;;; Request xcb.Render.CreateCursor
(defun create-cursor (conn cid source x y)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 27)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf cid)
    (xcb:buffer-write-card32 %buf source)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-cursor-request (xcb:request)
          ((cid :initarg :cid :type xcb:cursor) (source :initarg :source :type picture)
           (x :initarg :x :type (unsigned-byte 16)) (y :initarg :y :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj create-cursor-request))
  (create-cursor conn (slot-value %obj 'cid) (slot-value %obj 'source) (slot-value %obj 'x)
   (slot-value %obj 'y)))

;;; xcb.Render.TRANSFORM
(defclass transform nil
          ((matrix11 :initarg :matrix11 :accessor matrix11 :type fixed)
           (matrix12 :initarg :matrix12 :accessor matrix12 :type fixed)
           (matrix13 :initarg :matrix13 :accessor matrix13 :type fixed)
           (matrix21 :initarg :matrix21 :accessor matrix21 :type fixed)
           (matrix22 :initarg :matrix22 :accessor matrix22 :type fixed)
           (matrix23 :initarg :matrix23 :accessor matrix23 :type fixed)
           (matrix31 :initarg :matrix31 :accessor matrix31 :type fixed)
           (matrix32 :initarg :matrix32 :accessor matrix32 :type fixed)
           (matrix33 :initarg :matrix33 :accessor matrix33 :type fixed)))
(defun encode-transform (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((matrix11 (slot-value %obj 'matrix11))
         (matrix12 (slot-value %obj 'matrix12))
         (matrix13 (slot-value %obj 'matrix13))
         (matrix21 (slot-value %obj 'matrix21))
         (matrix22 (slot-value %obj 'matrix22))
         (matrix23 (slot-value %obj 'matrix23))
         (matrix31 (slot-value %obj 'matrix31))
         (matrix32 (slot-value %obj 'matrix32))
         (matrix33 (slot-value %obj 'matrix33)))
    (declare
     (ignorable matrix11 matrix12 matrix13 matrix21 matrix22 matrix23 matrix31 matrix32 matrix33))
    (xcb:buffer-write-card32 %buf matrix11)
    (xcb:buffer-write-card32 %buf matrix12)
    (xcb:buffer-write-card32 %buf matrix13)
    (xcb:buffer-write-card32 %buf matrix21)
    (xcb:buffer-write-card32 %buf matrix22)
    (xcb:buffer-write-card32 %buf matrix23)
    (xcb:buffer-write-card32 %buf matrix31)
    (xcb:buffer-write-card32 %buf matrix32)
    (xcb:buffer-write-card32 %buf matrix33)))
(defun decode-transform (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) matrix11 matrix12 matrix13 matrix21 matrix22 matrix23 matrix31 matrix32 matrix33)
    (declare
     (ignorable %p matrix11 matrix12 matrix13 matrix21 matrix22 matrix23 matrix31 matrix32
      matrix33))
    (setf matrix11 (xcb:read-int32-at %buf %p %order))
    (setf matrix12 (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf matrix13 (xcb:read-int32-at %buf (+ %p 8) %order))
    (setf matrix21 (xcb:read-int32-at %buf (+ %p 12) %order))
    (setf matrix22 (xcb:read-int32-at %buf (+ %p 16) %order))
    (setf matrix23 (xcb:read-int32-at %buf (+ %p 20) %order))
    (setf matrix31 (xcb:read-int32-at %buf (+ %p 24) %order))
    (setf matrix32 (xcb:read-int32-at %buf (+ %p 28) %order))
    (setf matrix33 (xcb:read-int32-at %buf (+ %p 32) %order))
    (cl:values
     (make-instance 'transform :matrix11 matrix11 :matrix12 matrix12 :matrix13 matrix13 :matrix21
                    matrix21 :matrix22 matrix22 :matrix23 matrix23 :matrix31 matrix31 :matrix32
                    matrix32 :matrix33 matrix33)
     (+ %p 36))))

;;; Request xcb.Render.SetPictureTransform
(defun set-picture-transform (conn picture transform)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 28)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (encode-transform %buf transform)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-picture-transform-request (xcb:request)
          ((picture :initarg :picture :type picture)
           (transform :initarg :transform :type transform)))
(defmethod xcb:send-request (conn (%obj set-picture-transform-request))
  (set-picture-transform conn (slot-value %obj 'picture) (slot-value %obj 'transform)))

;;; Request xcb.Render.QueryFilters
(defun query-filters (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 29)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-filters-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj query-filters-request))
  (query-filters conn (slot-value %obj 'drawable)))
(defclass query-filters-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-aliases :initarg :num-aliases :accessor num-aliases :type (unsigned-byte 32))
           (num-filters :initarg :num-filters :accessor num-filters :type (unsigned-byte 32))
           (aliases :initarg :aliases :accessor aliases :type cl:sequence)
           (filters :initarg :filters :accessor filters :type cl:sequence)))
(defun decode-query-filters-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-aliases num-filters aliases filters)
    (declare (ignorable %p response-type sequence length num-aliases num-filters aliases filters))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-aliases (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-filters (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (aliases %p)
      (xcb:read-vector-at %buf %p (min num-aliases (floor (- (+ %pos 32 (* 4 length)) %p) 2))
       %order :card16))
    (multiple-value-setq (filters %p)
      (xcb:read-struct-vector-at %buf %p (min num-filters (- (+ %pos 32 (* 4 length)) %p)) %order
       #'xcb:decode-str))
    (cl:values
     (make-instance 'query-filters-reply :response-type response-type :sequence sequence :length
                    length :num-aliases num-aliases :num-filters num-filters :aliases aliases
                    :filters filters)
     (+ %pos 32 (* 4 length)))))
(defun query-filters-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-filters-reply))

;;; Request xcb.Render.SetPictureFilter
(defun set-picture-filter (conn picture filter values)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER"))
         (%buf (xcb:conn-send-buffer conn))
         (filter-len (cl:length filter)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 30)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-write-card16 %buf filter-len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf filter filter-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-list %buf values nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-picture-filter-request (xcb:request)
          ((picture :initarg :picture :type picture)
           (filter-len :initarg :filter-len :type (unsigned-byte 16))
           (filter :initarg :filter :type cl:sequence) (values :initarg :values :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-picture-filter-request))
  (set-picture-filter conn (slot-value %obj 'picture) (slot-value %obj 'filter)
   (slot-value %obj 'values)))

;;; xcb.Render.ANIMCURSORELT
(defclass animcursorelt nil
          ((cursor :initarg :cursor :accessor cursor :type xcb:cursor)
           (delay :initarg :delay :accessor delay :type (unsigned-byte 32))))
(defun encode-animcursorelt (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((cursor (slot-value %obj 'cursor)) (delay (slot-value %obj 'delay)))
    (declare (ignorable cursor delay))
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-write-card32 %buf delay)))
(defun decode-animcursorelt (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) cursor delay)
    (declare (ignorable %p cursor delay))
    (setf cursor (xcb:read-card32-at %buf %p %order))
    (setf delay (xcb:read-card32-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'animcursorelt :cursor cursor :delay delay) (+ %p 8))))

;;; Request xcb.Render.CreateAnimCursor
(defun create-anim-cursor (conn cid cursors)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 31)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf cid)
    (xcb:buffer-write-list %buf cursors nil #'encode-animcursorelt)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-anim-cursor-request (xcb:request)
          ((cid :initarg :cid :type xcb:cursor) (cursors :initarg :cursors :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-anim-cursor-request))
  (create-anim-cursor conn (slot-value %obj 'cid) (slot-value %obj 'cursors)))

;;; xcb.Render.SPANFIX
(defclass spanfix nil
          ((l :initarg :l :accessor l :type fixed) (r :initarg :r :accessor r :type fixed)
           (y :initarg :y :accessor y :type fixed)))
(defun encode-spanfix (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((l (slot-value %obj 'l)) (r (slot-value %obj 'r)) (y (slot-value %obj 'y)))
    (declare (ignorable l r y))
    (xcb:buffer-write-card32 %buf l)
    (xcb:buffer-write-card32 %buf r)
    (xcb:buffer-write-card32 %buf y)))
(defun decode-spanfix (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) l r y)
    (declare (ignorable %p l r y))
    (setf l (xcb:read-int32-at %buf %p %order))
    (setf r (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf y (xcb:read-int32-at %buf (+ %p 8) %order))
    (cl:values (make-instance 'spanfix :l l :r r :y y) (+ %p 12))))

;;; xcb.Render.TRAP
(defclass trap nil
          ((top :initarg :top :accessor top :type spanfix)
           (bot :initarg :bot :accessor bot :type spanfix)))
(defun encode-trap (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((top (slot-value %obj 'top)) (bot (slot-value %obj 'bot)))
    (declare (ignorable top bot))
    (encode-spanfix %buf top)
    (encode-spanfix %buf bot)))
(defun decode-trap (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) top bot)
    (declare (ignorable %p top bot))
    (setf top (decode-spanfix %buf %p %order))
    (setf bot (decode-spanfix %buf (+ %p 12) %order))
    (cl:values (make-instance 'trap :top top :bot bot) (+ %p 24))))

;;; Request xcb.Render.AddTraps
(defun add-traps (conn picture x-off y-off traps)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 32)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (xcb:buffer-write-card16 %buf x-off)
    (xcb:buffer-write-card16 %buf y-off)
    (xcb:buffer-write-list %buf traps nil #'encode-trap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass add-traps-request (xcb:request)
          ((picture :initarg :picture :type picture) (x-off :initarg :x-off :type (signed-byte 16))
           (y-off :initarg :y-off :type (signed-byte 16))
           (traps :initarg :traps :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj add-traps-request))
  (add-traps conn (slot-value %obj 'picture) (slot-value %obj 'x-off) (slot-value %obj 'y-off)
   (slot-value %obj 'traps)))

;;; Request xcb.Render.CreateSolidFill
(defun create-solid-fill (conn picture color)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 33)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (encode-color %buf color)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-solid-fill-request (xcb:request)
          ((picture :initarg :picture :type picture) (color :initarg :color :type color)))
(defmethod xcb:send-request (conn (%obj create-solid-fill-request))
  (create-solid-fill conn (slot-value %obj 'picture) (slot-value %obj 'color)))

;;; Request xcb.Render.CreateLinearGradient
(defun create-linear-gradient (conn picture p1 p2 stops colors)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER"))
         (%buf (xcb:conn-send-buffer conn))
         (num-stops (cl:length stops)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 34)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (encode-pointfix %buf p1)
    (encode-pointfix %buf p2)
    (xcb:buffer-write-card32 %buf num-stops)
    (xcb:buffer-write-list %buf stops num-stops #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf colors num-stops #'encode-color)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-linear-gradient-request (xcb:request)
          ((picture :initarg :picture :type picture) (p1 :initarg :p1 :type pointfix)
           (p2 :initarg :p2 :type pointfix)
           (num-stops :initarg :num-stops :type (unsigned-byte 32))
           (stops :initarg :stops :type cl:sequence) (colors :initarg :colors :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-linear-gradient-request))
  (create-linear-gradient conn (slot-value %obj 'picture) (slot-value %obj 'p1)
   (slot-value %obj 'p2) (slot-value %obj 'stops) (slot-value %obj 'colors)))

;;; Request xcb.Render.CreateRadialGradient
(defun create-radial-gradient (conn picture inner outer inner-radius outer-radius stops colors)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER"))
         (%buf (xcb:conn-send-buffer conn))
         (num-stops (cl:length stops)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 35)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (encode-pointfix %buf inner)
    (encode-pointfix %buf outer)
    (xcb:buffer-write-card32 %buf inner-radius)
    (xcb:buffer-write-card32 %buf outer-radius)
    (xcb:buffer-write-card32 %buf num-stops)
    (xcb:buffer-write-list %buf stops num-stops #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf colors num-stops #'encode-color)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-radial-gradient-request (xcb:request)
          ((picture :initarg :picture :type picture) (inner :initarg :inner :type pointfix)
           (outer :initarg :outer :type pointfix) (inner-radius :initarg :inner-radius :type fixed)
           (outer-radius :initarg :outer-radius :type fixed)
           (num-stops :initarg :num-stops :type (unsigned-byte 32))
           (stops :initarg :stops :type cl:sequence) (colors :initarg :colors :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-radial-gradient-request))
  (create-radial-gradient conn (slot-value %obj 'picture) (slot-value %obj 'inner)
   (slot-value %obj 'outer) (slot-value %obj 'inner-radius) (slot-value %obj 'outer-radius)
   (slot-value %obj 'stops) (slot-value %obj 'colors)))

;;; Request xcb.Render.CreateConicalGradient
(defun create-conical-gradient (conn picture center angle stops colors)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RENDER"))
         (%buf (xcb:conn-send-buffer conn))
         (num-stops (cl:length stops)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 36)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf picture)
    (encode-pointfix %buf center)
    (xcb:buffer-write-card32 %buf angle)
    (xcb:buffer-write-card32 %buf num-stops)
    (xcb:buffer-write-list %buf stops num-stops #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf colors num-stops #'encode-color)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-conical-gradient-request (xcb:request)
          ((picture :initarg :picture :type picture) (center :initarg :center :type pointfix)
           (angle :initarg :angle :type fixed)
           (num-stops :initarg :num-stops :type (unsigned-byte 32))
           (stops :initarg :stops :type cl:sequence) (colors :initarg :colors :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-conical-gradient-request))
  (create-conical-gradient conn (slot-value %obj 'picture) (slot-value %obj 'center)
   (slot-value %obj 'angle) (slot-value %obj 'stops) (slot-value %obj 'colors)))
