;;; geometry.lisp — Coordinate translation and geometry queries.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(in-package #:xcb)

(defun root-window (conn)
  "Return screen 0's root window.

   Most X11 clients run on the one screen they were started on and
   never care that X can have several.  This is the screen-0 answer in
   one place, so that assumption is named rather than written out as
   (ROOT (FIRST (CONN-ROOTS CONN))) at each call site."
  (root (first (conn-roots conn))))

(defun window-root-position (conn window)
  "Return (VALUES X Y), the position of WINDOW's upper-left corner in
   root coordinates.  This is the position a drag delta should be
   applied to; the position inside the parent is not, because the WM
   may have reparented the window into a frame."
  (let* ((root   (root-window conn))
         (cookie (translate-coordinates conn window root 0 0))
         (reply  (translate-coordinates-reply conn cookie)))
    (cl:values (dst-x reply)
               (dst-y reply))))

(defun window-geometry (conn drawable)
  "Return (VALUES X Y WIDTH HEIGHT BORDER-WIDTH) for DRAWABLE.

   X and Y are relative to DRAWABLE's parent; a toplevel that a WM has
   reparented will report the offset inside its frame, not its position
   on the screen.  Use WINDOW-ROOT-POSITION for the root-relative
   position."
  (let* ((cookie (get-geometry conn drawable))
         (reply  (get-geometry-reply conn cookie)))
    (cl:values (slot-value reply 'x) (slot-value reply 'y)
               (slot-value reply 'width) (slot-value reply 'height)
               (slot-value reply 'border-width))))

;;; geometry.lisp ends here
