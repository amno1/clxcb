;;; Generated from screensaver.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-SCREENSAVER
  (:use #:cl)
  (:shadow #:CLASS #:LENGTH #:SEQUENCE #:TIME)
  (:export
   #:decode-notify
   #:decode-query-info-reply
   #:decode-query-version-reply
   #:encode-notify
   #:event-mask
   #:forced
   #:kind
   #:length
   #:ms-since-user-input
   #:ms-until-server
   #:notify
   #:query-info
   #:query-info-reply
   #:query-info-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:root
   #:saver-window
   #:select-input
   #:select-input-request
   #:sequence
   #:server-major-version
   #:server-minor-version
   #:set-attributes
   #:set-attributes-request
   #:state
   #:suspend
   #:suspend-request
   #:time
   #:unset-attributes
   #:unset-attributes-request
   #:window))

(in-package #:XCB-SCREENSAVER)

(xcb:register-extension-xname "XCB-SCREENSAVER" "MIT-SCREEN-SAVER")

;;; Enum xcb.ScreenSaver.Kind
(xcb:defenum screen-saver-kind
  (:blanked 0)
  (:internal 1)
  (:external 2))

;;; Enum xcb.ScreenSaver.Event
(xcb:defenum screen-saver-event
  (:notify-mask 1)
  (:cycle-mask 2))

;;; Enum xcb.ScreenSaver.State
(xcb:defenum screen-saver-state
  (:off 0)
  (:on 1)
  (:cycle 2)
  (:disabled 3))

;;; Request xcb.ScreenSaver.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf client-major-version)
    (xcb:buffer-write-card8 %buf client-minor-version)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 8))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major-version :initarg :server-major-version :accessor server-major-version
            :type (unsigned-byte 16))
           (server-minor-version :initarg :server-minor-version :accessor server-minor-version
            :type (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length server-major-version server-minor-version)
    (declare
     (ignorable %p response-type sequence length server-major-version server-minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf server-major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf server-minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :server-major-version server-major-version :server-minor-version
                    server-minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.ScreenSaver.QueryInfo
(defun query-info (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-info-request (xcb:request-with-reply)
          ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj query-info-request))
  (query-info conn (slot-value %obj 'drawable)))
(defclass query-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (saver-window :initarg :saver-window :accessor saver-window :type xcb:window)
           (ms-until-server :initarg :ms-until-server :accessor ms-until-server :type
            (unsigned-byte 32))
           (ms-since-user-input :initarg :ms-since-user-input :accessor ms-since-user-input :type
            (unsigned-byte 32))
           (event-mask :initarg :event-mask :accessor event-mask :type (unsigned-byte 32))
           (kind :initarg :kind :accessor kind :type (unsigned-byte 8))))
(defun decode-query-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        state
        sequence
        length
        saver-window
        ms-until-server
        ms-since-user-input
        event-mask
        kind)
    (declare
     (ignorable %p response-type state sequence length saver-window ms-until-server
      ms-since-user-input event-mask kind))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf state (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf saver-window (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf ms-until-server (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf ms-since-user-input (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf event-mask (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf kind (xcb:read-card8-at %buf (+ %p 24)))
    (values
     (make-instance 'query-info-reply :response-type response-type :state state :sequence sequence
                    :length length :saver-window saver-window :ms-until-server ms-until-server
                    :ms-since-user-input ms-since-user-input :event-mask event-mask :kind kind)
     (+ %pos 32 (* 4 length)))))
(defun query-info-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-info-reply))

;;; Request xcb.ScreenSaver.SelectInput
(defun select-input (conn drawable event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-input-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'drawable) (slot-value %obj 'event-mask)))

;;; Request xcb.ScreenSaver.SetAttributes
(defun set-attributes
       (conn drawable x y width height border-width class depth visual value-mask
        &key background-pixmap background-pixel border-pixmap border-pixel bit-gravity win-gravity
        backing-store backing-planes backing-pixel override-redirect save-under event-mask
        do-not-propogate-mask colormap cursor)
  (xcb:check-value-mask 'set-attributes value-mask (1 :background-pixmap background-pixmap nil)
   (2 :background-pixel background-pixel nil) (4 :border-pixmap border-pixmap nil)
   (8 :border-pixel border-pixel nil) (16 :bit-gravity bit-gravity nil)
   (32 :win-gravity win-gravity nil) (64 :backing-store backing-store nil)
   (128 :backing-planes backing-planes nil) (256 :backing-pixel backing-pixel nil)
   (512 :override-redirect override-redirect nil) (1024 :save-under save-under nil)
   (2048 :event-mask event-mask nil) (4096 :do-not-propogate-mask do-not-propogate-mask nil)
   (8192 :colormap colormap nil) (16384 :cursor cursor nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf border-width)
    (xcb:buffer-write-card8 %buf class)
    (xcb:buffer-write-card8 %buf depth)
    (xcb:buffer-write-card32 %buf visual)
    (xcb:buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf background-pixmap))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf background-pixel))
      (when (logtest %mask 4) (xcb:buffer-write-card32 %buf border-pixmap))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf border-pixel))
      (when (logtest %mask 16) (xcb:buffer-write-card32 %buf bit-gravity))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf win-gravity))
      (when (logtest %mask 64) (xcb:buffer-write-card32 %buf backing-store))
      (when (logtest %mask 128) (xcb:buffer-write-card32 %buf backing-planes))
      (when (logtest %mask 256) (xcb:buffer-write-card32 %buf backing-pixel))
      (when (logtest %mask 512) (xcb:buffer-write-card32 %buf override-redirect))
      (when (logtest %mask 1024) (xcb:buffer-write-card32 %buf save-under))
      (when (logtest %mask 2048) (xcb:buffer-write-card32 %buf event-mask))
      (when (logtest %mask 4096) (xcb:buffer-write-card32 %buf do-not-propogate-mask))
      (when (logtest %mask 8192) (xcb:buffer-write-card32 %buf colormap))
      (when (logtest %mask 16384) (xcb:buffer-write-card32 %buf cursor)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-attributes-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable) (x :initarg :x :type (signed-byte 16))
           (y :initarg :y :type (signed-byte 16)) (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (border-width :initarg :border-width :type (unsigned-byte 16))
           (class :initarg :class :type (unsigned-byte 8))
           (depth :initarg :depth :type (unsigned-byte 8))
           (visual :initarg :visual :type xcb:visualid)
           (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (background-pixmap :initarg :background-pixmap :type xcb:pixmap)
           (background-pixel :initarg :background-pixel :type (unsigned-byte 32))
           (border-pixmap :initarg :border-pixmap :type xcb:pixmap)
           (border-pixel :initarg :border-pixel :type (unsigned-byte 32))
           (bit-gravity :initarg :bit-gravity :type (unsigned-byte 32))
           (win-gravity :initarg :win-gravity :type (unsigned-byte 32))
           (backing-store :initarg :backing-store :type (unsigned-byte 32))
           (backing-planes :initarg :backing-planes :type (unsigned-byte 32))
           (backing-pixel :initarg :backing-pixel :type (unsigned-byte 32))
           (override-redirect :initarg :override-redirect :type xcb:bool32)
           (save-under :initarg :save-under :type xcb:bool32)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))
           (do-not-propogate-mask :initarg :do-not-propogate-mask :type (unsigned-byte 32))
           (colormap :initarg :colormap :type xcb:colormap)
           (cursor :initarg :cursor :type xcb:cursor)))
(defmethod xcb:send-request (conn (%obj set-attributes-request))
  (apply #'set-attributes conn (slot-value %obj 'drawable) (slot-value %obj 'x)
         (slot-value %obj 'y) (slot-value %obj 'width) (slot-value %obj 'height)
         (slot-value %obj 'border-width) (slot-value %obj 'class) (slot-value %obj 'depth)
         (slot-value %obj 'visual) (slot-value %obj 'value-mask)
         (nconc
          (when (slot-boundp %obj 'background-pixmap)
            (list :background-pixmap (slot-value %obj 'background-pixmap)))
          (when (slot-boundp %obj 'background-pixel)
            (list :background-pixel (slot-value %obj 'background-pixel)))
          (when (slot-boundp %obj 'border-pixmap)
            (list :border-pixmap (slot-value %obj 'border-pixmap)))
          (when (slot-boundp %obj 'border-pixel)
            (list :border-pixel (slot-value %obj 'border-pixel)))
          (when (slot-boundp %obj 'bit-gravity) (list :bit-gravity (slot-value %obj 'bit-gravity)))
          (when (slot-boundp %obj 'win-gravity) (list :win-gravity (slot-value %obj 'win-gravity)))
          (when (slot-boundp %obj 'backing-store)
            (list :backing-store (slot-value %obj 'backing-store)))
          (when (slot-boundp %obj 'backing-planes)
            (list :backing-planes (slot-value %obj 'backing-planes)))
          (when (slot-boundp %obj 'backing-pixel)
            (list :backing-pixel (slot-value %obj 'backing-pixel)))
          (when (slot-boundp %obj 'override-redirect)
            (list :override-redirect (slot-value %obj 'override-redirect)))
          (when (slot-boundp %obj 'save-under) (list :save-under (slot-value %obj 'save-under)))
          (when (slot-boundp %obj 'event-mask) (list :event-mask (slot-value %obj 'event-mask)))
          (when (slot-boundp %obj 'do-not-propogate-mask)
            (list :do-not-propogate-mask (slot-value %obj 'do-not-propogate-mask)))
          (when (slot-boundp %obj 'colormap) (list :colormap (slot-value %obj 'colormap)))
          (when (slot-boundp %obj 'cursor) (list :cursor (slot-value %obj 'cursor))))))

;;; Request xcb.ScreenSaver.UnsetAttributes
(defun unset-attributes (conn drawable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass unset-attributes-request (xcb:request) ((drawable :initarg :drawable :type xcb:drawable)))
(defmethod xcb:send-request (conn (%obj unset-attributes-request))
  (unset-attributes conn (slot-value %obj 'drawable)))

;;; Request xcb.ScreenSaver.Suspend
(defun suspend (conn suspend)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SCREENSAVER"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf suspend)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass suspend-request (xcb:request) ((suspend :initarg :suspend :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj suspend-request)) (suspend conn (slot-value %obj 'suspend)))

;;; Event xcb.ScreenSaver.Notify (0)
(defclass notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (window :initarg :window :accessor window :type xcb:window)
           (kind :initarg :kind :accessor kind :type (unsigned-byte 8))
           (forced :initarg :forced :accessor forced :type (or boolean (unsigned-byte 8)))))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type state sequence time root window kind forced)
    (declare (ignorable %p response-type state sequence time root window kind forced))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf state (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf kind (xcb:read-card8-at %buf (+ %p 16)))
    (setf forced (xcb:read-card8-at %buf (+ %p 17)))
    (values
     (make-instance 'notify :response-type response-type :state state :sequence sequence :time time
                    :root root :window window :kind kind :forced forced)
     (+ %pos 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (state (slot-value %obj 'state))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (window (slot-value %obj 'window))
         (kind (slot-value %obj 'kind))
         (forced (slot-value %obj 'forced)))
    (declare (ignorable response-type state sequence time root window kind forced))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf state)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf root)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf kind)
    (xcb:buffer-write-bool %buf forced)
    (xcb:buffer-write-padding %buf 14)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj notify)) (encode-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-SCREENSAVER" 0 #'decode-notify)
