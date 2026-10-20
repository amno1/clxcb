;;; packages.lisp — package definitions and exports for XCB protocol.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

(in-package :cl-user)


;;; xcb — the protocol binding
;;;
;;; The XCB package holds three closely-related concerns in one place:
;;;
;;;   1. The wire codec: the runtime the generated code is written
;;;      against (the send buffer and its writers, the positional
;;;      readers, FLUSH-REQUEST, READ-REPLY, the decoder tables), plus
;;;      the generated xproto senders, structures, encoders and decoders.
;;;   2. The connection lifecycle: reading $DISPLAY and ~/.Xauthority,
;;;      opening a socket, and the initial handshake.
;;;   3. A small set of convenience wrappers over the wire API
;;;      (INTERN-ATOM-ID, ATOM-NAME, SEND-CHANGE-PROPERTY, ...).
;;;
;;; Each extension gets a package of its own, XCB-<NAME>, defined by its
;;; generated file.
;;;
;;; An extension is loaded on request, with (REQUIRE :CLXCB/<NAME>).
;;;
;;; Load order (see clxcb.asd): clxcb/base is three layers, then the
;;; platform file of clxcb/cffi or clxcb/sbcl.
;;;
;;;     base       packages, codec, dispatch, I/O, connection
;;;     generated  the core protocol
;;;     runtime    auth, handshake, helpers that call generated code
;;;
;;; The base has to be *defined* before the generated files load, or
;;; their bodies compile to calls of undefined functions and macros.
;;; Loading the hand-written runtime *after* the generated code lets it
;;; use the generated structures and functions directly.

;;; xcb-enum: DEFENUM binds each enum's (keyword . value) alist to a
;;; variable of the enum's name here, for interactive inspection.
(defpackage #:xcb-enum)

(defpackage #:xcb-const
  (:use #:cl)
  (:documentation
   "Compile-time constants for X11 protocol enumerations.

Every DEFENUM emits one DEFCONSTANT per member into this package, named
+<enum>-<member>+.  It exports nothing else, and its symbol list is
entirely +-delimited by construction, so a package can :USE it without
any risk of conflict with COMMON-LISP or with any other package."))

(defpackage #:xcb
  (:use #:cl)
  ;; Shadowed because the X protocol uses these words as field names,
  ;; and the generated slots and accessors would otherwise collide with
  ;; the CL symbols.  The generator checks this list: it warns about any
  ;; name xproto's code uses that is also a CL symbol and missing here.
  (:shadow #:atom #:class #:count #:error
           #:format #:length #:sequence #:string #:time
           #:type #:delete #:function #:map #:values)
  (:export

   ;; Constants
   #:+MSB+
   #:+LSB+
   #:*default-byte-order*

   ;; Protocol base classes (defined in protocol.lisp)
   #:request
   #:request-with-reply
   #:reply
   #:event
   #:error

   ;; Wire operations (io.lisp)
   #:send-request
   #:check-value-mask
   #:value-mask-error
   #:value-mask-error-request
   #:value-mask-error-keyword
   #:value-mask-error-bit
   #:value-mask-error-missing-p
   #:flush-request
   #:read-reply
   #:decode-event
   #:flush
   #:conn-closed
   #:connection-closed
   #:no-reply
   #:protocol-error
   #:protocol-error-code
   #:protocol-error-sequence
   #:protocol-error-bad-value
   #:protocol-error-minor-opcode
   #:protocol-error-major-opcode
   #:protocol-error-object
   #:request-check
   #:discard-reply
   #:poll-for-queued-event
   #:poll-for-event
   #:wait-for-event
   #:wait-for-x-event-or-timeout
   #:with-checked-requests
   #:queue-available-events
   #:clear-event-queue
   #:pop-queued-events-while

   ;; File-descriptor passing (platform.lisp, io.lisp)
   #:*fd-passing-supported*
   #:*pending-fds*
   #:take-pending-fd
   #:take-pending-fds
   #:conn-raw-fd
   #:conn-received-fds

   ;; Event and error decoding (dispatch.lisp)
   #:*debug-decoders*
   #:register-event-decoder
   #:register-error-decoder
   #:register-extension-event-decoder
   #:register-extension-ge-event-decoder
   #:register-extension-error-decoder
   #:extension-major-opcode
   #:extension-present-p
   #:extension-not-present
   #:extension-not-present-extension
   #:extension-not-present-xname

   ;; Enumerations (enum.lisp)
   #:defenum
   #:register-enum
   #:enum-value
   #:enum-key
   #:enum-mask

   ;; Output buffer, used by generated encoders (buffer.lisp)
   #:buffer
   #:make-buffer
   #:buffer-octets
   #:buffer-byte-order
   #:buffer-position
   #:buffer-reset
   #:buffer-write-byte
   #:buffer-write-card8
   #:buffer-write-card16
   #:buffer-write-card32
   #:buffer-write-card64
   #:buffer-write-bool
   #:buffer-write-char
   #:buffer-write-float32
   #:buffer-write-float64
   #:buffer-write-padding
   #:buffer-pad-to-align
   #:buffer-write-octets
   #:buffer-write-string-octets
   #:buffer-write-list
   #:buffer-write-struct-list-16
   #:buffer-write-packed-16
   #:buffer-write-fixed-list
   #:buffer-patch-card16
   #:buffer-finish-request
   #:encode-event

   ;; Positional readers, used by generated decoders (utils.lisp)
   #:octet
   #:read-card8-at
   #:read-int8-at
   #:read-card16-at
   #:read-int16-at
   #:read-card32-at
   #:read-int32-at
   #:read-card64-at
   #:read-int64-at
   #:read-float32-at
   #:read-float64-at
   #:read-bytes-at
   #:read-string-at
   #:read-vector-at
   #:read-struct-vector-at
   #:align-position
   #:sum-of
   #:register-extension-xname
   #:lookup-extension-xname
   #:ensure-extension

   ;; Connection (connection.lisp)
   #:connection
   #:conn-socket
   #:conn-fd
   #:conn-stream
   #:conn-byte-order
   #:conn-send-buffer
   #:conn-next-serial
   #:conn-atoms
   #:conn-roots
   #:conn-event-queue
   #:conn-pending-replies
   #:conn-extensions
   #:conn-protocol-major-version
   #:conn-protocol-minor-version
   #:conn-release-number
   #:conn-resource-id-base
   #:conn-resource-id-mask
   #:conn-resource-id-next
   #:conn-motion-buffer-size
   #:conn-maximum-request-length
   #:conn-image-byte-order
   #:conn-bitmap-format-bit-order
   #:conn-bitmap-format-scanline-unit
   #:conn-bitmap-format-scanline-pad
   #:conn-min-keycode
   #:conn-max-keycode
   #:conn-vendor
   #:conn-pixmap-formats
   #:conn-a8-format
   #:conn-pict-formats-reply
   #:conn-xi2-version

   ;; Screen accessors (generated from xproto.xml)
   #:screen
   #:root
   #:width-in-pixels
   #:height-in-pixels
   #:width-in-millimeters
   #:height-in-millimeters
   #:root-depth
   #:default-colormap
   #:white-pixel
   #:black-pixel
   #:root-visual

   ;; Resource allocation
   #:generate-id

   ;; Connection lifecycle (parse-display.lisp, connection-setup.lisp;
   ;; Xauthority lookup is clXau's)
   #:parse-display
   #:read-xauth
   #:socket-path
   #:open-connection
   #:close-connection
   #:handshake
   #:with-x-connection
   #:connect
   #:conn-transport
   #:call-with-x-connection

   ;; Convenience wrappers (connection-setup.lisp, property.lisp)
   #:send-change-property
   #:intern-atom-id
   #:atom-name
   #:intern-atom
   #:send-client-message
   #:event-to-send-event-octets

   ;; Geometry (geometry.lisp)
   #:root-window
   #:window-root-position
   #:window-geometry

   ;; Visuals and color (visual.lisp)
   #:find-root-visual
   #:pixel-format
   #:pack-rgb-image
   #:rgb->pixel

   ;; Images
   #:put-image-chunked

   ;; User-facing conventions (parse.lisp)
   #:parse-color
   #:parse-geometry
   #:geometry-position

   ;; ICCCM and EWMH (wm.lisp)
   #:set-wm-name
   #:set-wm-icon-name
   #:set-wm-class
   #:set-wm-client-machine
   #:set-wm-delete-protocol
   #:wm-delete-window-message-p
   #:set-net-wm-pid
   #:set-net-wm-window-type
   #:set-wm-normal-hints
   #:set-motif-wm-hints
   #:set-net-wm-state
   #:net-wm-state-p
   #:set-fullscreen
   #:toggle-fullscreen))


;;; Forward declarations
;;;
;;; Files in clxcb/base's base layer call functions defined later: the
;;; CONN-* accessors come from the CONNECTION class in connection.lisp,
;;; and ENSURE-EXTENSION and EXTENSION-MAJOR-OPCODE from
;;; connection-setup.lisp in the runtime layer (they need the generated
;;; QueryExtension request).  These FTYPE declaims tell the compiler the
;;; functions will exist.

(declaim (ftype (cl:function (t t) t) xcb:ensure-extension))
(declaim (ftype (cl:function (t t) t) xcb:extension-major-opcode))
(declaim (ftype (cl:function (t) t) xcb:conn-byte-order))
(declaim (ftype (cl:function (t) t) xcb:conn-stream))
(declaim (ftype (cl:function (t) t) xcb:conn-pending-replies))
(declaim (ftype (cl:function (t) t) xcb:conn-event-queue))
(declaim (ftype (cl:function (t) t) xcb:conn-extensions))
(declaim (ftype (cl:function (t) t) xcb:conn-send-buffer))
(declaim (ftype (cl:function (t) t) xcb:conn-raw-fd))
(declaim (ftype (cl:function (t) t) xcb:conn-received-fds))
(declaim (ftype (cl:function (t) t) xcb::conn-fd-reply-serials))
(declaim (ftype (cl:function (t) t) xcb::conn-extension-index))
(declaim (ftype (cl:function (t t) t) (setf xcb::conn-extension-index)))
(declaim (ftype (cl:function (t t) t) xcb:send-request))
