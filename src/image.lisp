;;; image.lisp — helpers over the X11 image requests (GetImage, PutImage).
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; No single request can carry more than the connection's
;;; MAXIMUM-REQUEST-LENGTH words: the setup's limit, at most 256 KiB, or
;;; the larger one BIG-REQUESTS gives once enabled.  Chunking a large
;;; upload is therefore always necessary in principle.  The wrapper here
;;; enables BIG-REQUESTS when an image needs it, and makes no copy of
;;; DATA of its own: an octet array goes to the send buffer with one
;;; REPLACE, whole or, chunked, as displaced slices.  An array of another
;;; element type is checked element by element on the way
;;; (BUFFER-WRITE-OCTETS).

(in-package #:xcb)

(defun put-image-chunked (conn format drawable gc
                          width height dst-x dst-y left-pad depth data)
  "Upload DATA to DRAWABLE via PUT-IMAGE, chunking by rows if
   necessary to stay within CONN's MAXIMUM-REQUEST-LENGTH.

   DATA may be a 1-D octet vector or a 2-D octet array; it is not
   modified and — in the chunked path — not copied.

   ARGS match PUT-IMAGE; see that function's docstring."
  (let* ((vec (if (= (array-rank data) 1)
                  data
                  (make-array (array-total-size data)
                              :element-type (array-element-type data)
                              :displaced-to data)))
         (total (array-total-size vec))
         ;; BIG-REQUESTS is enabled by the first request too long for the
         ;; setup's limit, and chunks sized to that limit never are.  So
         ;; when DATA does not fit one request, enable it first, if the
         ;; server has it, and size the chunks to the limit it gives.
         (big-requests
           (and (> (+ total 28) (* 4 (conn-maximum-request-length conn)))
                (extension-present-p conn "XCB-BIGREQUESTS")
                (%ensure-big-requests conn 0)))
         ;; PUT-IMAGE's fixed header is 24 bytes, its length field
         ;; included, and 28 when BIG-REQUESTS adds a 32-bit length after
         ;; the (then zero) 16-bit one.
         (max-bytes (- (* 4 (conn-maximum-request-length conn)) 28))
         (row-bytes (if (zerop height) 0 (round total height)))
         (rows-per-chunk (if (zerop row-bytes)
                             1
                             (max 1 (floor max-bytes row-bytes)))))
    (declare (ignore big-requests))
    (if (or (zerop total) (<= height rows-per-chunk))
        (xcb::put-image conn format drawable gc
                        width height dst-x dst-y left-pad depth vec)
        (loop for y from 0 below height by rows-per-chunk
              for chunk-h = (min rows-per-chunk (- height y))
              for start   = (* y row-bytes)
              for end     = (+ start (* chunk-h row-bytes))
              for chunk   = (make-array (- end start)
                                        :element-type (array-element-type vec)
                                        :displaced-to vec
                                        :displaced-index-offset start)
              do (xcb::put-image conn format drawable gc
                                 width chunk-h
                                 dst-x (+ dst-y y) left-pad depth
                                 chunk)))))
