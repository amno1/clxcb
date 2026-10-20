;;; visual.lisp — Visuals and pixel packing for TrueColor / DirectColor screens.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(in-package #:xcb)

(defun find-root-visual (screen)
  "Return the VISUALTYPE object that describes SCREEN's root window.

   Every depth in SCREEN's ALLOWED-DEPTHS list carries a set of visuals;
   exactly one of them -- the one whose VISUAL-ID equals the screen's
   ROOT-VISUAL -- is the visual the root window was created with.  That
   is the one to consult for masks, depth, and colour packing."
  (let ((root-vid (root-visual screen)))
    (dolist (d (coerce (allowed-depths screen) 'list))
      (dolist (v (coerce (visuals d) 'list))
        (when (= (visual-id v) root-vid)
          (return-from find-root-visual v))))
    (cl:error "Root visual #x~X not found in screen's allowed depths"
              root-vid)))

(defun ctz (n)
  "Count trailing zero bits in N.  Undefined for N = 0."
  (loop for i from 0
        until (logbitp 0 n)
        do (setf n (ash n -1))
        finally (return i)))

(defun scale-channel (value mask)
  "Scale a 0..255 channel value into the bits of MASK.

   A pixel's red channel occupies the bits MASK selects.  On an 8-bit
   per channel screen, MASK is 8 bits wide and VALUE passes through
   unchanged; on a 5- or 6-bit-per-channel screen, VALUE is scaled to
   the narrower range so a max input maps to a max output.  Returns the
   masked, shifted contribution this channel makes to a packed pixel."
  (if (zerop mask)
      0
      (let* ((n    (logcount mask))
             (sh   (ctz mask))
             (mval (1- (ash 1 n)))
             (sc   (if (= n 8) value (round (* value mval) 255))))
        (logand (ash sc sh) mask))))

(defun rgb->pixel (visual red green blue)
  "Pack an R G B triple (0..255 per channel) into a pixel value
   appropriate for VISUAL.

   Uses VISUAL's red, green, and blue masks, so it works on any
   TrueColor or DirectColor screen regardless of channel layout or
   bit depth.  Returns the pixel value."
  (logior (scale-channel red   (red-mask   visual))
          (scale-channel green (green-mask visual))
          (scale-channel blue  (blue-mask  visual))))

;;; Packing whole images
;;
;; RGB->PIXEL is for one colour at a time.  For an image -- a window's
;; worth of pixels -- PIXEL-FORMAT works out the visual's channel shifts
;; and widths and the connection's byte order once, and PACK-RGB-IMAGE
;; turns a buffer of R G B bytes into PutImage data with them, in a
;; typed loop.  32 bits per pixel, as TrueColor visuals of depth 24 and
;; 32 have on every server in practice.  (CL:TYPE and CL:LENGTH: the XCB
;; package shadows TYPE, LENGTH and FORMAT, protocol field names.)

(defstruct (pixel-format (:constructor %make-pixel-format))
  (red-shift   0 :type (integer 0 31))
  (green-shift 0 :type (integer 0 31))
  (blue-shift  0 :type (integer 0 31))
  (red-bits    8 :type (integer 0 16))
  (green-bits  8 :type (integer 0 16))
  (blue-bits   8 :type (integer 0 16))
  (lsb-p       t :type boolean))

(defun pixel-format (visual byte-order)
  "The PIXEL-FORMAT of VISUAL, with pixels in BYTE-ORDER (+LSB+ or
   +MSB+, as CONN-BYTE-ORDER gives it)."
  (flet ((shift (mask) (if (zerop mask) 0 (ctz mask))))
    (%make-pixel-format :red-shift   (shift (red-mask visual))
                        :green-shift (shift (green-mask visual))
                        :blue-shift  (shift (blue-mask visual))
                        :red-bits    (logcount (red-mask visual))
                        :green-bits  (logcount (green-mask visual))
                        :blue-bits   (logcount (blue-mask visual))
                        :lsb-p (eql byte-order +lsb+))))

(declaim (inline %channel))
(defun %channel (value bits)
  (declare (cl:type (unsigned-byte 8) value) (cl:type (integer 0 16) bits)
           (optimize speed (safety 0)))
  (if (= bits 8) value (ash (* value (1- (ash 1 bits))) -8)))

(defun pack-rgb-image (format rgb width height &optional out)
  "PutImage data, 4 bytes per pixel in FORMAT's byte order, for a
   WIDTH x HEIGHT image given as R G B bytes in RGB.  Writes into OUT
   when given (an octet vector of WIDTH*HEIGHT*4 or more) and returns it."
  (declare (cl:type pixel-format format)
           (cl:type (simple-array (unsigned-byte 8) (*)) rgb)
           (cl:type (unsigned-byte 16) width height))
  (let* ((n (* width height))
         (out (or out (make-array (* n 4) :element-type '(unsigned-byte 8))))
         (rs (pixel-format-red-shift format))
         (gs (pixel-format-green-shift format))
         (bs (pixel-format-blue-shift format))
         (rb (pixel-format-red-bits format))
         (gb (pixel-format-green-bits format))
         (bb (pixel-format-blue-bits format))
         (lsb (pixel-format-lsb-p format)))
    (declare (cl:type (simple-array (unsigned-byte 8) (*)) out)
             (cl:type (unsigned-byte 32) n))
    (assert (>= (cl:length rgb) (* n 3)))
    (assert (>= (cl:length out) (* n 4)))
    (locally (declare (optimize speed (safety 0)))
      (if (and (= rb gb bb 8) (= rs 16) (= gs 8) (= bs 0))
          ;; The usual xRGB: bytes B G R x (LSB) or x R G B (MSB).
          (if lsb
              (loop for i of-type (unsigned-byte 32) below n
                    for s of-type (unsigned-byte 32) from 0 by 3
                    for o of-type (unsigned-byte 32) from 0 by 4
                    do (setf (aref out o)       (aref rgb (+ s 2))
                             (aref out (+ o 1)) (aref rgb (+ s 1))
                             (aref out (+ o 2)) (aref rgb s)
                             (aref out (+ o 3)) 0))
              (loop for i of-type (unsigned-byte 32) below n
                    for s of-type (unsigned-byte 32) from 0 by 3
                    for o of-type (unsigned-byte 32) from 0 by 4
                    do (setf (aref out o)       0
                             (aref out (+ o 1)) (aref rgb s)
                             (aref out (+ o 2)) (aref rgb (+ s 1))
                             (aref out (+ o 3)) (aref rgb (+ s 2)))))
          ;; Any other layout, through shifts.
          (loop for i of-type (unsigned-byte 32) below n
                for s of-type (unsigned-byte 32) from 0 by 3
                for o of-type (unsigned-byte 32) from 0 by 4
                do (let ((pixel (logior (ash (%channel (aref rgb s) rb) rs)
                                        (ash (%channel (aref rgb (+ s 1)) gb) gs)
                                        (ash (%channel (aref rgb (+ s 2)) bb) bs))))
                     (declare (cl:type (unsigned-byte 32) pixel))
                     (if lsb
                         (setf (aref out o)       (ldb (byte 8 0) pixel)
                               (aref out (+ o 1)) (ldb (byte 8 8) pixel)
                               (aref out (+ o 2)) (ldb (byte 8 16) pixel)
                               (aref out (+ o 3)) (ldb (byte 8 24) pixel))
                         (setf (aref out o)       (ldb (byte 8 24) pixel)
                               (aref out (+ o 1)) (ldb (byte 8 16) pixel)
                               (aref out (+ o 2)) (ldb (byte 8 8) pixel)
                               (aref out (+ o 3)) (ldb (byte 8 0) pixel)))))))
    out))

;;; visual.lisp ends here
