;;; buffer.lisp — output buffer for wire-format serialization.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(in-package "XCB")

(declaim (inline buffer-reset))

;;; A BUFFER is an adjustable octet vector with a fill-pointer, plus the
;;; byte order multi-byte values are written in.  Writers append at the
;;; fill-pointer and grow the vector on demand; nothing is ever zeroed
;;; ahead of time, so every byte that ends up on the wire, padding
;;; included, is written explicitly.
;;;
;;; Each connection maintains per-thread buffers (CONN-SEND-BUFFER).
;;; A generated request sender calls BUFFER-RESET on the calling
;;; thread's buffer, encodes the request with the writers below,
;;; finishes it with BUFFER-FINISH-REQUEST, and hands it to FLUSH-REQUEST.

(defstruct (buffer (:constructor %make-buffer))
  (octets (make-array 256 :element-type 'octet :adjustable t :fill-pointer 0))
  (byte-order *default-byte-order*))

(defun make-buffer (&key (byte-order *default-byte-order*) (capacity 256))
  (%make-buffer :byte-order byte-order
                :octets (make-array capacity :element-type 'octet
                                             :adjustable t :fill-pointer 0)))

(defun buffer-reset (buf)
  "Empty BUF by moving its fill-pointer back to 0.  The storage is kept,
   and the stale bytes past the fill-pointer are simply overwritten by
   the next request."
  (setf (fill-pointer (buffer-octets buf)) 0)
  buf)

(defun buffer-position (buf)
  (fill-pointer (buffer-octets buf)))

(defun buffer-write-byte (buf n)
  (vector-push-extend (logand n #xff) (buffer-octets buf))
  buf)

(defun buffer-write-card16 (buf n)
  (let ((n (logand n #xffff)))
    (if (= (buffer-byte-order buf) +MSB+)
        (progn (buffer-write-byte buf (ldb (byte 8 8) n))
               (buffer-write-byte buf (ldb (byte 8 0) n)))
        (progn (buffer-write-byte buf (ldb (byte 8 0) n))
               (buffer-write-byte buf (ldb (byte 8 8) n))))
    buf))

(defun buffer-write-card32 (buf n)
  (let ((n (logand n #xffffffff)))
    (if (= (buffer-byte-order buf) +MSB+)
        (progn (buffer-write-byte buf (ldb (byte 8 24) n))
               (buffer-write-byte buf (ldb (byte 8 16) n))
               (buffer-write-byte buf (ldb (byte 8  8) n))
               (buffer-write-byte buf (ldb (byte 8  0) n)))
        (progn (buffer-write-byte buf (ldb (byte 8  0) n))
               (buffer-write-byte buf (ldb (byte 8  8) n))
               (buffer-write-byte buf (ldb (byte 8 16) n))
               (buffer-write-byte buf (ldb (byte 8 24) n))))
    buf))

(defun buffer-write-card64 (buf n)
  (let ((n (logand n #xffffffffffffffff)))
    (if (= (buffer-byte-order buf) +MSB+)
        (loop for shift from 56 downto 0 by 8
              do (buffer-write-byte buf (ldb (byte 8 shift) n)))
        (loop for shift from 0 to 56 by 8
              do (buffer-write-byte buf (ldb (byte 8 shift) n))))
    buf))

(defun buffer-write-zeroes (buf n)
  (dotimes (i n) (buffer-write-byte buf 0))
  buf)

(defun buffer-pad-to-alignment (buf align)
  (loop while (not (zerop (mod (buffer-position buf) align)))
        do (buffer-write-byte buf 0))
  buf)

(defun buffer-patch-card16 (buf pos n)
  (let ((octets (buffer-octets buf))
        (n (logand n #xffff)))
    (if (= (buffer-byte-order buf) +MSB+)
        (setf (aref octets pos)       (ldb (byte 8 8) n)
              (aref octets (1+ pos)) (ldb (byte 8 0) n))
        (setf (aref octets pos)       (ldb (byte 8 0) n)
              (aref octets (1+ pos)) (ldb (byte 8 8) n)))
    buf))

;;; Typed writers
;;;
;;; These are the only writers generated encoders call.  Signed values
;;; need no writers of their own: masking a negative integer to the
;;; field width produces its two's-complement encoding.

(declaim (inline buffer-write-card8))
(defun buffer-write-card8 (buf n)
  (buffer-write-byte buf n))

(defun buffer-write-bool (buf value)
  "Write a BOOL.  VALUE may be a Lisp boolean or the integer 0 or 1."
  (buffer-write-byte buf (cond ((integerp value) value)
                               (value 1)
                               (t 0))))

(defun buffer-write-char (buf value)
  "Write a single character (or a character code) as one byte."
  (buffer-write-byte buf (if (characterp value) (char-code value) value)))

(defun buffer-write-float32 (buf x)
  (buffer-write-card32 buf (%single-float-bits (coerce x 'single-float))))

(defun buffer-write-float64 (buf x)
  (multiple-value-bind (hi lo) (%double-float-bits (coerce x 'double-float))
    (cond
      ((= (buffer-byte-order buf) +MSB+)
       (buffer-write-card32 buf hi)
       (buffer-write-card32 buf lo))
      (t
       (buffer-write-card32 buf lo)
       (buffer-write-card32 buf hi)))
    buf))

(defun buffer-write-padding (buf n)
  "Write N zero bytes."
  (buffer-write-zeroes buf n))

(defun buffer-pad-to-align (buf align)
  "Write zero bytes until BUF's length is a multiple of ALIGN."
  (buffer-pad-to-alignment buf align))

(defun buffer-write-octets (buf octets &key (start 0) end)
  "Append the octets of OCTETS (any sequence of integers 0..255)
   between START and END.  An element outside 0..255 is an error,
   reported with its index."
  ;; An octet vector, as images and pre-packed data are, is copied as it
  ;; is; anything else is checked first, so a bad element is reported
  ;; here rather than as a type error inside REPLACE.
  (unless (typep octets '(array (unsigned-byte 8) (*)))
    (flet ((check (e i)
             (unless (typep e '(unsigned-byte 8))
               (cl:error "BUFFER-WRITE-OCTETS: element ~D, ~S, is not an octet ~
                          (an integer from 0 to 255)."
                         i e))))
      ;; Walk OCTETS in place: a SUBSEQ of a large list would be a copy.
      (if (listp octets)
          (loop for e in (nthcdr start octets)
                for i from start below (or end most-positive-fixnum)
                do (check e i))
          (loop for i from start below (or end (cl:length octets))
                do (check (aref octets i) i)))))
  (let* ((vec (buffer-octets buf))
         (end (or end (cl:length octets)))
         (fill (fill-pointer vec))
         (new-fill (+ fill (- end start))))
    (when (> new-fill (array-dimension vec 0))
      (setf vec (adjust-array vec (max new-fill (* 2 (array-dimension vec 0))))
            (buffer-octets buf) vec))
    (setf (fill-pointer vec) new-fill)
    (replace vec octets :start1 fill :start2 start :end2 end)
    buf))

(defun buffer-write-string-octets (buf string &optional count)
  "Write the first COUNT characters of STRING (all of it by default)
   as one byte each: the character code truncated to 8 bits.  This is
   the X11 STRING8 encoding; a string that must go out as UTF-8 (for
   instance _NET_WM_NAME) has to be converted to octets first."
  (let ((count (or count (cl:length string))))
    (if (stringp string)
        (dotimes (i count)
          (buffer-write-byte buf (char-code (char string i))))
        (let ((i 0))
          (cl:map nil (lambda (c)
                        (when (< i count)
                          (buffer-write-char buf c)
                          (incf i)))
                  string)))
    buf))

(defun buffer-write-packed-16 (buf values per-element)
  "Append VALUES, a vector of integers, as 16-bit values in BUF's byte
   order, each truncated to 16 bits as BUFFER-WRITE-CARD16 does.  Its
   length must be a whole number of PER-ELEMENT values."
  (let ((n (cl:length values)))
    (unless (zerop (mod n per-element))
      (cl:error "A packed vector of ~D values is not a whole number of ~
                 ~D-value elements." n per-element))
    (let* ((vec (buffer-octets buf))
           (fill (fill-pointer vec))
           (new-fill (+ fill (* 2 n))))
      (when (> new-fill (array-dimension vec 0))
        (setf vec (adjust-array vec (max new-fill (* 2 (array-dimension vec 0))))
              (buffer-octets buf) vec))
      (setf (fill-pointer vec) new-fill)
      (if (= (buffer-byte-order buf) +MSB+)
          (loop for i fixnum from 0 below n
                for j fixnum from fill by 2
                do (let ((v (logand (aref values i) #xffff)))
                     (setf (aref vec j) (ash v -8)
                           (aref vec (1+ j)) (logand v #xff))))
          (loop for i fixnum from 0 below n
                for j fixnum from fill by 2
                do (let ((v (logand (aref values i) #xffff)))
                     (setf (aref vec j) (logand v #xff)
                           (aref vec (1+ j)) (ash v -8))))))
    buf))

(defun buffer-write-struct-list-16 (buf sequence writer per-element)
  "Write SEQUENCE, a list of a structure of PER-ELEMENT 16-bit integers
   (POINT, RECTANGLE, SEGMENT, ARC).  SEQUENCE is a list or vector of
   such structures, written with WRITER, or a vector of integers holding
   their fields one after another (x y width height x y ...), written
   directly with BUFFER-WRITE-PACKED-16, with no structure made."
  (if (and (vectorp sequence)
           (or (zerop (cl:length sequence)) (integerp (aref sequence 0))))
      (buffer-write-packed-16 buf sequence per-element)
      (buffer-write-list buf sequence nil writer)))

(defun buffer-write-list (buf sequence count writer)
  "Write the first COUNT elements of SEQUENCE (a list or a vector) with
   WRITER, a function of (BUFFER ELEMENT).  A COUNT of NIL means the
   whole sequence."
  (let ((count (or count (cl:length sequence))))
    (if (listp sequence)
        (loop repeat count
              for e in sequence
              do (funcall writer buf e))
        (dotimes (i count)
          (funcall writer buf (aref sequence i))))
    buf))

(defun buffer-write-fixed-list (buf sequence count writer element-size)
  "Write a list of exactly COUNT elements of ELEMENT-SIZE bytes each:
   the first COUNT elements of SEQUENCE with WRITER, then zero bytes in
   place of any elements SEQUENCE is short of.  Used for lists whose
   length is fixed by the protocol (a union's DATA8, KeymapNotify's
   keys), where a shorter value is a natural thing to supply."
  (let ((n (min count (cl:length sequence))))
    (buffer-write-list buf sequence n writer)
    (buffer-write-zeroes buf (* (- count n) element-size))))

(defun buffer-finish-request (buf)
  "Pad the request in BUF to a multiple of 4 bytes and store its length,
   in 4-byte units, in the 16-bit length field at offset 2.

   A request too long for 16 bits is written in the BIG-REQUESTS form: 0
   in the 16-bit field, and the length, counting the 4 bytes added, in a
   32-bit field inserted after the first 4 bytes.  FLUSH-REQUEST sees
   the 0 and enables BIG-REQUESTS on the connection before sending it."
  (buffer-pad-to-alignment buf 4)
  (let ((words (floor (buffer-position buf) 4)))
    (if (<= words #xFFFF)
        (buffer-patch-card16 buf 2 words)
        (let ((end (buffer-position buf))
              (big (1+ words)))
          (when (> big #xFFFFFFFF)
            (cl:error "Request of ~D bytes is too long even for BIG-REQUESTS."
                      end))
          ;; Make room for the 32-bit length after the first 4 bytes.
          (buffer-write-zeroes buf 4)
          (let ((octets (buffer-octets buf)))
            ;; REPLACE copies as if through a temporary when source and
            ;; destination are the same array and overlap.
            (replace octets octets :start1 8 :start2 4 :end2 end)
            (buffer-patch-card16 buf 2 0)
            (if (= (buffer-byte-order buf) +MSB+)
                (setf (aref octets 4) (ldb (byte 8 24) big)
                      (aref octets 5) (ldb (byte 8 16) big)
                      (aref octets 6) (ldb (byte 8 8) big)
                      (aref octets 7) (ldb (byte 8 0) big))
                (setf (aref octets 4) (ldb (byte 8 0) big)
                      (aref octets 5) (ldb (byte 8 8) big)
                      (aref octets 6) (ldb (byte 8 16) big)
                      (aref octets 7) (ldb (byte 8 24) big))))))))

(defgeneric encode-event (buffer event)
  (:documentation
   "Write the 32-byte wire form of EVENT to BUFFER, as SendEvent
    carries it.  The generated code defines a method for every event
    type SendEvent can carry (every event except XGE events)."))
