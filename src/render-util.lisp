;;; render-util.lisp — searches over the RENDER PictFormat table.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(in-package "XCB-RENDER")

;;; EVAL-WHEN: FIND-STANDARD-PICT-FORMAT below reads these with #. while the
;;; file is compiled, and only some Lisps (SBCL) define a constant at
;;; compile time by themselves.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pict-standard-argb32+ 0
    "PictStandardARGB32: 8 bits per channel, alpha in the high byte.")
  (defconstant +pict-standard-rgb24+  1
    "PictStandardRGB24: 8 bits per channel, no alpha.")
  (defconstant +pict-standard-a8+     2
    "PictStandardA8: 8-bit alpha only, no colour.  The usual coverage
     mask for antialiased rendering.")
  (defconstant +pict-standard-a4+     3
    "PictStandardA4: 4-bit alpha only.")
  (defconstant +pict-standard-a1+     4
    "PictStandardA1: 1-bit alpha only.  What the -sharp option of the
     C xclock selects."))

(defun query-pict-formats-info (conn)
  "Return the RENDER PictFormat table for CONN: a
   QUERY-PICT-FORMATS-REPLY instance.  This is a blocking round trip;
   callers that need more than one lookup should hold the result."
  (query-pict-formats-reply conn (query-pict-formats conn)))

(defun find-pict-format (reply &key type depth
                                  red-mask green-mask blue-mask
                                  alpha-mask)
  "Search REPLY (a QueryPictFormats reply) for the first PictFormat
   whose fields match every non-NIL criterion.  Returns the format's
   numeric ID, or NIL.  TYPE is 0 for Indexed, 1 for Direct; on any
   format other than Direct the colour masks are undefined and the
   corresponding arguments should be left NIL."
  (loop for pf across (slot-value reply 'formats)
        for direct = (slot-value pf 'direct)
        when (and (or (null type)  (= (slot-value pf 'type) type))
                  (or (null depth) (= (slot-value pf 'depth) depth))
                  (or (null red-mask)
                      (= (slot-value direct 'red-mask) red-mask))
                  (or (null green-mask)
                      (= (slot-value direct 'green-mask) green-mask))
                  (or (null blue-mask)
                      (= (slot-value direct 'blue-mask) blue-mask))
                  (or (null alpha-mask)
                      (= (slot-value direct 'alpha-mask) alpha-mask)))
          do (return-from find-pict-format
               (slot-value pf 'id)))
  nil)

(defun find-standard-pict-format (reply standard)
  "Return the PictFormat ID for one of the five standard formats the
   RENDER spec guarantees.  STANDARD is one of the +PICT-STANDARD-*+
   constants.

   The spec pins these to IDs 0..4, but a few servers have been known
   to enumerate them in a different order after a driver change; the
   search by direct-format masks makes the lookup independent of that.
   Falls back to the reserved ID only if the search fails, so callers
   that trust the spec still get an answer."
  (macrolet ((try (&body search-args)
               `(or (find-pict-format reply ,@search-args) standard)))
    (case standard
      (#.+pict-standard-argb32+
       (try :type 1 :depth 32
            :red-mask #xff0000 :green-mask #xff00 :blue-mask #xff
            :alpha-mask #xff000000))
      (#.+pict-standard-rgb24+
       (try :type 1 :depth 24
            :red-mask #xff0000 :green-mask #xff00 :blue-mask #xff
            :alpha-mask 0))
      (#.+pict-standard-a8+
       (try :type 1 :depth 8
            :red-mask 0 :green-mask 0 :blue-mask 0
            :alpha-mask #xff))
      (#.+pict-standard-a4+
       (try :type 1 :depth 4
            :red-mask 0 :green-mask 0 :blue-mask 0
            :alpha-mask #xf))
      (#.+pict-standard-a1+
       (try :type 1 :depth 1
            :red-mask 0 :green-mask 0 :blue-mask 0
            :alpha-mask #x1))
      (otherwise
       (error "find-standard-pict-format: unknown standard ~S" standard)))))

(defun find-visual-pict-format (reply visual-id)
  "Return the RENDER PictFormat the server associates with VISUAL-ID,
   or NIL.  Walks the QueryPictFormats reply's screens -> depths ->
   visuals tree."
  (loop for pscreen across (slot-value reply 'screens)
        do (loop for pdepth across (slot-value pscreen 'depths)
                 do (loop for pvisual across (slot-value pdepth 'visuals)
                          when (= (slot-value pvisual 'visual) visual-id)
                            do (return-from find-visual-pict-format
                                 (slot-value pvisual 'format)))))
  nil)

(defun make-color (red green blue &optional (alpha #xFFFF))
  "Return an XCB-RENDER:COLOR with the given 16-bit components.  ALPHA
   defaults to #xFFFF, fully opaque."
  (make-instance 'color
                 :red red :green green :blue blue :alpha alpha))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export '(query-pict-formats
            query-pict-formats-reply
            query-pict-formats-info
            find-pict-format
            find-standard-pict-format
            find-visual-pict-format
            +pict-standard-argb32+
            +pict-standard-rgb24+
            +pict-standard-a8+
            +pict-standard-a4+
            +pict-standard-a1+
            make-color
            create-picture
            free-picture
            composite
            create-solid-fill)
          (find-package "XCB-RENDER")))
