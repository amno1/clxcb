;;; tests/package.lisp — the package and test definitions for clxcb's tests.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; The tests use clxcb's internals by their plain names, so the package
;;; uses XCB as well as CL.  XCB shadows some CL symbols (LENGTH, FORMAT,
;;; SEQUENCE, TYPE, ...); here the CL ones are meant, and the tests
;;; write XCB:TYPE and so on for clxcb's.
;;;
;;; The definitions are a small layer on RT, as in tests/threads.lisp:
;;; IS records a failure and goes on, SIGNALS checks that a form signals
;;; a condition of a type, SKIP ends a test that cannot run here (no X
;;; server, a missing extension) as a pass, and DEFTEST turns the body
;;; into an RT test that passes when no IS failed.

(defpackage #:xcb/tests
  (:use #:cl #:xcb #+sbcl #:sb-rt #-sbcl #:rt)
  (:shadowing-import-from #:cl
   #:atom #:class #:count #:error #:format #:length #:sequence #:string
   #:time #:type #:delete #:function #:map #:values)
  (:shadow #:deftest)
  (:export #:run-tests))

(in-package #:xcb/tests)

(defvar *failures* '()
  "The assertions that failed in the test being run.")

(defvar *skipped* '()
  "The tests that skipped themselves in the last run.")

(defmacro is (form &rest message)
  "Record a failure if FORM is false.  MESSAGE, if given, is a format
   control and arguments describing it."
  `(unless ,form
     (push ,(if message
                `(cl:format nil ,@message)
                `'(:failed ,form))
           *failures*)))

(defmacro signals (condition-type &body body)
  "Record a failure unless BODY signals a condition of CONDITION-TYPE."
  `(is (handler-case (progn ,@body nil)
         (,condition-type () t))
       "~S did not signal ~S" '(progn ,@body) ',condition-type))

(defun skip ()
  "End the running test as skipped: it cannot run here."
  (throw 'skip :skipped))

(defmacro deftest (name lambda-list &body body)
  "Define an RT test NAME that runs BODY and passes if no IS in it
   failed.  LAMBDA-LIST must be empty."
  (assert (null lambda-list) () "DEFTEST ~S takes no arguments." name)
  `(#+sbcl sb-rt:deftest #-sbcl rt:deftest ,name
     (let ((*failures* '()))
       (if (eq (catch 'skip ,@body :ran) :skipped)
           (progn (pushnew ',name *skipped*) t)
           (or (null *failures*) (reverse *failures*))))
     t))

(defun run-tests ()
  "Run clxcb's tests.  Returns T if all passed."
  (setf *skipped* '())
  (prog1 (do-tests)
    (when *skipped*
      (cl:format t "~&~D test~:P skipped (no X server, or a missing extension): ~
                    ~{~(~A~)~^, ~}~%"
                 (cl:length *skipped*) (reverse *skipped*)))))
