;;;; tests/benchmark-write-batching.lisp — immediate vs deferred writes
;;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;;; SPDX-License-Identifier: MIT
;;;; See the LICENSE file for the full license text.
;;;;
;;;; A benchmark, not a test: no test system loads it.  It measures
;;;; XCB::*DEFER-WRITES* (doc/threads.md, section 2) on the X server named
;;;; by $DISPLAY, preferably a real one: Xephyr's own drawing swamps the
;;;; difference.  It draws into an off-screen pixmap, so nothing appears,
;;;; and frees it.
;;;;
;;;; Each case sends a fixed number of PolyFillRectangle requests of K
;;;; rectangles, then one round trip, and reports the median of three
;;;; runs of the wall-clock time, and the number of sendmsg calls, with
;;;; writes immediate and deferred.
;;;;
;;;; Run from the clxcb directory:
;;;;   sbcl --non-interactive --load tests/benchmark-write-batching.lisp \
;;;;        --eval "(benchmark-write-batching:run)"

(asdf:load-asd (merge-pathnames "clxcb.asd" (uiop:getcwd)))
(asdf:load-system "clxcb")

(defpackage #:benchmark-write-batching
  (:use #:cl)
  (:export #:run))

(in-package #:benchmark-write-batching)

(defvar *sends* 0
  "sendmsg calls made, counted at XCB::%SOCKET-SEND-NOW, which makes one each.")

(defun count-sends ()
  (unless (sb-int:encapsulated-p 'xcb::%socket-send-now 'count)
    (sb-int:encapsulate 'xcb::%socket-send-now 'count
                        (lambda (f &rest args) (incf *sends*) (apply f args)))))

(defun rectangles (k)
  (loop for i below k
        collect (make-instance 'xcb:rectangle :x (mod (* i 7) 700) :y (mod (* i 13) 500)
                                              :width 20 :height 20)))

(defun run-case (conn pixmap gc k requests defer)
  "Send REQUESTS PolyFillRectangles of K rectangles and one round trip.
   Returns (VALUES MILLISECONDS SENDMSG-CALLS)."
  (let ((rects (rectangles k))
        (xcb::*defer-writes* defer))
    (setf *sends* 0)
    (let ((t0 (get-internal-real-time)))
      (dotimes (i requests) (xcb:poly-fill-rectangle conn pixmap gc rects))
      (xcb:get-input-focus-reply conn (xcb:get-input-focus conn))
      (cl:values (/ (- (get-internal-real-time) t0)
                    (/ internal-time-units-per-second 1000.0))
                 *sends*))))

(defun run (&key (cases '((1 200000) (16 200000) (128 50000))))
  "Run every (K REQUESTS) case in CASES and print a table."
  (count-sends)
  (xcb:with-x-connection (conn)
    (let* ((screen (first (xcb:conn-roots conn)))
           (pixmap (xcb:generate-id conn))
           (gc (xcb:generate-id conn)))
      (xcb:create-pixmap conn (xcb:root-depth screen) pixmap (xcb:root screen) 800 600)
      (xcb:create-gc conn gc pixmap 4 :foreground #x336699)
      (run-case conn pixmap gc 1 2000 nil)  ; warm up
      (format t "~&~12a ~9a ~10a ~13a ~10a ~13a ~10a~%" "rects/req" "requests" "bytes/req"
              "immediate ms" "sendmsg" "deferred ms" "sendmsg")
      (dolist (case cases)
        (destructuring-bind (k requests) case
          (let (immediate deferred immediate-sends deferred-sends)
            (dotimes (r 3)
              (multiple-value-bind (ms sends) (run-case conn pixmap gc k requests nil)
                (push ms immediate) (setf immediate-sends sends))
              (multiple-value-bind (ms sends) (run-case conn pixmap gc k requests t)
                (push ms deferred) (setf deferred-sends sends)))
            (flet ((median (l) (nth 1 (sort l #'<))))
              (format t "~&~12d ~9d ~10d ~13,1f ~10d ~13,1f ~10d~%"
                      k requests (+ 12 (* 8 k))
                      (median immediate) immediate-sends
                      (median deferred) deferred-sends)))))
      (xcb:free-pixmap conn pixmap)
      (xcb:flush conn))))
