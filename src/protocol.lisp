;;; protocol.lisp — the base classes of the X11 protocol.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:

;;; Every generated request, reply, event and error class inherits from
;;; one of these.  They are ordinary classes: the wire format lives in
;;; each type's generated encoder and decoder, not on the class.

(in-package "XCB")

(defclass request () ()
  (:documentation "Base class of the generated <name>-REQUEST classes."))

(defclass request-with-reply (request) ()
  (:documentation "Base class of requests the server answers with a reply."))

(defclass reply () ()
  (:documentation "Base class of the generated <name>-REPLY classes."))

(defclass event () ()
  (:documentation "Base class of the generated event classes."))

(defclass error () ()
  (:documentation "Base class of the generated <name>-ERROR classes."))

(defgeneric send-request (conn request)
  (:documentation
   "Send REQUEST, an instance of a generated <name>-REQUEST class, on
    CONN and return its cookie.  Equivalent to calling the request's
    sender function with the values of REQUEST's slots; a slot of a
    <switch> field is sent only if it is bound."))

;;; Value lists
;;;
;;; A request such as CreateWindow or ChangeGC takes a value mask and the
;;; values its bits select, as keyword arguments.  A bit set without its
;;; value, or a value given without its bit, is a mistake: the first would
;;; send a bad request, the second silently drops the value.  The
;;; generated senders check both, with CHECK-VALUE-MASK, before they write
;;; anything.

(define-condition value-mask-error (cl:error)
  ((request   :initarg :request   :reader value-mask-error-request)
   (keyword   :initarg :keyword   :reader value-mask-error-keyword)
   (bit       :initarg :bit       :reader value-mask-error-bit)
   (missing-p :initarg :missing-p :reader value-mask-error-missing-p))
  (:report
   (lambda (c stream)
     (if (value-mask-error-missing-p c)
         (cl:format stream "~S: the value mask has bit #x~X set, but no ~S value ~
                            was given."
                    (value-mask-error-request c) (value-mask-error-bit c)
                    (value-mask-error-keyword c))
         (cl:format stream "~S: a ~S value was given, but its bit #x~X is not set ~
                            in the value mask, so it would not be sent."
                    (value-mask-error-request c) (value-mask-error-keyword c)
                    (value-mask-error-bit c)))))
  (:documentation
   "Signalled by a request sender called with a value mask and values that
    do not match: a bit set without its value (MISSING-P true), or a
    value given without its bit."))

(defun %value-mask-error (request keyword bit missing-p)
  (cl:error 'value-mask-error :request request :keyword keyword :bit bit
                              :missing-p missing-p))

(defmacro check-value-mask (request mask &rest entries)
  "Check that MASK and the values of a value list agree, for the request
   REQUEST (a symbol, for the error message).  Each of ENTRIES is
   (BIT KEYWORD VARIABLE LIST-P): VARIABLE holds the value the keyword
   KEYWORD gave, or NIL if it gave none; BIT is the mask bit that selects
   it.  A value that is a list may be empty, so for one only a value
   given without its bit is an error."
  (let ((m (gensym "MASK")))
    `(let ((,m ,mask))
       ,@(loop for (bit keyword variable list-p) in entries
               collect (if list-p
                           `(when (and ,variable (not (logtest ,m ,bit)))
                              (%value-mask-error ,request ,keyword ,bit nil))
                           `(if (logtest ,m ,bit)
                                (when (null ,variable)
                                  (%value-mask-error ,request ,keyword ,bit t))
                                (when ,variable
                                  (%value-mask-error ,request ,keyword ,bit nil)))))
       nil)))

(defun decoder-for-class (class-name)
  "The generated decoder for the class named CLASS-NAME: the function
   DECODE-<class-name> in the class name's package."
  (let ((sym (find-symbol (cl:format nil "DECODE-~A" (symbol-name class-name))
                          (symbol-package class-name))))
    (or (and sym (fboundp sym) (fdefinition sym))
        (cl:error "No decoder for class ~S" class-name))))

(defun %as-decoder (decoder)
  "DECODER itself if it is a function; the class's decoder if it is a
   class name."
  (if (symbolp decoder) (decoder-for-class decoder) decoder))

;;; protocol.lisp ends here
