;;; parse.lisp — X11 user-facing conventions: colour specs and geometry strings.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; Two things every X program that takes options from a user needs:
;;; turning a colour spec into a pixel, and parsing a geometry string
;;; such as "200x200-10+5".  Neither is part of the protocol, but both
;;; are X conventions rather than application ones, so they live here.

(in-package #:xcb)

;;; Colours

(defun %parse-hex-color (string)
  "Parse \"#RGB\", \"#RRGGBB\", \"#RRRGGGBBB\" or \"#RRRRGGGGBBBB\", as
   XParseColor does, into (VALUES R G B) with 8-bit channels.  Returns
   NIL if STRING is not of that form."
  (let* ((digits (subseq string 1))
         (n      (cl:length digits)))
    (when (and (member n '(3 6 9 12))
               (every (lambda (c) (digit-char-p c 16)) digits))
      (let ((w (/ n 3)))
        (flet ((channel (i)
                 ;; Scale a W-digit hex value to 0..255.
                 (let ((v (parse-integer digits :start (* i w) :end (* (1+ i) w)
                                                :radix 16)))
                   (round (* v 255) (1- (expt 16 w))))))
          (cl:values (channel 0) (channel 1) (channel 2)))))))

(defun %rgb->screen-pixel (conn screen r g b)
  "Return a pixel for the 8-bit R G B on SCREEN's default colormap.  On
   TrueColor and DirectColor root visuals the pixel is computed locally;
   on other visual classes a read-only cell is allocated with AllocColor."
  (let ((visual (find-root-visual screen)))
    (if (member (slot-value visual 'class) '(4 5))   ; TrueColor, DirectColor
        (rgb->pixel visual r g b)
        (flet ((c16 (v) (logior (ash v 8) v)))
          (slot-value (alloc-color-reply
                       conn (alloc-color conn (default-colormap screen)
                                         (c16 r) (c16 g) (c16 b)))
                      'pixel)))))

(defun parse-color (conn screen spec &optional default-pixel)
  "Resolve SPEC to an X server pixel on SCREEN's default colormap.
   SPEC may be:

     NIL          DEFAULT-PIXEL is returned unchanged.
     an integer   an #xRRGGBB triple, 0 to #xFFFFFF: RGB only, no alpha.
     \"#RRGGBB\"    a hex string, also #RGB, #RRRGGGBBB or #RRRRGGGGBBBB,
                  as XParseColor accepts.
     a string     a colour name from the server's colour database,
                  looked up with AllocNamedColor, e.g. \"MidnightBlue\".

   An unknown colour name prints a diagnostic on *ERROR-OUTPUT* and
   yields DEFAULT-PIXEL.  Signals an error for any other type of SPEC.

   On a PseudoColor visual, integer and hex specs and colour names all
   allocate a read-only colormap cell, which is never freed; on the
   TrueColor visuals of every current server that costs nothing."
  (cond
    ((null spec) default-pixel)
    ((integerp spec)
     (unless (<= 0 spec #xFFFFFF)
       (cl:error "Colour ~S is not an #xRRGGBB value." spec))
     (%rgb->screen-pixel conn screen
                         (ldb (byte 8 16) spec)
                         (ldb (byte 8  8) spec)
                         (ldb (byte 8  0) spec)))
    ((and (stringp spec) (plusp (cl:length spec)) (char= (char spec 0) #\#))
     (multiple-value-bind (r g b) (%parse-hex-color spec)
       (unless r
         (cl:error "Bad hex colour ~S: expected #RGB, #RRGGBB, #RRRGGGBBB or #RRRRGGGGBBBB."
                   spec))
       (%rgb->screen-pixel conn screen r g b)))
    ((stringp spec)
     (handler-case
         (slot-value (alloc-named-color-reply
                      conn (alloc-named-color conn (default-colormap screen) spec))
                     'pixel)
       (cl:error ()
         (cl:format *error-output* "~&Unknown colour name ~S, using the default.~%" spec)
         default-pixel)))
    (t (cl:error "Bad colour spec ~S: expected NIL, an integer or a string." spec))))

;;; Geometry strings

(defun %parse-geometry-offsets (string s)
  "Parse the offset part S of the geometry string STRING, e.g. \"+100-20\"
   or \"-0+5\", into (VALUES X Y X-NEGATIVE-P Y-NEGATIVE-P).  X is
   required, Y optional.  The NEGATIVE-P flags are separate from the
   values so that \"-0\" (flush against the right or bottom edge) is
   distinguishable from \"+0\"."
  (let ((i 0) (n (cl:length s)))
    (flet ((parse-one ()
             (when (>= i n) (return-from parse-one (cl:values nil nil)))
             (let ((sign (char s i)))
               (unless (member sign '(#\+ #\-))
                 (cl:error "Bad geometry string ~S." string))
               (incf i)
               (let ((start i))
                 (loop while (and (< i n) (digit-char-p (char s i)))
                       do (incf i))
                 (when (= start i)
                   (cl:error "Bad geometry string ~S." string))
                 (let ((v (parse-integer s :start start :end i)))
                   (if (char= sign #\-)
                       (cl:values (- v) t)
                       (cl:values v nil)))))))
      (multiple-value-bind (x x-neg) (parse-one)
        (multiple-value-bind (y y-neg) (parse-one)
          (when (< i n)
            (cl:error "Bad geometry string ~S." string))
          (cl:values x y x-neg y-neg))))))

(defun parse-geometry (string)
  "Parse an X11 geometry string (see X(7)) of the form

       [=][WIDTH][{x|X}HEIGHT][{+|-}XOFF[{+|-}YOFF]]

   as XParseGeometry does, and return a plist with any of the keys
   :WIDTH :HEIGHT :X :Y :X-NEGATIVE :Y-NEGATIVE.  Fields absent from
   STRING are absent from the plist.

   A negative offset is measured in from the right or bottom edge of the
   screen: :X -10 means 10 pixels between the window's right edge and
   the screen's.  :X-NEGATIVE / :Y-NEGATIVE are T for such offsets,
   which also covers \"-0\", where the value alone cannot say.  Signals
   an error for a malformed string."
  (let* ((s (string-left-trim "=" (string-trim " " string)))
         (n (cl:length s))
         (i 0)
         (result '()))
    (flet ((read-int ()
             (let ((start i))
               (loop while (and (< i n) (digit-char-p (char s i)))
                     do (incf i))
               (and (> i start) (parse-integer s :start start :end i)))))
      (let ((w (read-int)))
        (when w (setf (getf result :width) w)))
      (when (and (< i n) (char-equal (char s i) #\x))
        (incf i)
        (let ((h (read-int)))
          (unless h
            (cl:error "Bad geometry string ~S." string))
          (setf (getf result :height) h)))
      (when (< i n)
        (unless (member (char s i) '(#\+ #\-))
          (cl:error "Bad geometry string ~S." string))
        (multiple-value-bind (x y x-neg y-neg)
            (%parse-geometry-offsets string (subseq s i))
          (setf (getf result :x) x)
          (when x-neg (setf (getf result :x-negative) t))
          (when y
            (setf (getf result :y) y)
            (when y-neg (setf (getf result :y-negative) t)))))
      (when (and (null result) (plusp n))
        (cl:error "Bad geometry string ~S." string)))
    result))

(defun geometry-position (geometry screen-width screen-height width height)
  "Resolve the offsets of GEOMETRY, a plist from PARSE-GEOMETRY, for a
   WIDTH x HEIGHT window on a SCREEN-WIDTH x SCREEN-HEIGHT screen.
   Returns (VALUES X Y GRAVITY): X and Y are the window's top-left corner
   (NIL where GEOMETRY gives no offset), and GRAVITY is the window gravity
   keyword matching the anchored corner (:NORTH-WEST, :NORTH-EAST,
   :SOUTH-WEST or :SOUTH-EAST), for SET-WM-NORMAL-HINTS."
  (let ((gx (getf geometry :x))
        (gy (getf geometry :y))
        (x-neg (getf geometry :x-negative))
        (y-neg (getf geometry :y-negative)))
    (cl:values (and gx (if x-neg (- screen-width width (abs gx)) gx))
            (and gy (if y-neg (- screen-height height (abs gy)) gy))
            (if y-neg
                (if x-neg :south-east :south-west)
                (if x-neg :north-east :north-west)))))

;;; parse.lisp ends here
