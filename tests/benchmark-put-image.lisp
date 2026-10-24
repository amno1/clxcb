;;;; tests/benchmark-put-image.lisp — Benchmark xcb:put-image-chunked vs runes/xcb:put-image-chunked
;;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;;; SPDX-License-Identifier: MIT
;;;; See the LICENSE file for the full license text.
;;;;
;;;; Run from shell:
;;;;   sbcl --noinform --load tests/benchmark-put-image.lisp --eval "(benchmark-put-image:run-all)" --eval "(sb-ext:exit :code 0)"

;;;; (load "tests/benchmark-put-image.lisp")
;;;; (benchmark-put-image:run-all)
;;;; ;; or individually:
;;;; (benchmark-put-image:run-microbenchmarks)
;;;; (benchmark-put-image:run-x-benchmarks)


(defpackage #:benchmark-put-image
  (:use #:cl)
  (:export #:run-all
           #:run-x-benchmarks
           #:run-microbenchmarks))

(in-package #:benchmark-put-image)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-system :clxcb)
  (asdf:load-system :runes/xcb))

(defmacro measure ((&key (warmup 1) (runs 5) description) &body body)
  `(let ((desc ,description)
         (run-count ,runs)
         (warmup-count ,warmup))
     (format t "~%--- ~A ---~%" desc)
     (dotimes (w warmup-count)
       ,@body)
     (let ((real-times nil)
           (bytes-consed 0))
       (dotimes (r run-count)
         ;; A full collection before every run, not once before them
         ;; all, so that no run pays for the garbage of the one before.
         (sb-ext:gc :full t)
         (let ((start-bytes (sb-ext:get-bytes-consed))
               (start-time (get-internal-real-time)))
           ,@body
           (let ((elapsed (/ (- (get-internal-real-time) start-time)
                             (float internal-time-units-per-second)))
                 (consed (- (sb-ext:get-bytes-consed) start-bytes)))
             (push elapsed real-times)
             (incf bytes-consed consed))))
       (let* ((avg-time (/ (reduce #'+ real-times) run-count))
              (min-time (reduce #'min real-times))
              (max-time (reduce #'max real-times))
              (avg-consed (/ bytes-consed run-count)))
         (format t "  Avg Real Time: ~8,4F s  (min: ~8,4F s, max: ~8,4F s)~%" avg-time min-time max-time)
         (format t "  Avg Consed:    ~10,0F bytes (~,2F MB)~%" avg-consed (/ avg-consed (* 1024 1024.0)))
         (list :desc desc :avg avg-time :min min-time :max max-time :consed avg-consed)))))

;;; Controlled chunking functions for ablation (isolating displaced-to vs subseq)
(defun chunked-with-displaced (conn format drawable gc width height dst-x dst-y left-pad depth data chunk-size)
  (let* ((vec (if (= (array-rank data) 1)
                  data
                  (make-array (array-total-size data)
                              :element-type (array-element-type data)
                              :displaced-to data)))
         (total (array-total-size vec))
         (row-bytes (if (zerop height) 0 (round total height)))
         (rows-per-chunk (if (zerop row-bytes) 1 (max 1 (floor chunk-size row-bytes)))))
    (if (or (zerop total) (<= height rows-per-chunk))
        (xcb::put-image conn format drawable gc width height dst-x dst-y left-pad depth vec)
        (loop for y from 0 below height by rows-per-chunk
              for chunk-h = (min rows-per-chunk (- height y))
              for start   = (* y row-bytes)
              for end     = (+ start (* chunk-h row-bytes))
              for chunk   = (make-array (- end start)
                                        :element-type (array-element-type vec)
                                        :displaced-to vec
                                        :displaced-index-offset start)
              do (xcb::put-image conn format drawable gc width chunk-h dst-x (+ dst-y y) left-pad depth chunk)))))

(defun chunked-with-subseq (conn format drawable gc width height dst-x dst-y left-pad depth data chunk-size)
  (let* ((vec (if (= (array-rank data) 1)
                  data
                  (make-array (array-total-size data)
                              :element-type (array-element-type data)
                              :displaced-to data)))
         (total (array-total-size vec))
         (row-bytes (if (zerop height) 0 (/ total height)))
         (rows-per-chunk (if (zerop row-bytes) 1 (max 1 (floor chunk-size row-bytes)))))
    (if (or (<= height rows-per-chunk) (<= total chunk-size))
        (xcb::put-image conn format drawable gc width height dst-x dst-y left-pad depth vec)
        (loop for y from 0 below height by rows-per-chunk
              for chunk-h = (min rows-per-chunk (- height y))
              for start = (round (* y row-bytes))
              for end = (round (+ start (* chunk-h row-bytes)))
              for chunk-data = (subseq vec start end)
              do (xcb::put-image conn format drawable gc width chunk-h dst-x (+ dst-y y) left-pad depth chunk-data)))))

;;; End-to-end X11 Pixmap Benchmarks

(defun run-x-benchmarks ()
  (xcb:call-with-x-connection
   (lambda (conn)
     (let* ((screen (first (xcb:conn-roots conn)))
            (root   (xcb:root-window conn))
            (depth  (xcb:root-depth screen))
            (pixmap (xcb:generate-id conn))
            (gc     (xcb:generate-id conn))
            (max-b  (- (* 4 (xcb:conn-maximum-request-length conn)) 32)))
       (xcb::create-pixmap conn depth pixmap root 3840 2160)
       (xcb::create-gc conn gc pixmap 0)

       (format t "~%================================================================~%")
       (format t "END-TO-END BENCHMARKS: xcb:put-image-chunked vs runes/xcb~%")
       (format t "Connection max request length: ~D words (~D bytes)~%"
               (xcb:conn-maximum-request-length conn)
               (* 4 (xcb:conn-maximum-request-length conn)))
       (format t "================================================================~%")

       ;; TEST 1: Small images (1000 images, 32x32, 4 bytes/pixel = 4KB each)
       (format t "~%>>> TEST 1: Many small images (1,000 images @ 32x32, 4KB each) <<<~%")
       (let* ((w 32) (h 32) (size (* w h 4))
              (small-1d (make-array size :element-type '(unsigned-byte 8) :initial-element #x55))
              (small-2d (make-array (list h (* w 4)) :element-type '(unsigned-byte 8) :initial-element #xAA)))
         (measure (:description "clxcb (1D vector, 1,000 images)" :runs 5)
           (dotimes (i 1000)
             (xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth small-1d)))
         (measure (:description "runes/xcb (1D vector, 1,000 images)" :runs 5)
           (dotimes (i 1000)
             (runes/xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth small-1d)))
         (measure (:description "clxcb (2D array, 1,000 images)" :runs 5)
           (dotimes (i 1000)
             (xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth small-2d)))
         (measure (:description "runes/xcb (2D array, 1,000 images)" :runs 5)
           (dotimes (i 1000)
             (runes/xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth small-2d))))

       ;; TEST 2: Medium images (100 images, 128x128, 64KB each)
       (format t "~%>>> TEST 2: Medium images (100 images @ 128x128, 64KB each) <<<~%")
       (let* ((w 128) (h 128) (size (* w h 4))
              (med-1d (make-array size :element-type '(unsigned-byte 8) :initial-element #x77)))
         (measure (:description "clxcb (128x128, 100 images - 1 request each)" :runs 5)
           (dotimes (i 100)
             (xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth med-1d)))
         (measure (:description "runes/xcb (128x128, 100 images - 2 chunks of 32KB each)" :runs 5)
           (dotimes (i 100)
             (runes/xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth med-1d))))

       ;; TEST 3: One Large Image (2048x2048, 16 MB)
       (format t "~%>>> TEST 3: One Large Image (2048x2048, 16 MB) <<<~%")
       (let* ((w 2048) (h 2048) (size (* w h 4))
              (large (make-array size :element-type '(unsigned-byte 8) :initial-element #x33)))
         (measure (:description "clxcb (16 MB image, dynamic ~256KB chunks)" :runs 5)
           (xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth large))
         (measure (:description "runes/xcb (16 MB image, 32KB chunks with subseq)" :runs 5)
           (runes/xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth large)))

       ;; TEST 4: 4K UHD Image (3840x2160, ~33 MB)
       (format t "~%>>> TEST 4: Ultra-Large 4K UHD Image (3840x2160, 33 MB) <<<~%")
       (let* ((w 3840) (h 2160) (size (* w h 4))
              (huge (make-array size :element-type '(unsigned-byte 8) :initial-element #x11)))
         (measure (:description "clxcb (33 MB 4K image, dynamic ~256KB chunks)" :runs 3)
           (xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth huge))
         (measure (:description "runes/xcb (33 MB 4K image, 32KB chunks with subseq)" :runs 3)
           (runes/xcb:put-image-chunked conn 2 pixmap gc w h 0 0 0 depth huge)))

       ;; TEST 5: Controlled Ablation on 16 MB image
       (format t "~%>>> TEST 5: Controlled Ablation (Same Chunk Size on 16 MB) <<<~%")
       (let* ((w 2048) (h 2048) (size (* w h 4))
              (large (make-array size :element-type '(unsigned-byte 8) :initial-element #x33)))
         (format t "~%-- Ablation A: Both using 32KB chunk size (512 chunks) --~%")
         (measure (:description "Displaced Array (32KB chunks)" :runs 5)
           (chunked-with-displaced conn 2 pixmap gc w h 0 0 0 depth large 32768))
         (measure (:description "Subseq copying (32KB chunks)" :runs 5)
           (chunked-with-subseq conn 2 pixmap gc w h 0 0 0 depth large 32768))

         (format t "~%-- Ablation B: Both using 256KB chunk size (64 chunks) --~%")
         (measure (:description "Displaced Array (256KB chunks)" :runs 5)
           (chunked-with-displaced conn 2 pixmap gc w h 0 0 0 depth large max-b))
         (measure (:description "Subseq copying (256KB chunks)" :runs 5)
           (chunked-with-subseq conn 2 pixmap gc w h 0 0 0 depth large max-b)))

       (xcb::free-gc conn gc)
       (xcb::free-pixmap conn pixmap)))))

;;; Microbenchmarks (Isolated from X11)

(defun run-microbenchmarks ()
  (format t "~%================================================================~%")
  (format t "STANDALONE MICROBENCHMARKS (Memory Slicing & Access)~%")
  (format t "================================================================~%")
  (let* ((size (* 1024 1024 16)) ; 16 MB
         (orig (make-array size :element-type '(unsigned-byte 8) :initial-element #x42))
         (chunk-size 32768)
         (num-chunks (/ size chunk-size)))
    (format t "~%-- Slicing 16MB into ~D chunks of 32KB --~%" num-chunks)
    (measure (:description "SUBSEQ (allocates new vector per chunk)" :runs 5)
      (loop for i from 0 below num-chunks
            for start = (* i chunk-size)
            for end = (+ start chunk-size)
            collect (subseq orig start end)))
    (measure (:description "MAKE-ARRAY :DISPLACED-TO (zero payload copy)" :runs 5)
      (loop for i from 0 below num-chunks
            for start = (* i chunk-size)
            for end = (+ start chunk-size)
            collect (make-array chunk-size
                                :element-type '(unsigned-byte 8)
                                :displaced-to orig
                                :displaced-index-offset start)))))

(defun run-all ()
  (run-microbenchmarks)
  (run-x-benchmarks))
