;;; property.lisp — high-level property and ClientMessage helpers.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:
;;;
;;; This is the half of the old io.lisp that calls generated code
;;; (CHANGE-PROPERTY, SEND-EVENT) directly rather than only the wire
;;; primitives in xcb/protocol's io.lisp, so it lives here, in CLXCB,
;;; which loads after CLXCB/GENERATED.  No forward declaims needed:
;;; both generated functions already exist by the time this file
;;; compiles.

(in-package "XCB")

;; CHANGE-PROPERTY (generated from xproto.xml) takes an already-packed
;; byte list and an explicit item count -- one-to-one with C's
;; xcb_change_property.  SEND-CHANGE-PROPERTY sits on top: the caller
;; supplies a string or a sequence of integers, and the wire packing
;; happens here.
;;
;; The XCB package shadows several CL symbols (TYPE, FUNCTION, LENGTH,
;; STRING, SEQUENCE, MAP, ...) to keep generated names from clashing
;; with CL's.  Wherever those CL originals are needed in this file,
;; they must be written as CL:TYPE, CL:FUNCTION, CL:LENGTH, CL:STRING,
;; CL:SEQUENCE, CL:MAP.

(defun %pack-property-items (items format order)
  "Return a list of CARD8 octets encoding ITEMS as FORMAT-bit items in
   wire byte order ORDER.  ITEMS is a sequence of integers."
  (cl:declare (cl:type (cl:member 8 16 32) format))
  (let* ((item-bytes (ecase format (8 1) (16 2) (32 4)))
         (count      (cl:length items))
         (out        (make-array (* count item-bytes)
                                 :element-type '(unsigned-byte 8)))
         (mask       (1- (ash 1 format)))
         (lsb        (eql order +LSB+)))
    (loop for i from 0 below count
          for v = (logand (elt items i) mask)
          for o = (* i item-bytes)
          do (ecase format
               (8  (setf (aref out o) v))
               (16 (if lsb
                       (setf (aref out o)      (ldb (byte 8 0) v)
                             (aref out (1+ o)) (ldb (byte 8 8) v))
                       (setf (aref out o)      (ldb (byte 8 8) v)
                             (aref out (1+ o)) (ldb (byte 8 0) v))))
               (32 (if lsb
                       (setf (aref out o)       (ldb (byte 8  0) v)
                             (aref out (+ o 1)) (ldb (byte 8  8) v)
                             (aref out (+ o 2)) (ldb (byte 8 16) v)
                             (aref out (+ o 3)) (ldb (byte 8 24) v))
                       (setf (aref out o)       (ldb (byte 8 24) v)
                             (aref out (+ o 1)) (ldb (byte 8 16) v)
                             (aref out (+ o 2)) (ldb (byte 8  8) v)
                             (aref out (+ o 3)) (ldb (byte 8  0) v))))))
    (coerce out 'list)))

(defgeneric send-change-property (conn mode window property type format value)
  (:documentation
   "Set PROPERTY on WINDOW from VALUE.

    MODE is 0 (Replace), 1 (Prepend), or 2 (Append).
    FORMAT is 8, 16, or 32 (bits per item).

    VALUE may be:
      * a string -- FORMAT must be 8; each character contributes one
        CARD8 with its char-code, so the string must be Latin-1 (codes
        below 256), as the STRING type is.  For a UTF8_STRING property,
        pass (ENCODE-UTF8 string) instead, a sequence of octets.
      * a sequence of integers -- each element is packed as a
        FORMAT-bit item in CONN's byte order.

    CHANGE-PROPERTY is the lower-level companion: it takes a
    pre-packed byte list and an explicit item count, matching C's
    xcb_change_property one-for-one."))

(defmethod send-change-property (conn mode window property type
                                 (format (eql 8)) (value cl:string))
  (let ((octets (cl:map '(vector (unsigned-byte 8))
                        (lambda (ch)
                          (let ((code (char-code ch)))
                            (if (< code 256)
                                code
                                (cl:error "SEND-CHANGE-PROPERTY: ~S (code ~D) is not ~
                                           Latin-1; a string for a format-8 property must ~
                                           be.  For UTF8_STRING, pass (ENCODE-UTF8 string)."
                                          ch code))))
                        value)))
    (change-property conn mode window property type 8
                     (cl:length value) octets)))

(defmethod send-change-property (conn mode window property type
                                 format (value cl:sequence))
  (check-type format (member 8 16 32))
  (let ((octets (%pack-property-items value format (conn-byte-order conn))))
    (change-property conn mode window property type format
                     (cl:length value) octets)))

;; Low level: serialize an existing CLIENT-MESSAGE (or any other event
;; object) to a list of octets in CONN's byte order, for SEND-EVENT's
;; EVENT argument.
(defun event-to-send-event-octets (conn event)
  "Serialize EVENT (typically a CLIENT-MESSAGE) to the 32-byte wire
   form SEND-EVENT's EVENT argument expects, as a list of octets in
   CONN's byte order.  Uses the generated ENCODE-EVENT method for
   EVENT's class."
  (let ((buf (make-buffer :byte-order (conn-byte-order conn) :capacity 32)))
    (encode-event buf event)
    (coerce (buffer-octets buf) 'list)))

;; High level: build and send a ClientMessage in one call.
(defun send-client-message (conn destination event-mask window
                            message-type data
                            &key (format 32))
  "Send a ClientMessage to DESTINATION.  WINDOW is the ClientMessage's
   window field.  MESSAGE-TYPE is the atom identifying the message
   (e.g. the atom for _NET_WM_MOVERESIZE).  DATA is a list of up to
   five 32-bit integers; fewer are zero-padded, more are rejected.
   EVENT-MASK is the SEND-EVENT destination mask, typically
   (logior +substructure-redirect+ +substructure-notify+).

   Only format 32 is currently supported, which covers every
   ClientMessage in practical use.  Format 8 and 16 (used by
   SendEvent for custom events, not by any EWMH or ICCCM message)
   would need the corresponding DATA8 / DATA16 union branch."
  (unless (= format 32)
    (cl:error "send-client-message: only format 32 is supported, got ~D"
           format))
  (when (> (cl:length data) 5)
    (cl:error "send-client-message: at most 5 data words for format 32, got ~D"
           (cl:length data)))
  (let* ((padded (append data (make-list (- 5 (cl:length data))
                                         :initial-element 0)))
         (msg    (make-instance
                  'client-message
                  :response-type 33
                  :format        32
                  :sequence      0
                  :window        window
                  :type          message-type
                  :data          (make-instance 'client-message-data
                                                :data32 padded))))
    (send-event conn 0 destination event-mask
                (event-to-send-event-octets conn msg))))
