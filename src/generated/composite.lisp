;;; Generated from composite.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-COMPOSITE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:create-region-from-border-clip
   #:create-region-from-border-clip-request
   #:decode-get-overlay-window-reply
   #:decode-query-version-reply
   #:get-overlay-window
   #:get-overlay-window-reply
   #:get-overlay-window-request
   #:length
   #:major-version
   #:minor-version
   #:name-window-pixmap
   #:name-window-pixmap-request
   #:overlay-win
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:redirect-subwindows
   #:redirect-subwindows-request
   #:redirect-window
   #:redirect-window-request
   #:release-overlay-window
   #:release-overlay-window-request
   #:response-type
   #:sequence
   #:unredirect-subwindows
   #:unredirect-subwindows-request
   #:unredirect-window
   #:unredirect-window-request))

(in-package #:XCB-COMPOSITE)

(xcb:register-extension-xname "XCB-COMPOSITE" "Composite")

;;; Enum xcb.Composite.Redirect
(xcb:defenum composite-redirect
  (:automatic 0)
  (:manual 1))

;;; Request xcb.Composite.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  "Negotiate the version of Composite

This negotiates the version of the Composite extension.  It must be precede all
other requests using Composite.  Failure to do so will cause a BadRequest error."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf client-major-version)
    (xcb:buffer-write-card32 %buf client-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 32))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 32)))
          (:documentation "Negotiate the version of Composite

This negotiates the version of the Composite extension.  It must be precede all
other requests using Composite.  Failure to do so will cause a BadRequest error."))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 32)))
          (:documentation "The negotiated version of Composite

This indicates the version of Composite chosen by the server.  It will always be
less than or equal to the version offered by the client."))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.Composite.RedirectWindow
(defun redirect-window (conn window update)
  "Redirect the hierarchy starting at \"window\" to off-screen storage.

The hierarchy starting at 'window' is directed to off-screen
	storage.  When all clients enabling redirection terminate,
	the redirection will automatically be disabled.

	The root window may not be redirected. Doing so results in a Match
	error."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf update)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass redirect-window-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (update :initarg :update :type (unsigned-byte 8)))
          (:documentation "Redirect the hierarchy starting at \"window\" to off-screen storage.

The hierarchy starting at 'window' is directed to off-screen
	storage.  When all clients enabling redirection terminate,
	the redirection will automatically be disabled.

	The root window may not be redirected. Doing so results in a Match
	error."))
(defmethod xcb:send-request (conn (%obj redirect-window-request))
  (redirect-window conn (slot-value %obj 'window) (slot-value %obj 'update)))

;;; Request xcb.Composite.RedirectSubwindows
(defun redirect-subwindows (conn window update)
  "Redirect all current and future children of ‘window’

Hierarchies starting at all current and future children of window
	will be redirected as in RedirectWindow. If update is Manual,
	then painting of the window background during window manipulation
	and ClearArea requests is inhibited."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf update)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass redirect-subwindows-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (update :initarg :update :type (unsigned-byte 8)))
          (:documentation "Redirect all current and future children of ‘window’

Hierarchies starting at all current and future children of window
	will be redirected as in RedirectWindow. If update is Manual,
	then painting of the window background during window manipulation
	and ClearArea requests is inhibited."))
(defmethod xcb:send-request (conn (%obj redirect-subwindows-request))
  (redirect-subwindows conn (slot-value %obj 'window) (slot-value %obj 'update)))

;;; Request xcb.Composite.UnredirectWindow
(defun unredirect-window (conn window update)
  "Terminate redirection of the specified window.

Redirection of the specified window will be terminated.  This cannot be
	used if the window was redirected with RedirectSubwindows."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf update)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass unredirect-window-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (update :initarg :update :type (unsigned-byte 8)))
          (:documentation "Terminate redirection of the specified window.

Redirection of the specified window will be terminated.  This cannot be
	used if the window was redirected with RedirectSubwindows."))
(defmethod xcb:send-request (conn (%obj unredirect-window-request))
  (unredirect-window conn (slot-value %obj 'window) (slot-value %obj 'update)))

;;; Request xcb.Composite.UnredirectSubwindows
(defun unredirect-subwindows (conn window update)
  "Terminate redirection of the specified window’s children

Redirection of all children of window will be terminated."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf update)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass unredirect-subwindows-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (update :initarg :update :type (unsigned-byte 8)))
          (:documentation "Terminate redirection of the specified window’s children

Redirection of all children of window will be terminated."))
(defmethod xcb:send-request (conn (%obj unredirect-subwindows-request))
  (unredirect-subwindows conn (slot-value %obj 'window) (slot-value %obj 'update)))

;;; Request xcb.Composite.CreateRegionFromBorderClip
(defun create-region-from-border-clip (conn region window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-region-from-border-clip-request (xcb:request)
          ((region :initarg :region :type xcb-xfixes:region)
           (window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj create-region-from-border-clip-request))
  (create-region-from-border-clip conn (slot-value %obj 'region) (slot-value %obj 'window)))

;;; Request xcb.Composite.NameWindowPixmap
(defun name-window-pixmap (conn window pixmap)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf pixmap)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass name-window-pixmap-request (xcb:request)
          ((window :initarg :window :type xcb:window) (pixmap :initarg :pixmap :type xcb:pixmap)))
(defmethod xcb:send-request (conn (%obj name-window-pixmap-request))
  (name-window-pixmap conn (slot-value %obj 'window) (slot-value %obj 'pixmap)))

;;; Request xcb.Composite.GetOverlayWindow
(defun get-overlay-window (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-overlay-window-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-overlay-window-request))
  (get-overlay-window conn (slot-value %obj 'window)))
(defclass get-overlay-window-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (overlay-win :initarg :overlay-win :accessor overlay-win :type xcb:window)))
(defun decode-get-overlay-window-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length overlay-win)
    (declare (ignorable %p response-type sequence length overlay-win))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf overlay-win (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-overlay-window-reply :response-type response-type :sequence sequence
                    :length length :overlay-win overlay-win)
     (+ %pos 32 (* 4 length)))))
(defun get-overlay-window-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-overlay-window-reply))

;;; Request xcb.Composite.ReleaseOverlayWindow
(defun release-overlay-window (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-COMPOSITE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass release-overlay-window-request (xcb:request) ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj release-overlay-window-request))
  (release-overlay-window conn (slot-value %obj 'window)))
