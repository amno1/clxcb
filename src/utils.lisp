;;; utils.lisp — byte-level wire primitives for X11.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; --------------------------------------------------------------------
;;; Acknowledgements
;;;
;;; The X11 wire protocol is fully specified in the X Window System
;;; Protocol, published by the X Consortium:
;;;
;;;     https://www.x.org/releases/current/doc/xproto/x11protocol.html
;;;
;;; Every multi-byte integer, and every length-prefixed field, is
;;; described there.  The choice of reading the setup reply as a single
;;; block and decoding it in place follows libxcb's _xcb_in_read_block
;;; (libxcb/xcb_in.c), Copyright (C) 2001-2004 Bart Massey and Jamey
;;; Sharp, MIT/X11 licensed.  No libxcb code is copied; the algorithms
;;; below are the published X11 wire layout.

(in-package #:xcb)


;;; Byte order
;;;
;;; The two-character codes are ASCII 'B' (0x42, big-endian) and 'l'
;;; (0x6C, little-endian), exactly as sent to the server in the first
;;; byte of the setup request.

(defconstant +MSB+ #x42
  "Big-endian byte-order code ('B'), sent to request MSB-first wire
   encoding.")

(defconstant +LSB+ #x6C
  "Little-endian byte-order code ('l'), sent to request LSB-first wire
   encoding.")

(defvar *default-byte-order*
  #+little-endian +LSB+
  #-little-endian +MSB+
  "The byte order new connections are opened with.  Defaults to the
   host's native order so that no byte swapping is needed on the wire.
   Rebind this only for testing or for a deliberately mixed-endian
   setup; an already-open connection captures its byte order at
   construction time and is not affected.")

(deftype octet () '(unsigned-byte 8))

;;; Block I/O over streams
;;;
;;; The efficient way to move X11 wire data is a block at a time, not a
;;; byte at a time: the connection's stream is deliberately unbuffered
;;; (see OPEN-CONNECTION in connection.lisp), so each READ-BYTE is a
;;; separate syscall.  READ-SEQUENCE and WRITE-SEQUENCE over a byte
;;; vector let the implementation pipeline the underlying reads and
;;; writes in whatever way is fastest for the platform.

(defun read-octets (stream n)
  "Read exactly N octets from STREAM into a fresh (SIMPLE-ARRAY
   (UNSIGNED-BYTE 8) (*)).  Signals END-OF-FILE if the stream ends
   before N octets have been read.

   The loop around READ-SEQUENCE is not decoration: on some
   implementations READ-SEQUENCE on a stream may return before it has
   filled the whole sequence (a short read), and the call is retried
   from where it left off.  A return value equal to the start position
   means no progress was made and the stream is at end-of-file."
  (let ((buf (make-array n :element-type 'octet)))
    (loop with pos = 0
          while (< pos n)
          for next = (read-sequence buf stream :start pos)
          do (when (= next pos)
               (cl:error 'end-of-file :stream stream))
             (setf pos next))
    buf))

(defun write-octets (bytes stream)
  "Write BYTES (a vector of octets, or any sequence of integers
   0..255) to STREAM."
  (write-sequence bytes stream)
  stream)


;;; Decoding integers from a byte vector
;;;
;;; All decoders take (BUFFER POSITION &OPTIONAL ORDER) and return the
;;; integer at POSITION.  They do not advance any cursor; the caller is
;;; expected to do positional arithmetic, which is what makes the
;;; handshake and reply decoders easy to read.

(declaim (inline %be16 %be32 %le16 %le32
                 %be16-signed %be32-signed))

(defun %be16 (buf pos)
  (declare (cl:type (simple-array octet (*)) buf)
           (cl:type fixnum pos))
  (logior (ash (aref buf pos) 8)
          (aref buf (the fixnum (1+ pos)))))

(defun %be32 (buf pos)
  (declare (cl:type (simple-array octet (*)) buf)
           (cl:type fixnum pos))
  (logior (ash (aref buf pos)                 24)
          (ash (aref buf (the fixnum (+ pos 1))) 16)
          (ash (aref buf (the fixnum (+ pos 2)))  8)
          (aref buf (the fixnum (+ pos 3)))))

(defun %le16 (buf pos)
  (declare (cl:type (simple-array octet (*)) buf)
           (cl:type fixnum pos))
  (logior (aref buf pos)
          (ash (aref buf (the fixnum (1+ pos))) 8)))

(defun %le32 (buf pos)
  (declare (cl:type (simple-array octet (*)) buf)
           (cl:type fixnum pos))
  (logior (aref buf pos)
          (ash (aref buf (the fixnum (+ pos 1)))  8)
          (ash (aref buf (the fixnum (+ pos 2))) 16)
          (ash (aref buf (the fixnum (+ pos 3))) 24)))

(defun %be16-signed (buf pos)
  (let ((v (%be16 buf pos)))
    (if (logbitp 15 v) (- v #x10000) v)))

(defun %be32-signed (buf pos)
  (let ((v (%be32 buf pos)))
    (if (logbitp 31 v) (- v #x100000000) v)))


;;; Order-aware public decoders
;;;
;;; The default order is *DEFAULT-BYTE-ORDER* so that a decoder called
;;; without an explicit ORDER matches the connection's own order.  Callers
;;; that know the connection's order, i.e. anything that reads a reply,
;;; should pass it explicitly, both for clarity and because a
;;; connection may have captured a different order at open time than
;;; *DEFAULT-BYTE-ORDER* has now.

(declaim (inline decode-card8 decode-int8
                 decode-card16 decode-int16
                 decode-card32 decode-int32))

(defun decode-card8 (buf pos)
  "Return the unsigned 8-bit integer at POS.  Byte order is irrelevant."
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos))
  (aref buf pos))

(defun decode-int8 (buf pos)
  "Return the signed 8-bit integer at POS."
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos))
  (let ((v (aref buf pos)))
    (if (logbitp 7 v) (- v #x100) v)))

(defun decode-card16 (buf pos &optional (order *default-byte-order*))
  "Return the unsigned 16-bit integer at POS, decoded according to ORDER."
  (if (= order +MSB+) (%be16 buf pos) (%le16 buf pos)))

(defun decode-card32 (buf pos &optional (order *default-byte-order*))
  "Return the unsigned 32-bit integer at POS, decoded according to ORDER."
  (if (= order +MSB+) (%be32 buf pos) (%le32 buf pos)))

(defun decode-int16 (buf pos &optional (order *default-byte-order*))
  "Return the signed 16-bit integer at POS, decoded according to ORDER."
  (let ((v (decode-card16 buf pos order)))
    (if (logbitp 15 v) (- v #x10000) v)))

(defun decode-int32 (buf pos &optional (order *default-byte-order*))
  "Return the signed 32-bit integer at POS, decoded according to ORDER."
  (let ((v (decode-card32 buf pos order)))
    (if (logbitp 31 v) (- v #x100000000) v)))


;;; Order-aware public encoders
;;;
;;; Return fresh (SIMPLE-ARRAY (UNSIGNED-BYTE 8) (*)) values.  Use these
;;; when a value has to be handed to WRITE-SEQUENCE as part of a larger
;;; block; for a single field written straight to a stream, the stream
;;; writers below are simpler.

(defun encode-card8 (n)
  (make-array 1 :element-type 'octet
                :initial-contents (list (logand n #xFF))))

(defun encode-card16 (n &optional (order *default-byte-order*))
  (let ((n (logand n #xFFFF)))
    (if (= order +MSB+)
        (make-array 2 :element-type 'octet
                      :initial-contents (list (ldb (byte 8  8) n)
                                              (ldb (byte 8  0) n)))
        (make-array 2 :element-type 'octet
                      :initial-contents (list (ldb (byte 8  0) n)
                                              (ldb (byte 8  8) n))))))

(defun encode-card32 (n &optional (order *default-byte-order*))
  (let ((n (logand n #xFFFFFFFF)))
    (if (= order +MSB+)
        (make-array 4 :element-type 'octet
                      :initial-contents (list (ldb (byte 8 24) n)
                                              (ldb (byte 8 16) n)
                                              (ldb (byte 8  8) n)
                                              (ldb (byte 8  0) n)))
        (make-array 4 :element-type 'octet
                      :initial-contents (list (ldb (byte 8  0) n)
                                              (ldb (byte 8  8) n)
                                              (ldb (byte 8 16) n)
                                              (ldb (byte 8 24) n))))))


;;; Convenience: read/write a single field straight off a stream
;;;
;;; These go through READ-OCTETS so they are efficient on the same
;;; unbuffered stream the handshake uses.  Do not use them in a tight
;;; loop over a large body; call READ-OCTETS once and decode from the
;;; buffer instead.

(defun read-card8 (stream)
  (aref (read-octets stream 1) 0))

(defun read-card16 (stream &optional (order *default-byte-order*))
  (decode-card16 (read-octets stream 2) 0 order))

(defun read-card32 (stream &optional (order *default-byte-order*))
  (decode-card32 (read-octets stream 4) 0 order))

;;; These are the inverse of the readers above and are provided so that
;;; the setup request writer in connection-setup.lisp can build its
;;; fixed prefix without allocating a scratch vector per field.

(defun write-card8 (n stream)
  (write-byte (logand n #xFF) stream)
  stream)

(defun write-card16 (n stream &optional (order *default-byte-order*))
  (let ((n (logand n #xFFFF)))
    (if (= order +MSB+)
        (progn
          (write-byte (ldb (byte 8 8) n) stream)
          (write-byte (ldb (byte 8 0) n) stream))
        (progn
          (write-byte (ldb (byte 8 0) n) stream)
          (write-byte (ldb (byte 8 8) n) stream)))
    stream))

(defun write-card32 (n stream &optional (order *default-byte-order*))
  (let ((n (logand n #xFFFFFFFF)))
    (if (= order +MSB+)
        (progn
          (write-byte (ldb (byte 8 24) n) stream)
          (write-byte (ldb (byte 8 16) n) stream)
          (write-byte (ldb (byte 8  8) n) stream)
          (write-byte (ldb (byte 8  0) n) stream))
        (progn
          (write-byte (ldb (byte 8  0) n) stream)
          (write-byte (ldb (byte 8  8) n) stream)
          (write-byte (ldb (byte 8 16) n) stream)
          (write-byte (ldb (byte 8 24) n) stream)))
    stream))


;;; Padding
;;;
;;; Several X11 structures are padded to a 4-byte boundary after a
;;; variable-length field.  These two helpers compute and emit the
;;; padding; they are used by the setup writer and by the serializer.

(defun pad-length-to-4 (n)
  "Return the number of bytes of padding needed to bring N bytes up
   to the next multiple of 4."
  (mod (- 4 (mod n 4)) 4))

(defun write-padding-to-4 (n stream)
  "Emit pad-length-to-4(N) zero bytes to STREAM."
  (dotimes (i (pad-length-to-4 n))
    (declare (ignorable i))
    (write-byte 0 stream))
  stream)


;;; Positional readers for generated decoders
;;;
;;; Every decoder the generator emits reads its fields with these, and
;;; with nothing else.  They all take (BUFFER POSITION ORDER), read at a
;;; caller-computed POSITION (no cursor is advanced), and return a
;;; fresh Lisp value.  BUFFER is always a (SIMPLE-ARRAY OCTET (*)), an
;;; exact-size copy of one packet, so a decoder misled by a bad count
;;; signals an index error at the packet's end instead of reading bytes
;;; that are not its own.  ORDER is accepted, and ignored, by the single-byte readers
;;; so that the generator can emit every call with the same shape.

(declaim (inline read-card8-at read-int8-at
                 read-card16-at read-int16-at
                 read-card32-at read-int32-at
                 read-card64-at read-int64-at))

(defun read-card8-at (buf pos &optional order)
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos)
           (ignore order))
  (aref buf pos))

(defun read-int8-at (buf pos &optional order)
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos)
           (ignore order))
  (let ((v (aref buf pos)))
    (if (logbitp 7 v) (- v #x100) v)))

(defun read-card16-at (buf pos order)
  (if (eql order +MSB+) (%be16 buf pos) (%le16 buf pos)))

(defun read-int16-at (buf pos order)
  (let ((v (read-card16-at buf pos order)))
    (if (logbitp 15 v) (- v #x10000) v)))

(defun read-card32-at (buf pos order)
  (if (eql order +MSB+) (%be32 buf pos) (%le32 buf pos)))

(defun read-int32-at (buf pos order)
  (let ((v (read-card32-at buf pos order)))
    (if (logbitp 31 v) (- v #x100000000) v)))

(defun read-card64-at (buf pos order)
  (let ((hi (read-card32-at buf (if (eql order +MSB+) pos (+ pos 4)) order))
        (lo (read-card32-at buf (if (eql order +MSB+) (+ pos 4) pos) order)))
    (logior (ash hi 32) lo)))

(defun read-int64-at (buf pos order)
  (let ((v (read-card64-at buf pos order)))
    (if (logbitp 63 v) (- v (ash 1 64)) v)))

(defun read-float32-at (buf pos order)
  (%make-single-float (read-int32-at buf pos order)))

(defun read-float64-at (buf pos order)
  (let ((hi (read-int32-at buf (if (eql order +MSB+) pos (+ pos 4)) order))
        (lo (read-card32-at buf (if (eql order +MSB+) (+ pos 4) pos) order)))
    (%make-double-float hi lo)))

(defun read-bytes-at (buf pos n)
  "Return a fresh octet vector holding the N bytes of BUF at POS."
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos n))
  (subseq buf pos (+ pos n)))

(defun read-string-at (buf pos n)
  "Return a fresh string of the N bytes of BUF at POS, one character
   per byte (the X11 STRING8 encoding is Latin-1)."
  (declare (cl:type (simple-array octet (*)) buf) (cl:type fixnum pos n))
  (let ((s (make-string n)))
    (dotimes (i n s)
      (setf (char s i) (code-char (aref buf (+ pos i)))))))

;;; List readers
;;;
;;; A list of N primitive values becomes a specialised vector; a list
;;; of N structures becomes a simple-vector.  Both return
;;; (VALUES VECTOR NEW-POSITION), so that a decoder can chain straight
;;; on to whatever follows the list.

(defun read-vector-at (buf pos n order kind)
  "Read N values of primitive KIND (:CARD8, :INT16, :FLOAT32, ...)
   starting at POS.  Returns (VALUES VECTOR NEW-POSITION)."
  (macrolet ((fill-with (element-type size reader)
               `(let ((v (make-array n :element-type ',element-type)))
                  (dotimes (i n)
                    (setf (aref v i) (,reader buf (+ pos (* i ,size)) order)))
                  (cl:values v (+ pos (* n ,size))))))
    (ecase kind
      (:card8   (cl:values (read-bytes-at buf pos n) (+ pos n)))
      (:int8    (fill-with (signed-byte 8)    1 read-int8-at))
      (:card16  (fill-with (unsigned-byte 16) 2 read-card16-at))
      (:int16   (fill-with (signed-byte 16)   2 read-int16-at))
      (:card32  (fill-with (unsigned-byte 32) 4 read-card32-at))
      (:int32   (fill-with (signed-byte 32)   4 read-int32-at))
      (:card64  (fill-with (unsigned-byte 64) 8 read-card64-at))
      (:int64   (fill-with (signed-byte 64)   8 read-int64-at))
      (:float32 (fill-with single-float       4 read-float32-at))
      (:float64 (fill-with double-float       8 read-float64-at)))))

(defun read-struct-vector-at (buf pos n order decoder)
  "Read N consecutive structures starting at POS, each with DECODER, a
   function of (BUFFER POSITION ORDER) returning (VALUES OBJECT
   NEW-POSITION).  Returns (VALUES SIMPLE-VECTOR NEW-POSITION)."
  (let ((v (make-array n)))
    (dotimes (i n)
      (multiple-value-bind (obj next) (funcall decoder buf pos order)
        (setf (svref v i) obj
              pos next)))
    (cl:values v pos)))

(declaim (inline align-position))
(defun align-position (pos align)
  "Round POS up to the next multiple of ALIGN."
  (* align (ceiling pos align)))

(defun sum-of (function sequence)
  "Return the sum of FUNCTION applied to every element of SEQUENCE.
   Generated code uses this for the <sumof> length expression."
  (let ((sum 0))
    (cl:map nil (lambda (e) (incf sum (funcall function e))) sequence)
    sum))
