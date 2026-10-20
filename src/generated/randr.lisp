;;; Generated from randr.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-RANDR
  (:use #:cl)
  (:shadow #:ATOM #:DELETE #:FORMAT #:LENGTH #:SEQUENCE #:TYPE #:VALUES)
  (:export
   #:add-output-mode
   #:add-output-mode-request
   #:associated-capability
   #:associated-providers
   #:atom
   #:atoms
   #:automatic
   #:bad-crtc-error
   #:bad-mode-error
   #:bad-output-error
   #:bad-provider-error
   #:bad-value
   #:blue
   #:border-bottom
   #:border-left
   #:border-right
   #:border-top
   #:bytes-after
   #:capabilities
   #:cc
   #:change-output-property
   #:change-output-property-request
   #:change-provider-property
   #:change-provider-property-request
   #:clones
   #:config-timestamp
   #:configure-output-property
   #:configure-output-property-request
   #:configure-provider-property
   #:configure-provider-property-request
   #:connection
   #:create-lease
   #:create-lease-reply
   #:create-lease-request
   #:create-mode
   #:create-mode-reply
   #:create-mode-request
   #:created
   #:crtc
   #:crtc-change
   #:crtcs
   #:current-filter-name
   #:current-len
   #:current-nparams
   #:current-params
   #:current-transform
   #:data
   #:decode-bad-crtc-error
   #:decode-bad-mode-error
   #:decode-bad-output-error
   #:decode-bad-provider-error
   #:decode-create-lease-reply
   #:decode-create-mode-reply
   #:decode-crtc-change
   #:decode-get-crtc-gamma-reply
   #:decode-get-crtc-gamma-size-reply
   #:decode-get-crtc-info-reply
   #:decode-get-crtc-transform-reply
   #:decode-get-monitors-reply
   #:decode-get-output-info-reply
   #:decode-get-output-primary-reply
   #:decode-get-output-property-reply
   #:decode-get-panning-reply
   #:decode-get-provider-info-reply
   #:decode-get-provider-property-reply
   #:decode-get-providers-reply
   #:decode-get-screen-info-reply
   #:decode-get-screen-resources-current-reply
   #:decode-get-screen-resources-reply
   #:decode-get-screen-size-range-reply
   #:decode-lease-notify
   #:decode-list-output-properties-reply
   #:decode-list-provider-properties-reply
   #:decode-mode-info
   #:decode-monitor-info
   #:decode-notify
   #:decode-notify-data
   #:decode-output-change
   #:decode-output-property
   #:decode-provider-change
   #:decode-provider-property
   #:decode-query-output-property-reply
   #:decode-query-provider-property-reply
   #:decode-query-version-reply
   #:decode-refresh-rates
   #:decode-resource-change
   #:decode-screen-change-notify
   #:decode-screen-size
   #:decode-set-crtc-config-reply
   #:decode-set-panning-reply
   #:decode-set-screen-config-reply
   #:delete-monitor
   #:delete-monitor-request
   #:delete-output-mode
   #:delete-output-mode-request
   #:delete-output-property
   #:delete-output-property-request
   #:delete-provider-property
   #:delete-provider-property-request
   #:destroy-mode
   #:destroy-mode-request
   #:dot-clock
   #:encode-crtc-change
   #:encode-lease-notify
   #:encode-mode-info
   #:encode-monitor-info
   #:encode-notify
   #:encode-notify-data
   #:encode-output-change
   #:encode-output-property
   #:encode-provider-change
   #:encode-provider-property
   #:encode-refresh-rates
   #:encode-resource-change
   #:encode-screen-change-notify
   #:encode-screen-size
   #:error-code
   #:format
   #:free-lease
   #:free-lease-request
   #:get-crtc-gamma
   #:get-crtc-gamma-reply
   #:get-crtc-gamma-request
   #:get-crtc-gamma-size
   #:get-crtc-gamma-size-reply
   #:get-crtc-gamma-size-request
   #:get-crtc-info
   #:get-crtc-info-reply
   #:get-crtc-info-request
   #:get-crtc-transform
   #:get-crtc-transform-reply
   #:get-crtc-transform-request
   #:get-monitors
   #:get-monitors-reply
   #:get-monitors-request
   #:get-output-info
   #:get-output-info-reply
   #:get-output-info-request
   #:get-output-primary
   #:get-output-primary-reply
   #:get-output-primary-request
   #:get-output-property
   #:get-output-property-reply
   #:get-output-property-request
   #:get-panning
   #:get-panning-reply
   #:get-panning-request
   #:get-provider-info
   #:get-provider-info-reply
   #:get-provider-info-request
   #:get-provider-property
   #:get-provider-property-reply
   #:get-provider-property-request
   #:get-providers
   #:get-providers-reply
   #:get-providers-request
   #:get-screen-info
   #:get-screen-info-reply
   #:get-screen-info-request
   #:get-screen-resources
   #:get-screen-resources-current
   #:get-screen-resources-current-reply
   #:get-screen-resources-current-request
   #:get-screen-resources-reply
   #:get-screen-resources-request
   #:get-screen-size-range
   #:get-screen-size-range-reply
   #:get-screen-size-range-request
   #:green
   #:has-transforms
   #:height
   #:height-in-millimeters
   #:hskew
   #:hsync-end
   #:hsync-start
   #:htotal
   #:id
   #:immutable
   #:lc
   #:lease
   #:lease-notify
   #:left
   #:length
   #:list-output-properties
   #:list-output-properties-reply
   #:list-output-properties-request
   #:list-provider-properties
   #:list-provider-properties-reply
   #:list-provider-properties-request
   #:major-opcode
   #:major-version
   #:master-fd
   #:max-height
   #:max-width
   #:mheight
   #:min-height
   #:min-width
   #:minor-opcode
   #:minor-version
   #:mm-height
   #:mm-width
   #:mode
   #:mode-flags
   #:mode-info
   #:modes
   #:monitor-info
   #:monitors
   #:mwidth
   #:n-info
   #:n-monitors
   #:n-output
   #:n-outputs
   #:n-rates
   #:n-sizes
   #:name
   #:name-len
   #:names
   #:names-len
   #:new-timestamp
   #:nfd
   #:notify
   #:notify-data
   #:num-associated-providers
   #:num-atoms
   #:num-clones
   #:num-crtcs
   #:num-items
   #:num-modes
   #:num-outputs
   #:num-possible-outputs
   #:num-preferred
   #:num-providers
   #:oc
   #:op
   #:output
   #:output-change
   #:output-property
   #:outputs
   #:pc
   #:pending
   #:pending-filter-name
   #:pending-len
   #:pending-nparams
   #:pending-params
   #:pending-transform
   #:possible
   #:pp
   #:primary
   #:provider
   #:provider-change
   #:provider-property
   #:providers
   #:query-output-property
   #:query-output-property-reply
   #:query-output-property-request
   #:query-provider-property
   #:query-provider-property-reply
   #:query-provider-property-request
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:range
   #:rate
   #:rates
   #:rc
   #:red
   #:refresh-rates
   #:request-window
   #:resource-change
   #:response-type
   #:root
   #:rotation
   #:rotations
   #:screen-change-notify
   #:screen-size
   #:select-input
   #:select-input-request
   #:sequence
   #:set-crtc-config
   #:set-crtc-config-reply
   #:set-crtc-config-request
   #:set-crtc-gamma
   #:set-crtc-gamma-request
   #:set-crtc-transform
   #:set-crtc-transform-request
   #:set-monitor
   #:set-monitor-request
   #:set-output-primary
   #:set-output-primary-request
   #:set-panning
   #:set-panning-reply
   #:set-panning-request
   #:set-provider-offload-sink
   #:set-provider-offload-sink-request
   #:set-provider-output-source
   #:set-provider-output-source-request
   #:set-screen-config
   #:set-screen-config-reply
   #:set-screen-config-request
   #:set-screen-size
   #:set-screen-size-request
   #:size
   #:size-id
   #:sizes
   #:state
   #:status
   #:sub-code
   #:subpixel-order
   #:timestamp
   #:top
   #:track-height
   #:track-left
   #:track-top
   #:track-width
   #:type
   #:u
   #:valid-values
   #:vsync-end
   #:vsync-start
   #:vtotal
   #:width
   #:width-in-millimeters
   #:window
   #:x
   #:y))

(in-package #:XCB-RANDR)

(xcb:register-extension-xname "XCB-RANDR" "RANDR")
(deftype mode () '(unsigned-byte 32))
(deftype crtc () '(unsigned-byte 32))
(deftype output () '(unsigned-byte 32))
(deftype provider () '(unsigned-byte 32))
(deftype lease () '(unsigned-byte 32))

;;; Error xcb.RandR.BadOutput (0)
(defclass bad-output-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-output-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'bad-output-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RANDR" 0 #'decode-bad-output-error)

;;; Error xcb.RandR.BadCrtc (1)
(defclass bad-crtc-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-crtc-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'bad-crtc-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RANDR" 1 #'decode-bad-crtc-error)

;;; Error xcb.RandR.BadMode (2)
(defclass bad-mode-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-mode-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'bad-mode-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RANDR" 2 #'decode-bad-mode-error)

;;; Error xcb.RandR.BadProvider (3)
(defclass bad-provider-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-provider-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (cl:values
     (make-instance 'bad-provider-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-RANDR" 3 #'decode-bad-provider-error)

;;; Enum xcb.RandR.Rotation
(xcb:defenum rand-r-rotation
  (:rotate-0 1)
  (:rotate-90 2)
  (:rotate-180 4)
  (:rotate-270 8)
  (:reflect-x 16)
  (:reflect-y 32))

;;; xcb.RandR.ScreenSize
(defclass screen-size nil
          ((width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (mwidth :initarg :mwidth :accessor mwidth :type (unsigned-byte 16))
           (mheight :initarg :mheight :accessor mheight :type (unsigned-byte 16))))
(defun encode-screen-size (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (mwidth (slot-value %obj 'mwidth))
         (mheight (slot-value %obj 'mheight)))
    (declare (ignorable width height mwidth mheight))
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf mwidth)
    (xcb:buffer-write-card16 %buf mheight)))
(defun decode-screen-size (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) width height mwidth mheight)
    (declare (ignorable %p width height mwidth mheight))
    (setf width (xcb:read-card16-at %buf %p %order))
    (setf height (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf mwidth (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf mheight (xcb:read-card16-at %buf (+ %p 6) %order))
    (cl:values
     (make-instance 'screen-size :width width :height height :mwidth mwidth :mheight mheight)
     (+ %p 8))))

;;; xcb.RandR.RefreshRates
(defclass refresh-rates nil
          ((n-rates :initarg :n-rates :accessor n-rates :type (unsigned-byte 16))
           (rates :initarg :rates :accessor rates :type cl:sequence)))
(defun encode-refresh-rates (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((rates (slot-value %obj 'rates)) (n-rates (cl:length rates)))
    (declare (ignorable rates n-rates))
    (xcb:buffer-write-card16 %buf n-rates)
    (xcb:buffer-write-list %buf rates n-rates #'xcb:buffer-write-card16)))
(defun decode-refresh-rates (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) n-rates rates)
    (declare (ignorable %p n-rates rates))
    (setf n-rates (xcb:read-card16-at %buf %p %order))
    (setf %p (+ %p 2))
    (multiple-value-setq (rates %p) (xcb:read-vector-at %buf %p n-rates %order :card16))
    (cl:values (make-instance 'refresh-rates :n-rates n-rates :rates rates) %p)))

;;; Request xcb.RandR.QueryVersion
(defun query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf major-version)
    (xcb:buffer-write-card32 %buf minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj query-version-request))
  (query-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 32))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 32))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card32-at %buf (+ %p 12) %order))
    (cl:values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Enum xcb.RandR.SetConfig
(xcb:defenum rand-r-set-config
  (:success 0)
  (:invalid-config-time 1)
  (:invalid-time 2)
  (:failed 3))

;;; Request xcb.RandR.SetScreenConfig
(defun set-screen-config (conn window timestamp config-timestamp size-id rotation rate)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-write-card16 %buf size-id)
    (xcb:buffer-write-card16 %buf rotation)
    (xcb:buffer-write-card16 %buf rate)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-screen-config-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (timestamp :initarg :timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)
           (size-id :initarg :size-id :type (unsigned-byte 16))
           (rotation :initarg :rotation :type (unsigned-byte 16))
           (rate :initarg :rate :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj set-screen-config-request))
  (set-screen-config conn (slot-value %obj 'window) (slot-value %obj 'timestamp)
   (slot-value %obj 'config-timestamp) (slot-value %obj 'size-id) (slot-value %obj 'rotation)
   (slot-value %obj 'rate)))
(defclass set-screen-config-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (new-timestamp :initarg :new-timestamp :accessor new-timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (subpixel-order :initarg :subpixel-order :accessor subpixel-order :type
            (unsigned-byte 16))))
(defun decode-set-screen-config-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        status
        sequence
        length
        new-timestamp
        config-timestamp
        root
        subpixel-order)
    (declare
     (ignorable %p response-type status sequence length new-timestamp config-timestamp root
      subpixel-order))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf new-timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf subpixel-order (xcb:read-card16-at %buf (+ %p 20) %order))
    (cl:values
     (make-instance 'set-screen-config-reply :response-type response-type :status status :sequence
                    sequence :length length :new-timestamp new-timestamp :config-timestamp
                    config-timestamp :root root :subpixel-order subpixel-order)
     (+ %pos 32 (* 4 length)))))
(defun set-screen-config-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-screen-config-reply))

;;; Enum xcb.RandR.NotifyMask
(xcb:defenum rand-r-notify-mask
  (:screen-change 1)
  (:crtc-change 2)
  (:output-change 4)
  (:output-property 8)
  (:provider-change 16)
  (:provider-property 32)
  (:resource-change 64)
  (:lease 128))

;;; Request xcb.RandR.SelectInput
(defun select-input (conn window enable)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf enable)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-input-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (enable :initarg :enable :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'window) (slot-value %obj 'enable)))

;;; Request xcb.RandR.GetScreenInfo
(defun get-screen-info (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-info-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-screen-info-request))
  (get-screen-info conn (slot-value %obj 'window)))
(defclass get-screen-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (rotations :initarg :rotations :accessor rotations :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (n-sizes :initarg :n-sizes :accessor n-sizes :type (unsigned-byte 16))
           (size-id :initarg :size-id :accessor size-id :type (unsigned-byte 16))
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 16))
           (rate :initarg :rate :accessor rate :type (unsigned-byte 16))
           (n-info :initarg :n-info :accessor n-info :type (unsigned-byte 16))
           (sizes :initarg :sizes :accessor sizes :type cl:sequence)
           (rates :initarg :rates :accessor rates :type cl:sequence)))
(defun decode-get-screen-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        rotations
        sequence
        length
        root
        timestamp
        config-timestamp
        n-sizes
        size-id
        rotation
        rate
        n-info
        sizes
        rates)
    (declare
     (ignorable %p response-type rotations sequence length root timestamp config-timestamp n-sizes
      size-id rotation rate n-info sizes rates))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf rotations (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf n-sizes (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf size-id (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf rotation (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf rate (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf n-info (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (sizes %p)
      (xcb:read-struct-vector-at %buf %p (min n-sizes (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-screen-size))
    (multiple-value-setq (rates %p)
      (xcb:read-struct-vector-at %buf %p (min (- n-info n-sizes) (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-refresh-rates))
    (cl:values
     (make-instance 'get-screen-info-reply :response-type response-type :rotations rotations
                    :sequence sequence :length length :root root :timestamp timestamp
                    :config-timestamp config-timestamp :n-sizes n-sizes :size-id size-id :rotation
                    rotation :rate rate :n-info n-info :sizes sizes :rates rates)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-info-reply))

;;; Request xcb.RandR.GetScreenSizeRange
(defun get-screen-size-range (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-size-range-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-screen-size-range-request))
  (get-screen-size-range conn (slot-value %obj 'window)))
(defclass get-screen-size-range-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (min-width :initarg :min-width :accessor min-width :type (unsigned-byte 16))
           (min-height :initarg :min-height :accessor min-height :type (unsigned-byte 16))
           (max-width :initarg :max-width :accessor max-width :type (unsigned-byte 16))
           (max-height :initarg :max-height :accessor max-height :type (unsigned-byte 16))))
(defun decode-get-screen-size-range-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length min-width min-height max-width max-height)
    (declare
     (ignorable %p response-type sequence length min-width min-height max-width max-height))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf min-width (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf min-height (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf max-width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf max-height (xcb:read-card16-at %buf (+ %p 14) %order))
    (cl:values
     (make-instance 'get-screen-size-range-reply :response-type response-type :sequence sequence
                    :length length :min-width min-width :min-height min-height :max-width max-width
                    :max-height max-height)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-size-range-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-size-range-reply))

;;; Request xcb.RandR.SetScreenSize
(defun set-screen-size (conn window width height mm-width mm-height)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf mm-width)
    (xcb:buffer-write-card32 %buf mm-height)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-screen-size-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (mm-width :initarg :mm-width :type (unsigned-byte 32))
           (mm-height :initarg :mm-height :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj set-screen-size-request))
  (set-screen-size conn (slot-value %obj 'window) (slot-value %obj 'width)
   (slot-value %obj 'height) (slot-value %obj 'mm-width) (slot-value %obj 'mm-height)))

;;; Enum xcb.RandR.ModeFlag
(xcb:defenum rand-r-mode-flag
  (:hsync-positive 1)
  (:hsync-negative 2)
  (:vsync-positive 4)
  (:vsync-negative 8)
  (:interlace 16)
  (:double-scan 32)
  (:csync 64)
  (:csync-positive 128)
  (:csync-negative 256)
  (:hskew-present 512)
  (:bcast 1024)
  (:pixel-multiplex 2048)
  (:double-clock 4096)
  (:halve-clock 8192))

;;; xcb.RandR.ModeInfo
(defclass mode-info nil
          ((id :initarg :id :accessor id :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (dot-clock :initarg :dot-clock :accessor dot-clock :type (unsigned-byte 32))
           (hsync-start :initarg :hsync-start :accessor hsync-start :type (unsigned-byte 16))
           (hsync-end :initarg :hsync-end :accessor hsync-end :type (unsigned-byte 16))
           (htotal :initarg :htotal :accessor htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :accessor hskew :type (unsigned-byte 16))
           (vsync-start :initarg :vsync-start :accessor vsync-start :type (unsigned-byte 16))
           (vsync-end :initarg :vsync-end :accessor vsync-end :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :accessor vtotal :type (unsigned-byte 16))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (mode-flags :initarg :mode-flags :accessor mode-flags :type (unsigned-byte 32))))
(defun encode-mode-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((id (slot-value %obj 'id))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (dot-clock (slot-value %obj 'dot-clock))
         (hsync-start (slot-value %obj 'hsync-start))
         (hsync-end (slot-value %obj 'hsync-end))
         (htotal (slot-value %obj 'htotal))
         (hskew (slot-value %obj 'hskew))
         (vsync-start (slot-value %obj 'vsync-start))
         (vsync-end (slot-value %obj 'vsync-end))
         (vtotal (slot-value %obj 'vtotal))
         (name-len (slot-value %obj 'name-len))
         (mode-flags (slot-value %obj 'mode-flags)))
    (declare
     (ignorable id width height dot-clock hsync-start hsync-end htotal hskew vsync-start vsync-end
      vtotal name-len mode-flags))
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf dot-clock)
    (xcb:buffer-write-card16 %buf hsync-start)
    (xcb:buffer-write-card16 %buf hsync-end)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vsync-start)
    (xcb:buffer-write-card16 %buf vsync-end)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-card16 %buf name-len)
    (xcb:buffer-write-card32 %buf mode-flags)))
(defun decode-mode-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        id
        width
        height
        dot-clock
        hsync-start
        hsync-end
        htotal
        hskew
        vsync-start
        vsync-end
        vtotal
        name-len
        mode-flags)
    (declare
     (ignorable %p id width height dot-clock hsync-start hsync-end htotal hskew vsync-start
      vsync-end vtotal name-len mode-flags))
    (setf id (xcb:read-card32-at %buf %p %order))
    (setf width (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf dot-clock (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf hsync-start (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf hsync-end (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf htotal (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf hskew (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf vsync-start (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf vsync-end (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf vtotal (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf mode-flags (xcb:read-card32-at %buf (+ %p 28) %order))
    (cl:values
     (make-instance 'mode-info :id id :width width :height height :dot-clock dot-clock :hsync-start
                    hsync-start :hsync-end hsync-end :htotal htotal :hskew hskew :vsync-start
                    vsync-start :vsync-end vsync-end :vtotal vtotal :name-len name-len :mode-flags
                    mode-flags)
     (+ %p 32))))

;;; Request xcb.RandR.GetScreenResources
(defun get-screen-resources (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-resources-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-screen-resources-request))
  (get-screen-resources conn (slot-value %obj 'window)))
(defclass get-screen-resources-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (num-crtcs :initarg :num-crtcs :accessor num-crtcs :type (unsigned-byte 16))
           (num-outputs :initarg :num-outputs :accessor num-outputs :type (unsigned-byte 16))
           (num-modes :initarg :num-modes :accessor num-modes :type (unsigned-byte 16))
           (names-len :initarg :names-len :accessor names-len :type (unsigned-byte 16))
           (crtcs :initarg :crtcs :accessor crtcs :type cl:sequence)
           (outputs :initarg :outputs :accessor outputs :type cl:sequence)
           (modes :initarg :modes :accessor modes :type cl:sequence)
           (names :initarg :names :accessor names :type cl:sequence)))
(defun decode-get-screen-resources-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        timestamp
        config-timestamp
        num-crtcs
        num-outputs
        num-modes
        names-len
        crtcs
        outputs
        modes
        names)
    (declare
     (ignorable %p response-type sequence length timestamp config-timestamp num-crtcs num-outputs
      num-modes names-len crtcs outputs modes names))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-crtcs (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf num-outputs (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf num-modes (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf names-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (crtcs %p)
      (xcb:read-vector-at %buf %p (min num-crtcs (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (outputs %p)
      (xcb:read-vector-at %buf %p (min num-outputs (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (modes %p)
      (xcb:read-struct-vector-at %buf %p (min num-modes (floor (- (+ %pos 32 (* 4 length)) %p) 32))
       %order #'decode-mode-info))
    (multiple-value-setq (names %p)
      (xcb:read-vector-at %buf %p (min names-len (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-screen-resources-reply :response-type response-type :sequence sequence
                    :length length :timestamp timestamp :config-timestamp config-timestamp
                    :num-crtcs num-crtcs :num-outputs num-outputs :num-modes num-modes :names-len
                    names-len :crtcs crtcs :outputs outputs :modes modes :names names)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-resources-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-resources-reply))

;;; Enum xcb.RandR.Connection
(xcb:defenum rand-r-connection
  (:connected 0)
  (:disconnected 1)
  (:unknown 2))

;;; Request xcb.RandR.GetOutputInfo
(defun get-output-info (conn output config-timestamp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-output-info-request (xcb:request-with-reply)
          ((output :initarg :output :type output)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj get-output-info-request))
  (get-output-info conn (slot-value %obj 'output) (slot-value %obj 'config-timestamp)))
(defclass get-output-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (crtc :initarg :crtc :accessor crtc :type crtc)
           (mm-width :initarg :mm-width :accessor mm-width :type (unsigned-byte 32))
           (mm-height :initarg :mm-height :accessor mm-height :type (unsigned-byte 32))
           (connection :initarg :connection :accessor connection :type (unsigned-byte 8))
           (subpixel-order :initarg :subpixel-order :accessor subpixel-order :type
            (unsigned-byte 8))
           (num-crtcs :initarg :num-crtcs :accessor num-crtcs :type (unsigned-byte 16))
           (num-modes :initarg :num-modes :accessor num-modes :type (unsigned-byte 16))
           (num-preferred :initarg :num-preferred :accessor num-preferred :type (unsigned-byte 16))
           (num-clones :initarg :num-clones :accessor num-clones :type (unsigned-byte 16))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (crtcs :initarg :crtcs :accessor crtcs :type cl:sequence)
           (modes :initarg :modes :accessor modes :type cl:sequence)
           (clones :initarg :clones :accessor clones :type cl:sequence)
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-get-output-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        status
        sequence
        length
        timestamp
        crtc
        mm-width
        mm-height
        connection
        subpixel-order
        num-crtcs
        num-modes
        num-preferred
        num-clones
        name-len
        crtcs
        modes
        clones
        name)
    (declare
     (ignorable %p response-type status sequence length timestamp crtc mm-width mm-height
      connection subpixel-order num-crtcs num-modes num-preferred num-clones name-len crtcs modes
      clones name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf crtc (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf mm-width (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf mm-height (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf connection (xcb:read-card8-at %buf (+ %p 24)))
    (setf subpixel-order (xcb:read-card8-at %buf (+ %p 25)))
    (setf num-crtcs (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf num-modes (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf num-preferred (xcb:read-card16-at %buf (+ %p 30) %order))
    (setf num-clones (xcb:read-card16-at %buf (+ %p 32) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 34) %order))
    (setf %p (+ %p 36))
    (multiple-value-setq (crtcs %p)
      (xcb:read-vector-at %buf %p (min num-crtcs (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (modes %p)
      (xcb:read-vector-at %buf %p (min num-modes (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (clones %p)
      (xcb:read-vector-at %buf %p (min num-clones (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (name %p)
      (xcb:read-vector-at %buf %p (min name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-output-info-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp :crtc crtc :mm-width mm-width
                    :mm-height mm-height :connection connection :subpixel-order subpixel-order
                    :num-crtcs num-crtcs :num-modes num-modes :num-preferred num-preferred
                    :num-clones num-clones :name-len name-len :crtcs crtcs :modes modes :clones
                    clones :name name)
     (+ %pos 32 (* 4 length)))))
(defun get-output-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-output-info-reply))

;;; Request xcb.RandR.ListOutputProperties
(defun list-output-properties (conn output)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-output-properties-request (xcb:request-with-reply)
          ((output :initarg :output :type output)))
(defmethod xcb:send-request (conn (%obj list-output-properties-request))
  (list-output-properties conn (slot-value %obj 'output)))
(defclass list-output-properties-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-atoms :initarg :num-atoms :accessor num-atoms :type (unsigned-byte 16))
           (atoms :initarg :atoms :accessor atoms :type cl:sequence)))
(defun decode-list-output-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-atoms atoms)
    (declare (ignorable %p response-type sequence length num-atoms atoms))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-atoms (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (atoms %p)
      (xcb:read-vector-at %buf %p (min num-atoms (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'list-output-properties-reply :response-type response-type :sequence sequence
                    :length length :num-atoms num-atoms :atoms atoms)
     (+ %pos 32 (* 4 length)))))
(defun list-output-properties-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-output-properties-reply))

;;; Request xcb.RandR.QueryOutputProperty
(defun query-output-property (conn output property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-output-property-request (xcb:request-with-reply)
          ((output :initarg :output :type output) (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj query-output-property-request))
  (query-output-property conn (slot-value %obj 'output) (slot-value %obj 'property)))
(defclass query-output-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pending :initarg :pending :accessor pending :type (or boolean (unsigned-byte 8)))
           (range :initarg :range :accessor range :type (or boolean (unsigned-byte 8)))
           (immutable :initarg :immutable :accessor immutable :type (or boolean (unsigned-byte 8)))
           (valid-values :initarg :valid-values :accessor valid-values :type cl:sequence)))
(defun decode-query-output-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length pending range immutable valid-values)
    (declare (ignorable %p response-type sequence length pending range immutable valid-values))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf pending (xcb:read-card8-at %buf (+ %p 8)))
    (setf range (xcb:read-card8-at %buf (+ %p 9)))
    (setf immutable (xcb:read-card8-at %buf (+ %p 10)))
    (setf %p (+ %p 32))
    (multiple-value-setq (valid-values %p)
      (xcb:read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :int32))
    (cl:values
     (make-instance 'query-output-property-reply :response-type response-type :sequence sequence
                    :length length :pending pending :range range :immutable immutable :valid-values
                    valid-values)
     (+ %pos 32 (* 4 length)))))
(defun query-output-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-output-property-reply))

;;; Request xcb.RandR.ConfigureOutputProperty
(defun configure-output-property (conn output property pending range values)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-bool %buf pending)
    (xcb:buffer-write-bool %buf range)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf values nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass configure-output-property-request (xcb:request)
          ((output :initarg :output :type output) (property :initarg :property :type xcb:atom)
           (pending :initarg :pending :type (or boolean (unsigned-byte 8)))
           (range :initarg :range :type (or boolean (unsigned-byte 8)))
           (values :initarg :values :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj configure-output-property-request))
  (configure-output-property conn (slot-value %obj 'output) (slot-value %obj 'property)
   (slot-value %obj 'pending) (slot-value %obj 'range) (slot-value %obj 'values)))

;;; Request xcb.RandR.ChangeOutputProperty
(defun change-output-property (conn output property type format mode num-units data)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card8 %buf format)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf num-units)
    (xcb:buffer-write-octets %buf data :end (truncate (* num-units format) 8))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-output-property-request (xcb:request)
          ((output :initarg :output :type output) (property :initarg :property :type xcb:atom)
           (type :initarg :type :type xcb:atom) (format :initarg :format :type (unsigned-byte 8))
           (mode :initarg :mode :type (unsigned-byte 8))
           (num-units :initarg :num-units :type (unsigned-byte 32))
           (data :initarg :data :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-output-property-request))
  (change-output-property conn (slot-value %obj 'output) (slot-value %obj 'property)
   (slot-value %obj 'type) (slot-value %obj 'format) (slot-value %obj 'mode)
   (slot-value %obj 'num-units) (slot-value %obj 'data)))

;;; Request xcb.RandR.DeleteOutputProperty
(defun delete-output-property (conn output property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-output-property-request (xcb:request)
          ((output :initarg :output :type output) (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj delete-output-property-request))
  (delete-output-property conn (slot-value %obj 'output) (slot-value %obj 'property)))

;;; Request xcb.RandR.GetOutputProperty
(defun get-output-property (conn output property type long-offset long-length delete pending)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card32 %buf long-offset)
    (xcb:buffer-write-card32 %buf long-length)
    (xcb:buffer-write-bool %buf delete)
    (xcb:buffer-write-bool %buf pending)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-output-property-request (xcb:request-with-reply)
          ((output :initarg :output :type output) (property :initarg :property :type xcb:atom)
           (type :initarg :type :type xcb:atom)
           (long-offset :initarg :long-offset :type (unsigned-byte 32))
           (long-length :initarg :long-length :type (unsigned-byte 32))
           (delete :initarg :delete :type (or boolean (unsigned-byte 8)))
           (pending :initarg :pending :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj get-output-property-request))
  (get-output-property conn (slot-value %obj 'output) (slot-value %obj 'property)
   (slot-value %obj 'type) (slot-value %obj 'long-offset) (slot-value %obj 'long-length)
   (slot-value %obj 'delete) (slot-value %obj 'pending)))
(defclass get-output-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type xcb:atom)
           (bytes-after :initarg :bytes-after :accessor bytes-after :type (unsigned-byte 32))
           (num-items :initarg :num-items :accessor num-items :type (unsigned-byte 32))
           (data :initarg :data :accessor data :type cl:sequence)))
(defun decode-get-output-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type format sequence length type bytes-after num-items data)
    (declare (ignorable %p response-type format sequence length type bytes-after num-items data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf format (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf type (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf bytes-after (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-items (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (data %p)
      (xcb:read-vector-at %buf %p
       (min (* num-items (truncate format 8)) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-output-property-reply :response-type response-type :format format
                    :sequence sequence :length length :type type :bytes-after bytes-after
                    :num-items num-items :data data)
     (+ %pos 32 (* 4 length)))))
(defun get-output-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-output-property-reply))

;;; Request xcb.RandR.CreateMode
(defun create-mode (conn window mode-info name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (encode-mode-info %buf mode-info)
    (xcb:buffer-write-string-octets %buf name nil)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass create-mode-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (mode-info :initarg :mode-info :type mode-info) (name :initarg :name :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-mode-request))
  (create-mode conn (slot-value %obj 'window) (slot-value %obj 'mode-info) (slot-value %obj 'name)))
(defclass create-mode-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (mode :initarg :mode :accessor mode :type mode)))
(defun decode-create-mode-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length mode)
    (declare (ignorable %p response-type sequence length mode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf mode (xcb:read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'create-mode-reply :response-type response-type :sequence sequence :length
                    length :mode mode)
     (+ %pos 32 (* 4 length)))))
(defun create-mode-reply (conn cookie) (xcb:read-reply conn cookie #'decode-create-mode-reply))

;;; Request xcb.RandR.DestroyMode
(defun destroy-mode (conn mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-mode-request (xcb:request) ((mode :initarg :mode :type mode)))
(defmethod xcb:send-request (conn (%obj destroy-mode-request))
  (destroy-mode conn (slot-value %obj 'mode)))

;;; Request xcb.RandR.AddOutputMode
(defun add-output-mode (conn output mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass add-output-mode-request (xcb:request)
          ((output :initarg :output :type output) (mode :initarg :mode :type mode)))
(defmethod xcb:send-request (conn (%obj add-output-mode-request))
  (add-output-mode conn (slot-value %obj 'output) (slot-value %obj 'mode)))

;;; Request xcb.RandR.DeleteOutputMode
(defun delete-output-mode (conn output mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-output-mode-request (xcb:request)
          ((output :initarg :output :type output) (mode :initarg :mode :type mode)))
(defmethod xcb:send-request (conn (%obj delete-output-mode-request))
  (delete-output-mode conn (slot-value %obj 'output) (slot-value %obj 'mode)))

;;; Request xcb.RandR.GetCrtcInfo
(defun get-crtc-info (conn crtc config-timestamp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-crtc-info-request (xcb:request-with-reply)
          ((crtc :initarg :crtc :type crtc)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj get-crtc-info-request))
  (get-crtc-info conn (slot-value %obj 'crtc) (slot-value %obj 'config-timestamp)))
(defclass get-crtc-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (mode :initarg :mode :accessor mode :type mode)
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 16))
           (rotations :initarg :rotations :accessor rotations :type (unsigned-byte 16))
           (num-outputs :initarg :num-outputs :accessor num-outputs :type (unsigned-byte 16))
           (num-possible-outputs :initarg :num-possible-outputs :accessor num-possible-outputs
            :type (unsigned-byte 16))
           (outputs :initarg :outputs :accessor outputs :type cl:sequence)
           (possible :initarg :possible :accessor possible :type cl:sequence)))
(defun decode-get-crtc-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        status
        sequence
        length
        timestamp
        x
        y
        width
        height
        mode
        rotation
        rotations
        num-outputs
        num-possible-outputs
        outputs
        possible)
    (declare
     (ignorable %p response-type status sequence length timestamp x y width height mode rotation
      rotations num-outputs num-possible-outputs outputs possible))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 12) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 14) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf mode (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf rotation (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf rotations (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf num-outputs (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf num-possible-outputs (xcb:read-card16-at %buf (+ %p 30) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (outputs %p)
      (xcb:read-vector-at %buf %p (min num-outputs (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (possible %p)
      (xcb:read-vector-at %buf %p
       (min num-possible-outputs (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (cl:values
     (make-instance 'get-crtc-info-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp :x x :y y :width width :height
                    height :mode mode :rotation rotation :rotations rotations :num-outputs
                    num-outputs :num-possible-outputs num-possible-outputs :outputs outputs
                    :possible possible)
     (+ %pos 32 (* 4 length)))))
(defun get-crtc-info-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-crtc-info-reply))

;;; Request xcb.RandR.SetCrtcConfig
(defun set-crtc-config (conn crtc timestamp config-timestamp x y mode rotation outputs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-write-card16 %buf rotation)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf outputs nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-crtc-config-request (xcb:request-with-reply)
          ((crtc :initarg :crtc :type crtc) (timestamp :initarg :timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)
           (x :initarg :x :type (signed-byte 16)) (y :initarg :y :type (signed-byte 16))
           (mode :initarg :mode :type mode) (rotation :initarg :rotation :type (unsigned-byte 16))
           (outputs :initarg :outputs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-crtc-config-request))
  (set-crtc-config conn (slot-value %obj 'crtc) (slot-value %obj 'timestamp)
   (slot-value %obj 'config-timestamp) (slot-value %obj 'x) (slot-value %obj 'y)
   (slot-value %obj 'mode) (slot-value %obj 'rotation) (slot-value %obj 'outputs)))
(defclass set-crtc-config-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)))
(defun decode-set-crtc-config-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length timestamp)
    (declare (ignorable %p response-type status sequence length timestamp))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'set-crtc-config-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp)
     (+ %pos 32 (* 4 length)))))
(defun set-crtc-config-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-crtc-config-reply))

;;; Request xcb.RandR.GetCrtcGammaSize
(defun get-crtc-gamma-size (conn crtc)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-crtc-gamma-size-request (xcb:request-with-reply) ((crtc :initarg :crtc :type crtc)))
(defmethod xcb:send-request (conn (%obj get-crtc-gamma-size-request))
  (get-crtc-gamma-size conn (slot-value %obj 'crtc)))
(defclass get-crtc-gamma-size-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 16))))
(defun decode-get-crtc-gamma-size-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length size)
    (declare (ignorable %p response-type sequence length size))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf size (xcb:read-card16-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'get-crtc-gamma-size-reply :response-type response-type :sequence sequence
                    :length length :size size)
     (+ %pos 32 (* 4 length)))))
(defun get-crtc-gamma-size-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-crtc-gamma-size-reply))

;;; Request xcb.RandR.GetCrtcGamma
(defun get-crtc-gamma (conn crtc)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-crtc-gamma-request (xcb:request-with-reply) ((crtc :initarg :crtc :type crtc)))
(defmethod xcb:send-request (conn (%obj get-crtc-gamma-request))
  (get-crtc-gamma conn (slot-value %obj 'crtc)))
(defclass get-crtc-gamma-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 16))
           (red :initarg :red :accessor red :type cl:sequence)
           (green :initarg :green :accessor green :type cl:sequence)
           (blue :initarg :blue :accessor blue :type cl:sequence)))
(defun decode-get-crtc-gamma-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length size red green blue)
    (declare (ignorable %p response-type sequence length size red green blue))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf size (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (red %p)
      (xcb:read-vector-at %buf %p (min size (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (multiple-value-setq (green %p)
      (xcb:read-vector-at %buf %p (min size (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (multiple-value-setq (blue %p)
      (xcb:read-vector-at %buf %p (min size (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (cl:values
     (make-instance 'get-crtc-gamma-reply :response-type response-type :sequence sequence :length
                    length :size size :red red :green green :blue blue)
     (+ %pos 32 (* 4 length)))))
(defun get-crtc-gamma-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-crtc-gamma-reply))

;;; Request xcb.RandR.SetCrtcGamma
(defun set-crtc-gamma (conn crtc red green blue)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR"))
         (%buf (xcb:conn-send-buffer conn))
         (size (cl:length red)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card16 %buf size)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf red size #'xcb:buffer-write-card16)
    (xcb:buffer-write-list %buf green size #'xcb:buffer-write-card16)
    (xcb:buffer-write-list %buf blue size #'xcb:buffer-write-card16)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-crtc-gamma-request (xcb:request)
          ((crtc :initarg :crtc :type crtc) (size :initarg :size :type (unsigned-byte 16))
           (red :initarg :red :type cl:sequence) (green :initarg :green :type cl:sequence)
           (blue :initarg :blue :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-crtc-gamma-request))
  (set-crtc-gamma conn (slot-value %obj 'crtc) (slot-value %obj 'red) (slot-value %obj 'green)
   (slot-value %obj 'blue)))

;;; Request xcb.RandR.GetScreenResourcesCurrent
(defun get-screen-resources-current (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 25)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-screen-resources-current-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-screen-resources-current-request))
  (get-screen-resources-current conn (slot-value %obj 'window)))
(defclass get-screen-resources-current-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (num-crtcs :initarg :num-crtcs :accessor num-crtcs :type (unsigned-byte 16))
           (num-outputs :initarg :num-outputs :accessor num-outputs :type (unsigned-byte 16))
           (num-modes :initarg :num-modes :accessor num-modes :type (unsigned-byte 16))
           (names-len :initarg :names-len :accessor names-len :type (unsigned-byte 16))
           (crtcs :initarg :crtcs :accessor crtcs :type cl:sequence)
           (outputs :initarg :outputs :accessor outputs :type cl:sequence)
           (modes :initarg :modes :accessor modes :type cl:sequence)
           (names :initarg :names :accessor names :type cl:sequence)))
(defun decode-get-screen-resources-current-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        timestamp
        config-timestamp
        num-crtcs
        num-outputs
        num-modes
        names-len
        crtcs
        outputs
        modes
        names)
    (declare
     (ignorable %p response-type sequence length timestamp config-timestamp num-crtcs num-outputs
      num-modes names-len crtcs outputs modes names))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-crtcs (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf num-outputs (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf num-modes (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf names-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (crtcs %p)
      (xcb:read-vector-at %buf %p (min num-crtcs (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (outputs %p)
      (xcb:read-vector-at %buf %p (min num-outputs (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (modes %p)
      (xcb:read-struct-vector-at %buf %p (min num-modes (floor (- (+ %pos 32 (* 4 length)) %p) 32))
       %order #'decode-mode-info))
    (multiple-value-setq (names %p)
      (xcb:read-vector-at %buf %p (min names-len (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-screen-resources-current-reply :response-type response-type :sequence
                    sequence :length length :timestamp timestamp :config-timestamp config-timestamp
                    :num-crtcs num-crtcs :num-outputs num-outputs :num-modes num-modes :names-len
                    names-len :crtcs crtcs :outputs outputs :modes modes :names names)
     (+ %pos 32 (* 4 length)))))
(defun get-screen-resources-current-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-screen-resources-current-reply))

;;; Enum xcb.RandR.Transform
(xcb:defenum rand-r-transform
  (:unit 1)
  (:scale-up 2)
  (:scale-down 4)
  (:projective 8))

;;; Request xcb.RandR.SetCrtcTransform
(defun set-crtc-transform (conn crtc transform filter-name filter-params)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR"))
         (%buf (xcb:conn-send-buffer conn))
         (filter-len (cl:length filter-name)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 26)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb-render:encode-transform %buf transform)
    (xcb:buffer-write-card16 %buf filter-len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf filter-name filter-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-list %buf filter-params nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-crtc-transform-request (xcb:request)
          ((crtc :initarg :crtc :type crtc)
           (transform :initarg :transform :type xcb-render:transform)
           (filter-len :initarg :filter-len :type (unsigned-byte 16))
           (filter-name :initarg :filter-name :type cl:sequence)
           (filter-params :initarg :filter-params :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-crtc-transform-request))
  (set-crtc-transform conn (slot-value %obj 'crtc) (slot-value %obj 'transform)
   (slot-value %obj 'filter-name) (slot-value %obj 'filter-params)))

;;; Request xcb.RandR.GetCrtcTransform
(defun get-crtc-transform (conn crtc)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 27)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-crtc-transform-request (xcb:request-with-reply) ((crtc :initarg :crtc :type crtc)))
(defmethod xcb:send-request (conn (%obj get-crtc-transform-request))
  (get-crtc-transform conn (slot-value %obj 'crtc)))
(defclass get-crtc-transform-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pending-transform :initarg :pending-transform :accessor pending-transform :type
            xcb-render:transform)
           (has-transforms :initarg :has-transforms :accessor has-transforms :type
            (or boolean (unsigned-byte 8)))
           (current-transform :initarg :current-transform :accessor current-transform :type
            xcb-render:transform)
           (pending-len :initarg :pending-len :accessor pending-len :type (unsigned-byte 16))
           (pending-nparams :initarg :pending-nparams :accessor pending-nparams :type
            (unsigned-byte 16))
           (current-len :initarg :current-len :accessor current-len :type (unsigned-byte 16))
           (current-nparams :initarg :current-nparams :accessor current-nparams :type
            (unsigned-byte 16))
           (pending-filter-name :initarg :pending-filter-name :accessor pending-filter-name :type
            cl:sequence)
           (pending-params :initarg :pending-params :accessor pending-params :type cl:sequence)
           (current-filter-name :initarg :current-filter-name :accessor current-filter-name :type
            cl:sequence)
           (current-params :initarg :current-params :accessor current-params :type cl:sequence)))
(defun decode-get-crtc-transform-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        pending-transform
        has-transforms
        current-transform
        pending-len
        pending-nparams
        current-len
        current-nparams
        pending-filter-name
        pending-params
        current-filter-name
        current-params)
    (declare
     (ignorable %p response-type sequence length pending-transform has-transforms current-transform
      pending-len pending-nparams current-len current-nparams pending-filter-name pending-params
      current-filter-name current-params))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf pending-transform (xcb-render:decode-transform %buf (+ %p 8) %order))
    (setf has-transforms (xcb:read-card8-at %buf (+ %p 44)))
    (setf current-transform (xcb-render:decode-transform %buf (+ %p 48) %order))
    (setf pending-len (xcb:read-card16-at %buf (+ %p 88) %order))
    (setf pending-nparams (xcb:read-card16-at %buf (+ %p 90) %order))
    (setf current-len (xcb:read-card16-at %buf (+ %p 92) %order))
    (setf current-nparams (xcb:read-card16-at %buf (+ %p 94) %order))
    (setf %p (+ %p 96))
    (setf pending-filter-name
            (xcb:read-string-at %buf %p
             (min pending-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length pending-filter-name))
    (setf %p (xcb:align-position %p 4))
    (multiple-value-setq (pending-params %p)
      (xcb:read-vector-at %buf %p (min pending-nparams (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :int32))
    (setf current-filter-name
            (xcb:read-string-at %buf %p
             (min current-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length current-filter-name))
    (setf %p (xcb:align-position %p 4))
    (multiple-value-setq (current-params %p)
      (xcb:read-vector-at %buf %p (min current-nparams (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :int32))
    (cl:values
     (make-instance 'get-crtc-transform-reply :response-type response-type :sequence sequence
                    :length length :pending-transform pending-transform :has-transforms
                    has-transforms :current-transform current-transform :pending-len pending-len
                    :pending-nparams pending-nparams :current-len current-len :current-nparams
                    current-nparams :pending-filter-name pending-filter-name :pending-params
                    pending-params :current-filter-name current-filter-name :current-params
                    current-params)
     (+ %pos 32 (* 4 length)))))
(defun get-crtc-transform-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-crtc-transform-reply))

;;; Request xcb.RandR.GetPanning
(defun get-panning (conn crtc)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 28)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-panning-request (xcb:request-with-reply) ((crtc :initarg :crtc :type crtc)))
(defmethod xcb:send-request (conn (%obj get-panning-request))
  (get-panning conn (slot-value %obj 'crtc)))
(defclass get-panning-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (left :initarg :left :accessor left :type (unsigned-byte 16))
           (top :initarg :top :accessor top :type (unsigned-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (track-left :initarg :track-left :accessor track-left :type (unsigned-byte 16))
           (track-top :initarg :track-top :accessor track-top :type (unsigned-byte 16))
           (track-width :initarg :track-width :accessor track-width :type (unsigned-byte 16))
           (track-height :initarg :track-height :accessor track-height :type (unsigned-byte 16))
           (border-left :initarg :border-left :accessor border-left :type (signed-byte 16))
           (border-top :initarg :border-top :accessor border-top :type (signed-byte 16))
           (border-right :initarg :border-right :accessor border-right :type (signed-byte 16))
           (border-bottom :initarg :border-bottom :accessor border-bottom :type (signed-byte 16))))
(defun decode-get-panning-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        status
        sequence
        length
        timestamp
        left
        top
        width
        height
        track-left
        track-top
        track-width
        track-height
        border-left
        border-top
        border-right
        border-bottom)
    (declare
     (ignorable %p response-type status sequence length timestamp left top width height track-left
      track-top track-width track-height border-left border-top border-right border-bottom))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf left (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf top (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf track-left (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf track-top (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf track-width (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf track-height (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf border-left (xcb:read-int16-at %buf (+ %p 28) %order))
    (setf border-top (xcb:read-int16-at %buf (+ %p 30) %order))
    (setf border-right (xcb:read-int16-at %buf (+ %p 32) %order))
    (setf border-bottom (xcb:read-int16-at %buf (+ %p 34) %order))
    (cl:values
     (make-instance 'get-panning-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp :left left :top top :width width
                    :height height :track-left track-left :track-top track-top :track-width
                    track-width :track-height track-height :border-left border-left :border-top
                    border-top :border-right border-right :border-bottom border-bottom)
     (+ %pos 32 (* 4 length)))))
(defun get-panning-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-panning-reply))

;;; Request xcb.RandR.SetPanning
(defun set-panning
       (conn crtc timestamp left top width height track-left track-top track-width track-height
        border-left border-top border-right border-bottom)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 29)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card16 %buf left)
    (xcb:buffer-write-card16 %buf top)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf track-left)
    (xcb:buffer-write-card16 %buf track-top)
    (xcb:buffer-write-card16 %buf track-width)
    (xcb:buffer-write-card16 %buf track-height)
    (xcb:buffer-write-card16 %buf border-left)
    (xcb:buffer-write-card16 %buf border-top)
    (xcb:buffer-write-card16 %buf border-right)
    (xcb:buffer-write-card16 %buf border-bottom)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-panning-request (xcb:request-with-reply)
          ((crtc :initarg :crtc :type crtc) (timestamp :initarg :timestamp :type xcb:timestamp)
           (left :initarg :left :type (unsigned-byte 16))
           (top :initarg :top :type (unsigned-byte 16))
           (width :initarg :width :type (unsigned-byte 16))
           (height :initarg :height :type (unsigned-byte 16))
           (track-left :initarg :track-left :type (unsigned-byte 16))
           (track-top :initarg :track-top :type (unsigned-byte 16))
           (track-width :initarg :track-width :type (unsigned-byte 16))
           (track-height :initarg :track-height :type (unsigned-byte 16))
           (border-left :initarg :border-left :type (signed-byte 16))
           (border-top :initarg :border-top :type (signed-byte 16))
           (border-right :initarg :border-right :type (signed-byte 16))
           (border-bottom :initarg :border-bottom :type (signed-byte 16))))
(defmethod xcb:send-request (conn (%obj set-panning-request))
  (set-panning conn (slot-value %obj 'crtc) (slot-value %obj 'timestamp) (slot-value %obj 'left)
   (slot-value %obj 'top) (slot-value %obj 'width) (slot-value %obj 'height)
   (slot-value %obj 'track-left) (slot-value %obj 'track-top) (slot-value %obj 'track-width)
   (slot-value %obj 'track-height) (slot-value %obj 'border-left) (slot-value %obj 'border-top)
   (slot-value %obj 'border-right) (slot-value %obj 'border-bottom)))
(defclass set-panning-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)))
(defun decode-set-panning-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length timestamp)
    (declare (ignorable %p response-type status sequence length timestamp))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'set-panning-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp)
     (+ %pos 32 (* 4 length)))))
(defun set-panning-reply (conn cookie) (xcb:read-reply conn cookie #'decode-set-panning-reply))

;;; Request xcb.RandR.SetOutputPrimary
(defun set-output-primary (conn window output)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 30)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-output-primary-request (xcb:request)
          ((window :initarg :window :type xcb:window) (output :initarg :output :type output)))
(defmethod xcb:send-request (conn (%obj set-output-primary-request))
  (set-output-primary conn (slot-value %obj 'window) (slot-value %obj 'output)))

;;; Request xcb.RandR.GetOutputPrimary
(defun get-output-primary (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 31)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-output-primary-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-output-primary-request))
  (get-output-primary conn (slot-value %obj 'window)))
(defclass get-output-primary-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (output :initarg :output :accessor output :type output)))
(defun decode-get-output-primary-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length output)
    (declare (ignorable %p response-type sequence length output))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf output (xcb:read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'get-output-primary-reply :response-type response-type :sequence sequence
                    :length length :output output)
     (+ %pos 32 (* 4 length)))))
(defun get-output-primary-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-output-primary-reply))

;;; Request xcb.RandR.GetProviders
(defun get-providers (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 32)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-providers-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-providers-request))
  (get-providers conn (slot-value %obj 'window)))
(defclass get-providers-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (num-providers :initarg :num-providers :accessor num-providers :type (unsigned-byte 16))
           (providers :initarg :providers :accessor providers :type cl:sequence)))
(defun decode-get-providers-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length timestamp num-providers providers)
    (declare (ignorable %p response-type sequence length timestamp num-providers providers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-providers (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (providers %p)
      (xcb:read-vector-at %buf %p (min num-providers (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (cl:values
     (make-instance 'get-providers-reply :response-type response-type :sequence sequence :length
                    length :timestamp timestamp :num-providers num-providers :providers providers)
     (+ %pos 32 (* 4 length)))))
(defun get-providers-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-providers-reply))

;;; Enum xcb.RandR.ProviderCapability
(xcb:defenum rand-r-provider-capability
  (:source-output 1)
  (:sink-output 2)
  (:source-offload 4)
  (:sink-offload 8))

;;; Request xcb.RandR.GetProviderInfo
(defun get-provider-info (conn provider config-timestamp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 33)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-provider-info-request (xcb:request-with-reply)
          ((provider :initarg :provider :type provider)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj get-provider-info-request))
  (get-provider-info conn (slot-value %obj 'provider) (slot-value %obj 'config-timestamp)))
(defclass get-provider-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (capabilities :initarg :capabilities :accessor capabilities :type (unsigned-byte 32))
           (num-crtcs :initarg :num-crtcs :accessor num-crtcs :type (unsigned-byte 16))
           (num-outputs :initarg :num-outputs :accessor num-outputs :type (unsigned-byte 16))
           (num-associated-providers :initarg :num-associated-providers :accessor
            num-associated-providers :type (unsigned-byte 16))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (crtcs :initarg :crtcs :accessor crtcs :type cl:sequence)
           (outputs :initarg :outputs :accessor outputs :type cl:sequence)
           (associated-providers :initarg :associated-providers :accessor associated-providers
            :type cl:sequence)
           (associated-capability :initarg :associated-capability :accessor associated-capability
            :type cl:sequence)
           (name :initarg :name :accessor name :type cl:sequence)))
(defun decode-get-provider-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        status
        sequence
        length
        timestamp
        capabilities
        num-crtcs
        num-outputs
        num-associated-providers
        name-len
        crtcs
        outputs
        associated-providers
        associated-capability
        name)
    (declare
     (ignorable %p response-type status sequence length timestamp capabilities num-crtcs
      num-outputs num-associated-providers name-len crtcs outputs associated-providers
      associated-capability name))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf capabilities (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-crtcs (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf num-outputs (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf num-associated-providers (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (crtcs %p)
      (xcb:read-vector-at %buf %p (min num-crtcs (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (outputs %p)
      (xcb:read-vector-at %buf %p (min num-outputs (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (associated-providers %p)
      (xcb:read-vector-at %buf %p
       (min num-associated-providers (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (multiple-value-setq (associated-capability %p)
      (xcb:read-vector-at %buf %p
       (min num-associated-providers (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (setf name
            (xcb:read-string-at %buf %p (min name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (cl:values
     (make-instance 'get-provider-info-reply :response-type response-type :status status :sequence
                    sequence :length length :timestamp timestamp :capabilities capabilities
                    :num-crtcs num-crtcs :num-outputs num-outputs :num-associated-providers
                    num-associated-providers :name-len name-len :crtcs crtcs :outputs outputs
                    :associated-providers associated-providers :associated-capability
                    associated-capability :name name)
     (+ %pos 32 (* 4 length)))))
(defun get-provider-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-provider-info-reply))

;;; Request xcb.RandR.SetProviderOffloadSink
(defun set-provider-offload-sink (conn provider sink-provider config-timestamp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 34)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf sink-provider)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-provider-offload-sink-request (xcb:request)
          ((provider :initarg :provider :type provider)
           (sink-provider :initarg :sink-provider :type provider)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj set-provider-offload-sink-request))
  (set-provider-offload-sink conn (slot-value %obj 'provider) (slot-value %obj 'sink-provider)
   (slot-value %obj 'config-timestamp)))

;;; Request xcb.RandR.SetProviderOutputSource
(defun set-provider-output-source (conn provider source-provider config-timestamp)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 35)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf source-provider)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-provider-output-source-request (xcb:request)
          ((provider :initarg :provider :type provider)
           (source-provider :initarg :source-provider :type provider)
           (config-timestamp :initarg :config-timestamp :type xcb:timestamp)))
(defmethod xcb:send-request (conn (%obj set-provider-output-source-request))
  (set-provider-output-source conn (slot-value %obj 'provider) (slot-value %obj 'source-provider)
   (slot-value %obj 'config-timestamp)))

;;; Request xcb.RandR.ListProviderProperties
(defun list-provider-properties (conn provider)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 36)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-provider-properties-request (xcb:request-with-reply)
          ((provider :initarg :provider :type provider)))
(defmethod xcb:send-request (conn (%obj list-provider-properties-request))
  (list-provider-properties conn (slot-value %obj 'provider)))
(defclass list-provider-properties-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-atoms :initarg :num-atoms :accessor num-atoms :type (unsigned-byte 16))
           (atoms :initarg :atoms :accessor atoms :type cl:sequence)))
(defun decode-list-provider-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-atoms atoms)
    (declare (ignorable %p response-type sequence length num-atoms atoms))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-atoms (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (atoms %p)
      (xcb:read-vector-at %buf %p (min num-atoms (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (cl:values
     (make-instance 'list-provider-properties-reply :response-type response-type :sequence sequence
                    :length length :num-atoms num-atoms :atoms atoms)
     (+ %pos 32 (* 4 length)))))
(defun list-provider-properties-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-provider-properties-reply))

;;; Request xcb.RandR.QueryProviderProperty
(defun query-provider-property (conn provider property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 37)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-provider-property-request (xcb:request-with-reply)
          ((provider :initarg :provider :type provider)
           (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj query-provider-property-request))
  (query-provider-property conn (slot-value %obj 'provider) (slot-value %obj 'property)))
(defclass query-provider-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (pending :initarg :pending :accessor pending :type (or boolean (unsigned-byte 8)))
           (range :initarg :range :accessor range :type (or boolean (unsigned-byte 8)))
           (immutable :initarg :immutable :accessor immutable :type (or boolean (unsigned-byte 8)))
           (valid-values :initarg :valid-values :accessor valid-values :type cl:sequence)))
(defun decode-query-provider-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length pending range immutable valid-values)
    (declare (ignorable %p response-type sequence length pending range immutable valid-values))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf pending (xcb:read-card8-at %buf (+ %p 8)))
    (setf range (xcb:read-card8-at %buf (+ %p 9)))
    (setf immutable (xcb:read-card8-at %buf (+ %p 10)))
    (setf %p (+ %p 32))
    (multiple-value-setq (valid-values %p)
      (xcb:read-vector-at %buf %p (min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :int32))
    (cl:values
     (make-instance 'query-provider-property-reply :response-type response-type :sequence sequence
                    :length length :pending pending :range range :immutable immutable :valid-values
                    valid-values)
     (+ %pos 32 (* 4 length)))))
(defun query-provider-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-provider-property-reply))

;;; Request xcb.RandR.ConfigureProviderProperty
(defun configure-provider-property (conn provider property pending range values)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 38)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-bool %buf pending)
    (xcb:buffer-write-bool %buf range)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf values nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass configure-provider-property-request (xcb:request)
          ((provider :initarg :provider :type provider)
           (property :initarg :property :type xcb:atom)
           (pending :initarg :pending :type (or boolean (unsigned-byte 8)))
           (range :initarg :range :type (or boolean (unsigned-byte 8)))
           (values :initarg :values :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj configure-provider-property-request))
  (configure-provider-property conn (slot-value %obj 'provider) (slot-value %obj 'property)
   (slot-value %obj 'pending) (slot-value %obj 'range) (slot-value %obj 'values)))

;;; Request xcb.RandR.ChangeProviderProperty
(defun change-provider-property (conn provider property type format mode num-items data)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 39)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card8 %buf format)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf num-items)
    (xcb:buffer-write-octets %buf data :end (* num-items (truncate format 8)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-provider-property-request (xcb:request)
          ((provider :initarg :provider :type provider)
           (property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (format :initarg :format :type (unsigned-byte 8))
           (mode :initarg :mode :type (unsigned-byte 8))
           (num-items :initarg :num-items :type (unsigned-byte 32))
           (data :initarg :data :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-provider-property-request))
  (change-provider-property conn (slot-value %obj 'provider) (slot-value %obj 'property)
   (slot-value %obj 'type) (slot-value %obj 'format) (slot-value %obj 'mode)
   (slot-value %obj 'num-items) (slot-value %obj 'data)))

;;; Request xcb.RandR.DeleteProviderProperty
(defun delete-provider-property (conn provider property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 40)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-provider-property-request (xcb:request)
          ((provider :initarg :provider :type provider)
           (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj delete-provider-property-request))
  (delete-provider-property conn (slot-value %obj 'provider) (slot-value %obj 'property)))

;;; Request xcb.RandR.GetProviderProperty
(defun get-provider-property (conn provider property type long-offset long-length delete pending)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 41)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card32 %buf long-offset)
    (xcb:buffer-write-card32 %buf long-length)
    (xcb:buffer-write-bool %buf delete)
    (xcb:buffer-write-bool %buf pending)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-provider-property-request (xcb:request-with-reply)
          ((provider :initarg :provider :type provider)
           (property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (long-offset :initarg :long-offset :type (unsigned-byte 32))
           (long-length :initarg :long-length :type (unsigned-byte 32))
           (delete :initarg :delete :type (or boolean (unsigned-byte 8)))
           (pending :initarg :pending :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj get-provider-property-request))
  (get-provider-property conn (slot-value %obj 'provider) (slot-value %obj 'property)
   (slot-value %obj 'type) (slot-value %obj 'long-offset) (slot-value %obj 'long-length)
   (slot-value %obj 'delete) (slot-value %obj 'pending)))
(defclass get-provider-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type xcb:atom)
           (bytes-after :initarg :bytes-after :accessor bytes-after :type (unsigned-byte 32))
           (num-items :initarg :num-items :accessor num-items :type (unsigned-byte 32))
           (data :initarg :data :accessor data :type cl:sequence)))
(defun decode-get-provider-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type format sequence length type bytes-after num-items data)
    (declare (ignorable %p response-type format sequence length type bytes-after num-items data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf format (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf type (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf bytes-after (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-items (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (data %p)
      (xcb:read-vector-at %buf %p
       (min (* num-items (truncate format 8)) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (cl:values
     (make-instance 'get-provider-property-reply :response-type response-type :format format
                    :sequence sequence :length length :type type :bytes-after bytes-after
                    :num-items num-items :data data)
     (+ %pos 32 (* 4 length)))))
(defun get-provider-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-provider-property-reply))

;;; Event xcb.RandR.ScreenChangeNotify (0)
(defclass screen-change-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (request-window :initarg :request-window :accessor request-window :type xcb:window)
           (size-id :initarg :size-id :accessor size-id :type (unsigned-byte 16))
           (subpixel-order :initarg :subpixel-order :accessor subpixel-order :type
            (unsigned-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (mwidth :initarg :mwidth :accessor mwidth :type (unsigned-byte 16))
           (mheight :initarg :mheight :accessor mheight :type (unsigned-byte 16))))
(defun decode-screen-change-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        rotation
        sequence
        timestamp
        config-timestamp
        root
        request-window
        size-id
        subpixel-order
        width
        height
        mwidth
        mheight)
    (declare
     (ignorable %p response-type rotation sequence timestamp config-timestamp root request-window
      size-id subpixel-order width height mwidth mheight))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf rotation (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf request-window (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf size-id (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf subpixel-order (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf mwidth (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf mheight (xcb:read-card16-at %buf (+ %p 30) %order))
    (cl:values
     (make-instance 'screen-change-notify :response-type response-type :rotation rotation :sequence
                    sequence :timestamp timestamp :config-timestamp config-timestamp :root root
                    :request-window request-window :size-id size-id :subpixel-order subpixel-order
                    :width width :height height :mwidth mwidth :mheight mheight)
     (+ %pos 32))))
(defun encode-screen-change-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (rotation (slot-value %obj 'rotation))
         (sequence (slot-value %obj 'sequence))
         (timestamp (slot-value %obj 'timestamp))
         (config-timestamp (slot-value %obj 'config-timestamp))
         (root (slot-value %obj 'root))
         (request-window (slot-value %obj 'request-window))
         (size-id (slot-value %obj 'size-id))
         (subpixel-order (slot-value %obj 'subpixel-order))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (mwidth (slot-value %obj 'mwidth))
         (mheight (slot-value %obj 'mheight)))
    (declare
     (ignorable response-type rotation sequence timestamp config-timestamp root request-window
      size-id subpixel-order width height mwidth mheight))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf rotation)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-write-card32 %buf root)
    (xcb:buffer-write-card32 %buf request-window)
    (xcb:buffer-write-card16 %buf size-id)
    (xcb:buffer-write-card16 %buf subpixel-order)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card16 %buf mwidth)
    (xcb:buffer-write-card16 %buf mheight)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj screen-change-notify))
  (encode-screen-change-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-RANDR" 0 #'decode-screen-change-notify)

;;; Enum xcb.RandR.Notify
(xcb:defenum rand-r-notify
  (:crtc-change 0)
  (:output-change 1)
  (:output-property 2)
  (:provider-change 3)
  (:provider-property 4)
  (:resource-change 5)
  (:lease 6))

;;; xcb.RandR.CrtcChange
(defclass crtc-change nil
          ((timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (crtc :initarg :crtc :accessor crtc :type crtc)
           (mode :initarg :mode :accessor mode :type mode)
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 16))
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))))
(defun encode-crtc-change (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((timestamp (slot-value %obj 'timestamp))
         (window (slot-value %obj 'window))
         (crtc (slot-value %obj 'crtc))
         (mode (slot-value %obj 'mode))
         (rotation (slot-value %obj 'rotation))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height)))
    (declare (ignorable timestamp window crtc mode rotation x y width height))
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-write-card16 %buf rotation)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)))
(defun decode-crtc-change (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) timestamp window crtc mode rotation x y width height)
    (declare (ignorable %p timestamp window crtc mode rotation x y width height))
    (setf timestamp (xcb:read-card32-at %buf %p %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf crtc (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf mode (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf rotation (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 20) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 22) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 26) %order))
    (cl:values
     (make-instance 'crtc-change :timestamp timestamp :window window :crtc crtc :mode mode
                    :rotation rotation :x x :y y :width width :height height)
     (+ %p 28))))

;;; xcb.RandR.OutputChange
(defclass output-change nil
          ((timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (config-timestamp :initarg :config-timestamp :accessor config-timestamp :type
            xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (output :initarg :output :accessor output :type output)
           (crtc :initarg :crtc :accessor crtc :type crtc)
           (mode :initarg :mode :accessor mode :type mode)
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 16))
           (connection :initarg :connection :accessor connection :type (unsigned-byte 8))
           (subpixel-order :initarg :subpixel-order :accessor subpixel-order :type
            (unsigned-byte 8))))
(defun encode-output-change (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((timestamp (slot-value %obj 'timestamp))
         (config-timestamp (slot-value %obj 'config-timestamp))
         (window (slot-value %obj 'window))
         (output (slot-value %obj 'output))
         (crtc (slot-value %obj 'crtc))
         (mode (slot-value %obj 'mode))
         (rotation (slot-value %obj 'rotation))
         (connection (slot-value %obj 'connection))
         (subpixel-order (slot-value %obj 'subpixel-order)))
    (declare
     (ignorable timestamp config-timestamp window output crtc mode rotation connection
      subpixel-order))
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf config-timestamp)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf crtc)
    (xcb:buffer-write-card32 %buf mode)
    (xcb:buffer-write-card16 %buf rotation)
    (xcb:buffer-write-card8 %buf connection)
    (xcb:buffer-write-card8 %buf subpixel-order)))
(defun decode-output-change (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        timestamp
        config-timestamp
        window
        output
        crtc
        mode
        rotation
        connection
        subpixel-order)
    (declare
     (ignorable %p timestamp config-timestamp window output crtc mode rotation connection
      subpixel-order))
    (setf timestamp (xcb:read-card32-at %buf %p %order))
    (setf config-timestamp (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf output (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf crtc (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf mode (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf rotation (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf connection (xcb:read-card8-at %buf (+ %p 26)))
    (setf subpixel-order (xcb:read-card8-at %buf (+ %p 27)))
    (cl:values
     (make-instance 'output-change :timestamp timestamp :config-timestamp config-timestamp :window
                    window :output output :crtc crtc :mode mode :rotation rotation :connection
                    connection :subpixel-order subpixel-order)
     (+ %p 28))))

;;; xcb.RandR.OutputProperty
(defclass output-property nil
          ((window :initarg :window :accessor window :type xcb:window)
           (output :initarg :output :accessor output :type output)
           (atom :initarg :atom :accessor atom :type xcb:atom)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun encode-output-property (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((window (slot-value %obj 'window))
         (output (slot-value %obj 'output))
         (atom (slot-value %obj 'atom))
         (timestamp (slot-value %obj 'timestamp))
         (status (slot-value %obj 'status)))
    (declare (ignorable window output atom timestamp status))
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf output)
    (xcb:buffer-write-card32 %buf atom)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card8 %buf status)
    (xcb:buffer-write-padding %buf 11)))
(defun decode-output-property (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) window output atom timestamp status)
    (declare (ignorable %p window output atom timestamp status))
    (setf window (xcb:read-card32-at %buf %p %order))
    (setf output (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf atom (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 16)))
    (cl:values
     (make-instance 'output-property :window window :output output :atom atom :timestamp timestamp
                    :status status)
     (+ %p 28))))

;;; xcb.RandR.ProviderChange
(defclass provider-change nil
          ((timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (provider :initarg :provider :accessor provider :type provider)))
(defun encode-provider-change (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((timestamp (slot-value %obj 'timestamp))
         (window (slot-value %obj 'window))
         (provider (slot-value %obj 'provider)))
    (declare (ignorable timestamp window provider))
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-padding %buf 16)))
(defun decode-provider-change (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) timestamp window provider)
    (declare (ignorable %p timestamp window provider))
    (setf timestamp (xcb:read-card32-at %buf %p %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf provider (xcb:read-card32-at %buf (+ %p 8) %order))
    (cl:values
     (make-instance 'provider-change :timestamp timestamp :window window :provider provider)
     (+ %p 28))))

;;; xcb.RandR.ProviderProperty
(defclass provider-property nil
          ((window :initarg :window :accessor window :type xcb:window)
           (provider :initarg :provider :accessor provider :type provider)
           (atom :initarg :atom :accessor atom :type xcb:atom)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (state :initarg :state :accessor state :type (unsigned-byte 8))))
(defun encode-provider-property (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((window (slot-value %obj 'window))
         (provider (slot-value %obj 'provider))
         (atom (slot-value %obj 'atom))
         (timestamp (slot-value %obj 'timestamp))
         (state (slot-value %obj 'state)))
    (declare (ignorable window provider atom timestamp state))
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf provider)
    (xcb:buffer-write-card32 %buf atom)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card8 %buf state)
    (xcb:buffer-write-padding %buf 11)))
(defun decode-provider-property (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) window provider atom timestamp state)
    (declare (ignorable %p window provider atom timestamp state))
    (setf window (xcb:read-card32-at %buf %p %order))
    (setf provider (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf atom (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf state (xcb:read-card8-at %buf (+ %p 16)))
    (cl:values
     (make-instance 'provider-property :window window :provider provider :atom atom :timestamp
                    timestamp :state state)
     (+ %p 28))))

;;; xcb.RandR.ResourceChange
(defclass resource-change nil
          ((timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)))
(defun encode-resource-change (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((timestamp (slot-value %obj 'timestamp)) (window (slot-value %obj 'window)))
    (declare (ignorable timestamp window))
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-padding %buf 20)))
(defun decode-resource-change (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) timestamp window)
    (declare (ignorable %p timestamp window))
    (setf timestamp (xcb:read-card32-at %buf %p %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (cl:values (make-instance 'resource-change :timestamp timestamp :window window) (+ %p 28))))

;;; xcb.RandR.MonitorInfo
(defclass monitor-info nil
          ((name :initarg :name :accessor name :type xcb:atom)
           (primary :initarg :primary :accessor primary :type (or boolean (unsigned-byte 8)))
           (automatic :initarg :automatic :accessor automatic :type (or boolean (unsigned-byte 8)))
           (n-output :initarg :n-output :accessor n-output :type (unsigned-byte 16))
           (x :initarg :x :accessor x :type (signed-byte 16))
           (y :initarg :y :accessor y :type (signed-byte 16))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (width-in-millimeters :initarg :width-in-millimeters :accessor width-in-millimeters
            :type (unsigned-byte 32))
           (height-in-millimeters :initarg :height-in-millimeters :accessor height-in-millimeters
            :type (unsigned-byte 32))
           (outputs :initarg :outputs :accessor outputs :type cl:sequence)))
(defun encode-monitor-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name))
         (primary (slot-value %obj 'primary))
         (automatic (slot-value %obj 'automatic))
         (x (slot-value %obj 'x))
         (y (slot-value %obj 'y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (width-in-millimeters (slot-value %obj 'width-in-millimeters))
         (height-in-millimeters (slot-value %obj 'height-in-millimeters))
         (outputs (slot-value %obj 'outputs))
         (n-output (cl:length outputs)))
    (declare
     (ignorable name primary automatic x y width height width-in-millimeters height-in-millimeters
      outputs n-output))
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-bool %buf primary)
    (xcb:buffer-write-bool %buf automatic)
    (xcb:buffer-write-card16 %buf n-output)
    (xcb:buffer-write-card16 %buf x)
    (xcb:buffer-write-card16 %buf y)
    (xcb:buffer-write-card16 %buf width)
    (xcb:buffer-write-card16 %buf height)
    (xcb:buffer-write-card32 %buf width-in-millimeters)
    (xcb:buffer-write-card32 %buf height-in-millimeters)
    (xcb:buffer-write-list %buf outputs n-output #'xcb:buffer-write-card32)))
(defun decode-monitor-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        name
        primary
        automatic
        n-output
        x
        y
        width
        height
        width-in-millimeters
        height-in-millimeters
        outputs)
    (declare
     (ignorable %p name primary automatic n-output x y width height width-in-millimeters
      height-in-millimeters outputs))
    (setf name (xcb:read-card32-at %buf %p %order))
    (setf primary (xcb:read-card8-at %buf (+ %p 4)))
    (setf automatic (xcb:read-card8-at %buf (+ %p 5)))
    (setf n-output (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf x (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf y (xcb:read-int16-at %buf (+ %p 10) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf width-in-millimeters (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf height-in-millimeters (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf %p (+ %p 24))
    (multiple-value-setq (outputs %p) (xcb:read-vector-at %buf %p n-output %order :card32))
    (cl:values
     (make-instance 'monitor-info :name name :primary primary :automatic automatic :n-output
                    n-output :x x :y y :width width :height height :width-in-millimeters
                    width-in-millimeters :height-in-millimeters height-in-millimeters :outputs
                    outputs)
     %p)))

;;; Request xcb.RandR.GetMonitors
(defun get-monitors (conn window get-active)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 42)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-bool %buf get-active)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-monitors-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (get-active :initarg :get-active :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj get-monitors-request))
  (get-monitors conn (slot-value %obj 'window) (slot-value %obj 'get-active)))
(defclass get-monitors-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (n-monitors :initarg :n-monitors :accessor n-monitors :type (unsigned-byte 32))
           (n-outputs :initarg :n-outputs :accessor n-outputs :type (unsigned-byte 32))
           (monitors :initarg :monitors :accessor monitors :type cl:sequence)))
(defun decode-get-monitors-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length timestamp n-monitors n-outputs monitors)
    (declare (ignorable %p response-type sequence length timestamp n-monitors n-outputs monitors))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf n-monitors (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf n-outputs (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (monitors %p)
      (xcb:read-struct-vector-at %buf %p (min n-monitors (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-monitor-info))
    (cl:values
     (make-instance 'get-monitors-reply :response-type response-type :sequence sequence :length
                    length :timestamp timestamp :n-monitors n-monitors :n-outputs n-outputs
                    :monitors monitors)
     (+ %pos 32 (* 4 length)))))
(defun get-monitors-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-monitors-reply))

;;; Request xcb.RandR.SetMonitor
(defun set-monitor (conn window monitorinfo)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 43)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (encode-monitor-info %buf monitorinfo)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-monitor-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (monitorinfo :initarg :monitorinfo :type monitor-info)))
(defmethod xcb:send-request (conn (%obj set-monitor-request))
  (set-monitor conn (slot-value %obj 'window) (slot-value %obj 'monitorinfo)))

;;; Request xcb.RandR.DeleteMonitor
(defun delete-monitor (conn window name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 44)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-monitor-request (xcb:request)
          ((window :initarg :window :type xcb:window) (name :initarg :name :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj delete-monitor-request))
  (delete-monitor conn (slot-value %obj 'window) (slot-value %obj 'name)))

;;; Request xcb.RandR.CreateLease
(defun create-lease (conn window lid crtcs outputs)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR"))
         (%buf (xcb:conn-send-buffer conn))
         (num-crtcs (cl:length crtcs))
         (num-outputs (cl:length outputs)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 45)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf lid)
    (xcb:buffer-write-card16 %buf num-crtcs)
    (xcb:buffer-write-card16 %buf num-outputs)
    (xcb:buffer-write-list %buf crtcs num-crtcs #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf outputs num-outputs #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t :reply-fds t)))
(defclass create-lease-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window) (lid :initarg :lid :type lease)
           (num-crtcs :initarg :num-crtcs :type (unsigned-byte 16))
           (num-outputs :initarg :num-outputs :type (unsigned-byte 16))
           (crtcs :initarg :crtcs :type cl:sequence) (outputs :initarg :outputs :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-lease-request))
  (create-lease conn (slot-value %obj 'window) (slot-value %obj 'lid) (slot-value %obj 'crtcs)
   (slot-value %obj 'outputs)))
(defclass create-lease-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (nfd :initarg :nfd :accessor nfd :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (master-fd :initarg :master-fd :accessor master-fd :type integer)))
(defun decode-create-lease-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type nfd sequence length master-fd)
    (declare (ignorable %p response-type nfd sequence length master-fd))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf nfd (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf master-fd (xcb:take-pending-fd))
    (cl:values
     (make-instance 'create-lease-reply :response-type response-type :nfd nfd :sequence sequence
                    :length length :master-fd master-fd)
     (+ %pos 32 (* 4 length)))))
(defun create-lease-reply (conn cookie) (xcb:read-reply conn cookie #'decode-create-lease-reply))

;;; Request xcb.RandR.FreeLease
(defun free-lease (conn lid terminate)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-RANDR")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 46)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf lid)
    (xcb:buffer-write-card8 %buf terminate)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass free-lease-request (xcb:request)
          ((lid :initarg :lid :type lease) (terminate :initarg :terminate :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj free-lease-request))
  (free-lease conn (slot-value %obj 'lid) (slot-value %obj 'terminate)))

;;; xcb.RandR.LeaseNotify
(defclass lease-notify nil
          ((timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (lease :initarg :lease :accessor lease :type lease)
           (created :initarg :created :accessor created :type (unsigned-byte 8))))
(defun encode-lease-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((timestamp (slot-value %obj 'timestamp))
         (window (slot-value %obj 'window))
         (lease (slot-value %obj 'lease))
         (created (slot-value %obj 'created)))
    (declare (ignorable timestamp window lease created))
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf lease)
    (xcb:buffer-write-card8 %buf created)
    (xcb:buffer-write-padding %buf 15)))
(defun decode-lease-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) timestamp window lease created)
    (declare (ignorable %p timestamp window lease created))
    (setf timestamp (xcb:read-card32-at %buf %p %order))
    (setf window (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf lease (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf created (xcb:read-card8-at %buf (+ %p 12)))
    (cl:values
     (make-instance 'lease-notify :timestamp timestamp :window window :lease lease :created
                    created)
     (+ %p 28))))

;;; xcb.RandR.NotifyData
(defclass notify-data nil
          ((cc :initarg :cc :accessor cc :type crtc-change)
           (oc :initarg :oc :accessor oc :type output-change)
           (op :initarg :op :accessor op :type output-property)
           (pc :initarg :pc :accessor pc :type provider-change)
           (pp :initarg :pp :accessor pp :type provider-property)
           (rc :initarg :rc :accessor rc :type resource-change)
           (lc :initarg :lc :accessor lc :type lease-notify))
          (:documentation "A union: its members are views of the same bytes.
Decoding sets every member, each read from those bytes; encoding writes
the first member that is bound, in the order of the slots.  Re-encoding
a decoded instance therefore writes its first member, which in X's
unions spans the whole union, so the bytes come out the same.  To
encode a particular member, make an instance with only that one bound."))
(defun encode-notify-data (%buf %obj)
  (let ((%start (xcb:buffer-position %buf)))
    (cond ((slot-boundp %obj 'cc) (encode-crtc-change %buf (slot-value %obj 'cc)))
          ((slot-boundp %obj 'oc) (encode-output-change %buf (slot-value %obj 'oc)))
          ((slot-boundp %obj 'op) (encode-output-property %buf (slot-value %obj 'op)))
          ((slot-boundp %obj 'pc) (encode-provider-change %buf (slot-value %obj 'pc)))
          ((slot-boundp %obj 'pp) (encode-provider-property %buf (slot-value %obj 'pp)))
          ((slot-boundp %obj 'rc) (encode-resource-change %buf (slot-value %obj 'rc)))
          ((slot-boundp %obj 'lc) (encode-lease-notify %buf (slot-value %obj 'lc)))
          (t (error "No member of union ~A is set" %obj)))
    (xcb:buffer-write-padding %buf (- 28 (- (xcb:buffer-position %buf) %start)))))
(defun decode-notify-data (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) cc oc op pc pp rc lc)
    (declare (ignorable %p cc oc op pc pp rc lc))
    (setf cc (decode-crtc-change %buf %p %order))
    (setf oc (decode-output-change %buf %p %order))
    (setf op (decode-output-property %buf %p %order))
    (setf pc (decode-provider-change %buf %p %order))
    (setf pp (decode-provider-property %buf %p %order))
    (setf rc (decode-resource-change %buf %p %order))
    (setf lc (decode-lease-notify %buf %p %order))
    (cl:values (make-instance 'notify-data :cc cc :oc oc :op op :pc pc :pp pp :rc rc :lc lc)
               (+ %pos 28))))

;;; Event xcb.RandR.Notify (1)
(defclass notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sub-code :initarg :sub-code :accessor sub-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (u :initarg :u :accessor u :type notify-data)))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sub-code sequence u)
    (declare (ignorable %p response-type sub-code sequence u))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sub-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf u (decode-notify-data %buf (+ %p 4) %order))
    (cl:values
     (make-instance 'notify :response-type response-type :sub-code sub-code :sequence sequence :u
                    u)
     (+ %pos 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sub-code (slot-value %obj 'sub-code))
         (sequence (slot-value %obj 'sequence))
         (u (slot-value %obj 'u)))
    (declare (ignorable response-type sub-code sequence u))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf sub-code)
    (xcb:buffer-write-card16 %buf sequence)
    (encode-notify-data %buf u)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj notify)) (encode-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-RANDR" 1 #'decode-notify)
