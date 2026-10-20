;;; clxcb.asd — ASDF system definitions for CLXCB.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(cl:in-package #:asdf-user)


;;; Systems
;;;
;;; Load one of the two platform paths:
;;;
;;;   clxcb/cffi   portable: usocket, CFFI, bordeaux-threads,
;;;                trivial-garbage (platform-cffi.lisp)
;;;   clxcb/sbcl   SBCL only: sb-bsd-sockets, sb-posix and SBCL's own
;;;                internals, nothing else (platform-sbcl.lisp)
;;;
;;; clxcb is clxcb/cffi, the default.  Either is clxcb/base and its
;;; platform file.  clxcb/base is everything that does not depend on the
;;; platform, in three layers, loaded in this order:
;;;
;;;   base       packages, the platform interface, and what the generated
;;;              code is written against: buffer, readers, enums,
;;;              dispatch tables, I/O, the connection
;;;   generated  the core protocol, with BIG-REQUESTS and XC-MISC
;;;   runtime    connecting and authorization, properties, ICCCM/EWMH,
;;;              images: the hand-written code that calls generated code
;;;
;;; The base layer comes first so that the macros and functions generated
;;; code uses are defined when it is compiled; the runtime layer after it,
;;; so that hand-written code can use generated structures and functions
;;; directly.  clxcb/base calls only the interface platform.lisp declares,
;;; which lets it compile the same under either path; a platform file must
;;; be loaded before it is used.  An image holds one path.  Loading
;;; clxcb/cffi after clxcb/sbcl keeps the SBCL path (the CFFI file is
;;; skipped), so a library that depends on clxcb can be used with
;;; clxcb/sbcl; loading clxcb/sbcl after clxcb/cffi signals.
;;;
;;; Extensions are loaded on request (see "Extensions" below).

(defsystem "clxcb/base"
  :description "Internal: CLXCB without its platform file.  Load clxcb,
 clxcb/cffi or clxcb/sbcl instead."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :homepage "https://github.com/amno1/clxcb"
  :source-control (:git "https://github.com/amno1/clxcb.git")
  :bug-tracker "https://github.com/amno1/clxcb/issues"
  :version "0.6.0"
  :depends-on ("clxau" "uiop")
  :pathname "src/"
  :serial t
  :components ((:module "base"
                :pathname ""
                :serial t
                :components ((:file "packages")
                             (:file "platform")
                             (:file "utils")
                             (:file "enum")
                             (:file "protocol")
                             (:file "dispatch")
                             (:file "buffer")
                             (:file "io")
                             (:file "connection")))
               (:module "generated"
                :serial t
                :components ((:file "xproto")
                             (:file "bigreq")
                             (:file "xc_misc")))
               (:module "runtime"
                :pathname ""
                :serial t
                :components ((:file "parse-display")
                             (:file "connection-setup")
                             (:file "property")
                             (:file "geometry")
                             (:file "visual")
                             (:file "wm")
                             (:file "parse")
                             (:file "image")))))

(defsystem "clxcb/cffi"
  :description "CLXCB, the X protocol binding, on the portable CFFI path."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :version "0.6.0"
  :depends-on ("clxcb/base" "usocket" "cffi" "bordeaux-threads" "trivial-garbage")
  :pathname "src/"
  :components ((:file "platform-cffi" :if-feature (:not :clxcb-sbcl))))

(defsystem "clxcb/sbcl"
  :description "CLXCB, the X protocol binding, on SBCL's own interfaces."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :version "0.6.0"
  :if-feature :sbcl
  :depends-on ("clxcb/base" "sb-bsd-sockets" "sb-posix")
  :pathname "src/"
  :components ((:file "platform-sbcl")))

(defsystem "clxcb"
  :description "CLXCB on the default path, clxcb/cffi."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :homepage "https://github.com/amno1/clxcb"
  :source-control (:git "https://github.com/amno1/clxcb.git")
  :bug-tracker "https://github.com/amno1/clxcb/issues"
  :version "0.6.0"
  :depends-on ("clxcb/cffi"))

;;; Extensions
;;;
;;; Each extension is a system of its own, clxcb/<name>, named after its
;;; XML file, in a package of its own, XCB-<NAME>: the generated code in
;;; src/generated/<name>.lisp, a few with hand-written helpers for that
;;; extension, on top of clxcb/base.  It loads the extensions its XML
;;; imports first, as libxcb's libraries do.  A program loads one when it
;;; needs it, with REQUIRE, which ASDF provides:
;;;
;;;   (require :clxcb/render)
;;;
;;; and a library whose source names an extension's symbols
;;; (xcb-render:composite) lists it among its dependencies, so that the
;;; package exists when the library is compiled.  An extension needs a
;;; platform path to be used, like the rest of CLXCB: load or depend on
;;; clxcb (or clxcb/sbcl) as well.

;;; DEFINE-CLXCB-EXTENSION is a MACROLET, not a DEFMACRO, so that ASDF
;;; reading this file again (as :FORCE T does) redefines nothing.
(macrolet ((define-clxcb-extension (name description &key imports helpers)
  `(defsystem ,(format nil "clxcb/~A" name)
     :description ,description
     :license "MIT"
     :version "0.6.0"
     :depends-on ("clxcb/base"
                  ,@(mapcar (lambda (i) (format nil "clxcb/~A" i)) imports))
     :serial t
     :components ((:file ,name :pathname ,(format nil "src/generated/~A" name))
                  ,@(mapcar (lambda (h) `(:file ,h :pathname ,(format nil "src/~A" h)))
                            helpers)))))

(define-clxcb-extension "composite"   "Composite extension." :imports ("xfixes"))
(define-clxcb-extension "damage"      "DAMAGE extension." :imports ("xfixes"))
(define-clxcb-extension "dbe"         "Double Buffer extension (DBE).")
(define-clxcb-extension "dpms"        "DPMS extension.")
(define-clxcb-extension "dri2"        "DRI2 extension.")
(define-clxcb-extension "dri3"        "DRI3 extension.")
(define-clxcb-extension "ge"          "Generic Event extension.")
(define-clxcb-extension "glx"         "GLX extension.")
(define-clxcb-extension "present"     "Present extension."
  :imports ("randr" "xfixes" "sync" "dri3"))
(define-clxcb-extension "randr"       "RandR extension." :imports ("render"))
(define-clxcb-extension "record"      "RECORD extension.")
(define-clxcb-extension "render"      "RENDER extension, and PictFormat helpers."
  :helpers ("render-util"))
(define-clxcb-extension "res"         "X-Resource extension.")
(define-clxcb-extension "screensaver" "MIT-SCREEN-SAVER extension.")
(define-clxcb-extension "shape"       "SHAPE extension.")
(define-clxcb-extension "shm"         "MIT-SHM extension.")
(define-clxcb-extension "sync"        "SYNC extension.")
(define-clxcb-extension "xevie"       "XEVIE extension.")
(define-clxcb-extension "xf86dri"     "XFree86-DRI extension.")
(define-clxcb-extension "xf86vidmode" "XFree86-VidModeExtension.")
(define-clxcb-extension "xfixes"      "XFIXES extension." :imports ("render" "shape"))
(define-clxcb-extension "xinerama"    "XINERAMA extension.")
(define-clxcb-extension "xinput"      "X Input extension (XInput 1 and 2), and XInput 2 helpers."
  :imports ("xfixes") :helpers ("xinput-util"))
(define-clxcb-extension "xkb"         "XKEYBOARD extension.")
(define-clxcb-extension "xprint"      "XpExtension (X Print).")
(define-clxcb-extension "xselinux"    "SELinux extension.")
(define-clxcb-extension "xtest"       "XTEST extension.")
(define-clxcb-extension "xv"          "Xv (X Video) extension." :imports ("shm"))
(define-clxcb-extension "xvmc"        "XvMC extension." :imports ("xv")))

(defsystem "clxcb/keysyms"
  :description "Generated X11 key symbols"
  :long-description
  "This system contains only key symbols as defined by Xorg.
They are separated in their own packages so programs that don't use them
don't need to load them (~2300+ symbols)"
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :version "0.6.0"
  :depends-on ("clxcb/base")
  :pathname "src/"
  :serial t
  :components ((:file "keysyms")))

(defsystem "clxcb/all"
  :description "CLXCB with every extension and the key symbols, on the
 platform path already loaded (clxcb/cffi if none is)."
  :license "MIT"
  :version "0.6.0"
  :depends-on ("clxcb"
               "clxcb/keysyms"
               "clxcb/composite"
               "clxcb/damage"
               "clxcb/dbe"
               "clxcb/dpms"
               "clxcb/dri2"
               "clxcb/dri3"
               "clxcb/ge"
               "clxcb/glx"
               "clxcb/present"
               "clxcb/randr"
               "clxcb/record"
               "clxcb/render"
               "clxcb/res"
               "clxcb/screensaver"
               "clxcb/shape"
               "clxcb/shm"
               "clxcb/sync"
               "clxcb/xevie"
               "clxcb/xf86dri"
               "clxcb/xf86vidmode"
               "clxcb/xfixes"
               "clxcb/xinerama"
               "clxcb/xinput"
               "clxcb/xkb"
               "clxcb/xprint"
               "clxcb/xselinux"
               "clxcb/xtest"
               "clxcb/xv"
               "clxcb/xvmc"))

;;; The test systems are CLXCB-TEST-SYSTEMs, whose TEST-OP calls the
;;; function their :TEST-FUNCTION names, a (package-name function-name)
;;; list.  One class and one method serve both, rather than a :PERFORM in
;;; each DEFSYSTEM.  Reading this file again redefines the class and the
;;; method in place, so a changed definition takes effect.

(defclass clxcb-test-system (system)
  ((test-function :initarg :test-function :reader test-function)))

(defmethod perform ((o test-op) (c clxcb-test-system))
  (destructuring-bind (package name) (test-function c)
    (unless (uiop:symbol-call package name)
      (error "~A failed." (component-name c)))))

;;; clxcb/tests — codecs, requests, replies, events and errors over an
;;; in-memory connection, descriptor passing, and the XInput helpers.
;;; The tests that need an X server ($DISPLAY) or an extension skip
;;; themselves without one.  They run on the path already loaded --
;;; load clxcb/sbcl first to test that one -- and load clxcb/cffi when
;;; none is.  SBCL bundles RT as the sb-rt contrib; pull
;;; it in now so the package exists before the test files are read.

#+sbcl (eval-when (:load-toplevel :execute) (require :sb-rt))

(defsystem "clxcb/tests"
  :class clxcb-test-system
  :test-function ("XCB/TESTS" "RUN-TESTS")
  :description "Tests of CLXCB's codecs, I/O, file-descriptor passing and XInput helpers."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :if-feature :sbcl
  :depends-on ("clxcb" "sb-posix" "clxcb/glx" "clxcb/xinput"
               "clxcb/dri3" "clxcb/shm" "clxcb/render" "clxcb/xfixes")
  :pathname "tests/"
  :serial t
  :components ((:file "package")
               (:file "codec")
               (:file "io")
               (:file "fd-passing")
               (:file "xinput")))

;;; clxcb/thread-tests — one connection used from several threads.  Needs
;;; an X server ($DISPLAY); skipped without one.  Like clxcb/tests, it
;;; runs on the path already loaded.  SBCL bundles RT as the
;;; sb-rt contrib; pull it in now so the package exists before the test
;;; file is read.

#+sbcl (eval-when (:load-toplevel :execute) (require :sb-rt))

(defsystem "clxcb/thread-tests"
  :class clxcb-test-system
  :test-function ("CLXCB/THREAD-TESTS" "RUN-TESTS")
  :description "Functional tests of using one CLXCB connection from several threads."
  :license "MIT"
  :author "A. Miller <arthur.miller@live.com>"
  :if-feature :sbcl
  :depends-on ("clxcb" "clxcb/shm")
  :pathname "tests/"
  :components ((:file "threads")))
