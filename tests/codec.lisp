;;; tests/codec.lisp — wire primitives and generated encoders/decoders.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Everything here runs without an X server: values are encoded into a
;;; BUFFER and decoded back from its octets.

(in-package #:xcb/tests)

(defun octets (buf)
  "BUF's contents as a fresh (SIMPLE-ARRAY OCTET (*))."
  (coerce (buffer-octets buf) '(simple-array octet (*))))

(defun encoded (fn &key (order +LSB+))
  "Call FN on a fresh buffer in byte order ORDER; return its octets."
  (let ((buf (make-buffer :byte-order order)))
    (funcall fn buf)
    (octets buf)))

;;; Buffer writers

(deftest buffer-writes-in-byte-order ()
  (is (equalp #(#x34 #x12) (encoded (lambda (b) (buffer-write-card16 b #x1234)))))
  (is (equalp #(#x12 #x34) (encoded (lambda (b) (buffer-write-card16 b #x1234)) :order +MSB+)))
  (is (equalp #(4 3 2 1) (encoded (lambda (b) (buffer-write-card32 b #x01020304)))))
  (is (equalp #(1 2 3 4) (encoded (lambda (b) (buffer-write-card32 b #x01020304)) :order +MSB+)))
  ;; Negative values are written as two's complement.
  (is (equalp #(#xFF #xFF) (encoded (lambda (b) (buffer-write-card16 b -1))))))

(deftest buffer-padding-and-octets ()
  (is (equalp #(7 0 0 0) (encoded (lambda (b) (buffer-write-card8 b 7) (buffer-pad-to-align b 4)))))
  (is (equalp #(0 0 0) (encoded (lambda (b) (buffer-write-padding b 3)))))
  (is (equalp #(1 2 3 4 5) (encoded (lambda (b) (buffer-write-octets b #(1 2 3 4 5))))))
  (is (equalp #(2 3) (encoded (lambda (b) (buffer-write-octets b '(1 2 3 4) :start 1 :end 3)))))
  (is (equalp #(97 98) (encoded (lambda (b) (buffer-write-string-octets b "abc" 2)))))
  (is (equalp #(1 0 1) (encoded (lambda (b) (buffer-write-bool b t) (buffer-write-bool b nil)
                                  (buffer-write-bool b 1))))))

(deftest buffer-write-list-takes-lists-and-vectors ()
  (is (equalp #(1 0 2 0) (encoded (lambda (b) (buffer-write-list b '(1 2) nil #'buffer-write-card16)))))
  (is (equalp #(1 0) (encoded (lambda (b) (buffer-write-list b #(1 2 3) 1 #'buffer-write-card16))))))

(deftest buffer-reset-reuses-storage ()
  (let ((buf (make-buffer)))
    (buffer-write-card32 buf 42)
    (buffer-reset buf)
    (is (zerop (buffer-position buf)))
    (buffer-write-card8 buf 1)
    (is (equalp #(1) (octets buf)))))

(deftest buffer-finish-request-pads-and-patches-length ()
  (let ((buf (make-buffer :byte-order +LSB+)))
    (buffer-write-card8 buf 99)
    (buffer-write-card8 buf 0)
    (buffer-write-card16 buf 0)
    (buffer-write-card8 buf 1)
    (buffer-finish-request buf)
    (is (equalp #(99 0 2 0 1 0 0 0) (octets buf))))
  ;; Too long for the 16-bit length field: the BIG-REQUESTS form, with 0
  ;; there and the length, counting the 4 bytes it adds, after the first
  ;; 4 bytes.  The body follows unchanged.
  (let ((buf (make-buffer :byte-order +LSB+)))
    (buffer-write-card8 buf 77)
    (buffer-write-card8 buf 5)
    (buffer-write-card16 buf 0)
    (buffer-write-card32 buf #x11223344)
    (buffer-write-padding buf (- (* 4 #x10000) 8))
    (buffer-finish-request buf)
    (let ((o (octets buf)))
      (is (= (length o) (* 4 #x10001)))
      (is (equalp (subseq o 0 12) #(77 5 0 0  #x01 0 1 0  #x44 #x33 #x22 #x11))))))

(deftest floats-round-trip ()
  (dolist (order (list +LSB+ +MSB+))
    (let ((o (encoded (lambda (b) (buffer-write-float32 b 1.5) (buffer-write-float64 b -2.25d0))
                      :order order)))
      (is (= 1.5 (read-float32-at o 0 order)))
      (is (= -2.25d0 (read-float64-at o 4 order))))))

;;; Positional readers

(deftest readers-sign-extend-only-signed-types ()
  (let ((o (coerce #(0 0 #xFF #xFF #xFE #xFF #xFF #xFF) '(simple-array octet (*)))))
    (is (= -1 (read-int16-at o 2 +LSB+)))
    (is (= #xFFFF (read-card16-at o 2 +LSB+)))
    (is (= -2 (read-int32-at o 4 +LSB+)))
    (is (= #xFFFFFFFE (read-card32-at o 4 +LSB+)))
    (is (= #xFFFFFEFF (read-card32-at o 2 +MSB+)))
    (is (= -1 (read-int8-at o 2)))
    (is (= 255 (read-card8-at o 2)))))

(deftest readers-64-bit ()
  (let ((o (encoded (lambda (b) (buffer-write-card64 b #x0102030405060708)))))
    (is (= #x0102030405060708 (read-card64-at o 0 +LSB+))))
  (let ((o (encoded (lambda (b) (buffer-write-card64 b -3)) :order +MSB+)))
    (is (= -3 (read-int64-at o 0 +MSB+)))))

(deftest read-vector-and-string ()
  (let ((o (encoded (lambda (b) (buffer-write-list b '(1 2 65535) nil #'buffer-write-card16)))))
    (multiple-value-bind (v pos) (read-vector-at o 0 3 +LSB+ :card16)
      (is (equalp #(1 2 65535) v))
      (is (= 6 pos)))
    (multiple-value-bind (v pos) (read-vector-at o 0 3 +LSB+ :int16)
      (is (equalp #(1 2 -1) v))
      (is (= 6 pos))))
  (let ((o (coerce (map 'vector #'char-code "xhello") '(simple-array octet (*)))))
    (is (string= "hello" (read-string-at o 1 5)))
    (is (equalp #(104 101) (read-bytes-at o 1 2)))))

;;; Generated classes

(defun slots-equal (a b)
  "True if A and B are of the same class and every bound slot of A is
   bound in B to an EQUALP value."
  (and (eq (class-of a) (class-of b))
       (every (lambda (slot)
                (let ((name (sb-mop:slot-definition-name slot)))
                  (or (not (slot-boundp a name))
                      (and (slot-boundp b name)
                           (equalp (slot-value a name) (slot-value b name))))))
              (sb-mop:class-slots (class-of a)))))

(defun round-trip (encoder decoder object &optional (order +LSB+))
  "Encode OBJECT with ENCODER and decode it back with DECODER.  Returns
   the decoded object, the position the decoder stopped at, and the
   encoded length."
  (let ((o (encoded (lambda (b) (funcall encoder b object)) :order order)))
    (multiple-value-bind (decoded pos) (funcall decoder o 0 order)
      (values decoded pos (length o)))))

(deftest fixed-struct-round-trip ()
  (dolist (order (list +LSB+ +MSB+))
    (let ((r (make-instance 'xcb::rectangle :x -5 :y 7 :width 100 :height 65535)))
      (multiple-value-bind (r2 pos size)
          (round-trip #'xcb::encode-rectangle #'xcb::decode-rectangle r order)
        (is (= 8 pos size))
        (is (slots-equal r r2))
        ;; The classic generic accessors.
        (is (= -5 (xcb::x r2)))
        (is (= 65535 (xcb::height r2)))))))

(deftest variable-struct-with-derived-length ()
  ;; STR is a length-prefixed name: the length byte is computed from the
  ;; string when encoding, so NAME-LEN need not be supplied.
  (let ((o (encoded (lambda (b) (xcb::encode-str b (make-instance 'xcb::str :name "abc"))))))
    (is (equalp #(3 97 98 99) o))
    (multiple-value-bind (s pos) (xcb::decode-str o 0 +LSB+)
      (is (string= "abc" (xcb::name s)))
      (is (= 3 (xcb::name-len s)))
      (is (= 4 pos)))))

(deftest nested-lists-round-trip ()
  ;; DEPTH holds a counted list of VISUALTYPE instances.
  (let* ((v (make-instance 'xcb::visualtype :visual-id 33 :class 4 :bits-per-rgb-value 8
                                            :colormap-entries 256 :red-mask #xFF0000
                                            :green-mask #xFF00 :blue-mask #xFF))
         (d (make-instance 'xcb::depth :depth 24 :visuals (list v v))))
    (multiple-value-bind (d2 pos size) (round-trip #'xcb::encode-depth #'xcb::decode-depth d)
      (is (= pos size (+ 8 (* 2 24))))
      (is (= 2 (xcb::visuals-len d2)))
      (is (slots-equal v (aref (xcb::visuals d2) 1))))))

(deftest list-count-bounded-by-packet ()
  ;; XIQueryDevice's reply says how many device infos follow.  Infos vary
  ;; in size, so the count cannot be checked exactly, but each takes at
  ;; least one byte: a reply claiming 65535 of them in an empty body
  ;; decodes to none, rather than first making a 65535-element vector.
  (let ((o (make-array 32 :element-type 'octet :initial-element 0)))
    (setf (aref o 0) 1                  ; a reply
          (aref o 8) #xFF (aref o 9) #xFF) ; num-infos = 65535, length 0
    (let ((reply (xcb-input::decode-xi-query-device-reply o 0 +LSB+)))
      (is (zerop (length (xcb-input:infos reply)))))))

(deftest write-octets-reports-bad-element ()
  ;; A list with an element that is not an octet is refused, with its
  ;; index, before anything is written.
  (let ((buf (make-buffer)))
    (is (search "element 2"
                (handler-case (progn (buffer-write-octets buf (list 1 2 300 4)) "")
                  (cl:error (e) (princ-to-string e)))))
    (is (zerop (buffer-position buf)))
    (buffer-write-octets buf (list 1 2 3 4 5) :start 1 :end 3)
    (is (= 2 (buffer-position buf)))))

(deftest union-encodes-one-member-and-decodes-all ()
  (let ((o (encoded (lambda (b)
                      (xcb::encode-client-message-data
                       b (make-instance 'xcb::client-message-data :data32 '(1 2 3 4 5)))))))
    (is (= 20 (length o)))
    (let ((u (xcb::decode-client-message-data o 0 +LSB+)))
      (is (equalp #(1 2 3 4 5) (xcb::data32 u)))
      (is (equalp #(1 0 2 0 3 0 4 0 5 0) (xcb::data16 u)))
      (is (= 20 (length (xcb::data8 u))))))
  ;; A short member is padded to the union's size.
  (is (= 20 (length (encoded (lambda (b)
                               (xcb::encode-client-message-data
                                b (make-instance 'xcb::client-message-data
                                                 :data8 #(1 2 3)))))))))

(deftest union-without-a-member-signals ()
  (signals cl:error (encoded (lambda (b)
                               (xcb::encode-client-message-data
                                b (make-instance 'xcb::client-message-data))))))

(deftest event-round-trip-and-copies ()
  (let* ((ev (make-instance 'xcb::key-press :response-type 2 :detail 38 :sequence 7
                                            :time 1000 :root 1 :event 2 :child 0
                                            :root-x -3 :root-y 4 :event-x 5 :event-y 6
                                            :state 1 :same-screen 1))
         (o (encoded (lambda (b) (encode-event b ev)))))
    (is (= 32 (length o)))
    (let ((decoded (xcb::decode-key-press o 0 +LSB+)))
      (is (typep decoded 'xcb:event))
      (is (slots-equal ev decoded)))
    ;; KeyRelease is an <eventcopy> of KeyPress: a class of its own, with
    ;; the same slots and accessors.
    (let ((rel (xcb::decode-key-release o 0 +LSB+)))
      (is (typep rel 'xcb::key-release))
      (is (= 38 (xcb::detail rel))))))

(deftest switch-fields-stay-unbound-when-absent ()
  ;; XInput's InputInfo is a switch on CLASS-ID: only the fields of the
  ;; case on the wire are bound, as they always were.
  (let ((o (encoded (lambda (b)
                      (xcb-input::encode-input-info
                       b (make-instance 'xcb-input::input-info :class-id 1 :len 4
                                                               :button-num-buttons 5))))))
    (let ((info (xcb-input::decode-input-info o 0 +LSB+)))
      (is (= 5 (slot-value info 'xcb-input::button-num-buttons)))
      (is (not (slot-boundp info 'xcb-input::key-num-keys))))))

(deftest sumof-and-switch-in-extension-reply ()
  ;; XInput's ListInputDevices reply: the INFOS count is the sum of every
  ;; device's NUM-CLASS-INFO, and each InputInfo is a switch on CLASS-ID.
  ;; A white-box test: it calls the generated decoder by its internal
  ;; name, which follows the generator's naming and would change with it.
  (flet ((device (id n) (make-instance 'xcb-input::device-info :device-type 0 :device-id id
                                                               :num-class-info n :device-use 0))
         (info (&rest initargs) (apply #'make-instance 'xcb-input::input-info initargs)))
    (let ((devices (list (device 2 1) (device 3 2)))
          (infos (list (info :class-id 1 :len 4 :button-num-buttons 5)
                       (info :class-id 0 :len 8 :key-min-keycode 8
                             :key-max-keycode 255 :key-num-keys 248)
                       (info :class-id 1 :len 4 :button-num-buttons 3)))
          (names (list (make-instance 'xcb::str :name "pointer")
                       (make-instance 'xcb::str :name "keyboard")))
          (buf (make-buffer :byte-order +LSB+)))
      (buffer-write-card8 buf 1)                  ; reply
      (buffer-write-card8 buf 2)                  ; xi_reply_type
      (buffer-write-card16 buf 1)                 ; sequence
      (buffer-write-card32 buf 0)                 ; length, patched below
      (buffer-write-card8 buf 2)                  ; devices_len
      (buffer-write-padding buf 23)
      (buffer-write-list buf devices nil #'xcb-input::encode-device-info)
      (buffer-write-list buf infos nil #'xcb-input::encode-input-info)
      (buffer-write-list buf names nil #'xcb::encode-str)
      (buffer-pad-to-align buf 4)
      (let* ((o (octets buf)))
        (setf (aref o 4) (/ (- (length o) 32) 4))
        (multiple-value-bind (r pos) (xcb-input::decode-list-input-devices-reply o 0 +LSB+)
          (is (= pos (length o)))
          (is (= 3 (length (xcb-input::infos r))))
          (is (= 248 (slot-value (aref (xcb-input::infos r) 1) 'xcb-input::key-num-keys)))
          (is (equal '("pointer" "keyboard")
                     (map 'list #'xcb::name (xcb-input::names r)))))))))

(deftest list-reads-stop-at-the-packet-end ()
  ;; GLX VendorPrivateWithReply: data1 runs to byte 36, past the 32-byte
  ;; header, yet the XML gives data2 as length*4 bytes -- 4 more than the
  ;; packet holds.  An exact-size copy (as a retained reply is) must not
  ;; be read past its end.
  (let ((b (make-buffer :byte-order +LSB+)))
    (buffer-write-card8 b 1) (buffer-write-card8 b 0)
    (buffer-write-card16 b 1) (buffer-write-card32 b 2)   ; 8 extra bytes: 40 in all
    (buffer-write-card32 b 7)                              ; retval
    (buffer-write-padding b 24)                            ; data1
    (buffer-write-octets b #(1 2 3 4))                     ; data2: what fits
    (let ((o (octets b)))
      (is (= 40 (length o)))
      (multiple-value-bind (reply pos) (xcb-glx::decode-vendor-private-with-reply-reply o 0 +LSB+)
        (is (= 40 pos))
        (is (= 7 (xcb-glx::retval reply)))
        (is (equalp #(1 2 3 4) (xcb-glx::data2 reply)))))))

;;; Enumerations

(deftest enums ()
  (is (= 32768 xcb-const:+event-mask-exposure+))
  (is (= 32768 (enum-value :event-mask :exposure)))
  (is (= 5 (enum-value :event-mask 5)))
  (is (= 32769 (enum-mask :event-mask :exposure :key-press)))
  (is (eq :true-color (enum-key :visual-class 4)))
  (signals cl:error (enum-value :event-mask :no-such-member)))
