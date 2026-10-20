;;; enum.lisp — X11 enumerations: named constants and keyword lookup.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:

;;; Every <enum> in the protocol XML becomes a DEFENUM form, which
;;; gives each member two names:
;;;
;;;   - a constant, XCB-CONST:+<ENUM>-<MEMBER>+, for use in code;
;;;   - a keyword, looked up at run time with ENUM-VALUE and ENUM-MASK,
;;;     for use in data.
;;;
;;;     xcb-const:+event-mask-exposure+            => 32768
;;;     (xcb:enum-value :event-mask :exposure)     => 32768
;;;     (xcb:enum-mask :event-mask :exposure :key-press) => 32769
;;;     (xcb:enum-key :visual-class 4)             => :TRUE-COLOR
;;;
;;; XCB-CONST exports nothing but +-delimited constant names, so a
;;; package can :USE it without conflicting with CL.

(in-package "XCB")

(defvar *enums* (make-hash-table :test 'equal)
  "Maps an enum's name (a string, e.g. \"EVENT-MASK\") to its alist of
   (KEYWORD . INTEGER).")

(defun register-enum (name alist)
  (setf (gethash (cl:string name) *enums*) alist))

(defun %enum-alist (enum)
  (or (gethash (cl:string enum) *enums*)
      (cl:error "Unknown enum ~S" enum)))

(defun enum-value (enum key)
  "The integer value of member KEY (a keyword) of ENUM.  An integer
   KEY is returned as is."
  (if (integerp key)
      key
      (let ((pair (assoc key (%enum-alist enum))))
        (unless pair
          (cl:error "~S is not a member of enum ~S" key enum))
        (cdr pair))))

(defun enum-key (enum value)
  "The keyword naming VALUE in ENUM, or NIL."
  (car (rassoc value (%enum-alist enum))))

(defun enum-mask (enum &rest keys)
  "The LOGIOR of the values of KEYS (keywords or integers) in ENUM."
  (reduce #'logior keys :key (lambda (k) (enum-value enum k)) :initial-value 0))

(defmacro defenum (name &body members)
  "Define enum NAME with MEMBERS, each (KEYWORD VALUE): a constant
   XCB-CONST:+NAME-KEYWORD+ per member, and a registry entry for
   ENUM-VALUE, ENUM-KEY and ENUM-MASK."
  (let* ((const-pkg (find-package "XCB-CONST"))
         (constants
           (loop for (key value) in members
                 collect (list
                          (intern
                           (cl:format nil "+~A-~A+"
                                      (symbol-name name)
                                      (symbol-name key))
                           const-pkg)
                          value))))
    `(progn
       (eval-when (:compile-toplevel :load-toplevel :execute)
         (export ',(mapcar #'first constants) ,(package-name const-pkg)))
       ,@(loop for (constant value) in constants
               collect `(defconstant ,constant ,value))
       (register-enum ',name ',(loop for (key value) in members
                                     collect (cons key value)))
       (defparameter ,(intern (symbol-name name) (find-package "XCB-ENUM"))
         ',(loop for (key value) in members collect (cons key value)))
       ',name)))
