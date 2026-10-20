;;; Generated from xinput.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-INPUT
  (:use #:cl)
  (:shadow #:COUNT #:DELETE #:FORMAT #:LABELS #:LENGTH #:MAP #:MAX #:MIN #:NUMBER #:SEQUENCE #:SET #:STRING #:TIME #:TYPE)
  (:export
   #:abs-area-following
   #:abs-area-height
   #:abs-area-offset-x
   #:abs-area-offset-y
   #:abs-area-screen
   #:abs-area-width
   #:abs-calib-button-threshold
   #:abs-calib-flip-x
   #:abs-calib-flip-y
   #:abs-calib-max-x
   #:abs-calib-max-y
   #:abs-calib-min-x
   #:abs-calib-min-y
   #:abs-calib-rotation
   #:accel-denom
   #:accel-num
   #:add-master
   #:add-master-enable
   #:add-master-name
   #:add-master-name-len
   #:add-master-send-core
   #:all-classes
   #:allow-device-events
   #:allow-device-events-request
   #:atoms
   #:attach-slave
   #:attach-slave-deviceid
   #:attach-slave-master
   #:attachment
   #:auto-repeat-mode
   #:auto-repeats
   #:axes
   #:axes-len
   #:axis-info
   #:axisvalues
   #:axisvalues-raw
   #:bad-value
   #:barrier
   #:barrier-hit
   #:barrier-leave
   #:barrier-release-pointer-info
   #:base
   #:bell-duration
   #:bell-feedback-ctl
   #:bell-feedback-state
   #:bell-percent
   #:bell-pitch
   #:button-buttons
   #:button-class
   #:button-info
   #:button-labels
   #:button-mask
   #:button-num-buttons
   #:button-press
   #:button-release
   #:button-state
   #:button-threshold
   #:buttons
   #:buttons-len
   #:bytes-after
   #:change-device-control
   #:change-device-control-reply
   #:change-device-control-request
   #:change-device-dont-propagate-list
   #:change-device-dont-propagate-list-request
   #:change-device-key-mapping
   #:change-device-key-mapping-request
   #:change-device-notify
   #:change-device-property
   #:change-device-property-request
   #:change-feedback-control
   #:change-feedback-control-request
   #:change-keyboard-device
   #:change-keyboard-device-reply
   #:change-keyboard-device-request
   #:change-pointer-device
   #:change-pointer-device-reply
   #:change-pointer-device-request
   #:child
   #:class-error
   #:class-id
   #:class-info
   #:classes
   #:classes-reported
   #:click
   #:close-device
   #:close-device-request
   #:control
   #:control-id
   #:core-iscore
   #:core-status
   #:count
   #:data16
   #:data32
   #:data8
   #:decode-add-master
   #:decode-attach-slave
   #:decode-axis-info
   #:decode-barrier-hit
   #:decode-barrier-leave
   #:decode-barrier-release-pointer-info
   #:decode-bell-feedback-ctl
   #:decode-bell-feedback-state
   #:decode-button-class
   #:decode-button-info
   #:decode-button-press
   #:decode-button-release
   #:decode-button-state
   #:decode-change-device-control-reply
   #:decode-change-device-notify
   #:decode-change-keyboard-device-reply
   #:decode-change-pointer-device-reply
   #:decode-class-error
   #:decode-detach-slave
   #:decode-device-abs-area-ctrl
   #:decode-device-abs-area-state
   #:decode-device-abs-calib-ctl
   #:decode-device-abs-calib-state
   #:decode-device-busy-error
   #:decode-device-button-press
   #:decode-device-button-release
   #:decode-device-button-state-notify
   #:decode-device-changed
   #:decode-device-class
   #:decode-device-core-ctrl
   #:decode-device-core-state
   #:decode-device-ctl
   #:decode-device-enable-ctrl
   #:decode-device-enable-state
   #:decode-device-error
   #:decode-device-focus-in
   #:decode-device-focus-out
   #:decode-device-info
   #:decode-device-key-press
   #:decode-device-key-release
   #:decode-device-key-state-notify
   #:decode-device-mapping-notify
   #:decode-device-motion-notify
   #:decode-device-name
   #:decode-device-presence-notify
   #:decode-device-property-notify
   #:decode-device-resolution-ctl
   #:decode-device-resolution-state
   #:decode-device-state
   #:decode-device-state-notify
   #:decode-device-time-coord
   #:decode-device-valuator
   #:decode-enter
   #:decode-event-error
   #:decode-event-for-send
   #:decode-event-mask
   #:decode-feedback-ctl
   #:decode-feedback-state
   #:decode-focus-in
   #:decode-focus-out
   #:decode-fp3232
   #:decode-gesture-class
   #:decode-gesture-pinch-begin
   #:decode-gesture-pinch-end
   #:decode-gesture-pinch-update
   #:decode-gesture-swipe-begin
   #:decode-gesture-swipe-end
   #:decode-gesture-swipe-update
   #:decode-get-device-button-mapping-reply
   #:decode-get-device-control-reply
   #:decode-get-device-dont-propagate-list-reply
   #:decode-get-device-focus-reply
   #:decode-get-device-key-mapping-reply
   #:decode-get-device-modifier-mapping-reply
   #:decode-get-device-motion-events-reply
   #:decode-get-device-property-reply
   #:decode-get-extension-version-reply
   #:decode-get-feedback-control-reply
   #:decode-get-selected-extension-events-reply
   #:decode-grab-device-reply
   #:decode-grab-modifier-info
   #:decode-group-info
   #:decode-hierarchy
   #:decode-hierarchy-change
   #:decode-hierarchy-info
   #:decode-input-class-info
   #:decode-input-info
   #:decode-input-state
   #:decode-integer-feedback-ctl
   #:decode-integer-feedback-state
   #:decode-kbd-feedback-ctl
   #:decode-kbd-feedback-state
   #:decode-key-class
   #:decode-key-info
   #:decode-key-press
   #:decode-key-release
   #:decode-key-state
   #:decode-leave
   #:decode-led-feedback-ctl
   #:decode-led-feedback-state
   #:decode-list-device-properties-reply
   #:decode-list-input-devices-reply
   #:decode-mode-error
   #:decode-modifier-info
   #:decode-motion
   #:decode-open-device-reply
   #:decode-property
   #:decode-proximity-in
   #:decode-proximity-out
   #:decode-ptr-feedback-ctl
   #:decode-ptr-feedback-state
   #:decode-query-device-state-reply
   #:decode-raw-button-press
   #:decode-raw-button-release
   #:decode-raw-key-press
   #:decode-raw-key-release
   #:decode-raw-motion
   #:decode-raw-touch-begin
   #:decode-raw-touch-end
   #:decode-raw-touch-update
   #:decode-remove-master
   #:decode-scroll-class
   #:decode-set-device-button-mapping-reply
   #:decode-set-device-mode-reply
   #:decode-set-device-modifier-mapping-reply
   #:decode-set-device-valuators-reply
   #:decode-string-feedback-ctl
   #:decode-string-feedback-state
   #:decode-touch-begin
   #:decode-touch-class
   #:decode-touch-end
   #:decode-touch-ownership
   #:decode-touch-update
   #:decode-valuator-class
   #:decode-valuator-info
   #:decode-valuator-state
   #:decode-xi-device-info
   #:decode-xi-get-client-pointer-reply
   #:decode-xi-get-focus-reply
   #:decode-xi-get-property-reply
   #:decode-xi-get-selected-events-reply
   #:decode-xi-grab-device-reply
   #:decode-xi-list-properties-reply
   #:decode-xi-passive-grab-device-reply
   #:decode-xi-query-device-reply
   #:decode-xi-query-pointer-reply
   #:decode-xi-query-version-reply
   #:delete-device-property
   #:delete-device-property-request
   #:delta-angle
   #:delta-unaccel-x
   #:delta-unaccel-y
   #:delta-x
   #:delta-y
   #:denom
   #:detach-slave
   #:detach-slave-deviceid
   #:detail
   #:devchange
   #:device-abs-area-ctrl
   #:device-abs-area-state
   #:device-abs-calib-ctl
   #:device-abs-calib-state
   #:device-bell
   #:device-bell-request
   #:device-busy-error
   #:device-button-press
   #:device-button-release
   #:device-button-state-notify
   #:device-changed
   #:device-class
   #:device-core-ctrl
   #:device-core-state
   #:device-ctl
   #:device-enable-ctrl
   #:device-enable-state
   #:device-error
   #:device-focus-in
   #:device-focus-out
   #:device-id
   #:device-info
   #:device-key-press
   #:device-key-release
   #:device-key-state-notify
   #:device-mapping-notify
   #:device-mode
   #:device-motion-notify
   #:device-name
   #:device-presence-notify
   #:device-property-notify
   #:device-resolution-ctl
   #:device-resolution-state
   #:device-state
   #:device-state-notify
   #:device-time-coord
   #:device-type
   #:device-use
   #:device-valuator
   #:deviceid
   #:devices
   #:devices-len
   #:dtime
   #:duration
   #:dx
   #:dy
   #:effective
   #:enable
   #:enable-enable
   #:enabled
   #:encode-add-master
   #:encode-attach-slave
   #:encode-axis-info
   #:encode-barrier-release-pointer-info
   #:encode-bell-feedback-ctl
   #:encode-bell-feedback-state
   #:encode-button-class
   #:encode-button-info
   #:encode-button-state
   #:encode-change-device-notify
   #:encode-detach-slave
   #:encode-device-abs-area-ctrl
   #:encode-device-abs-area-state
   #:encode-device-abs-calib-ctl
   #:encode-device-abs-calib-state
   #:encode-device-button-state-notify
   #:encode-device-class
   #:encode-device-core-ctrl
   #:encode-device-core-state
   #:encode-device-ctl
   #:encode-device-enable-ctrl
   #:encode-device-enable-state
   #:encode-device-focus-in
   #:encode-device-info
   #:encode-device-key-press
   #:encode-device-key-state-notify
   #:encode-device-mapping-notify
   #:encode-device-name
   #:encode-device-presence-notify
   #:encode-device-property-notify
   #:encode-device-resolution-ctl
   #:encode-device-resolution-state
   #:encode-device-state
   #:encode-device-state-notify
   #:encode-device-time-coord
   #:encode-device-valuator
   #:encode-event-for-send
   #:encode-event-mask
   #:encode-feedback-ctl
   #:encode-feedback-state
   #:encode-fp3232
   #:encode-gesture-class
   #:encode-grab-modifier-info
   #:encode-group-info
   #:encode-hierarchy-change
   #:encode-hierarchy-info
   #:encode-input-class-info
   #:encode-input-info
   #:encode-input-state
   #:encode-integer-feedback-ctl
   #:encode-integer-feedback-state
   #:encode-kbd-feedback-ctl
   #:encode-kbd-feedback-state
   #:encode-key-class
   #:encode-key-info
   #:encode-key-state
   #:encode-led-feedback-ctl
   #:encode-led-feedback-state
   #:encode-modifier-info
   #:encode-ptr-feedback-ctl
   #:encode-ptr-feedback-state
   #:encode-remove-master
   #:encode-scroll-class
   #:encode-string-feedback-ctl
   #:encode-string-feedback-state
   #:encode-touch-class
   #:encode-valuator-class
   #:encode-valuator-info
   #:encode-valuator-state
   #:encode-xi-device-info
   #:enter
   #:error-code
   #:event
   #:event-class
   #:event-error
   #:event-for-send
   #:event-mask
   #:event-type
   #:event-type-base
   #:event-x
   #:event-y
   #:eventid
   #:events
   #:extension
   #:feedback-ctl
   #:feedback-id
   #:feedback-state
   #:feedbacks
   #:first-keycode
   #:first-valuator
   #:flags
   #:flip-x
   #:flip-y
   #:focus
   #:focus-in
   #:focus-out
   #:following
   #:format
   #:fp1616
   #:fp3232
   #:frac
   #:gesture-class
   #:gesture-num-touches
   #:gesture-pinch-begin
   #:gesture-pinch-end
   #:gesture-pinch-update
   #:gesture-swipe-begin
   #:gesture-swipe-end
   #:gesture-swipe-update
   #:get-device-button-mapping
   #:get-device-button-mapping-reply
   #:get-device-button-mapping-request
   #:get-device-control
   #:get-device-control-reply
   #:get-device-control-request
   #:get-device-dont-propagate-list
   #:get-device-dont-propagate-list-reply
   #:get-device-dont-propagate-list-request
   #:get-device-focus
   #:get-device-focus-reply
   #:get-device-focus-request
   #:get-device-key-mapping
   #:get-device-key-mapping-reply
   #:get-device-key-mapping-request
   #:get-device-modifier-mapping
   #:get-device-modifier-mapping-reply
   #:get-device-modifier-mapping-request
   #:get-device-motion-events
   #:get-device-motion-events-reply
   #:get-device-motion-events-request
   #:get-device-property
   #:get-device-property-reply
   #:get-device-property-request
   #:get-extension-version
   #:get-extension-version-reply
   #:get-extension-version-request
   #:get-feedback-control
   #:get-feedback-control-reply
   #:get-feedback-control-request
   #:get-selected-extension-events
   #:get-selected-extension-events-reply
   #:get-selected-extension-events-request
   #:global-auto-repeat
   #:grab-device
   #:grab-device-button
   #:grab-device-button-request
   #:grab-device-key
   #:grab-device-key-request
   #:grab-device-reply
   #:grab-device-request
   #:grab-modifier-info
   #:group
   #:group-info
   #:height
   #:hierarchy
   #:hierarchy-change
   #:hierarchy-info
   #:increment
   #:infos
   #:input-class-info
   #:input-info
   #:input-state
   #:int-to-display
   #:integer-feedback-ctl
   #:integer-feedback-state
   #:integer-int-to-display
   #:integer-max-value
   #:integer-min-value
   #:integer-resolution
   #:integral
   #:iscore
   #:kbd-feedback-ctl
   #:kbd-feedback-state
   #:key
   #:key-class
   #:key-click-percent
   #:key-code
   #:key-info
   #:key-keys
   #:key-max-keycode
   #:key-min-keycode
   #:key-num-keys
   #:key-press
   #:key-release
   #:key-state
   #:keyboard-auto-repeat-mode
   #:keyboard-auto-repeats
   #:keyboard-bell-duration
   #:keyboard-bell-percent
   #:keyboard-bell-pitch
   #:keyboard-click
   #:keyboard-duration
   #:keyboard-global-auto-repeat
   #:keyboard-key
   #:keyboard-key-click-percent
   #:keyboard-led-mask
   #:keyboard-led-values
   #:keyboard-percent
   #:keyboard-pitch
   #:keycodes-per-modifier
   #:keymaps
   #:keys
   #:keysyms
   #:keysyms-per-keycode
   #:label
   #:labels
   #:latched
   #:leave
   #:led-feedback-ctl
   #:led-feedback-state
   #:led-led-mask
   #:led-led-values
   #:led-mask
   #:led-values
   #:len
   #:length
   #:list-device-properties
   #:list-device-properties-reply
   #:list-device-properties-request
   #:list-input-devices
   #:list-input-devices-reply
   #:list-input-devices-request
   #:locked
   #:major-opcode
   #:major-version
   #:map
   #:map-size
   #:mask
   #:mask-len
   #:masks
   #:master
   #:max
   #:max-keycode
   #:max-symbols
   #:max-value
   #:max-x
   #:max-y
   #:maximum
   #:min
   #:min-keycode
   #:min-value
   #:min-x
   #:min-y
   #:minimum
   #:minor-opcode
   #:minor-version
   #:mode
   #:mode-error
   #:modifier-info
   #:modifiers
   #:mods
   #:motion
   #:motion-size
   #:name
   #:name-len
   #:names
   #:num
   #:num-all-classes
   #:num-atoms
   #:num-axes
   #:num-buttons
   #:num-class-info
   #:num-classes
   #:num-events
   #:num-feedbacks
   #:num-infos
   #:num-items
   #:num-keys
   #:num-keysyms
   #:num-masks
   #:num-modifiers
   #:num-properties
   #:num-this-classes
   #:num-touches
   #:num-valuators
   #:number
   #:offset-x
   #:offset-y
   #:open-device
   #:open-device-reply
   #:open-device-request
   #:percent
   #:pitch
   #:pointer-accel-denom
   #:pointer-accel-num
   #:pointer-denom
   #:pointer-num
   #:pointer-threshold
   #:present
   #:properties
   #:property
   #:proximity-in
   #:proximity-out
   #:ptr-feedback-ctl
   #:ptr-feedback-state
   #:query-device-state
   #:query-device-state-reply
   #:query-device-state-request
   #:raw-button-press
   #:raw-button-release
   #:raw-key-press
   #:raw-key-release
   #:raw-motion
   #:raw-touch-begin
   #:raw-touch-end
   #:raw-touch-update
   #:reason
   #:remove-master
   #:remove-master-deviceid
   #:remove-master-return-keyboard
   #:remove-master-return-mode
   #:remove-master-return-pointer
   #:request
   #:resolution
   #:resolution-first-valuator
   #:resolution-max
   #:resolution-min
   #:resolution-num-valuators
   #:resolution-resolution-max
   #:resolution-resolution-min
   #:resolution-resolution-values
   #:resolution-values
   #:response-type
   #:return-keyboard
   #:return-mode
   #:return-pointer
   #:revert-to
   #:root
   #:root-x
   #:root-y
   #:rotation
   #:same-screen
   #:scale
   #:screen
   #:scroll-class
   #:scroll-flags
   #:scroll-increment
   #:scroll-number
   #:scroll-scroll-type
   #:scroll-type
   #:select-extension-event
   #:select-extension-event-request
   #:send-core
   #:send-extension-event
   #:send-extension-event-request
   #:sequence
   #:server-major
   #:server-minor
   #:set
   #:set-device-button-mapping
   #:set-device-button-mapping-reply
   #:set-device-button-mapping-request
   #:set-device-focus
   #:set-device-focus-request
   #:set-device-mode
   #:set-device-mode-reply
   #:set-device-mode-request
   #:set-device-modifier-mapping
   #:set-device-modifier-mapping-reply
   #:set-device-modifier-mapping-request
   #:set-device-valuators
   #:set-device-valuators-reply
   #:set-device-valuators-request
   #:sourceid
   #:state
   #:status
   #:string
   #:string-feedback-ctl
   #:string-feedback-state
   #:string-keysyms
   #:string-max-symbols
   #:string-num-keysyms
   #:this-classes
   #:threshold
   #:time
   #:touch-begin
   #:touch-class
   #:touch-end
   #:touch-mode
   #:touch-num-touches
   #:touch-ownership
   #:touch-update
   #:touchid
   #:type
   #:ungrab-device
   #:ungrab-device-button
   #:ungrab-device-button-request
   #:ungrab-device-key
   #:ungrab-device-key-request
   #:ungrab-device-request
   #:valuator-axes
   #:valuator-axes-len
   #:valuator-class
   #:valuator-info
   #:valuator-label
   #:valuator-mask
   #:valuator-max
   #:valuator-min
   #:valuator-mode
   #:valuator-motion-size
   #:valuator-num-valuators
   #:valuator-number
   #:valuator-resolution
   #:valuator-state
   #:valuator-valuators
   #:valuator-value
   #:valuators
   #:valuators-len
   #:value
   #:what
   #:width
   #:win-x
   #:win-y
   #:window
   #:xi-allow-events
   #:xi-allow-events-request
   #:xi-barrier-release-pointer
   #:xi-barrier-release-pointer-request
   #:xi-change-cursor
   #:xi-change-cursor-request
   #:xi-change-hierarchy
   #:xi-change-hierarchy-request
   #:xi-change-property
   #:xi-change-property-request
   #:xi-delete-property
   #:xi-delete-property-request
   #:xi-device-info
   #:xi-get-client-pointer
   #:xi-get-client-pointer-reply
   #:xi-get-client-pointer-request
   #:xi-get-focus
   #:xi-get-focus-reply
   #:xi-get-focus-request
   #:xi-get-property
   #:xi-get-property-reply
   #:xi-get-property-request
   #:xi-get-selected-events
   #:xi-get-selected-events-reply
   #:xi-get-selected-events-request
   #:xi-grab-device
   #:xi-grab-device-reply
   #:xi-grab-device-request
   #:xi-list-properties
   #:xi-list-properties-reply
   #:xi-list-properties-request
   #:xi-passive-grab-device
   #:xi-passive-grab-device-reply
   #:xi-passive-grab-device-request
   #:xi-passive-ungrab-device
   #:xi-passive-ungrab-device-request
   #:xi-query-device
   #:xi-query-device-reply
   #:xi-query-device-request
   #:xi-query-pointer
   #:xi-query-pointer-reply
   #:xi-query-pointer-request
   #:xi-query-version
   #:xi-query-version-reply
   #:xi-query-version-request
   #:xi-reply-type
   #:xi-select-events
   #:xi-select-events-request
   #:xi-set-client-pointer
   #:xi-set-client-pointer-request
   #:xi-set-focus
   #:xi-set-focus-request
   #:xi-ungrab-device
   #:xi-ungrab-device-request
   #:xi-warp-pointer
   #:xi-warp-pointer-request))

(in-package #:XCB-INPUT)

(xcb:register-extension-xname "XCB-INPUT" "XInputExtension")
(deftype event-class () '(unsigned-byte 32))
(deftype key-code () '(unsigned-byte 8))
(deftype device-id () '(unsigned-byte 16))
(deftype fp1616 () '(signed-byte 32))

;;; xcb.Input.FP3232
(defclass fp3232 nil
          ((integral :initarg :integral :accessor integral :type (signed-byte 32))
           (frac :initarg :frac :accessor frac :type (unsigned-byte 32))))
(defun encode-fp3232 (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((integral (slot-value %obj 'integral)) (frac (slot-value %obj 'frac)))
    (declare (ignorable integral frac))
    (xcb:buffer-write-card32 %buf integral)
    (xcb:buffer-write-card32 %buf frac)))
(defun decode-fp3232 (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) integral frac)
    (declare (ignorable %p integral frac))
    (setf integral (xcb:read-int32-at %buf %p %order))
    (setf frac (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'fp3232 :integral integral :frac frac) (+ %p 8))))

;;; Request xcb.Input.GetExtensionVersion
(defun get-extension-version (conn name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (name-len (cl:length name)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf name-len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-extension-version-request (xcb:request-with-reply)
          ((name-len :initarg :name-len :type (unsigned-byte 16))
           (name :initarg :name :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj get-extension-version-request))
  (get-extension-version conn (slot-value %obj 'name)))
(defclass get-extension-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major :initarg :server-major :accessor server-major :type (unsigned-byte 16))
           (server-minor :initarg :server-minor :accessor server-minor :type (unsigned-byte 16))
           (present :initarg :present :accessor present :type (or boolean (unsigned-byte 8)))))
(defun decode-get-extension-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length server-major server-minor present)
    (declare
     (ignorable %p response-type xi-reply-type sequence length server-major server-minor present))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf server-major (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf server-minor (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf present (xcb:read-card8-at %buf (+ %p 12)))
    (values
     (make-instance 'get-extension-version-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :server-major server-major
                    :server-minor server-minor :present present)
     (+ %pos 32 (* 4 length)))))
(defun get-extension-version-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-extension-version-reply))

;;; Enum xcb.Input.DeviceUse
(xcb:defenum input-device-use
  (:is-x-pointer 0)
  (:is-x-keyboard 1)
  (:is-x-extension-device 2)
  (:is-x-extension-keyboard 3)
  (:is-x-extension-pointer 4))

;;; Enum xcb.Input.InputClass
(xcb:defenum input-class
  (:key 0)
  (:button 1)
  (:valuator 2)
  (:feedback 3)
  (:proximity 4)
  (:focus 5)
  (:other 6))

;;; Enum xcb.Input.ValuatorMode
(xcb:defenum input-valuator-mode
  (:relative 0)
  (:absolute 1))

;;; xcb.Input.DeviceInfo
(defclass device-info nil
          ((device-type :initarg :device-type :accessor device-type :type xcb:atom)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (num-class-info :initarg :num-class-info :accessor num-class-info :type
            (unsigned-byte 8))
           (device-use :initarg :device-use :accessor device-use :type (unsigned-byte 8))))
(defun encode-device-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((device-type (slot-value %obj 'device-type))
         (device-id (slot-value %obj 'device-id))
         (num-class-info (slot-value %obj 'num-class-info))
         (device-use (slot-value %obj 'device-use)))
    (declare (ignorable device-type device-id num-class-info device-use))
    (xcb:buffer-write-card32 %buf device-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf num-class-info)
    (xcb:buffer-write-card8 %buf device-use)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-device-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) device-type device-id num-class-info device-use)
    (declare (ignorable %p device-type device-id num-class-info device-use))
    (setf device-type (xcb:read-card32-at %buf %p %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 4)))
    (setf num-class-info (xcb:read-card8-at %buf (+ %p 5)))
    (setf device-use (xcb:read-card8-at %buf (+ %p 6)))
    (values
     (make-instance 'device-info :device-type device-type :device-id device-id :num-class-info
                    num-class-info :device-use device-use)
     (+ %p 8))))

;;; xcb.Input.KeyInfo
(defclass key-info nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (min-keycode :initarg :min-keycode :accessor min-keycode :type key-code)
           (max-keycode :initarg :max-keycode :accessor max-keycode :type key-code)
           (num-keys :initarg :num-keys :accessor num-keys :type (unsigned-byte 16))))
(defun encode-key-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (min-keycode (slot-value %obj 'min-keycode))
         (max-keycode (slot-value %obj 'max-keycode))
         (num-keys (slot-value %obj 'num-keys)))
    (declare (ignorable class-id len min-keycode max-keycode num-keys))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card8 %buf min-keycode)
    (xcb:buffer-write-card8 %buf max-keycode)
    (xcb:buffer-write-card16 %buf num-keys)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-key-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len min-keycode max-keycode num-keys)
    (declare (ignorable %p class-id len min-keycode max-keycode num-keys))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf min-keycode (xcb:read-card8-at %buf (+ %p 2)))
    (setf max-keycode (xcb:read-card8-at %buf (+ %p 3)))
    (setf num-keys (xcb:read-card16-at %buf (+ %p 4) %order))
    (values
     (make-instance 'key-info :class-id class-id :len len :min-keycode min-keycode :max-keycode
                    max-keycode :num-keys num-keys)
     (+ %p 8))))

;;; xcb.Input.ButtonInfo
(defclass button-info nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (num-buttons :initarg :num-buttons :accessor num-buttons :type (unsigned-byte 16))))
(defun encode-button-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (num-buttons (slot-value %obj 'num-buttons)))
    (declare (ignorable class-id len num-buttons))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card16 %buf num-buttons)))
(defun decode-button-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len num-buttons)
    (declare (ignorable %p class-id len num-buttons))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf num-buttons (xcb:read-card16-at %buf (+ %p 2) %order))
    (values (make-instance 'button-info :class-id class-id :len len :num-buttons num-buttons)
            (+ %p 4))))

;;; xcb.Input.AxisInfo
(defclass axis-info nil
          ((resolution :initarg :resolution :accessor resolution :type (unsigned-byte 32))
           (minimum :initarg :minimum :accessor minimum :type (signed-byte 32))
           (maximum :initarg :maximum :accessor maximum :type (signed-byte 32))))
(defun encode-axis-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((resolution (slot-value %obj 'resolution))
         (minimum (slot-value %obj 'minimum))
         (maximum (slot-value %obj 'maximum)))
    (declare (ignorable resolution minimum maximum))
    (xcb:buffer-write-card32 %buf resolution)
    (xcb:buffer-write-card32 %buf minimum)
    (xcb:buffer-write-card32 %buf maximum)))
(defun decode-axis-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) resolution minimum maximum)
    (declare (ignorable %p resolution minimum maximum))
    (setf resolution (xcb:read-card32-at %buf %p %order))
    (setf minimum (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf maximum (xcb:read-int32-at %buf (+ %p 8) %order))
    (values (make-instance 'axis-info :resolution resolution :minimum minimum :maximum maximum)
            (+ %p 12))))

;;; xcb.Input.ValuatorInfo
(defclass valuator-info nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (axes-len :initarg :axes-len :accessor axes-len :type (unsigned-byte 8))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (motion-size :initarg :motion-size :accessor motion-size :type (unsigned-byte 32))
           (axes :initarg :axes :accessor axes :type cl:sequence)))
(defun encode-valuator-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (mode (slot-value %obj 'mode))
         (motion-size (slot-value %obj 'motion-size))
         (axes (slot-value %obj 'axes))
         (axes-len (cl:length axes)))
    (declare (ignorable class-id len mode motion-size axes axes-len))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card8 %buf axes-len)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card32 %buf motion-size)
    (xcb:buffer-write-list %buf axes axes-len #'encode-axis-info)))
(defun decode-valuator-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len axes-len mode motion-size axes)
    (declare (ignorable %p class-id len axes-len mode motion-size axes))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf axes-len (xcb:read-card8-at %buf (+ %p 2)))
    (setf mode (xcb:read-card8-at %buf (+ %p 3)))
    (setf motion-size (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (axes %p)
      (xcb:read-struct-vector-at %buf %p axes-len %order #'decode-axis-info))
    (values
     (make-instance 'valuator-info :class-id class-id :len len :axes-len axes-len :mode mode
                    :motion-size motion-size :axes axes)
     %p)))

;;; xcb.Input.InputInfo
(defclass input-info nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (key-min-keycode :initarg :key-min-keycode :accessor key-min-keycode :type key-code)
           (key-max-keycode :initarg :key-max-keycode :accessor key-max-keycode :type key-code)
           (key-num-keys :initarg :key-num-keys :accessor key-num-keys :type (unsigned-byte 16))
           (button-num-buttons :initarg :button-num-buttons :accessor button-num-buttons :type
            (unsigned-byte 16))
           (valuator-axes-len :initarg :valuator-axes-len :accessor valuator-axes-len :type
            (unsigned-byte 8))
           (valuator-mode :initarg :valuator-mode :accessor valuator-mode :type (unsigned-byte 8))
           (valuator-motion-size :initarg :valuator-motion-size :accessor valuator-motion-size
            :type (unsigned-byte 32))
           (valuator-axes :initarg :valuator-axes :accessor valuator-axes :type cl:sequence)))
(defun encode-input-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id)) (len (slot-value %obj 'len)))
    (declare (ignorable class-id len))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (let ((%mask class-id))
      (when (eql %mask 0)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'key-min-keycode))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'key-max-keycode))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'key-num-keys))
        (xcb:buffer-write-padding %buf 2))
      (when (eql %mask 1) (xcb:buffer-write-card16 %buf (slot-value %obj 'button-num-buttons)))
      (when (eql %mask 2)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'valuator-axes-len))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'valuator-mode))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'valuator-motion-size))
        (xcb:buffer-write-list %buf (slot-value %obj 'valuator-axes)
         (slot-value %obj 'valuator-axes-len) #'encode-axis-info)))))
(defun decode-input-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        len
        key-min-keycode
        key-max-keycode
        key-num-keys
        button-num-buttons
        valuator-axes-len
        valuator-mode
        valuator-motion-size
        valuator-axes)
    (declare
     (ignorable %p class-id len key-min-keycode key-max-keycode key-num-keys button-num-buttons
      valuator-axes-len valuator-mode valuator-motion-size valuator-axes))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf %p (+ %p 2))
    (let ((%mask class-id))
      (when (eql %mask 0)
        (setf key-min-keycode (xcb:read-card8-at %buf %p))
        (setf key-max-keycode (xcb:read-card8-at %buf (+ %p 1)))
        (setf key-num-keys (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf %p (+ %p 6)))
      (when (eql %mask 1)
        (setf button-num-buttons (xcb:read-card16-at %buf %p %order))
        (setf %p (+ %p 2)))
      (when (eql %mask 2)
        (setf valuator-axes-len (xcb:read-card8-at %buf %p))
        (setf valuator-mode (xcb:read-card8-at %buf (+ %p 1)))
        (setf valuator-motion-size (xcb:read-card32-at %buf (+ %p 2) %order))
        (setf %p (+ %p 6))
        (multiple-value-setq (valuator-axes %p)
          (xcb:read-struct-vector-at %buf %p valuator-axes-len %order #'decode-axis-info))))
    (let ((%obj (make-instance 'input-info :class-id class-id :len len)))
      (when key-min-keycode (setf (slot-value %obj 'key-min-keycode) key-min-keycode))
      (when key-max-keycode (setf (slot-value %obj 'key-max-keycode) key-max-keycode))
      (when key-num-keys (setf (slot-value %obj 'key-num-keys) key-num-keys))
      (when button-num-buttons (setf (slot-value %obj 'button-num-buttons) button-num-buttons))
      (when valuator-axes-len (setf (slot-value %obj 'valuator-axes-len) valuator-axes-len))
      (when valuator-mode (setf (slot-value %obj 'valuator-mode) valuator-mode))
      (when valuator-motion-size
        (setf (slot-value %obj 'valuator-motion-size) valuator-motion-size))
      (when valuator-axes (setf (slot-value %obj 'valuator-axes) valuator-axes))
      (values %obj %p))))

;;; xcb.Input.DeviceName
(defclass device-name nil
          ((len :initarg :len :accessor len :type (unsigned-byte 8))
           (string :initarg :string :accessor string :type cl:sequence)))
(defun encode-device-name (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((string (slot-value %obj 'string)) (len (cl:length string)))
    (declare (ignorable string len))
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-string-octets %buf string len)))
(defun decode-device-name (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) len string)
    (declare (ignorable %p len string))
    (setf len (xcb:read-card8-at %buf %p))
    (setf %p (+ %p 1))
    (setf string (xcb:read-string-at %buf %p len))
    (incf %p (cl:length string))
    (values (make-instance 'device-name :len len :string string) %p)))

;;; Request xcb.Input.ListInputDevices
(defun list-input-devices (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-input-devices-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj list-input-devices-request)) (list-input-devices conn))
(defclass list-input-devices-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (devices-len :initarg :devices-len :accessor devices-len :type (unsigned-byte 8))
           (devices :initarg :devices :accessor devices :type cl:sequence)
           (infos :initarg :infos :accessor infos :type cl:sequence)
           (names :initarg :names :accessor names :type cl:sequence)))
(defun decode-list-input-devices-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length devices-len devices infos names)
    (declare
     (ignorable %p response-type xi-reply-type sequence length devices-len devices infos names))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf devices-len (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (devices %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min devices-len (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order #'decode-device-info))
    (multiple-value-setq (infos %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (slot-value %e 'num-class-info)) devices)
               (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-input-info))
    (multiple-value-setq (names %p)
      (xcb:read-struct-vector-at %buf %p (cl:min devices-len (- (+ %pos 32 (* 4 length)) %p))
       %order #'xcb:decode-str))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'list-input-devices-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :devices-len devices-len
                    :devices devices :infos infos :names names)
     (+ %pos 32 (* 4 length)))))
(defun list-input-devices-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-input-devices-reply))
(deftype event-type-base () '(unsigned-byte 8))

;;; xcb.Input.InputClassInfo
(defclass input-class-info nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (event-type-base :initarg :event-type-base :accessor event-type-base :type
            event-type-base)))
(defun encode-input-class-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (event-type-base (slot-value %obj 'event-type-base)))
    (declare (ignorable class-id event-type-base))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf event-type-base)))
(defun decode-input-class-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id event-type-base)
    (declare (ignorable %p class-id event-type-base))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf event-type-base (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'input-class-info :class-id class-id :event-type-base event-type-base)
            (+ %p 2))))

;;; Request xcb.Input.OpenDevice
(defun open-device (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass open-device-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj open-device-request))
  (open-device conn (slot-value %obj 'device-id)))
(defclass open-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-classes :initarg :num-classes :accessor num-classes :type (unsigned-byte 8))
           (class-info :initarg :class-info :accessor class-info :type cl:sequence)))
(defun decode-open-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length num-classes class-info)
    (declare (ignorable %p response-type xi-reply-type sequence length num-classes class-info))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-classes (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (class-info %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min num-classes (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       #'decode-input-class-info))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'open-device-reply :response-type response-type :xi-reply-type xi-reply-type
                    :sequence sequence :length length :num-classes num-classes :class-info
                    class-info)
     (+ %pos 32 (* 4 length)))))
(defun open-device-reply (conn cookie) (xcb:read-reply conn cookie #'decode-open-device-reply))

;;; Request xcb.Input.CloseDevice
(defun close-device (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass close-device-request (xcb:request)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj close-device-request))
  (close-device conn (slot-value %obj 'device-id)))

;;; Request xcb.Input.SetDeviceMode
(defun set-device-mode (conn device-id mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-device-mode-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (mode :initarg :mode :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj set-device-mode-request))
  (set-device-mode conn (slot-value %obj 'device-id) (slot-value %obj 'mode)))
(defclass set-device-mode-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-set-device-mode-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'set-device-mode-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun set-device-mode-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-device-mode-reply))

;;; Request xcb.Input.SelectExtensionEvent
(defun select-extension-event (conn window classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-extension-event-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj select-extension-event-request))
  (select-extension-event conn (slot-value %obj 'window) (slot-value %obj 'classes)))

;;; Request xcb.Input.GetSelectedExtensionEvents
(defun get-selected-extension-events (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-selected-extension-events-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-selected-extension-events-request))
  (get-selected-extension-events conn (slot-value %obj 'window)))
(defclass get-selected-extension-events-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-this-classes :initarg :num-this-classes :accessor num-this-classes :type
            (unsigned-byte 16))
           (num-all-classes :initarg :num-all-classes :accessor num-all-classes :type
            (unsigned-byte 16))
           (this-classes :initarg :this-classes :accessor this-classes :type cl:sequence)
           (all-classes :initarg :all-classes :accessor all-classes :type cl:sequence)))
(defun decode-get-selected-extension-events-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xi-reply-type
        sequence
        length
        num-this-classes
        num-all-classes
        this-classes
        all-classes)
    (declare
     (ignorable %p response-type xi-reply-type sequence length num-this-classes num-all-classes
      this-classes all-classes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-this-classes (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf num-all-classes (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (this-classes %p)
      (xcb:read-vector-at %buf %p
       (cl:min num-this-classes (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (multiple-value-setq (all-classes %p)
      (xcb:read-vector-at %buf %p
       (cl:min num-all-classes (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))
    (values
     (make-instance 'get-selected-extension-events-reply :response-type response-type
                    :xi-reply-type xi-reply-type :sequence sequence :length length
                    :num-this-classes num-this-classes :num-all-classes num-all-classes
                    :this-classes this-classes :all-classes all-classes)
     (+ %pos 32 (* 4 length)))))
(defun get-selected-extension-events-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-selected-extension-events-reply))

;;; Enum xcb.Input.PropagateMode
(xcb:defenum input-propagate-mode
  (:add-to-list 0)
  (:delete-from-list 1))

;;; Request xcb.Input.ChangeDeviceDontPropagateList
(defun change-device-dont-propagate-list (conn window mode classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-device-dont-propagate-list-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (mode :initarg :mode :type (unsigned-byte 8))
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-device-dont-propagate-list-request))
  (change-device-dont-propagate-list conn (slot-value %obj 'window) (slot-value %obj 'mode)
   (slot-value %obj 'classes)))

;;; Request xcb.Input.GetDeviceDontPropagateList
(defun get-device-dont-propagate-list (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-dont-propagate-list-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj get-device-dont-propagate-list-request))
  (get-device-dont-propagate-list conn (slot-value %obj 'window)))
(defclass get-device-dont-propagate-list-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-classes :initarg :num-classes :accessor num-classes :type (unsigned-byte 16))
           (classes :initarg :classes :accessor classes :type cl:sequence)))
(defun decode-get-device-dont-propagate-list-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length num-classes classes)
    (declare (ignorable %p response-type xi-reply-type sequence length num-classes classes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-classes (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (classes %p)
      (xcb:read-vector-at %buf %p (cl:min num-classes (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'get-device-dont-propagate-list-reply :response-type response-type
                    :xi-reply-type xi-reply-type :sequence sequence :length length :num-classes
                    num-classes :classes classes)
     (+ %pos 32 (* 4 length)))))
(defun get-device-dont-propagate-list-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-dont-propagate-list-reply))

;;; xcb.Input.DeviceTimeCoord
(defclass device-time-coord nil
          ((time :initarg :time :accessor time :type xcb:timestamp)
           (num-axes :initarg :num-axes :accessor num-axes :type (unsigned-byte 8))
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun encode-device-time-coord (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((time (slot-value %obj 'time))
         (axisvalues (slot-value %obj 'axisvalues))
         (num-axes (cl:length axisvalues)))
    (declare (ignorable time axisvalues num-axes))
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf num-axes)
    (xcb:buffer-write-list %buf axisvalues num-axes #'xcb:buffer-write-card32)))
(defun decode-device-time-coord (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) time num-axes axisvalues)
    (declare (ignorable %p time num-axes axisvalues))
    (setf time (xcb:read-card32-at %buf %p %order))
    (setf num-axes (xcb:read-card8-at %buf (+ %p 4)))
    (setf %p (+ %p 5))
    (multiple-value-setq (axisvalues %p) (xcb:read-vector-at %buf %p num-axes %order :int32))
    (values (make-instance 'device-time-coord :time time :num-axes num-axes :axisvalues axisvalues)
            %p)))

;;; Request xcb.Input.GetDeviceMotionEvents
(defun get-device-motion-events (conn start stop device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf start)
    (xcb:buffer-write-card32 %buf stop)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-motion-events-request (xcb:request-with-reply)
          ((start :initarg :start :type xcb:timestamp) (stop :initarg :stop :type xcb:timestamp)
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-motion-events-request))
  (get-device-motion-events conn (slot-value %obj 'start) (slot-value %obj 'stop)
   (slot-value %obj 'device-id)))
(defclass get-device-motion-events-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-events :initarg :num-events :accessor num-events :type (unsigned-byte 32))
           (num-axes :initarg :num-axes :accessor num-axes :type (unsigned-byte 8))
           (device-mode :initarg :device-mode :accessor device-mode :type (unsigned-byte 8))
           (events :initarg :events :accessor events :type cl:sequence)))
(defun decode-get-device-motion-events-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xi-reply-type
        sequence
        length
        num-events
        num-axes
        device-mode
        events)
    (declare
     (ignorable %p response-type xi-reply-type sequence length num-events num-axes device-mode
      events))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-events (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf num-axes (xcb:read-card8-at %buf (+ %p 12)))
    (setf device-mode (xcb:read-card8-at %buf (+ %p 13)))
    (setf %p (+ %p 32))
    (multiple-value-setq (events %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-events (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-device-time-coord))
    (values
     (make-instance 'get-device-motion-events-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :num-events num-events
                    :num-axes num-axes :device-mode device-mode :events events)
     (+ %pos 32 (* 4 length)))))
(defun get-device-motion-events-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-motion-events-reply))

;;; Request xcb.Input.ChangeKeyboardDevice
(defun change-keyboard-device (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass change-keyboard-device-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj change-keyboard-device-request))
  (change-keyboard-device conn (slot-value %obj 'device-id)))
(defclass change-keyboard-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-change-keyboard-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'change-keyboard-device-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun change-keyboard-device-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-change-keyboard-device-reply))

;;; Request xcb.Input.ChangePointerDevice
(defun change-pointer-device (conn x-axis y-axis device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf x-axis)
    (xcb:buffer-write-card8 %buf y-axis)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass change-pointer-device-request (xcb:request-with-reply)
          ((x-axis :initarg :x-axis :type (unsigned-byte 8))
           (y-axis :initarg :y-axis :type (unsigned-byte 8))
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj change-pointer-device-request))
  (change-pointer-device conn (slot-value %obj 'x-axis) (slot-value %obj 'y-axis)
   (slot-value %obj 'device-id)))
(defclass change-pointer-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-change-pointer-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'change-pointer-device-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun change-pointer-device-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-change-pointer-device-reply))

;;; Request xcb.Input.GrabDevice
(defun grab-device
       (conn grab-window time this-device-mode other-device-mode owner-events device-id classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card8 %buf this-device-mode)
    (xcb:buffer-write-card8 %buf other-device-mode)
    (xcb:buffer-write-bool %buf owner-events)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass grab-device-request (xcb:request-with-reply)
          ((grab-window :initarg :grab-window :type xcb:window)
           (time :initarg :time :type xcb:timestamp)
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (this-device-mode :initarg :this-device-mode :type (unsigned-byte 8))
           (other-device-mode :initarg :other-device-mode :type (unsigned-byte 8))
           (owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj grab-device-request))
  (grab-device conn (slot-value %obj 'grab-window) (slot-value %obj 'time)
   (slot-value %obj 'this-device-mode) (slot-value %obj 'other-device-mode)
   (slot-value %obj 'owner-events) (slot-value %obj 'device-id) (slot-value %obj 'classes)))
(defclass grab-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-grab-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'grab-device-reply :response-type response-type :xi-reply-type xi-reply-type
                    :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun grab-device-reply (conn cookie) (xcb:read-reply conn cookie #'decode-grab-device-reply))

;;; Request xcb.Input.UngrabDevice
(defun ungrab-device (conn time device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass ungrab-device-request (xcb:request)
          ((time :initarg :time :type xcb:timestamp)
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj ungrab-device-request))
  (ungrab-device conn (slot-value %obj 'time) (slot-value %obj 'device-id)))

;;; Enum xcb.Input.ModifierDevice
(xcb:defenum input-modifier-device
  (:use-x-keyboard 255))

;;; Request xcb.Input.GrabDeviceKey
(defun grab-device-key
       (conn grab-window modifiers modifier-device grabbed-device key this-device-mode
        other-device-mode owner-events classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card16 %buf modifiers)
    (xcb:buffer-write-card8 %buf modifier-device)
    (xcb:buffer-write-card8 %buf grabbed-device)
    (xcb:buffer-write-card8 %buf key)
    (xcb:buffer-write-card8 %buf this-device-mode)
    (xcb:buffer-write-card8 %buf other-device-mode)
    (xcb:buffer-write-bool %buf owner-events)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass grab-device-key-request (xcb:request)
          ((grab-window :initarg :grab-window :type xcb:window)
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (modifiers :initarg :modifiers :type (unsigned-byte 16))
           (modifier-device :initarg :modifier-device :type (unsigned-byte 8))
           (grabbed-device :initarg :grabbed-device :type (unsigned-byte 8))
           (key :initarg :key :type (unsigned-byte 8))
           (this-device-mode :initarg :this-device-mode :type (unsigned-byte 8))
           (other-device-mode :initarg :other-device-mode :type (unsigned-byte 8))
           (owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj grab-device-key-request))
  (grab-device-key conn (slot-value %obj 'grab-window) (slot-value %obj 'modifiers)
   (slot-value %obj 'modifier-device) (slot-value %obj 'grabbed-device) (slot-value %obj 'key)
   (slot-value %obj 'this-device-mode) (slot-value %obj 'other-device-mode)
   (slot-value %obj 'owner-events) (slot-value %obj 'classes)))

;;; Request xcb.Input.UngrabDeviceKey
(defun ungrab-device-key (conn grab-window modifiers modifier-device key grabbed-device)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card16 %buf modifiers)
    (xcb:buffer-write-card8 %buf modifier-device)
    (xcb:buffer-write-card8 %buf key)
    (xcb:buffer-write-card8 %buf grabbed-device)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass ungrab-device-key-request (xcb:request)
          ((grab-window :initarg :grab-window :type xcb:window)
           (modifiers :initarg :modifiers :type (unsigned-byte 16))
           (modifier-device :initarg :modifier-device :type (unsigned-byte 8))
           (key :initarg :key :type (unsigned-byte 8))
           (grabbed-device :initarg :grabbed-device :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj ungrab-device-key-request))
  (ungrab-device-key conn (slot-value %obj 'grab-window) (slot-value %obj 'modifiers)
   (slot-value %obj 'modifier-device) (slot-value %obj 'key) (slot-value %obj 'grabbed-device)))

;;; Request xcb.Input.GrabDeviceButton
(defun grab-device-button
       (conn grab-window grabbed-device modifier-device modifiers this-device-mode
        other-device-mode button owner-events classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card8 %buf grabbed-device)
    (xcb:buffer-write-card8 %buf modifier-device)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card16 %buf modifiers)
    (xcb:buffer-write-card8 %buf this-device-mode)
    (xcb:buffer-write-card8 %buf other-device-mode)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-bool %buf owner-events)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass grab-device-button-request (xcb:request)
          ((grab-window :initarg :grab-window :type xcb:window)
           (grabbed-device :initarg :grabbed-device :type (unsigned-byte 8))
           (modifier-device :initarg :modifier-device :type (unsigned-byte 8))
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (modifiers :initarg :modifiers :type (unsigned-byte 16))
           (this-device-mode :initarg :this-device-mode :type (unsigned-byte 8))
           (other-device-mode :initarg :other-device-mode :type (unsigned-byte 8))
           (button :initarg :button :type (unsigned-byte 8))
           (owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj grab-device-button-request))
  (grab-device-button conn (slot-value %obj 'grab-window) (slot-value %obj 'grabbed-device)
   (slot-value %obj 'modifier-device) (slot-value %obj 'modifiers)
   (slot-value %obj 'this-device-mode) (slot-value %obj 'other-device-mode)
   (slot-value %obj 'button) (slot-value %obj 'owner-events) (slot-value %obj 'classes)))

;;; Request xcb.Input.UngrabDeviceButton
(defun ungrab-device-button (conn grab-window modifiers modifier-device button grabbed-device)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card16 %buf modifiers)
    (xcb:buffer-write-card8 %buf modifier-device)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-card8 %buf grabbed-device)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass ungrab-device-button-request (xcb:request)
          ((grab-window :initarg :grab-window :type xcb:window)
           (modifiers :initarg :modifiers :type (unsigned-byte 16))
           (modifier-device :initarg :modifier-device :type (unsigned-byte 8))
           (button :initarg :button :type (unsigned-byte 8))
           (grabbed-device :initarg :grabbed-device :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj ungrab-device-button-request))
  (ungrab-device-button conn (slot-value %obj 'grab-window) (slot-value %obj 'modifiers)
   (slot-value %obj 'modifier-device) (slot-value %obj 'button) (slot-value %obj 'grabbed-device)))

;;; Enum xcb.Input.DeviceInputMode
(xcb:defenum input-device-input-mode
  (:async-this-device 0)
  (:sync-this-device 1)
  (:replay-this-device 2)
  (:async-other-devices 3)
  (:async-all 4)
  (:sync-all 5))

;;; Request xcb.Input.AllowDeviceEvents
(defun allow-device-events (conn time mode device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass allow-device-events-request (xcb:request)
          ((time :initarg :time :type xcb:timestamp) (mode :initarg :mode :type (unsigned-byte 8))
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj allow-device-events-request))
  (allow-device-events conn (slot-value %obj 'time) (slot-value %obj 'mode)
   (slot-value %obj 'device-id)))

;;; Request xcb.Input.GetDeviceFocus
(defun get-device-focus (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-focus-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-focus-request))
  (get-device-focus conn (slot-value %obj 'device-id)))
(defclass get-device-focus-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (focus :initarg :focus :accessor focus :type xcb:window)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (revert-to :initarg :revert-to :accessor revert-to :type (unsigned-byte 8))))
(defun decode-get-device-focus-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length focus time revert-to)
    (declare (ignorable %p response-type xi-reply-type sequence length focus time revert-to))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf focus (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf revert-to (xcb:read-card8-at %buf (+ %p 16)))
    (values
     (make-instance 'get-device-focus-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :focus focus :time time
                    :revert-to revert-to)
     (+ %pos 32 (* 4 length)))))
(defun get-device-focus-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-focus-reply))

;;; Request xcb.Input.SetDeviceFocus
(defun set-device-focus (conn focus time revert-to device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf focus)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf revert-to)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-device-focus-request (xcb:request)
          ((focus :initarg :focus :type xcb:window) (time :initarg :time :type xcb:timestamp)
           (revert-to :initarg :revert-to :type (unsigned-byte 8))
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj set-device-focus-request))
  (set-device-focus conn (slot-value %obj 'focus) (slot-value %obj 'time)
   (slot-value %obj 'revert-to) (slot-value %obj 'device-id)))

;;; Enum xcb.Input.FeedbackClass
(xcb:defenum input-feedback-class
  (:keyboard 0)
  (:pointer 1)
  (:string 2)
  (:integer 3)
  (:led 4)
  (:bell 5))

;;; xcb.Input.KbdFeedbackState
(defclass kbd-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (pitch :initarg :pitch :accessor pitch :type (unsigned-byte 16))
           (duration :initarg :duration :accessor duration :type (unsigned-byte 16))
           (led-mask :initarg :led-mask :accessor led-mask :type (unsigned-byte 32))
           (led-values :initarg :led-values :accessor led-values :type (unsigned-byte 32))
           (global-auto-repeat :initarg :global-auto-repeat :accessor global-auto-repeat :type
            (or boolean (unsigned-byte 8)))
           (click :initarg :click :accessor click :type (unsigned-byte 8))
           (percent :initarg :percent :accessor percent :type (unsigned-byte 8))
           (auto-repeats :initarg :auto-repeats :accessor auto-repeats :type cl:sequence)))
(defun encode-kbd-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (pitch (slot-value %obj 'pitch))
         (duration (slot-value %obj 'duration))
         (led-mask (slot-value %obj 'led-mask))
         (led-values (slot-value %obj 'led-values))
         (global-auto-repeat (slot-value %obj 'global-auto-repeat))
         (click (slot-value %obj 'click))
         (percent (slot-value %obj 'percent))
         (auto-repeats (slot-value %obj 'auto-repeats)))
    (declare
     (ignorable class-id feedback-id len pitch duration led-mask led-values global-auto-repeat
      click percent auto-repeats))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf pitch)
    (xcb:buffer-write-card16 %buf duration)
    (xcb:buffer-write-card32 %buf led-mask)
    (xcb:buffer-write-card32 %buf led-values)
    (xcb:buffer-write-bool %buf global-auto-repeat)
    (xcb:buffer-write-card8 %buf click)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-fixed-list %buf auto-repeats 32 #'xcb:buffer-write-card8 1)))
(defun decode-kbd-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        feedback-id
        len
        pitch
        duration
        led-mask
        led-values
        global-auto-repeat
        click
        percent
        auto-repeats)
    (declare
     (ignorable %p class-id feedback-id len pitch duration led-mask led-values global-auto-repeat
      click percent auto-repeats))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf pitch (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf duration (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf led-mask (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf led-values (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf global-auto-repeat (xcb:read-card8-at %buf (+ %p 16)))
    (setf click (xcb:read-card8-at %buf (+ %p 17)))
    (setf percent (xcb:read-card8-at %buf (+ %p 18)))
    (setf auto-repeats (xcb:read-vector-at %buf (+ %p 20) 32 %order :card8))
    (values
     (make-instance 'kbd-feedback-state :class-id class-id :feedback-id feedback-id :len len :pitch
                    pitch :duration duration :led-mask led-mask :led-values led-values
                    :global-auto-repeat global-auto-repeat :click click :percent percent
                    :auto-repeats auto-repeats)
     (+ %p 52))))

;;; xcb.Input.PtrFeedbackState
(defclass ptr-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (accel-num :initarg :accel-num :accessor accel-num :type (unsigned-byte 16))
           (accel-denom :initarg :accel-denom :accessor accel-denom :type (unsigned-byte 16))
           (threshold :initarg :threshold :accessor threshold :type (unsigned-byte 16))))
(defun encode-ptr-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (accel-num (slot-value %obj 'accel-num))
         (accel-denom (slot-value %obj 'accel-denom))
         (threshold (slot-value %obj 'threshold)))
    (declare (ignorable class-id feedback-id len accel-num accel-denom threshold))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card16 %buf accel-num)
    (xcb:buffer-write-card16 %buf accel-denom)
    (xcb:buffer-write-card16 %buf threshold)))
(defun decode-ptr-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len accel-num accel-denom threshold)
    (declare (ignorable %p class-id feedback-id len accel-num accel-denom threshold))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf accel-num (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf accel-denom (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf threshold (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'ptr-feedback-state :class-id class-id :feedback-id feedback-id :len len
                    :accel-num accel-num :accel-denom accel-denom :threshold threshold)
     (+ %p 12))))

;;; xcb.Input.IntegerFeedbackState
(defclass integer-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (resolution :initarg :resolution :accessor resolution :type (unsigned-byte 32))
           (min-value :initarg :min-value :accessor min-value :type (signed-byte 32))
           (max-value :initarg :max-value :accessor max-value :type (signed-byte 32))))
(defun encode-integer-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (resolution (slot-value %obj 'resolution))
         (min-value (slot-value %obj 'min-value))
         (max-value (slot-value %obj 'max-value)))
    (declare (ignorable class-id feedback-id len resolution min-value max-value))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf resolution)
    (xcb:buffer-write-card32 %buf min-value)
    (xcb:buffer-write-card32 %buf max-value)))
(defun decode-integer-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len resolution min-value max-value)
    (declare (ignorable %p class-id feedback-id len resolution min-value max-value))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf resolution (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf min-value (xcb:read-int32-at %buf (+ %p 8) %order))
    (setf max-value (xcb:read-int32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'integer-feedback-state :class-id class-id :feedback-id feedback-id :len len
                    :resolution resolution :min-value min-value :max-value max-value)
     (+ %p 16))))

;;; xcb.Input.StringFeedbackState
(defclass string-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (max-symbols :initarg :max-symbols :accessor max-symbols :type (unsigned-byte 16))
           (num-keysyms :initarg :num-keysyms :accessor num-keysyms :type (unsigned-byte 16))
           (keysyms :initarg :keysyms :accessor keysyms :type cl:sequence)))
(defun encode-string-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (max-symbols (slot-value %obj 'max-symbols))
         (keysyms (slot-value %obj 'keysyms))
         (num-keysyms (cl:length keysyms)))
    (declare (ignorable class-id feedback-id len max-symbols keysyms num-keysyms))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf max-symbols)
    (xcb:buffer-write-card16 %buf num-keysyms)
    (xcb:buffer-write-list %buf keysyms num-keysyms #'xcb:buffer-write-card32)))
(defun decode-string-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len max-symbols num-keysyms keysyms)
    (declare (ignorable %p class-id feedback-id len max-symbols num-keysyms keysyms))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf max-symbols (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-keysyms (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (keysyms %p) (xcb:read-vector-at %buf %p num-keysyms %order :card32))
    (values
     (make-instance 'string-feedback-state :class-id class-id :feedback-id feedback-id :len len
                    :max-symbols max-symbols :num-keysyms num-keysyms :keysyms keysyms)
     %p)))

;;; xcb.Input.BellFeedbackState
(defclass bell-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (percent :initarg :percent :accessor percent :type (unsigned-byte 8))
           (pitch :initarg :pitch :accessor pitch :type (unsigned-byte 16))
           (duration :initarg :duration :accessor duration :type (unsigned-byte 16))))
(defun encode-bell-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (percent (slot-value %obj 'percent))
         (pitch (slot-value %obj 'pitch))
         (duration (slot-value %obj 'duration)))
    (declare (ignorable class-id feedback-id len percent pitch duration))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card16 %buf pitch)
    (xcb:buffer-write-card16 %buf duration)))
(defun decode-bell-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len percent pitch duration)
    (declare (ignorable %p class-id feedback-id len percent pitch duration))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf percent (xcb:read-card8-at %buf (+ %p 4)))
    (setf pitch (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf duration (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'bell-feedback-state :class-id class-id :feedback-id feedback-id :len len
                    :percent percent :pitch pitch :duration duration)
     (+ %p 12))))

;;; xcb.Input.LedFeedbackState
(defclass led-feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (led-mask :initarg :led-mask :accessor led-mask :type (unsigned-byte 32))
           (led-values :initarg :led-values :accessor led-values :type (unsigned-byte 32))))
(defun encode-led-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (led-mask (slot-value %obj 'led-mask))
         (led-values (slot-value %obj 'led-values)))
    (declare (ignorable class-id feedback-id len led-mask led-values))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf led-mask)
    (xcb:buffer-write-card32 %buf led-values)))
(defun decode-led-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len led-mask led-values)
    (declare (ignorable %p class-id feedback-id len led-mask led-values))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf led-mask (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf led-values (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'led-feedback-state :class-id class-id :feedback-id feedback-id :len len
                    :led-mask led-mask :led-values led-values)
     (+ %p 12))))

;;; xcb.Input.FeedbackState
(defclass feedback-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (keyboard-pitch :initarg :keyboard-pitch :accessor keyboard-pitch :type
            (unsigned-byte 16))
           (keyboard-duration :initarg :keyboard-duration :accessor keyboard-duration :type
            (unsigned-byte 16))
           (keyboard-led-mask :initarg :keyboard-led-mask :accessor keyboard-led-mask :type
            (unsigned-byte 32))
           (keyboard-led-values :initarg :keyboard-led-values :accessor keyboard-led-values :type
            (unsigned-byte 32))
           (keyboard-global-auto-repeat :initarg :keyboard-global-auto-repeat :accessor
            keyboard-global-auto-repeat :type (or boolean (unsigned-byte 8)))
           (keyboard-click :initarg :keyboard-click :accessor keyboard-click :type
            (unsigned-byte 8))
           (keyboard-percent :initarg :keyboard-percent :accessor keyboard-percent :type
            (unsigned-byte 8))
           (keyboard-auto-repeats :initarg :keyboard-auto-repeats :accessor keyboard-auto-repeats
            :type cl:sequence)
           (pointer-accel-num :initarg :pointer-accel-num :accessor pointer-accel-num :type
            (unsigned-byte 16))
           (pointer-accel-denom :initarg :pointer-accel-denom :accessor pointer-accel-denom :type
            (unsigned-byte 16))
           (pointer-threshold :initarg :pointer-threshold :accessor pointer-threshold :type
            (unsigned-byte 16))
           (string-max-symbols :initarg :string-max-symbols :accessor string-max-symbols :type
            (unsigned-byte 16))
           (string-num-keysyms :initarg :string-num-keysyms :accessor string-num-keysyms :type
            (unsigned-byte 16))
           (string-keysyms :initarg :string-keysyms :accessor string-keysyms :type cl:sequence)
           (integer-resolution :initarg :integer-resolution :accessor integer-resolution :type
            (unsigned-byte 32))
           (integer-min-value :initarg :integer-min-value :accessor integer-min-value :type
            (signed-byte 32))
           (integer-max-value :initarg :integer-max-value :accessor integer-max-value :type
            (signed-byte 32))
           (led-led-mask :initarg :led-led-mask :accessor led-led-mask :type (unsigned-byte 32))
           (led-led-values :initarg :led-led-values :accessor led-led-values :type
            (unsigned-byte 32))
           (bell-percent :initarg :bell-percent :accessor bell-percent :type (unsigned-byte 8))
           (bell-pitch :initarg :bell-pitch :accessor bell-pitch :type (unsigned-byte 16))
           (bell-duration :initarg :bell-duration :accessor bell-duration :type
            (unsigned-byte 16))))
(defun encode-feedback-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len)))
    (declare (ignorable class-id feedback-id len))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (let ((%mask class-id))
      (when (eql %mask 0)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'keyboard-pitch))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'keyboard-duration))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'keyboard-led-mask))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'keyboard-led-values))
        (xcb:buffer-write-bool %buf (slot-value %obj 'keyboard-global-auto-repeat))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-click))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-percent))
        (xcb:buffer-write-padding %buf 1)
        (xcb:buffer-write-fixed-list %buf (slot-value %obj 'keyboard-auto-repeats) 32
         #'xcb:buffer-write-card8 1))
      (when (eql %mask 1)
        (xcb:buffer-write-padding %buf 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-accel-num))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-accel-denom))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-threshold)))
      (when (eql %mask 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'string-max-symbols))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'string-num-keysyms))
        (xcb:buffer-write-list %buf (slot-value %obj 'string-keysyms)
         (slot-value %obj 'string-num-keysyms) #'xcb:buffer-write-card32))
      (when (eql %mask 3)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'integer-resolution))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'integer-min-value))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'integer-max-value)))
      (when (eql %mask 4)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'led-led-mask))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'led-led-values)))
      (when (eql %mask 5)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'bell-percent))
        (xcb:buffer-write-padding %buf 3)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'bell-pitch))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'bell-duration))))))
(defun decode-feedback-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        feedback-id
        len
        keyboard-pitch
        keyboard-duration
        keyboard-led-mask
        keyboard-led-values
        keyboard-global-auto-repeat
        keyboard-click
        keyboard-percent
        keyboard-auto-repeats
        pointer-accel-num
        pointer-accel-denom
        pointer-threshold
        string-max-symbols
        string-num-keysyms
        string-keysyms
        integer-resolution
        integer-min-value
        integer-max-value
        led-led-mask
        led-led-values
        bell-percent
        bell-pitch
        bell-duration)
    (declare
     (ignorable %p class-id feedback-id len keyboard-pitch keyboard-duration keyboard-led-mask
      keyboard-led-values keyboard-global-auto-repeat keyboard-click keyboard-percent
      keyboard-auto-repeats pointer-accel-num pointer-accel-denom pointer-threshold
      string-max-symbols string-num-keysyms string-keysyms integer-resolution integer-min-value
      integer-max-value led-led-mask led-led-values bell-percent bell-pitch bell-duration))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (let ((%mask class-id))
      (when (eql %mask 0)
        (setf keyboard-pitch (xcb:read-card16-at %buf %p %order))
        (setf keyboard-duration (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf keyboard-led-mask (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf keyboard-led-values (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf keyboard-global-auto-repeat (xcb:read-card8-at %buf (+ %p 12)))
        (setf keyboard-click (xcb:read-card8-at %buf (+ %p 13)))
        (setf keyboard-percent (xcb:read-card8-at %buf (+ %p 14)))
        (setf keyboard-auto-repeats (xcb:read-vector-at %buf (+ %p 16) 32 %order :card8))
        (setf %p (+ %p 48)))
      (when (eql %mask 1)
        (setf pointer-accel-num (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf pointer-accel-denom (xcb:read-card16-at %buf (+ %p 4) %order))
        (setf pointer-threshold (xcb:read-card16-at %buf (+ %p 6) %order))
        (setf %p (+ %p 8)))
      (when (eql %mask 2)
        (setf string-max-symbols (xcb:read-card16-at %buf %p %order))
        (setf string-num-keysyms (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf %p (+ %p 4))
        (multiple-value-setq (string-keysyms %p)
          (xcb:read-vector-at %buf %p string-num-keysyms %order :card32)))
      (when (eql %mask 3)
        (setf integer-resolution (xcb:read-card32-at %buf %p %order))
        (setf integer-min-value (xcb:read-int32-at %buf (+ %p 4) %order))
        (setf integer-max-value (xcb:read-int32-at %buf (+ %p 8) %order))
        (setf %p (+ %p 12)))
      (when (eql %mask 4)
        (setf led-led-mask (xcb:read-card32-at %buf %p %order))
        (setf led-led-values (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf %p (+ %p 8)))
      (when (eql %mask 5)
        (setf bell-percent (xcb:read-card8-at %buf %p))
        (setf bell-pitch (xcb:read-card16-at %buf (+ %p 4) %order))
        (setf bell-duration (xcb:read-card16-at %buf (+ %p 6) %order))
        (setf %p (+ %p 8))))
    (let ((%obj
           (make-instance 'feedback-state :class-id class-id :feedback-id feedback-id :len len)))
      (when keyboard-pitch (setf (slot-value %obj 'keyboard-pitch) keyboard-pitch))
      (when keyboard-duration (setf (slot-value %obj 'keyboard-duration) keyboard-duration))
      (when keyboard-led-mask (setf (slot-value %obj 'keyboard-led-mask) keyboard-led-mask))
      (when keyboard-led-values (setf (slot-value %obj 'keyboard-led-values) keyboard-led-values))
      (when keyboard-global-auto-repeat
        (setf (slot-value %obj 'keyboard-global-auto-repeat) keyboard-global-auto-repeat))
      (when keyboard-click (setf (slot-value %obj 'keyboard-click) keyboard-click))
      (when keyboard-percent (setf (slot-value %obj 'keyboard-percent) keyboard-percent))
      (when keyboard-auto-repeats
        (setf (slot-value %obj 'keyboard-auto-repeats) keyboard-auto-repeats))
      (when pointer-accel-num (setf (slot-value %obj 'pointer-accel-num) pointer-accel-num))
      (when pointer-accel-denom (setf (slot-value %obj 'pointer-accel-denom) pointer-accel-denom))
      (when pointer-threshold (setf (slot-value %obj 'pointer-threshold) pointer-threshold))
      (when string-max-symbols (setf (slot-value %obj 'string-max-symbols) string-max-symbols))
      (when string-num-keysyms (setf (slot-value %obj 'string-num-keysyms) string-num-keysyms))
      (when string-keysyms (setf (slot-value %obj 'string-keysyms) string-keysyms))
      (when integer-resolution (setf (slot-value %obj 'integer-resolution) integer-resolution))
      (when integer-min-value (setf (slot-value %obj 'integer-min-value) integer-min-value))
      (when integer-max-value (setf (slot-value %obj 'integer-max-value) integer-max-value))
      (when led-led-mask (setf (slot-value %obj 'led-led-mask) led-led-mask))
      (when led-led-values (setf (slot-value %obj 'led-led-values) led-led-values))
      (when bell-percent (setf (slot-value %obj 'bell-percent) bell-percent))
      (when bell-pitch (setf (slot-value %obj 'bell-pitch) bell-pitch))
      (when bell-duration (setf (slot-value %obj 'bell-duration) bell-duration))
      (values %obj %p))))

;;; Request xcb.Input.GetFeedbackControl
(defun get-feedback-control (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-feedback-control-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-feedback-control-request))
  (get-feedback-control conn (slot-value %obj 'device-id)))
(defclass get-feedback-control-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-feedbacks :initarg :num-feedbacks :accessor num-feedbacks :type (unsigned-byte 16))
           (feedbacks :initarg :feedbacks :accessor feedbacks :type cl:sequence)))
(defun decode-get-feedback-control-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length num-feedbacks feedbacks)
    (declare (ignorable %p response-type xi-reply-type sequence length num-feedbacks feedbacks))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-feedbacks (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (feedbacks %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-feedbacks (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-feedback-state))
    (values
     (make-instance 'get-feedback-control-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :num-feedbacks num-feedbacks
                    :feedbacks feedbacks)
     (+ %pos 32 (* 4 length)))))
(defun get-feedback-control-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-feedback-control-reply))

;;; xcb.Input.KbdFeedbackCtl
(defclass kbd-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (key :initarg :key :accessor key :type key-code)
           (auto-repeat-mode :initarg :auto-repeat-mode :accessor auto-repeat-mode :type
            (unsigned-byte 8))
           (key-click-percent :initarg :key-click-percent :accessor key-click-percent :type
            (signed-byte 8))
           (bell-percent :initarg :bell-percent :accessor bell-percent :type (signed-byte 8))
           (bell-pitch :initarg :bell-pitch :accessor bell-pitch :type (signed-byte 16))
           (bell-duration :initarg :bell-duration :accessor bell-duration :type (signed-byte 16))
           (led-mask :initarg :led-mask :accessor led-mask :type (unsigned-byte 32))
           (led-values :initarg :led-values :accessor led-values :type (unsigned-byte 32))))
(defun encode-kbd-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (key (slot-value %obj 'key))
         (auto-repeat-mode (slot-value %obj 'auto-repeat-mode))
         (key-click-percent (slot-value %obj 'key-click-percent))
         (bell-percent (slot-value %obj 'bell-percent))
         (bell-pitch (slot-value %obj 'bell-pitch))
         (bell-duration (slot-value %obj 'bell-duration))
         (led-mask (slot-value %obj 'led-mask))
         (led-values (slot-value %obj 'led-values)))
    (declare
     (ignorable class-id feedback-id len key auto-repeat-mode key-click-percent bell-percent
      bell-pitch bell-duration led-mask led-values))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf key)
    (xcb:buffer-write-card8 %buf auto-repeat-mode)
    (xcb:buffer-write-card8 %buf key-click-percent)
    (xcb:buffer-write-card8 %buf bell-percent)
    (xcb:buffer-write-card16 %buf bell-pitch)
    (xcb:buffer-write-card16 %buf bell-duration)
    (xcb:buffer-write-card32 %buf led-mask)
    (xcb:buffer-write-card32 %buf led-values)))
(defun decode-kbd-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        feedback-id
        len
        key
        auto-repeat-mode
        key-click-percent
        bell-percent
        bell-pitch
        bell-duration
        led-mask
        led-values)
    (declare
     (ignorable %p class-id feedback-id len key auto-repeat-mode key-click-percent bell-percent
      bell-pitch bell-duration led-mask led-values))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf key (xcb:read-card8-at %buf (+ %p 4)))
    (setf auto-repeat-mode (xcb:read-card8-at %buf (+ %p 5)))
    (setf key-click-percent (xcb:read-int8-at %buf (+ %p 6)))
    (setf bell-percent (xcb:read-int8-at %buf (+ %p 7)))
    (setf bell-pitch (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf bell-duration (xcb:read-int16-at %buf (+ %p 10) %order))
    (setf led-mask (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf led-values (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'kbd-feedback-ctl :class-id class-id :feedback-id feedback-id :len len :key key
                    :auto-repeat-mode auto-repeat-mode :key-click-percent key-click-percent
                    :bell-percent bell-percent :bell-pitch bell-pitch :bell-duration bell-duration
                    :led-mask led-mask :led-values led-values)
     (+ %p 20))))

;;; xcb.Input.PtrFeedbackCtl
(defclass ptr-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (num :initarg :num :accessor num :type (signed-byte 16))
           (denom :initarg :denom :accessor denom :type (signed-byte 16))
           (threshold :initarg :threshold :accessor threshold :type (signed-byte 16))))
(defun encode-ptr-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (num (slot-value %obj 'num))
         (denom (slot-value %obj 'denom))
         (threshold (slot-value %obj 'threshold)))
    (declare (ignorable class-id feedback-id len num denom threshold))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card16 %buf num)
    (xcb:buffer-write-card16 %buf denom)
    (xcb:buffer-write-card16 %buf threshold)))
(defun decode-ptr-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len num denom threshold)
    (declare (ignorable %p class-id feedback-id len num denom threshold))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf num (xcb:read-int16-at %buf (+ %p 6) %order))
    (setf denom (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf threshold (xcb:read-int16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'ptr-feedback-ctl :class-id class-id :feedback-id feedback-id :len len :num num
                    :denom denom :threshold threshold)
     (+ %p 12))))

;;; xcb.Input.IntegerFeedbackCtl
(defclass integer-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (int-to-display :initarg :int-to-display :accessor int-to-display :type
            (signed-byte 32))))
(defun encode-integer-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (int-to-display (slot-value %obj 'int-to-display)))
    (declare (ignorable class-id feedback-id len int-to-display))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf int-to-display)))
(defun decode-integer-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len int-to-display)
    (declare (ignorable %p class-id feedback-id len int-to-display))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf int-to-display (xcb:read-int32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'integer-feedback-ctl :class-id class-id :feedback-id feedback-id :len len
                    :int-to-display int-to-display)
     (+ %p 8))))

;;; xcb.Input.StringFeedbackCtl
(defclass string-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (num-keysyms :initarg :num-keysyms :accessor num-keysyms :type (unsigned-byte 16))
           (keysyms :initarg :keysyms :accessor keysyms :type cl:sequence)))
(defun encode-string-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (keysyms (slot-value %obj 'keysyms))
         (num-keysyms (cl:length keysyms)))
    (declare (ignorable class-id feedback-id len keysyms num-keysyms))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card16 %buf num-keysyms)
    (xcb:buffer-write-list %buf keysyms num-keysyms #'xcb:buffer-write-card32)))
(defun decode-string-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len num-keysyms keysyms)
    (declare (ignorable %p class-id feedback-id len num-keysyms keysyms))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf num-keysyms (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (keysyms %p) (xcb:read-vector-at %buf %p num-keysyms %order :card32))
    (values
     (make-instance 'string-feedback-ctl :class-id class-id :feedback-id feedback-id :len len
                    :num-keysyms num-keysyms :keysyms keysyms)
     %p)))

;;; xcb.Input.BellFeedbackCtl
(defclass bell-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (percent :initarg :percent :accessor percent :type (signed-byte 8))
           (pitch :initarg :pitch :accessor pitch :type (signed-byte 16))
           (duration :initarg :duration :accessor duration :type (signed-byte 16))))
(defun encode-bell-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (percent (slot-value %obj 'percent))
         (pitch (slot-value %obj 'pitch))
         (duration (slot-value %obj 'duration)))
    (declare (ignorable class-id feedback-id len percent pitch duration))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card16 %buf pitch)
    (xcb:buffer-write-card16 %buf duration)))
(defun decode-bell-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len percent pitch duration)
    (declare (ignorable %p class-id feedback-id len percent pitch duration))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf percent (xcb:read-int8-at %buf (+ %p 4)))
    (setf pitch (xcb:read-int16-at %buf (+ %p 8) %order))
    (setf duration (xcb:read-int16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'bell-feedback-ctl :class-id class-id :feedback-id feedback-id :len len
                    :percent percent :pitch pitch :duration duration)
     (+ %p 12))))

;;; xcb.Input.LedFeedbackCtl
(defclass led-feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (led-mask :initarg :led-mask :accessor led-mask :type (unsigned-byte 32))
           (led-values :initarg :led-values :accessor led-values :type (unsigned-byte 32))))
(defun encode-led-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len))
         (led-mask (slot-value %obj 'led-mask))
         (led-values (slot-value %obj 'led-values)))
    (declare (ignorable class-id feedback-id len led-mask led-values))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf led-mask)
    (xcb:buffer-write-card32 %buf led-values)))
(defun decode-led-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id feedback-id len led-mask led-values)
    (declare (ignorable %p class-id feedback-id len led-mask led-values))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf led-mask (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf led-values (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'led-feedback-ctl :class-id class-id :feedback-id feedback-id :len len
                    :led-mask led-mask :led-values led-values)
     (+ %p 12))))

;;; xcb.Input.FeedbackCtl
(defclass feedback-ctl nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :accessor feedback-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (keyboard-key :initarg :keyboard-key :accessor keyboard-key :type key-code)
           (keyboard-auto-repeat-mode :initarg :keyboard-auto-repeat-mode :accessor
            keyboard-auto-repeat-mode :type (unsigned-byte 8))
           (keyboard-key-click-percent :initarg :keyboard-key-click-percent :accessor
            keyboard-key-click-percent :type (signed-byte 8))
           (keyboard-bell-percent :initarg :keyboard-bell-percent :accessor keyboard-bell-percent
            :type (signed-byte 8))
           (keyboard-bell-pitch :initarg :keyboard-bell-pitch :accessor keyboard-bell-pitch :type
            (signed-byte 16))
           (keyboard-bell-duration :initarg :keyboard-bell-duration :accessor
            keyboard-bell-duration :type (signed-byte 16))
           (keyboard-led-mask :initarg :keyboard-led-mask :accessor keyboard-led-mask :type
            (unsigned-byte 32))
           (keyboard-led-values :initarg :keyboard-led-values :accessor keyboard-led-values :type
            (unsigned-byte 32))
           (pointer-num :initarg :pointer-num :accessor pointer-num :type (signed-byte 16))
           (pointer-denom :initarg :pointer-denom :accessor pointer-denom :type (signed-byte 16))
           (pointer-threshold :initarg :pointer-threshold :accessor pointer-threshold :type
            (signed-byte 16))
           (string-num-keysyms :initarg :string-num-keysyms :accessor string-num-keysyms :type
            (unsigned-byte 16))
           (string-keysyms :initarg :string-keysyms :accessor string-keysyms :type cl:sequence)
           (integer-int-to-display :initarg :integer-int-to-display :accessor
            integer-int-to-display :type (signed-byte 32))
           (led-led-mask :initarg :led-led-mask :accessor led-led-mask :type (unsigned-byte 32))
           (led-led-values :initarg :led-led-values :accessor led-led-values :type
            (unsigned-byte 32))
           (bell-percent :initarg :bell-percent :accessor bell-percent :type (signed-byte 8))
           (bell-pitch :initarg :bell-pitch :accessor bell-pitch :type (signed-byte 16))
           (bell-duration :initarg :bell-duration :accessor bell-duration :type (signed-byte 16))))
(defun encode-feedback-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (feedback-id (slot-value %obj 'feedback-id))
         (len (slot-value %obj 'len)))
    (declare (ignorable class-id feedback-id len))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card16 %buf len)
    (let ((%mask class-id))
      (when (eql %mask 0)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-key))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-auto-repeat-mode))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-key-click-percent))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'keyboard-bell-percent))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'keyboard-bell-pitch))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'keyboard-bell-duration))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'keyboard-led-mask))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'keyboard-led-values)))
      (when (eql %mask 1)
        (xcb:buffer-write-padding %buf 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-num))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-denom))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'pointer-threshold)))
      (when (eql %mask 2)
        (xcb:buffer-write-padding %buf 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'string-num-keysyms))
        (xcb:buffer-write-list %buf (slot-value %obj 'string-keysyms)
         (slot-value %obj 'string-num-keysyms) #'xcb:buffer-write-card32))
      (when (eql %mask 3) (xcb:buffer-write-card32 %buf (slot-value %obj 'integer-int-to-display)))
      (when (eql %mask 4)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'led-led-mask))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'led-led-values)))
      (when (eql %mask 5)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'bell-percent))
        (xcb:buffer-write-padding %buf 3)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'bell-pitch))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'bell-duration))))))
(defun decode-feedback-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        feedback-id
        len
        keyboard-key
        keyboard-auto-repeat-mode
        keyboard-key-click-percent
        keyboard-bell-percent
        keyboard-bell-pitch
        keyboard-bell-duration
        keyboard-led-mask
        keyboard-led-values
        pointer-num
        pointer-denom
        pointer-threshold
        string-num-keysyms
        string-keysyms
        integer-int-to-display
        led-led-mask
        led-led-values
        bell-percent
        bell-pitch
        bell-duration)
    (declare
     (ignorable %p class-id feedback-id len keyboard-key keyboard-auto-repeat-mode
      keyboard-key-click-percent keyboard-bell-percent keyboard-bell-pitch keyboard-bell-duration
      keyboard-led-mask keyboard-led-values pointer-num pointer-denom pointer-threshold
      string-num-keysyms string-keysyms integer-int-to-display led-led-mask led-led-values
      bell-percent bell-pitch bell-duration))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf feedback-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (let ((%mask class-id))
      (when (eql %mask 0)
        (setf keyboard-key (xcb:read-card8-at %buf %p))
        (setf keyboard-auto-repeat-mode (xcb:read-card8-at %buf (+ %p 1)))
        (setf keyboard-key-click-percent (xcb:read-int8-at %buf (+ %p 2)))
        (setf keyboard-bell-percent (xcb:read-int8-at %buf (+ %p 3)))
        (setf keyboard-bell-pitch (xcb:read-int16-at %buf (+ %p 4) %order))
        (setf keyboard-bell-duration (xcb:read-int16-at %buf (+ %p 6) %order))
        (setf keyboard-led-mask (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf keyboard-led-values (xcb:read-card32-at %buf (+ %p 12) %order))
        (setf %p (+ %p 16)))
      (when (eql %mask 1)
        (setf pointer-num (xcb:read-int16-at %buf (+ %p 2) %order))
        (setf pointer-denom (xcb:read-int16-at %buf (+ %p 4) %order))
        (setf pointer-threshold (xcb:read-int16-at %buf (+ %p 6) %order))
        (setf %p (+ %p 8)))
      (when (eql %mask 2)
        (setf string-num-keysyms (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf %p (+ %p 4))
        (multiple-value-setq (string-keysyms %p)
          (xcb:read-vector-at %buf %p string-num-keysyms %order :card32)))
      (when (eql %mask 3)
        (setf integer-int-to-display (xcb:read-int32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (eql %mask 4)
        (setf led-led-mask (xcb:read-card32-at %buf %p %order))
        (setf led-led-values (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf %p (+ %p 8)))
      (when (eql %mask 5)
        (setf bell-percent (xcb:read-int8-at %buf %p))
        (setf bell-pitch (xcb:read-int16-at %buf (+ %p 4) %order))
        (setf bell-duration (xcb:read-int16-at %buf (+ %p 6) %order))
        (setf %p (+ %p 8))))
    (let ((%obj (make-instance 'feedback-ctl :class-id class-id :feedback-id feedback-id :len len)))
      (when keyboard-key (setf (slot-value %obj 'keyboard-key) keyboard-key))
      (when keyboard-auto-repeat-mode
        (setf (slot-value %obj 'keyboard-auto-repeat-mode) keyboard-auto-repeat-mode))
      (when keyboard-key-click-percent
        (setf (slot-value %obj 'keyboard-key-click-percent) keyboard-key-click-percent))
      (when keyboard-bell-percent
        (setf (slot-value %obj 'keyboard-bell-percent) keyboard-bell-percent))
      (when keyboard-bell-pitch (setf (slot-value %obj 'keyboard-bell-pitch) keyboard-bell-pitch))
      (when keyboard-bell-duration
        (setf (slot-value %obj 'keyboard-bell-duration) keyboard-bell-duration))
      (when keyboard-led-mask (setf (slot-value %obj 'keyboard-led-mask) keyboard-led-mask))
      (when keyboard-led-values (setf (slot-value %obj 'keyboard-led-values) keyboard-led-values))
      (when pointer-num (setf (slot-value %obj 'pointer-num) pointer-num))
      (when pointer-denom (setf (slot-value %obj 'pointer-denom) pointer-denom))
      (when pointer-threshold (setf (slot-value %obj 'pointer-threshold) pointer-threshold))
      (when string-num-keysyms (setf (slot-value %obj 'string-num-keysyms) string-num-keysyms))
      (when string-keysyms (setf (slot-value %obj 'string-keysyms) string-keysyms))
      (when integer-int-to-display
        (setf (slot-value %obj 'integer-int-to-display) integer-int-to-display))
      (when led-led-mask (setf (slot-value %obj 'led-led-mask) led-led-mask))
      (when led-led-values (setf (slot-value %obj 'led-led-values) led-led-values))
      (when bell-percent (setf (slot-value %obj 'bell-percent) bell-percent))
      (when bell-pitch (setf (slot-value %obj 'bell-pitch) bell-pitch))
      (when bell-duration (setf (slot-value %obj 'bell-duration) bell-duration))
      (values %obj %p))))

;;; Enum xcb.Input.ChangeFeedbackControlMask
(xcb:defenum input-change-feedback-control-mask
  (:key-click-percent 1)
  (:percent 2)
  (:pitch 4)
  (:duration 8)
  (:led 16)
  (:led-mode 32)
  (:key 64)
  (:auto-repeat-mode 128)
  (:string 1)
  (:integer 1)
  (:accel-num 1)
  (:accel-denom 2)
  (:threshold 4))

;;; Request xcb.Input.ChangeFeedbackControl
(defun change-feedback-control (conn mask device-id feedback-id feedback)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf mask)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-padding %buf 2)
    (encode-feedback-ctl %buf feedback)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-feedback-control-request (xcb:request)
          ((mask :initarg :mask :type (unsigned-byte 32))
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :type (unsigned-byte 8))
           (feedback :initarg :feedback :type feedback-ctl)))
(defmethod xcb:send-request (conn (%obj change-feedback-control-request))
  (change-feedback-control conn (slot-value %obj 'mask) (slot-value %obj 'device-id)
   (slot-value %obj 'feedback-id) (slot-value %obj 'feedback)))

;;; Request xcb.Input.GetDeviceKeyMapping
(defun get-device-key-mapping (conn device-id first-keycode count)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf first-keycode)
    (xcb:buffer-write-card8 %buf count)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-key-mapping-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (first-keycode :initarg :first-keycode :type key-code)
           (count :initarg :count :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-key-mapping-request))
  (get-device-key-mapping conn (slot-value %obj 'device-id) (slot-value %obj 'first-keycode)
   (slot-value %obj 'count)))
(defclass get-device-key-mapping-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (keysyms-per-keycode :initarg :keysyms-per-keycode :accessor keysyms-per-keycode :type
            (unsigned-byte 8))
           (keysyms :initarg :keysyms :accessor keysyms :type cl:sequence)))
(defun decode-get-device-key-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length keysyms-per-keycode keysyms)
    (declare
     (ignorable %p response-type xi-reply-type sequence length keysyms-per-keycode keysyms))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf keysyms-per-keycode (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (keysyms %p)
      (xcb:read-vector-at %buf %p (cl:min length (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'get-device-key-mapping-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :keysyms-per-keycode
                    keysyms-per-keycode :keysyms keysyms)
     (+ %pos 32 (* 4 length)))))
(defun get-device-key-mapping-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-key-mapping-reply))

;;; Request xcb.Input.ChangeDeviceKeyMapping
(defun change-device-key-mapping
       (conn device-id first-keycode keysyms-per-keycode keycode-count keysyms)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 25)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf first-keycode)
    (xcb:buffer-write-card8 %buf keysyms-per-keycode)
    (xcb:buffer-write-card8 %buf keycode-count)
    (xcb:buffer-write-list %buf keysyms (* keycode-count keysyms-per-keycode)
     #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-device-key-mapping-request (xcb:request)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (first-keycode :initarg :first-keycode :type key-code)
           (keysyms-per-keycode :initarg :keysyms-per-keycode :type (unsigned-byte 8))
           (keycode-count :initarg :keycode-count :type (unsigned-byte 8))
           (keysyms :initarg :keysyms :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-device-key-mapping-request))
  (change-device-key-mapping conn (slot-value %obj 'device-id) (slot-value %obj 'first-keycode)
   (slot-value %obj 'keysyms-per-keycode) (slot-value %obj 'keycode-count)
   (slot-value %obj 'keysyms)))

;;; Request xcb.Input.GetDeviceModifierMapping
(defun get-device-modifier-mapping (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 26)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-modifier-mapping-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-modifier-mapping-request))
  (get-device-modifier-mapping conn (slot-value %obj 'device-id)))
(defclass get-device-modifier-mapping-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (keycodes-per-modifier :initarg :keycodes-per-modifier :accessor keycodes-per-modifier
            :type (unsigned-byte 8))
           (keymaps :initarg :keymaps :accessor keymaps :type cl:sequence)))
(defun decode-get-device-modifier-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length keycodes-per-modifier keymaps)
    (declare
     (ignorable %p response-type xi-reply-type sequence length keycodes-per-modifier keymaps))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf keycodes-per-modifier (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (keymaps %p)
      (xcb:read-vector-at %buf %p
       (cl:min (* keycodes-per-modifier 8) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (values
     (make-instance 'get-device-modifier-mapping-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :keycodes-per-modifier
                    keycodes-per-modifier :keymaps keymaps)
     (+ %pos 32 (* 4 length)))))
(defun get-device-modifier-mapping-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-modifier-mapping-reply))

;;; Request xcb.Input.SetDeviceModifierMapping
(defun set-device-modifier-mapping (conn device-id keycodes-per-modifier keymaps)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 27)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf keycodes-per-modifier)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-octets %buf keymaps :end (* keycodes-per-modifier 8))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-device-modifier-mapping-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (keycodes-per-modifier :initarg :keycodes-per-modifier :type (unsigned-byte 8))
           (keymaps :initarg :keymaps :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-modifier-mapping-request))
  (set-device-modifier-mapping conn (slot-value %obj 'device-id)
   (slot-value %obj 'keycodes-per-modifier) (slot-value %obj 'keymaps)))
(defclass set-device-modifier-mapping-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-set-device-modifier-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'set-device-modifier-mapping-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun set-device-modifier-mapping-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-device-modifier-mapping-reply))

;;; Request xcb.Input.GetDeviceButtonMapping
(defun get-device-button-mapping (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 28)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-button-mapping-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-button-mapping-request))
  (get-device-button-mapping conn (slot-value %obj 'device-id)))
(defclass get-device-button-mapping-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (map-size :initarg :map-size :accessor map-size :type (unsigned-byte 8))
           (map :initarg :map :accessor map :type cl:sequence)))
(defun decode-get-device-button-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length map-size map)
    (declare (ignorable %p response-type xi-reply-type sequence length map-size map))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf map-size (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (map %p)
      (xcb:read-vector-at %buf %p (cl:min map-size (floor (- (+ %pos 32 (* 4 length)) %p) 1))
       %order :card8))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'get-device-button-mapping-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :map-size map-size :map map)
     (+ %pos 32 (* 4 length)))))
(defun get-device-button-mapping-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-button-mapping-reply))

;;; Request xcb.Input.SetDeviceButtonMapping
(defun set-device-button-mapping (conn device-id map)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (map-size (cl:length map)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 29)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf map-size)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-octets %buf map :end map-size)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-device-button-mapping-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (map-size :initarg :map-size :type (unsigned-byte 8))
           (map :initarg :map :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-button-mapping-request))
  (set-device-button-mapping conn (slot-value %obj 'device-id) (slot-value %obj 'map)))
(defclass set-device-button-mapping-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-set-device-button-mapping-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'set-device-button-mapping-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun set-device-button-mapping-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-device-button-mapping-reply))

;;; xcb.Input.KeyState
(defclass key-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (num-keys :initarg :num-keys :accessor num-keys :type (unsigned-byte 8))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun encode-key-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (num-keys (slot-value %obj 'num-keys))
         (keys (slot-value %obj 'keys)))
    (declare (ignorable class-id len num-keys keys))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card8 %buf num-keys)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-fixed-list %buf keys 32 #'xcb:buffer-write-card8 1)))
(defun decode-key-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len num-keys keys)
    (declare (ignorable %p class-id len num-keys keys))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf num-keys (xcb:read-card8-at %buf (+ %p 2)))
    (setf keys (xcb:read-vector-at %buf (+ %p 4) 32 %order :card8))
    (values (make-instance 'key-state :class-id class-id :len len :num-keys num-keys :keys keys)
            (+ %p 36))))

;;; xcb.Input.ButtonState
(defclass button-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (num-buttons :initarg :num-buttons :accessor num-buttons :type (unsigned-byte 8))
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun encode-button-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (num-buttons (slot-value %obj 'num-buttons))
         (buttons (slot-value %obj 'buttons)))
    (declare (ignorable class-id len num-buttons buttons))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card8 %buf num-buttons)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-fixed-list %buf buttons 32 #'xcb:buffer-write-card8 1)))
(defun decode-button-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len num-buttons buttons)
    (declare (ignorable %p class-id len num-buttons buttons))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf num-buttons (xcb:read-card8-at %buf (+ %p 2)))
    (setf buttons (xcb:read-vector-at %buf (+ %p 4) 32 %order :card8))
    (values
     (make-instance 'button-state :class-id class-id :len len :num-buttons num-buttons :buttons
                    buttons)
     (+ %p 36))))

;;; Enum xcb.Input.ValuatorStateModeMask
(xcb:defenum input-valuator-state-mode-mask
  (:device-mode-absolute 1)
  (:out-of-proximity 2))

;;; xcb.Input.ValuatorState
(defclass valuator-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (num-valuators :initarg :num-valuators :accessor num-valuators :type (unsigned-byte 8))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (valuators :initarg :valuators :accessor valuators :type cl:sequence)))
(defun encode-valuator-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id))
         (len (slot-value %obj 'len))
         (mode (slot-value %obj 'mode))
         (valuators (slot-value %obj 'valuators))
         (num-valuators (cl:length valuators)))
    (declare (ignorable class-id len mode valuators num-valuators))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (xcb:buffer-write-card8 %buf num-valuators)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-list %buf valuators num-valuators #'xcb:buffer-write-card32)))
(defun decode-valuator-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) class-id len num-valuators mode valuators)
    (declare (ignorable %p class-id len num-valuators mode valuators))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf num-valuators (xcb:read-card8-at %buf (+ %p 2)))
    (setf mode (xcb:read-card8-at %buf (+ %p 3)))
    (setf %p (+ %p 4))
    (multiple-value-setq (valuators %p) (xcb:read-vector-at %buf %p num-valuators %order :int32))
    (values
     (make-instance 'valuator-state :class-id class-id :len len :num-valuators num-valuators :mode
                    mode :valuators valuators)
     %p)))

;;; xcb.Input.InputState
(defclass input-state nil
          ((class-id :initarg :class-id :accessor class-id :type (unsigned-byte 8))
           (len :initarg :len :accessor len :type (unsigned-byte 8))
           (key-num-keys :initarg :key-num-keys :accessor key-num-keys :type (unsigned-byte 8))
           (key-keys :initarg :key-keys :accessor key-keys :type cl:sequence)
           (button-num-buttons :initarg :button-num-buttons :accessor button-num-buttons :type
            (unsigned-byte 8))
           (button-buttons :initarg :button-buttons :accessor button-buttons :type cl:sequence)
           (valuator-num-valuators :initarg :valuator-num-valuators :accessor
            valuator-num-valuators :type (unsigned-byte 8))
           (valuator-mode :initarg :valuator-mode :accessor valuator-mode :type (unsigned-byte 8))
           (valuator-valuators :initarg :valuator-valuators :accessor valuator-valuators :type
            cl:sequence)))
(defun encode-input-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((class-id (slot-value %obj 'class-id)) (len (slot-value %obj 'len)))
    (declare (ignorable class-id len))
    (xcb:buffer-write-card8 %buf class-id)
    (xcb:buffer-write-card8 %buf len)
    (let ((%mask class-id))
      (when (eql %mask 0)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'key-num-keys))
        (xcb:buffer-write-padding %buf 1)
        (xcb:buffer-write-fixed-list %buf (slot-value %obj 'key-keys) 32 #'xcb:buffer-write-card8
         1))
      (when (eql %mask 1)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'button-num-buttons))
        (xcb:buffer-write-padding %buf 1)
        (xcb:buffer-write-fixed-list %buf (slot-value %obj 'button-buttons) 32
         #'xcb:buffer-write-card8 1))
      (when (eql %mask 2)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'valuator-num-valuators))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'valuator-mode))
        (xcb:buffer-write-list %buf (slot-value %obj 'valuator-valuators)
         (slot-value %obj 'valuator-num-valuators) #'xcb:buffer-write-card32)))))
(defun decode-input-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        class-id
        len
        key-num-keys
        key-keys
        button-num-buttons
        button-buttons
        valuator-num-valuators
        valuator-mode
        valuator-valuators)
    (declare
     (ignorable %p class-id len key-num-keys key-keys button-num-buttons button-buttons
      valuator-num-valuators valuator-mode valuator-valuators))
    (setf class-id (xcb:read-card8-at %buf %p))
    (setf len (xcb:read-card8-at %buf (+ %p 1)))
    (setf %p (+ %p 2))
    (let ((%mask class-id))
      (when (eql %mask 0)
        (setf key-num-keys (xcb:read-card8-at %buf %p))
        (setf key-keys (xcb:read-vector-at %buf (+ %p 2) 32 %order :card8))
        (setf %p (+ %p 34)))
      (when (eql %mask 1)
        (setf button-num-buttons (xcb:read-card8-at %buf %p))
        (setf button-buttons (xcb:read-vector-at %buf (+ %p 2) 32 %order :card8))
        (setf %p (+ %p 34)))
      (when (eql %mask 2)
        (setf valuator-num-valuators (xcb:read-card8-at %buf %p))
        (setf valuator-mode (xcb:read-card8-at %buf (+ %p 1)))
        (setf %p (+ %p 2))
        (multiple-value-setq (valuator-valuators %p)
          (xcb:read-vector-at %buf %p valuator-num-valuators %order :int32))))
    (let ((%obj (make-instance 'input-state :class-id class-id :len len)))
      (when key-num-keys (setf (slot-value %obj 'key-num-keys) key-num-keys))
      (when key-keys (setf (slot-value %obj 'key-keys) key-keys))
      (when button-num-buttons (setf (slot-value %obj 'button-num-buttons) button-num-buttons))
      (when button-buttons (setf (slot-value %obj 'button-buttons) button-buttons))
      (when valuator-num-valuators
        (setf (slot-value %obj 'valuator-num-valuators) valuator-num-valuators))
      (when valuator-mode (setf (slot-value %obj 'valuator-mode) valuator-mode))
      (when valuator-valuators (setf (slot-value %obj 'valuator-valuators) valuator-valuators))
      (values %obj %p))))

;;; Request xcb.Input.QueryDeviceState
(defun query-device-state (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 30)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-device-state-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj query-device-state-request))
  (query-device-state conn (slot-value %obj 'device-id)))
(defclass query-device-state-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-classes :initarg :num-classes :accessor num-classes :type (unsigned-byte 8))
           (classes :initarg :classes :accessor classes :type cl:sequence)))
(defun decode-query-device-state-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length num-classes classes)
    (declare (ignorable %p response-type xi-reply-type sequence length num-classes classes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-classes (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (classes %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-classes (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-input-state))
    (values
     (make-instance 'query-device-state-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :num-classes num-classes
                    :classes classes)
     (+ %pos 32 (* 4 length)))))
(defun query-device-state-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-query-device-state-reply))

;;; Request xcb.Input.DeviceBell
(defun device-bell (conn device-id feedback-id feedback-class percent)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 32)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf feedback-id)
    (xcb:buffer-write-card8 %buf feedback-class)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass device-bell-request (xcb:request)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (feedback-id :initarg :feedback-id :type (unsigned-byte 8))
           (feedback-class :initarg :feedback-class :type (unsigned-byte 8))
           (percent :initarg :percent :type (signed-byte 8))))
(defmethod xcb:send-request (conn (%obj device-bell-request))
  (device-bell conn (slot-value %obj 'device-id) (slot-value %obj 'feedback-id)
   (slot-value %obj 'feedback-class) (slot-value %obj 'percent)))

;;; Request xcb.Input.SetDeviceValuators
(defun set-device-valuators (conn device-id first-valuator valuators)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-valuators (cl:length valuators)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 33)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf first-valuator)
    (xcb:buffer-write-card8 %buf num-valuators)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-list %buf valuators num-valuators #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-device-valuators-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))
           (first-valuator :initarg :first-valuator :type (unsigned-byte 8))
           (num-valuators :initarg :num-valuators :type (unsigned-byte 8))
           (valuators :initarg :valuators :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-valuators-request))
  (set-device-valuators conn (slot-value %obj 'device-id) (slot-value %obj 'first-valuator)
   (slot-value %obj 'valuators)))
(defclass set-device-valuators-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-set-device-valuators-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'set-device-valuators-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun set-device-valuators-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-device-valuators-reply))

;;; Enum xcb.Input.DeviceControl
(xcb:defenum input-device-control
  (:resolution 1)
  (:abs-calib 2)
  (:core 3)
  (:enable 4)
  (:abs-area 5))

;;; xcb.Input.DeviceResolutionState
(defclass device-resolution-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (num-valuators :initarg :num-valuators :accessor num-valuators :type (unsigned-byte 32))
           (resolution-values :initarg :resolution-values :accessor resolution-values :type
            cl:sequence)
           (resolution-min :initarg :resolution-min :accessor resolution-min :type cl:sequence)
           (resolution-max :initarg :resolution-max :accessor resolution-max :type cl:sequence)))
(defun encode-device-resolution-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (resolution-values (slot-value %obj 'resolution-values))
         (resolution-min (slot-value %obj 'resolution-min))
         (resolution-max (slot-value %obj 'resolution-max))
         (num-valuators (cl:length resolution-values)))
    (declare
     (ignorable control-id len resolution-values resolution-min resolution-max num-valuators))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf num-valuators)
    (xcb:buffer-write-list %buf resolution-values num-valuators #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf resolution-min num-valuators #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf resolution-max num-valuators #'xcb:buffer-write-card32)))
(defun decode-device-resolution-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len num-valuators resolution-values resolution-min resolution-max)
    (declare
     (ignorable %p control-id len num-valuators resolution-values resolution-min resolution-max))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf num-valuators (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (resolution-values %p)
      (xcb:read-vector-at %buf %p num-valuators %order :card32))
    (multiple-value-setq (resolution-min %p)
      (xcb:read-vector-at %buf %p num-valuators %order :card32))
    (multiple-value-setq (resolution-max %p)
      (xcb:read-vector-at %buf %p num-valuators %order :card32))
    (values
     (make-instance 'device-resolution-state :control-id control-id :len len :num-valuators
                    num-valuators :resolution-values resolution-values :resolution-min
                    resolution-min :resolution-max resolution-max)
     %p)))

;;; xcb.Input.DeviceAbsCalibState
(defclass device-abs-calib-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (min-x :initarg :min-x :accessor min-x :type (signed-byte 32))
           (max-x :initarg :max-x :accessor max-x :type (signed-byte 32))
           (min-y :initarg :min-y :accessor min-y :type (signed-byte 32))
           (max-y :initarg :max-y :accessor max-y :type (signed-byte 32))
           (flip-x :initarg :flip-x :accessor flip-x :type (unsigned-byte 32))
           (flip-y :initarg :flip-y :accessor flip-y :type (unsigned-byte 32))
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 32))
           (button-threshold :initarg :button-threshold :accessor button-threshold :type
            (unsigned-byte 32))))
(defun encode-device-abs-calib-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (min-x (slot-value %obj 'min-x))
         (max-x (slot-value %obj 'max-x))
         (min-y (slot-value %obj 'min-y))
         (max-y (slot-value %obj 'max-y))
         (flip-x (slot-value %obj 'flip-x))
         (flip-y (slot-value %obj 'flip-y))
         (rotation (slot-value %obj 'rotation))
         (button-threshold (slot-value %obj 'button-threshold)))
    (declare
     (ignorable control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf min-x)
    (xcb:buffer-write-card32 %buf max-x)
    (xcb:buffer-write-card32 %buf min-y)
    (xcb:buffer-write-card32 %buf max-y)
    (xcb:buffer-write-card32 %buf flip-x)
    (xcb:buffer-write-card32 %buf flip-y)
    (xcb:buffer-write-card32 %buf rotation)
    (xcb:buffer-write-card32 %buf button-threshold)))
(defun decode-device-abs-calib-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold)
    (declare
     (ignorable %p control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf min-x (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf max-x (xcb:read-int32-at %buf (+ %p 8) %order))
    (setf min-y (xcb:read-int32-at %buf (+ %p 12) %order))
    (setf max-y (xcb:read-int32-at %buf (+ %p 16) %order))
    (setf flip-x (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf flip-y (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf rotation (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf button-threshold (xcb:read-card32-at %buf (+ %p 32) %order))
    (values
     (make-instance 'device-abs-calib-state :control-id control-id :len len :min-x min-x :max-x
                    max-x :min-y min-y :max-y max-y :flip-x flip-x :flip-y flip-y :rotation
                    rotation :button-threshold button-threshold)
     (+ %p 36))))

;;; xcb.Input.DeviceAbsAreaState
(defclass device-abs-area-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (offset-x :initarg :offset-x :accessor offset-x :type (unsigned-byte 32))
           (offset-y :initarg :offset-y :accessor offset-y :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 32))
           (height :initarg :height :accessor height :type (unsigned-byte 32))
           (screen :initarg :screen :accessor screen :type (unsigned-byte 32))
           (following :initarg :following :accessor following :type (unsigned-byte 32))))
(defun encode-device-abs-area-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (offset-x (slot-value %obj 'offset-x))
         (offset-y (slot-value %obj 'offset-y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (screen (slot-value %obj 'screen))
         (following (slot-value %obj 'following)))
    (declare (ignorable control-id len offset-x offset-y width height screen following))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf offset-x)
    (xcb:buffer-write-card32 %buf offset-y)
    (xcb:buffer-write-card32 %buf width)
    (xcb:buffer-write-card32 %buf height)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf following)))
(defun decode-device-abs-area-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len offset-x offset-y width height screen following)
    (declare (ignorable %p control-id len offset-x offset-y width height screen following))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf offset-x (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf offset-y (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf width (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf height (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf screen (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf following (xcb:read-card32-at %buf (+ %p 24) %order))
    (values
     (make-instance 'device-abs-area-state :control-id control-id :len len :offset-x offset-x
                    :offset-y offset-y :width width :height height :screen screen :following
                    following)
     (+ %p 28))))

;;; xcb.Input.DeviceCoreState
(defclass device-core-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (iscore :initarg :iscore :accessor iscore :type (unsigned-byte 8))))
(defun encode-device-core-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (status (slot-value %obj 'status))
         (iscore (slot-value %obj 'iscore)))
    (declare (ignorable control-id len status iscore))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf status)
    (xcb:buffer-write-card8 %buf iscore)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-device-core-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len status iscore)
    (declare (ignorable %p control-id len status iscore))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 4)))
    (setf iscore (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'device-core-state :control-id control-id :len len :status status :iscore
                    iscore)
     (+ %p 8))))

;;; xcb.Input.DeviceEnableState
(defclass device-enable-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (enable :initarg :enable :accessor enable :type (unsigned-byte 8))))
(defun encode-device-enable-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (enable (slot-value %obj 'enable)))
    (declare (ignorable control-id len enable))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf enable)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-device-enable-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len enable)
    (declare (ignorable %p control-id len enable))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf enable (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'device-enable-state :control-id control-id :len len :enable enable)
            (+ %p 8))))

;;; xcb.Input.DeviceState
(defclass device-state nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (resolution-num-valuators :initarg :resolution-num-valuators :accessor
            resolution-num-valuators :type (unsigned-byte 32))
           (resolution-resolution-values :initarg :resolution-resolution-values :accessor
            resolution-resolution-values :type cl:sequence)
           (resolution-resolution-min :initarg :resolution-resolution-min :accessor
            resolution-resolution-min :type cl:sequence)
           (resolution-resolution-max :initarg :resolution-resolution-max :accessor
            resolution-resolution-max :type cl:sequence)
           (abs-calib-min-x :initarg :abs-calib-min-x :accessor abs-calib-min-x :type
            (signed-byte 32))
           (abs-calib-max-x :initarg :abs-calib-max-x :accessor abs-calib-max-x :type
            (signed-byte 32))
           (abs-calib-min-y :initarg :abs-calib-min-y :accessor abs-calib-min-y :type
            (signed-byte 32))
           (abs-calib-max-y :initarg :abs-calib-max-y :accessor abs-calib-max-y :type
            (signed-byte 32))
           (abs-calib-flip-x :initarg :abs-calib-flip-x :accessor abs-calib-flip-x :type
            (unsigned-byte 32))
           (abs-calib-flip-y :initarg :abs-calib-flip-y :accessor abs-calib-flip-y :type
            (unsigned-byte 32))
           (abs-calib-rotation :initarg :abs-calib-rotation :accessor abs-calib-rotation :type
            (unsigned-byte 32))
           (abs-calib-button-threshold :initarg :abs-calib-button-threshold :accessor
            abs-calib-button-threshold :type (unsigned-byte 32))
           (core-status :initarg :core-status :accessor core-status :type (unsigned-byte 8))
           (core-iscore :initarg :core-iscore :accessor core-iscore :type (unsigned-byte 8))
           (enable-enable :initarg :enable-enable :accessor enable-enable :type (unsigned-byte 8))
           (abs-area-offset-x :initarg :abs-area-offset-x :accessor abs-area-offset-x :type
            (unsigned-byte 32))
           (abs-area-offset-y :initarg :abs-area-offset-y :accessor abs-area-offset-y :type
            (unsigned-byte 32))
           (abs-area-width :initarg :abs-area-width :accessor abs-area-width :type
            (unsigned-byte 32))
           (abs-area-height :initarg :abs-area-height :accessor abs-area-height :type
            (unsigned-byte 32))
           (abs-area-screen :initarg :abs-area-screen :accessor abs-area-screen :type
            (unsigned-byte 32))
           (abs-area-following :initarg :abs-area-following :accessor abs-area-following :type
            (unsigned-byte 32))))
(defun encode-device-state (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id)) (len (slot-value %obj 'len)))
    (declare (ignorable control-id len))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (let ((%mask control-id))
      (when (eql %mask 1)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'resolution-num-valuators))
        (xcb:buffer-write-list %buf (slot-value %obj 'resolution-resolution-values)
         (slot-value %obj 'resolution-num-valuators) #'xcb:buffer-write-card32)
        (xcb:buffer-write-list %buf (slot-value %obj 'resolution-resolution-min)
         (slot-value %obj 'resolution-num-valuators) #'xcb:buffer-write-card32)
        (xcb:buffer-write-list %buf (slot-value %obj 'resolution-resolution-max)
         (slot-value %obj 'resolution-num-valuators) #'xcb:buffer-write-card32))
      (when (eql %mask 2)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-min-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-max-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-min-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-max-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-flip-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-flip-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-rotation))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-button-threshold)))
      (when (eql %mask 3)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'core-status))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'core-iscore))
        (xcb:buffer-write-padding %buf 2))
      (when (eql %mask 4)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'enable-enable))
        (xcb:buffer-write-padding %buf 3))
      (when (eql %mask 5)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-offset-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-offset-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-width))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-height))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-screen))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-following))))))
(defun decode-device-state (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        control-id
        len
        resolution-num-valuators
        resolution-resolution-values
        resolution-resolution-min
        resolution-resolution-max
        abs-calib-min-x
        abs-calib-max-x
        abs-calib-min-y
        abs-calib-max-y
        abs-calib-flip-x
        abs-calib-flip-y
        abs-calib-rotation
        abs-calib-button-threshold
        core-status
        core-iscore
        enable-enable
        abs-area-offset-x
        abs-area-offset-y
        abs-area-width
        abs-area-height
        abs-area-screen
        abs-area-following)
    (declare
     (ignorable %p control-id len resolution-num-valuators resolution-resolution-values
      resolution-resolution-min resolution-resolution-max abs-calib-min-x abs-calib-max-x
      abs-calib-min-y abs-calib-max-y abs-calib-flip-x abs-calib-flip-y abs-calib-rotation
      abs-calib-button-threshold core-status core-iscore enable-enable abs-area-offset-x
      abs-area-offset-y abs-area-width abs-area-height abs-area-screen abs-area-following))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (let ((%mask control-id))
      (when (eql %mask 1)
        (setf resolution-num-valuators (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4))
        (multiple-value-setq (resolution-resolution-values %p)
          (xcb:read-vector-at %buf %p resolution-num-valuators %order :card32))
        (multiple-value-setq (resolution-resolution-min %p)
          (xcb:read-vector-at %buf %p resolution-num-valuators %order :card32))
        (multiple-value-setq (resolution-resolution-max %p)
          (xcb:read-vector-at %buf %p resolution-num-valuators %order :card32)))
      (when (eql %mask 2)
        (setf abs-calib-min-x (xcb:read-int32-at %buf %p %order))
        (setf abs-calib-max-x (xcb:read-int32-at %buf (+ %p 4) %order))
        (setf abs-calib-min-y (xcb:read-int32-at %buf (+ %p 8) %order))
        (setf abs-calib-max-y (xcb:read-int32-at %buf (+ %p 12) %order))
        (setf abs-calib-flip-x (xcb:read-card32-at %buf (+ %p 16) %order))
        (setf abs-calib-flip-y (xcb:read-card32-at %buf (+ %p 20) %order))
        (setf abs-calib-rotation (xcb:read-card32-at %buf (+ %p 24) %order))
        (setf abs-calib-button-threshold (xcb:read-card32-at %buf (+ %p 28) %order))
        (setf %p (+ %p 32)))
      (when (eql %mask 3)
        (setf core-status (xcb:read-card8-at %buf %p))
        (setf core-iscore (xcb:read-card8-at %buf (+ %p 1)))
        (setf %p (+ %p 4)))
      (when (eql %mask 4) (setf enable-enable (xcb:read-card8-at %buf %p)) (setf %p (+ %p 4)))
      (when (eql %mask 5)
        (setf abs-area-offset-x (xcb:read-card32-at %buf %p %order))
        (setf abs-area-offset-y (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf abs-area-width (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf abs-area-height (xcb:read-card32-at %buf (+ %p 12) %order))
        (setf abs-area-screen (xcb:read-card32-at %buf (+ %p 16) %order))
        (setf abs-area-following (xcb:read-card32-at %buf (+ %p 20) %order))
        (setf %p (+ %p 24))))
    (let ((%obj (make-instance 'device-state :control-id control-id :len len)))
      (when resolution-num-valuators
        (setf (slot-value %obj 'resolution-num-valuators) resolution-num-valuators))
      (when resolution-resolution-values
        (setf (slot-value %obj 'resolution-resolution-values) resolution-resolution-values))
      (when resolution-resolution-min
        (setf (slot-value %obj 'resolution-resolution-min) resolution-resolution-min))
      (when resolution-resolution-max
        (setf (slot-value %obj 'resolution-resolution-max) resolution-resolution-max))
      (when abs-calib-min-x (setf (slot-value %obj 'abs-calib-min-x) abs-calib-min-x))
      (when abs-calib-max-x (setf (slot-value %obj 'abs-calib-max-x) abs-calib-max-x))
      (when abs-calib-min-y (setf (slot-value %obj 'abs-calib-min-y) abs-calib-min-y))
      (when abs-calib-max-y (setf (slot-value %obj 'abs-calib-max-y) abs-calib-max-y))
      (when abs-calib-flip-x (setf (slot-value %obj 'abs-calib-flip-x) abs-calib-flip-x))
      (when abs-calib-flip-y (setf (slot-value %obj 'abs-calib-flip-y) abs-calib-flip-y))
      (when abs-calib-rotation (setf (slot-value %obj 'abs-calib-rotation) abs-calib-rotation))
      (when abs-calib-button-threshold
        (setf (slot-value %obj 'abs-calib-button-threshold) abs-calib-button-threshold))
      (when core-status (setf (slot-value %obj 'core-status) core-status))
      (when core-iscore (setf (slot-value %obj 'core-iscore) core-iscore))
      (when enable-enable (setf (slot-value %obj 'enable-enable) enable-enable))
      (when abs-area-offset-x (setf (slot-value %obj 'abs-area-offset-x) abs-area-offset-x))
      (when abs-area-offset-y (setf (slot-value %obj 'abs-area-offset-y) abs-area-offset-y))
      (when abs-area-width (setf (slot-value %obj 'abs-area-width) abs-area-width))
      (when abs-area-height (setf (slot-value %obj 'abs-area-height) abs-area-height))
      (when abs-area-screen (setf (slot-value %obj 'abs-area-screen) abs-area-screen))
      (when abs-area-following (setf (slot-value %obj 'abs-area-following) abs-area-following))
      (values %obj %p))))

;;; Request xcb.Input.GetDeviceControl
(defun get-device-control (conn control-id device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 34)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-control-request (xcb:request-with-reply)
          ((control-id :initarg :control-id :type (unsigned-byte 16))
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-device-control-request))
  (get-device-control conn (slot-value %obj 'control-id) (slot-value %obj 'device-id)))
(defclass get-device-control-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))
           (control :initarg :control :accessor control :type device-state)))
(defun decode-get-device-control-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status control)
    (declare (ignorable %p response-type xi-reply-type sequence length status control))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (setf %p (+ %p 32))
    (multiple-value-setq (control %p) (decode-device-state %buf %p %order))
    (values
     (make-instance 'get-device-control-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status :control
                    control)
     (+ %pos 32 (* 4 length)))))
(defun get-device-control-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-control-reply))

;;; xcb.Input.DeviceResolutionCtl
(defclass device-resolution-ctl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (first-valuator :initarg :first-valuator :accessor first-valuator :type
            (unsigned-byte 8))
           (num-valuators :initarg :num-valuators :accessor num-valuators :type (unsigned-byte 8))
           (resolution-values :initarg :resolution-values :accessor resolution-values :type
            cl:sequence)))
(defun encode-device-resolution-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (first-valuator (slot-value %obj 'first-valuator))
         (resolution-values (slot-value %obj 'resolution-values))
         (num-valuators (cl:length resolution-values)))
    (declare (ignorable control-id len first-valuator resolution-values num-valuators))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf first-valuator)
    (xcb:buffer-write-card8 %buf num-valuators)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf resolution-values num-valuators #'xcb:buffer-write-card32)))
(defun decode-device-resolution-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len first-valuator num-valuators resolution-values)
    (declare (ignorable %p control-id len first-valuator num-valuators resolution-values))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf first-valuator (xcb:read-card8-at %buf (+ %p 4)))
    (setf num-valuators (xcb:read-card8-at %buf (+ %p 5)))
    (setf %p (+ %p 8))
    (multiple-value-setq (resolution-values %p)
      (xcb:read-vector-at %buf %p num-valuators %order :card32))
    (values
     (make-instance 'device-resolution-ctl :control-id control-id :len len :first-valuator
                    first-valuator :num-valuators num-valuators :resolution-values
                    resolution-values)
     %p)))

;;; xcb.Input.DeviceAbsCalibCtl
(defclass device-abs-calib-ctl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (min-x :initarg :min-x :accessor min-x :type (signed-byte 32))
           (max-x :initarg :max-x :accessor max-x :type (signed-byte 32))
           (min-y :initarg :min-y :accessor min-y :type (signed-byte 32))
           (max-y :initarg :max-y :accessor max-y :type (signed-byte 32))
           (flip-x :initarg :flip-x :accessor flip-x :type (unsigned-byte 32))
           (flip-y :initarg :flip-y :accessor flip-y :type (unsigned-byte 32))
           (rotation :initarg :rotation :accessor rotation :type (unsigned-byte 32))
           (button-threshold :initarg :button-threshold :accessor button-threshold :type
            (unsigned-byte 32))))
(defun encode-device-abs-calib-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (min-x (slot-value %obj 'min-x))
         (max-x (slot-value %obj 'max-x))
         (min-y (slot-value %obj 'min-y))
         (max-y (slot-value %obj 'max-y))
         (flip-x (slot-value %obj 'flip-x))
         (flip-y (slot-value %obj 'flip-y))
         (rotation (slot-value %obj 'rotation))
         (button-threshold (slot-value %obj 'button-threshold)))
    (declare
     (ignorable control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf min-x)
    (xcb:buffer-write-card32 %buf max-x)
    (xcb:buffer-write-card32 %buf min-y)
    (xcb:buffer-write-card32 %buf max-y)
    (xcb:buffer-write-card32 %buf flip-x)
    (xcb:buffer-write-card32 %buf flip-y)
    (xcb:buffer-write-card32 %buf rotation)
    (xcb:buffer-write-card32 %buf button-threshold)))
(defun decode-device-abs-calib-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold)
    (declare
     (ignorable %p control-id len min-x max-x min-y max-y flip-x flip-y rotation button-threshold))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf min-x (xcb:read-int32-at %buf (+ %p 4) %order))
    (setf max-x (xcb:read-int32-at %buf (+ %p 8) %order))
    (setf min-y (xcb:read-int32-at %buf (+ %p 12) %order))
    (setf max-y (xcb:read-int32-at %buf (+ %p 16) %order))
    (setf flip-x (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf flip-y (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf rotation (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf button-threshold (xcb:read-card32-at %buf (+ %p 32) %order))
    (values
     (make-instance 'device-abs-calib-ctl :control-id control-id :len len :min-x min-x :max-x max-x
                    :min-y min-y :max-y max-y :flip-x flip-x :flip-y flip-y :rotation rotation
                    :button-threshold button-threshold)
     (+ %p 36))))

;;; xcb.Input.DeviceAbsAreaCtrl
(defclass device-abs-area-ctrl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (offset-x :initarg :offset-x :accessor offset-x :type (unsigned-byte 32))
           (offset-y :initarg :offset-y :accessor offset-y :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (signed-byte 32))
           (height :initarg :height :accessor height :type (signed-byte 32))
           (screen :initarg :screen :accessor screen :type (signed-byte 32))
           (following :initarg :following :accessor following :type (unsigned-byte 32))))
(defun encode-device-abs-area-ctrl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (offset-x (slot-value %obj 'offset-x))
         (offset-y (slot-value %obj 'offset-y))
         (width (slot-value %obj 'width))
         (height (slot-value %obj 'height))
         (screen (slot-value %obj 'screen))
         (following (slot-value %obj 'following)))
    (declare (ignorable control-id len offset-x offset-y width height screen following))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card32 %buf offset-x)
    (xcb:buffer-write-card32 %buf offset-y)
    (xcb:buffer-write-card32 %buf width)
    (xcb:buffer-write-card32 %buf height)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf following)))
(defun decode-device-abs-area-ctrl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len offset-x offset-y width height screen following)
    (declare (ignorable %p control-id len offset-x offset-y width height screen following))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf offset-x (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf offset-y (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf width (xcb:read-int32-at %buf (+ %p 12) %order))
    (setf height (xcb:read-int32-at %buf (+ %p 16) %order))
    (setf screen (xcb:read-int32-at %buf (+ %p 20) %order))
    (setf following (xcb:read-card32-at %buf (+ %p 24) %order))
    (values
     (make-instance 'device-abs-area-ctrl :control-id control-id :len len :offset-x offset-x
                    :offset-y offset-y :width width :height height :screen screen :following
                    following)
     (+ %p 28))))

;;; xcb.Input.DeviceCoreCtrl
(defclass device-core-ctrl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun encode-device-core-ctrl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (status (slot-value %obj 'status)))
    (declare (ignorable control-id len status))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf status)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-device-core-ctrl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len status)
    (declare (ignorable %p control-id len status))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'device-core-ctrl :control-id control-id :len len :status status)
            (+ %p 8))))

;;; xcb.Input.DeviceEnableCtrl
(defclass device-enable-ctrl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (enable :initarg :enable :accessor enable :type (unsigned-byte 8))))
(defun encode-device-enable-ctrl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id))
         (len (slot-value %obj 'len))
         (enable (slot-value %obj 'enable)))
    (declare (ignorable control-id len enable))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card8 %buf enable)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-device-enable-ctrl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) control-id len enable)
    (declare (ignorable %p control-id len enable))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf enable (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'device-enable-ctrl :control-id control-id :len len :enable enable)
            (+ %p 8))))

;;; xcb.Input.DeviceCtl
(defclass device-ctl nil
          ((control-id :initarg :control-id :accessor control-id :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (resolution-first-valuator :initarg :resolution-first-valuator :accessor
            resolution-first-valuator :type (unsigned-byte 8))
           (resolution-num-valuators :initarg :resolution-num-valuators :accessor
            resolution-num-valuators :type (unsigned-byte 8))
           (resolution-resolution-values :initarg :resolution-resolution-values :accessor
            resolution-resolution-values :type cl:sequence)
           (abs-calib-min-x :initarg :abs-calib-min-x :accessor abs-calib-min-x :type
            (signed-byte 32))
           (abs-calib-max-x :initarg :abs-calib-max-x :accessor abs-calib-max-x :type
            (signed-byte 32))
           (abs-calib-min-y :initarg :abs-calib-min-y :accessor abs-calib-min-y :type
            (signed-byte 32))
           (abs-calib-max-y :initarg :abs-calib-max-y :accessor abs-calib-max-y :type
            (signed-byte 32))
           (abs-calib-flip-x :initarg :abs-calib-flip-x :accessor abs-calib-flip-x :type
            (unsigned-byte 32))
           (abs-calib-flip-y :initarg :abs-calib-flip-y :accessor abs-calib-flip-y :type
            (unsigned-byte 32))
           (abs-calib-rotation :initarg :abs-calib-rotation :accessor abs-calib-rotation :type
            (unsigned-byte 32))
           (abs-calib-button-threshold :initarg :abs-calib-button-threshold :accessor
            abs-calib-button-threshold :type (unsigned-byte 32))
           (core-status :initarg :core-status :accessor core-status :type (unsigned-byte 8))
           (enable-enable :initarg :enable-enable :accessor enable-enable :type (unsigned-byte 8))
           (abs-area-offset-x :initarg :abs-area-offset-x :accessor abs-area-offset-x :type
            (unsigned-byte 32))
           (abs-area-offset-y :initarg :abs-area-offset-y :accessor abs-area-offset-y :type
            (unsigned-byte 32))
           (abs-area-width :initarg :abs-area-width :accessor abs-area-width :type
            (signed-byte 32))
           (abs-area-height :initarg :abs-area-height :accessor abs-area-height :type
            (signed-byte 32))
           (abs-area-screen :initarg :abs-area-screen :accessor abs-area-screen :type
            (signed-byte 32))
           (abs-area-following :initarg :abs-area-following :accessor abs-area-following :type
            (unsigned-byte 32))))
(defun encode-device-ctl (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((control-id (slot-value %obj 'control-id)) (len (slot-value %obj 'len)))
    (declare (ignorable control-id len))
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card16 %buf len)
    (let ((%mask control-id))
      (when (eql %mask 1)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'resolution-first-valuator))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'resolution-num-valuators))
        (xcb:buffer-write-padding %buf 2)
        (xcb:buffer-write-list %buf (slot-value %obj 'resolution-resolution-values)
         (slot-value %obj 'resolution-num-valuators) #'xcb:buffer-write-card32))
      (when (eql %mask 2)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-min-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-max-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-min-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-max-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-flip-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-flip-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-rotation))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-calib-button-threshold)))
      (when (eql %mask 3)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'core-status))
        (xcb:buffer-write-padding %buf 3))
      (when (eql %mask 4)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'enable-enable))
        (xcb:buffer-write-padding %buf 3))
      (when (eql %mask 5)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-offset-x))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-offset-y))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-width))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-height))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-screen))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'abs-area-following))))))
(defun decode-device-ctl (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        control-id
        len
        resolution-first-valuator
        resolution-num-valuators
        resolution-resolution-values
        abs-calib-min-x
        abs-calib-max-x
        abs-calib-min-y
        abs-calib-max-y
        abs-calib-flip-x
        abs-calib-flip-y
        abs-calib-rotation
        abs-calib-button-threshold
        core-status
        enable-enable
        abs-area-offset-x
        abs-area-offset-y
        abs-area-width
        abs-area-height
        abs-area-screen
        abs-area-following)
    (declare
     (ignorable %p control-id len resolution-first-valuator resolution-num-valuators
      resolution-resolution-values abs-calib-min-x abs-calib-max-x abs-calib-min-y abs-calib-max-y
      abs-calib-flip-x abs-calib-flip-y abs-calib-rotation abs-calib-button-threshold core-status
      enable-enable abs-area-offset-x abs-area-offset-y abs-area-width abs-area-height
      abs-area-screen abs-area-following))
    (setf control-id (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (let ((%mask control-id))
      (when (eql %mask 1)
        (setf resolution-first-valuator (xcb:read-card8-at %buf %p))
        (setf resolution-num-valuators (xcb:read-card8-at %buf (+ %p 1)))
        (setf %p (+ %p 4))
        (multiple-value-setq (resolution-resolution-values %p)
          (xcb:read-vector-at %buf %p resolution-num-valuators %order :card32)))
      (when (eql %mask 2)
        (setf abs-calib-min-x (xcb:read-int32-at %buf %p %order))
        (setf abs-calib-max-x (xcb:read-int32-at %buf (+ %p 4) %order))
        (setf abs-calib-min-y (xcb:read-int32-at %buf (+ %p 8) %order))
        (setf abs-calib-max-y (xcb:read-int32-at %buf (+ %p 12) %order))
        (setf abs-calib-flip-x (xcb:read-card32-at %buf (+ %p 16) %order))
        (setf abs-calib-flip-y (xcb:read-card32-at %buf (+ %p 20) %order))
        (setf abs-calib-rotation (xcb:read-card32-at %buf (+ %p 24) %order))
        (setf abs-calib-button-threshold (xcb:read-card32-at %buf (+ %p 28) %order))
        (setf %p (+ %p 32)))
      (when (eql %mask 3) (setf core-status (xcb:read-card8-at %buf %p)) (setf %p (+ %p 4)))
      (when (eql %mask 4) (setf enable-enable (xcb:read-card8-at %buf %p)) (setf %p (+ %p 4)))
      (when (eql %mask 5)
        (setf abs-area-offset-x (xcb:read-card32-at %buf %p %order))
        (setf abs-area-offset-y (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf abs-area-width (xcb:read-int32-at %buf (+ %p 8) %order))
        (setf abs-area-height (xcb:read-int32-at %buf (+ %p 12) %order))
        (setf abs-area-screen (xcb:read-int32-at %buf (+ %p 16) %order))
        (setf abs-area-following (xcb:read-card32-at %buf (+ %p 20) %order))
        (setf %p (+ %p 24))))
    (let ((%obj (make-instance 'device-ctl :control-id control-id :len len)))
      (when resolution-first-valuator
        (setf (slot-value %obj 'resolution-first-valuator) resolution-first-valuator))
      (when resolution-num-valuators
        (setf (slot-value %obj 'resolution-num-valuators) resolution-num-valuators))
      (when resolution-resolution-values
        (setf (slot-value %obj 'resolution-resolution-values) resolution-resolution-values))
      (when abs-calib-min-x (setf (slot-value %obj 'abs-calib-min-x) abs-calib-min-x))
      (when abs-calib-max-x (setf (slot-value %obj 'abs-calib-max-x) abs-calib-max-x))
      (when abs-calib-min-y (setf (slot-value %obj 'abs-calib-min-y) abs-calib-min-y))
      (when abs-calib-max-y (setf (slot-value %obj 'abs-calib-max-y) abs-calib-max-y))
      (when abs-calib-flip-x (setf (slot-value %obj 'abs-calib-flip-x) abs-calib-flip-x))
      (when abs-calib-flip-y (setf (slot-value %obj 'abs-calib-flip-y) abs-calib-flip-y))
      (when abs-calib-rotation (setf (slot-value %obj 'abs-calib-rotation) abs-calib-rotation))
      (when abs-calib-button-threshold
        (setf (slot-value %obj 'abs-calib-button-threshold) abs-calib-button-threshold))
      (when core-status (setf (slot-value %obj 'core-status) core-status))
      (when enable-enable (setf (slot-value %obj 'enable-enable) enable-enable))
      (when abs-area-offset-x (setf (slot-value %obj 'abs-area-offset-x) abs-area-offset-x))
      (when abs-area-offset-y (setf (slot-value %obj 'abs-area-offset-y) abs-area-offset-y))
      (when abs-area-width (setf (slot-value %obj 'abs-area-width) abs-area-width))
      (when abs-area-height (setf (slot-value %obj 'abs-area-height) abs-area-height))
      (when abs-area-screen (setf (slot-value %obj 'abs-area-screen) abs-area-screen))
      (when abs-area-following (setf (slot-value %obj 'abs-area-following) abs-area-following))
      (values %obj %p))))

;;; Request xcb.Input.ChangeDeviceControl
(defun change-device-control (conn control-id device-id control)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 35)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf control-id)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 1)
    (encode-device-ctl %buf control)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass change-device-control-request (xcb:request-with-reply)
          ((control-id :initarg :control-id :type (unsigned-byte 16))
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (control :initarg :control :type device-ctl)))
(defmethod xcb:send-request (conn (%obj change-device-control-request))
  (change-device-control conn (slot-value %obj 'control-id) (slot-value %obj 'device-id)
   (slot-value %obj 'control)))
(defclass change-device-control-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-change-device-control-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length status)
    (declare (ignorable %p response-type xi-reply-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'change-device-control-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun change-device-control-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-change-device-control-reply))

;;; Request xcb.Input.ListDeviceProperties
(defun list-device-properties (conn device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 36)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-device-properties-request (xcb:request-with-reply)
          ((device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj list-device-properties-request))
  (list-device-properties conn (slot-value %obj 'device-id)))
(defclass list-device-properties-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-atoms :initarg :num-atoms :accessor num-atoms :type (unsigned-byte 16))
           (atoms :initarg :atoms :accessor atoms :type cl:sequence)))
(defun decode-list-device-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xi-reply-type sequence length num-atoms atoms)
    (declare (ignorable %p response-type xi-reply-type sequence length num-atoms atoms))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-atoms (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (atoms %p)
      (xcb:read-vector-at %buf %p (cl:min num-atoms (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'list-device-properties-reply :response-type response-type :xi-reply-type
                    xi-reply-type :sequence sequence :length length :num-atoms num-atoms :atoms
                    atoms)
     (+ %pos 32 (* 4 length)))))
(defun list-device-properties-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-device-properties-reply))

;;; Enum xcb.Input.PropertyFormat
(xcb:defenum input-property-format
  (:n8-bits 8)
  (:n16-bits 16)
  (:n32-bits 32))

;;; Request xcb.Input.ChangeDeviceProperty
(defun change-device-property
       (conn property type device-id format mode num-items &key data8 data16 data32)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 37)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf format)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf num-items)
    (let ((%mask format))
      (when (eql %mask 8)
        (xcb:buffer-write-octets %buf data8 :end num-items)
        (xcb:buffer-pad-to-align %buf 4))
      (when (eql %mask 16)
        (xcb:buffer-write-list %buf data16 num-items #'xcb:buffer-write-card16)
        (xcb:buffer-pad-to-align %buf 4))
      (when (eql %mask 32)
        (xcb:buffer-write-list %buf data32 num-items #'xcb:buffer-write-card32)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-device-property-request (xcb:request)
          ((property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (format :initarg :format :type (unsigned-byte 8))
           (mode :initarg :mode :type (unsigned-byte 8))
           (num-items :initarg :num-items :type (unsigned-byte 32))
           (data8 :initarg :data8 :type cl:sequence) (data16 :initarg :data16 :type cl:sequence)
           (data32 :initarg :data32 :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj change-device-property-request))
  (apply #'change-device-property conn (slot-value %obj 'property) (slot-value %obj 'type)
         (slot-value %obj 'device-id) (slot-value %obj 'format) (slot-value %obj 'mode)
         (slot-value %obj 'num-items)
         (nconc (when (slot-boundp %obj 'data8) (list :data8 (slot-value %obj 'data8)))
                (when (slot-boundp %obj 'data16) (list :data16 (slot-value %obj 'data16)))
                (when (slot-boundp %obj 'data32) (list :data32 (slot-value %obj 'data32))))))

;;; Request xcb.Input.DeleteDeviceProperty
(defun delete-device-property (conn property device-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 38)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-device-property-request (xcb:request)
          ((property :initarg :property :type xcb:atom)
           (device-id :initarg :device-id :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj delete-device-property-request))
  (delete-device-property conn (slot-value %obj 'property) (slot-value %obj 'device-id)))

;;; Request xcb.Input.GetDeviceProperty
(defun get-device-property (conn property type offset len device-id delete)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 39)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card32 %buf offset)
    (xcb:buffer-write-card32 %buf len)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-bool %buf delete)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-property-request (xcb:request-with-reply)
          ((property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (offset :initarg :offset :type (unsigned-byte 32))
           (len :initarg :len :type (unsigned-byte 32))
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (delete :initarg :delete :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj get-device-property-request))
  (get-device-property conn (slot-value %obj 'property) (slot-value %obj 'type)
   (slot-value %obj 'offset) (slot-value %obj 'len) (slot-value %obj 'device-id)
   (slot-value %obj 'delete)))
(defclass get-device-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xi-reply-type :initarg :xi-reply-type :accessor xi-reply-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type xcb:atom)
           (bytes-after :initarg :bytes-after :accessor bytes-after :type (unsigned-byte 32))
           (num-items :initarg :num-items :accessor num-items :type (unsigned-byte 32))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (data8 :initarg :data8 :accessor data8 :type cl:sequence)
           (data16 :initarg :data16 :accessor data16 :type cl:sequence)
           (data32 :initarg :data32 :accessor data32 :type cl:sequence)))
(defun decode-get-device-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xi-reply-type
        sequence
        length
        type
        bytes-after
        num-items
        format
        device-id
        data8
        data16
        data32)
    (declare
     (ignorable %p response-type xi-reply-type sequence length type bytes-after num-items format
      device-id data8 data16 data32))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xi-reply-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf type (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf bytes-after (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-items (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf format (xcb:read-card8-at %buf (+ %p 20)))
    (setf device-id (xcb:read-card8-at %buf (+ %p 21)))
    (setf %p (+ %p 32))
    (let ((%mask format))
      (when (eql %mask 8)
        (multiple-value-setq (data8 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 1))
           %order :card8))
        (setf %p (xcb:align-position %p 4)))
      (when (eql %mask 16)
        (multiple-value-setq (data16 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 2))
           %order :card16))
        (setf %p (xcb:align-position %p 4)))
      (when (eql %mask 32)
        (multiple-value-setq (data32 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 4))
           %order :card32))))
    (let ((%obj
           (make-instance 'get-device-property-reply :response-type response-type :xi-reply-type
                          xi-reply-type :sequence sequence :length length :type type :bytes-after
                          bytes-after :num-items num-items :format format :device-id device-id)))
      (when data8 (setf (slot-value %obj 'data8) data8))
      (when data16 (setf (slot-value %obj 'data16) data16))
      (when data32 (setf (slot-value %obj 'data32) data32))
      (values %obj (+ %pos 32 (* 4 length))))))
(defun get-device-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-property-reply))

;;; Enum xcb.Input.Device
(xcb:defenum input-device
  (:all 0)
  (:all-master 1))

;;; xcb.Input.GroupInfo
(defclass group-info nil
          ((base :initarg :base :accessor base :type (unsigned-byte 8))
           (latched :initarg :latched :accessor latched :type (unsigned-byte 8))
           (locked :initarg :locked :accessor locked :type (unsigned-byte 8))
           (effective :initarg :effective :accessor effective :type (unsigned-byte 8))))
(defun encode-group-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((base (slot-value %obj 'base))
         (latched (slot-value %obj 'latched))
         (locked (slot-value %obj 'locked))
         (effective (slot-value %obj 'effective)))
    (declare (ignorable base latched locked effective))
    (xcb:buffer-write-card8 %buf base)
    (xcb:buffer-write-card8 %buf latched)
    (xcb:buffer-write-card8 %buf locked)
    (xcb:buffer-write-card8 %buf effective)))
(defun decode-group-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) base latched locked effective)
    (declare (ignorable %p base latched locked effective))
    (setf base (xcb:read-card8-at %buf %p))
    (setf latched (xcb:read-card8-at %buf (+ %p 1)))
    (setf locked (xcb:read-card8-at %buf (+ %p 2)))
    (setf effective (xcb:read-card8-at %buf (+ %p 3)))
    (values
     (make-instance 'group-info :base base :latched latched :locked locked :effective effective)
     (+ %p 4))))

;;; xcb.Input.ModifierInfo
(defclass modifier-info nil
          ((base :initarg :base :accessor base :type (unsigned-byte 32))
           (latched :initarg :latched :accessor latched :type (unsigned-byte 32))
           (locked :initarg :locked :accessor locked :type (unsigned-byte 32))
           (effective :initarg :effective :accessor effective :type (unsigned-byte 32))))
(defun encode-modifier-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((base (slot-value %obj 'base))
         (latched (slot-value %obj 'latched))
         (locked (slot-value %obj 'locked))
         (effective (slot-value %obj 'effective)))
    (declare (ignorable base latched locked effective))
    (xcb:buffer-write-card32 %buf base)
    (xcb:buffer-write-card32 %buf latched)
    (xcb:buffer-write-card32 %buf locked)
    (xcb:buffer-write-card32 %buf effective)))
(defun decode-modifier-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) base latched locked effective)
    (declare (ignorable %p base latched locked effective))
    (setf base (xcb:read-card32-at %buf %p %order))
    (setf latched (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf locked (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf effective (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'modifier-info :base base :latched latched :locked locked :effective effective)
     (+ %p 16))))

;;; Request xcb.Input.XIQueryPointer
(defun xi-query-pointer (conn window deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 40)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-query-pointer-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)
           (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-query-pointer-request))
  (xi-query-pointer conn (slot-value %obj 'window) (slot-value %obj 'deviceid)))
(defclass xi-query-pointer-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (win-x :initarg :win-x :accessor win-x :type fp1616)
           (win-y :initarg :win-y :accessor win-y :type fp1616)
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-xi-query-pointer-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        root
        child
        root-x
        root-y
        win-x
        win-y
        same-screen
        buttons-len
        mods
        group
        buttons)
    (declare
     (ignorable %p response-type sequence length root child root-x root-y win-x win-y same-screen
      buttons-len mods group buttons))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 16) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 20) %order))
    (setf win-x (xcb:read-int32-at %buf (+ %p 24) %order))
    (setf win-y (xcb:read-int32-at %buf (+ %p 28) %order))
    (setf same-screen (xcb:read-card8-at %buf (+ %p 32)))
    (setf buttons-len (xcb:read-card16-at %buf (+ %p 34) %order))
    (setf mods (decode-modifier-info %buf (+ %p 36) %order))
    (setf group (decode-group-info %buf (+ %p 52) %order))
    (setf %p (+ %p 56))
    (multiple-value-setq (buttons %p)
      (xcb:read-vector-at %buf %p (cl:min buttons-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'xi-query-pointer-reply :response-type response-type :sequence sequence :length
                    length :root root :child child :root-x root-x :root-y root-y :win-x win-x
                    :win-y win-y :same-screen same-screen :buttons-len buttons-len :mods mods
                    :group group :buttons buttons)
     (+ %pos 32 (* 4 length)))))
(defun xi-query-pointer-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-query-pointer-reply))

;;; Request xcb.Input.XIWarpPointer
(defun xi-warp-pointer (conn src-win dst-win src-x src-y src-width src-height dst-x dst-y deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 41)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf src-win)
    (xcb:buffer-write-card32 %buf dst-win)
    (xcb:buffer-write-card32 %buf src-x)
    (xcb:buffer-write-card32 %buf src-y)
    (xcb:buffer-write-card16 %buf src-width)
    (xcb:buffer-write-card16 %buf src-height)
    (xcb:buffer-write-card32 %buf dst-x)
    (xcb:buffer-write-card32 %buf dst-y)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-warp-pointer-request (xcb:request)
          ((src-win :initarg :src-win :type xcb:window)
           (dst-win :initarg :dst-win :type xcb:window) (src-x :initarg :src-x :type fp1616)
           (src-y :initarg :src-y :type fp1616)
           (src-width :initarg :src-width :type (unsigned-byte 16))
           (src-height :initarg :src-height :type (unsigned-byte 16))
           (dst-x :initarg :dst-x :type fp1616) (dst-y :initarg :dst-y :type fp1616)
           (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-warp-pointer-request))
  (xi-warp-pointer conn (slot-value %obj 'src-win) (slot-value %obj 'dst-win)
   (slot-value %obj 'src-x) (slot-value %obj 'src-y) (slot-value %obj 'src-width)
   (slot-value %obj 'src-height) (slot-value %obj 'dst-x) (slot-value %obj 'dst-y)
   (slot-value %obj 'deviceid)))

;;; Request xcb.Input.XIChangeCursor
(defun xi-change-cursor (conn window cursor deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 42)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-change-cursor-request (xcb:request)
          ((window :initarg :window :type xcb:window) (cursor :initarg :cursor :type xcb:cursor)
           (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-change-cursor-request))
  (xi-change-cursor conn (slot-value %obj 'window) (slot-value %obj 'cursor)
   (slot-value %obj 'deviceid)))

;;; Enum xcb.Input.HierarchyChangeType
(xcb:defenum input-hierarchy-change-type
  (:add-master 1)
  (:remove-master 2)
  (:attach-slave 3)
  (:detach-slave 4))

;;; Enum xcb.Input.ChangeMode
(xcb:defenum input-change-mode
  (:attach 1)
  (:float 2))

;;; xcb.Input.AddMaster
(defclass add-master nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (send-core :initarg :send-core :accessor send-core :type (or boolean (unsigned-byte 8)))
           (enable :initarg :enable :accessor enable :type (or boolean (unsigned-byte 8)))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun encode-add-master (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (send-core (slot-value %obj 'send-core))
         (enable (slot-value %obj 'enable))
         (name (slot-value %obj 'name))
         (name-len (cl:length name)))
    (declare (ignorable type len send-core enable name name-len))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf name-len)
    (xcb:buffer-write-bool %buf send-core)
    (xcb:buffer-write-bool %buf enable)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-add-master (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len name-len send-core enable name)
    (declare (ignorable %p type len name-len send-core enable name))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf send-core (xcb:read-card8-at %buf (+ %p 6)))
    (setf enable (xcb:read-card8-at %buf (+ %p 7)))
    (setf %p (+ %p 8))
    (setf name (xcb:read-string-at %buf %p name-len))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'add-master :type type :len len :name-len name-len :send-core send-core :enable
                    enable :name name)
     %p)))

;;; xcb.Input.RemoveMaster
(defclass remove-master nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (return-mode :initarg :return-mode :accessor return-mode :type (unsigned-byte 8))
           (return-pointer :initarg :return-pointer :accessor return-pointer :type device-id)
           (return-keyboard :initarg :return-keyboard :accessor return-keyboard :type device-id)))
(defun encode-remove-master (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (deviceid (slot-value %obj 'deviceid))
         (return-mode (slot-value %obj 'return-mode))
         (return-pointer (slot-value %obj 'return-pointer))
         (return-keyboard (slot-value %obj 'return-keyboard)))
    (declare (ignorable type len deviceid return-mode return-pointer return-keyboard))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card8 %buf return-mode)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf return-pointer)
    (xcb:buffer-write-card16 %buf return-keyboard)))
(defun decode-remove-master (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len deviceid return-mode return-pointer return-keyboard)
    (declare (ignorable %p type len deviceid return-mode return-pointer return-keyboard))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf return-mode (xcb:read-card8-at %buf (+ %p 6)))
    (setf return-pointer (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf return-keyboard (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'remove-master :type type :len len :deviceid deviceid :return-mode return-mode
                    :return-pointer return-pointer :return-keyboard return-keyboard)
     (+ %p 12))))

;;; xcb.Input.AttachSlave
(defclass attach-slave nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (master :initarg :master :accessor master :type device-id)))
(defun encode-attach-slave (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (deviceid (slot-value %obj 'deviceid))
         (master (slot-value %obj 'master)))
    (declare (ignorable type len deviceid master))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf master)))
(defun decode-attach-slave (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len deviceid master)
    (declare (ignorable %p type len deviceid master))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf master (xcb:read-card16-at %buf (+ %p 6) %order))
    (values (make-instance 'attach-slave :type type :len len :deviceid deviceid :master master)
            (+ %p 8))))

;;; xcb.Input.DetachSlave
(defclass detach-slave nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)))
(defun encode-detach-slave (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (deviceid (slot-value %obj 'deviceid)))
    (declare (ignorable type len deviceid))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-detach-slave (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len deviceid)
    (declare (ignorable %p type len deviceid))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (values (make-instance 'detach-slave :type type :len len :deviceid deviceid) (+ %p 8))))

;;; xcb.Input.HierarchyChange
(defclass hierarchy-change nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (add-master-name-len :initarg :add-master-name-len :accessor add-master-name-len :type
            (unsigned-byte 16))
           (add-master-send-core :initarg :add-master-send-core :accessor add-master-send-core
            :type (or boolean (unsigned-byte 8)))
           (add-master-enable :initarg :add-master-enable :accessor add-master-enable :type
            (or boolean (unsigned-byte 8)))
           (add-master-name :initarg :add-master-name :accessor add-master-name :type cl:sequence)
           (remove-master-deviceid :initarg :remove-master-deviceid :accessor
            remove-master-deviceid :type device-id)
           (remove-master-return-mode :initarg :remove-master-return-mode :accessor
            remove-master-return-mode :type (unsigned-byte 8))
           (remove-master-return-pointer :initarg :remove-master-return-pointer :accessor
            remove-master-return-pointer :type device-id)
           (remove-master-return-keyboard :initarg :remove-master-return-keyboard :accessor
            remove-master-return-keyboard :type device-id)
           (attach-slave-deviceid :initarg :attach-slave-deviceid :accessor attach-slave-deviceid
            :type device-id)
           (attach-slave-master :initarg :attach-slave-master :accessor attach-slave-master :type
            device-id)
           (detach-slave-deviceid :initarg :detach-slave-deviceid :accessor detach-slave-deviceid
            :type device-id)))
(defun encode-hierarchy-change (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (len (slot-value %obj 'len)))
    (declare (ignorable type len))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (let ((%mask type))
      (when (eql %mask 1)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'add-master-name-len))
        (xcb:buffer-write-bool %buf (slot-value %obj 'add-master-send-core))
        (xcb:buffer-write-bool %buf (slot-value %obj 'add-master-enable))
        (xcb:buffer-write-string-octets %buf (slot-value %obj 'add-master-name)
         (slot-value %obj 'add-master-name-len))
        (xcb:buffer-pad-to-align %buf 4))
      (when (eql %mask 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'remove-master-deviceid))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'remove-master-return-mode))
        (xcb:buffer-write-padding %buf 1)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'remove-master-return-pointer))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'remove-master-return-keyboard)))
      (when (eql %mask 3)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'attach-slave-deviceid))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'attach-slave-master)))
      (when (eql %mask 4)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'detach-slave-deviceid))
        (xcb:buffer-write-padding %buf 2)))))
(defun decode-hierarchy-change (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        type
        len
        add-master-name-len
        add-master-send-core
        add-master-enable
        add-master-name
        remove-master-deviceid
        remove-master-return-mode
        remove-master-return-pointer
        remove-master-return-keyboard
        attach-slave-deviceid
        attach-slave-master
        detach-slave-deviceid)
    (declare
     (ignorable %p type len add-master-name-len add-master-send-core add-master-enable
      add-master-name remove-master-deviceid remove-master-return-mode remove-master-return-pointer
      remove-master-return-keyboard attach-slave-deviceid attach-slave-master
      detach-slave-deviceid))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (let ((%mask type))
      (when (eql %mask 1)
        (setf add-master-name-len (xcb:read-card16-at %buf %p %order))
        (setf add-master-send-core (xcb:read-card8-at %buf (+ %p 2)))
        (setf add-master-enable (xcb:read-card8-at %buf (+ %p 3)))
        (setf %p (+ %p 4))
        (setf add-master-name (xcb:read-string-at %buf %p add-master-name-len))
        (incf %p (cl:length add-master-name))
        (setf %p (xcb:align-position %p 4)))
      (when (eql %mask 2)
        (setf remove-master-deviceid (xcb:read-card16-at %buf %p %order))
        (setf remove-master-return-mode (xcb:read-card8-at %buf (+ %p 2)))
        (setf remove-master-return-pointer (xcb:read-card16-at %buf (+ %p 4) %order))
        (setf remove-master-return-keyboard (xcb:read-card16-at %buf (+ %p 6) %order))
        (setf %p (+ %p 8)))
      (when (eql %mask 3)
        (setf attach-slave-deviceid (xcb:read-card16-at %buf %p %order))
        (setf attach-slave-master (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf %p (+ %p 4)))
      (when (eql %mask 4)
        (setf detach-slave-deviceid (xcb:read-card16-at %buf %p %order))
        (setf %p (+ %p 4))))
    (let ((%obj (make-instance 'hierarchy-change :type type :len len)))
      (when add-master-name-len (setf (slot-value %obj 'add-master-name-len) add-master-name-len))
      (when add-master-send-core
        (setf (slot-value %obj 'add-master-send-core) add-master-send-core))
      (when add-master-enable (setf (slot-value %obj 'add-master-enable) add-master-enable))
      (when add-master-name (setf (slot-value %obj 'add-master-name) add-master-name))
      (when remove-master-deviceid
        (setf (slot-value %obj 'remove-master-deviceid) remove-master-deviceid))
      (when remove-master-return-mode
        (setf (slot-value %obj 'remove-master-return-mode) remove-master-return-mode))
      (when remove-master-return-pointer
        (setf (slot-value %obj 'remove-master-return-pointer) remove-master-return-pointer))
      (when remove-master-return-keyboard
        (setf (slot-value %obj 'remove-master-return-keyboard) remove-master-return-keyboard))
      (when attach-slave-deviceid
        (setf (slot-value %obj 'attach-slave-deviceid) attach-slave-deviceid))
      (when attach-slave-master (setf (slot-value %obj 'attach-slave-master) attach-slave-master))
      (when detach-slave-deviceid
        (setf (slot-value %obj 'detach-slave-deviceid) detach-slave-deviceid))
      (values %obj %p))))

;;; Request xcb.Input.XIChangeHierarchy
(defun xi-change-hierarchy (conn changes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-changes (cl:length changes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 43)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf num-changes)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-list %buf changes num-changes #'encode-hierarchy-change)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-change-hierarchy-request (xcb:request)
          ((num-changes :initarg :num-changes :type (unsigned-byte 8))
           (changes :initarg :changes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-change-hierarchy-request))
  (xi-change-hierarchy conn (slot-value %obj 'changes)))

;;; Request xcb.Input.XISetClientPointer
(defun xi-set-client-pointer (conn window deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 44)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-set-client-pointer-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-set-client-pointer-request))
  (xi-set-client-pointer conn (slot-value %obj 'window) (slot-value %obj 'deviceid)))

;;; Request xcb.Input.XIGetClientPointer
(defun xi-get-client-pointer (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 45)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-get-client-pointer-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj xi-get-client-pointer-request))
  (xi-get-client-pointer conn (slot-value %obj 'window)))
(defclass xi-get-client-pointer-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (set :initarg :set :accessor set :type (or boolean (unsigned-byte 8)))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)))
(defun decode-xi-get-client-pointer-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length set deviceid)
    (declare (ignorable %p response-type sequence length set deviceid))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf set (xcb:read-card8-at %buf (+ %p 8)))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'xi-get-client-pointer-reply :response-type response-type :sequence sequence
                    :length length :set set :deviceid deviceid)
     (+ %pos 32 (* 4 length)))))
(defun xi-get-client-pointer-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-get-client-pointer-reply))

;;; Enum xcb.Input.XIEventMask
(xcb:defenum input-xi-event-mask
  (:device-changed 2)
  (:key-press 4)
  (:key-release 8)
  (:button-press 16)
  (:button-release 32)
  (:motion 64)
  (:enter 128)
  (:leave 256)
  (:focus-in 512)
  (:focus-out 1024)
  (:hierarchy 2048)
  (:property 4096)
  (:raw-key-press 8192)
  (:raw-key-release 16384)
  (:raw-button-press 32768)
  (:raw-button-release 65536)
  (:raw-motion 131072)
  (:touch-begin 262144)
  (:touch-update 524288)
  (:touch-end 1048576)
  (:touch-ownership 2097152)
  (:raw-touch-begin 4194304)
  (:raw-touch-update 8388608)
  (:raw-touch-end 16777216)
  (:barrier-hit 33554432)
  (:barrier-leave 67108864))

;;; xcb.Input.EventMask
(defclass event-mask nil
          ((deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (mask-len :initarg :mask-len :accessor mask-len :type (unsigned-byte 16))
           (mask :initarg :mask :accessor mask :type cl:sequence)))
(defun encode-event-mask (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((deviceid (slot-value %obj 'deviceid))
         (mask (slot-value %obj 'mask))
         (mask-len (cl:length mask)))
    (declare (ignorable deviceid mask mask-len))
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf mask-len)
    (xcb:buffer-write-list %buf mask mask-len #'xcb:buffer-write-card32)))
(defun decode-event-mask (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) deviceid mask-len mask)
    (declare (ignorable %p deviceid mask-len mask))
    (setf deviceid (xcb:read-card16-at %buf %p %order))
    (setf mask-len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (multiple-value-setq (mask %p) (xcb:read-vector-at %buf %p mask-len %order :card32))
    (values (make-instance 'event-mask :deviceid deviceid :mask-len mask-len :mask mask) %p)))

;;; Request xcb.Input.XISelectEvents
(defun xi-select-events (conn window masks)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-mask (cl:length masks)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 46)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card16 %buf num-mask)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf masks num-mask #'encode-event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-select-events-request (xcb:request)
          ((window :initarg :window :type xcb:window)
           (num-mask :initarg :num-mask :type (unsigned-byte 16))
           (masks :initarg :masks :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-select-events-request))
  (xi-select-events conn (slot-value %obj 'window) (slot-value %obj 'masks)))

;;; Request xcb.Input.XIQueryVersion
(defun xi-query-version (conn major-version minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 47)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf major-version)
    (xcb:buffer-write-card16 %buf minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-query-version-request (xcb:request-with-reply)
          ((major-version :initarg :major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj xi-query-version-request))
  (xi-query-version conn (slot-value %obj 'major-version) (slot-value %obj 'minor-version)))
(defclass xi-query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 16))))
(defun decode-xi-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'xi-query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun xi-query-version-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-query-version-reply))

;;; Enum xcb.Input.DeviceClassType
(xcb:defenum input-device-class-type
  (:key 0)
  (:button 1)
  (:valuator 2)
  (:scroll 3)
  (:touch 8)
  (:gesture 9))

;;; Enum xcb.Input.DeviceType
(xcb:defenum input-device-type
  (:master-pointer 1)
  (:master-keyboard 2)
  (:slave-pointer 3)
  (:slave-keyboard 4)
  (:floating-slave 5))

;;; Enum xcb.Input.ScrollFlags
(xcb:defenum input-scroll-flags
  (:no-emulation 1)
  (:preferred 2))

;;; Enum xcb.Input.ScrollType
(xcb:defenum input-scroll-type
  (:vertical 1)
  (:horizontal 2))

;;; Enum xcb.Input.TouchMode
(xcb:defenum input-touch-mode
  (:direct 1)
  (:dependent 2))

;;; xcb.Input.ButtonClass
(defclass button-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (num-buttons :initarg :num-buttons :accessor num-buttons :type (unsigned-byte 16))
           (state :initarg :state :accessor state :type cl:sequence)
           (labels :initarg :labels :accessor labels :type cl:sequence)))
(defun encode-button-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (state (slot-value %obj 'state))
         (labels (slot-value %obj 'labels))
         (num-buttons (cl:length labels)))
    (declare (ignorable type len sourceid state labels num-buttons))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card16 %buf num-buttons)
    (xcb:buffer-write-list %buf state (truncate (+ num-buttons 31) 32) #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf labels num-buttons #'xcb:buffer-write-card32)))
(defun decode-button-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid num-buttons state labels)
    (declare (ignorable %p type len sourceid num-buttons state labels))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-buttons (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (state %p)
      (xcb:read-vector-at %buf %p (truncate (+ num-buttons 31) 32) %order :card32))
    (multiple-value-setq (labels %p) (xcb:read-vector-at %buf %p num-buttons %order :card32))
    (values
     (make-instance 'button-class :type type :len len :sourceid sourceid :num-buttons num-buttons
                    :state state :labels labels)
     %p)))

;;; xcb.Input.KeyClass
(defclass key-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (num-keys :initarg :num-keys :accessor num-keys :type (unsigned-byte 16))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun encode-key-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (keys (slot-value %obj 'keys))
         (num-keys (cl:length keys)))
    (declare (ignorable type len sourceid keys num-keys))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card16 %buf num-keys)
    (xcb:buffer-write-list %buf keys num-keys #'xcb:buffer-write-card32)))
(defun decode-key-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid num-keys keys)
    (declare (ignorable %p type len sourceid num-keys keys))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-keys (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (keys %p) (xcb:read-vector-at %buf %p num-keys %order :card32))
    (values
     (make-instance 'key-class :type type :len len :sourceid sourceid :num-keys num-keys :keys
                    keys)
     %p)))

;;; xcb.Input.ScrollClass
(defclass scroll-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (number :initarg :number :accessor number :type (unsigned-byte 16))
           (scroll-type :initarg :scroll-type :accessor scroll-type :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (increment :initarg :increment :accessor increment :type fp3232)))
(defun encode-scroll-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (number (slot-value %obj 'number))
         (scroll-type (slot-value %obj 'scroll-type))
         (flags (slot-value %obj 'flags))
         (increment (slot-value %obj 'increment)))
    (declare (ignorable type len sourceid number scroll-type flags increment))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card16 %buf number)
    (xcb:buffer-write-card16 %buf scroll-type)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (encode-fp3232 %buf increment)))
(defun decode-scroll-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid number scroll-type flags increment)
    (declare (ignorable %p type len sourceid number scroll-type flags increment))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf number (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf scroll-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf increment (decode-fp3232 %buf (+ %p 16) %order))
    (values
     (make-instance 'scroll-class :type type :len len :sourceid sourceid :number number
                    :scroll-type scroll-type :flags flags :increment increment)
     (+ %p 24))))

;;; xcb.Input.TouchClass
(defclass touch-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (num-touches :initarg :num-touches :accessor num-touches :type (unsigned-byte 8))))
(defun encode-touch-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (mode (slot-value %obj 'mode))
         (num-touches (slot-value %obj 'num-touches)))
    (declare (ignorable type len sourceid mode num-touches))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf num-touches)))
(defun decode-touch-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid mode num-touches)
    (declare (ignorable %p type len sourceid mode num-touches))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf mode (xcb:read-card8-at %buf (+ %p 6)))
    (setf num-touches (xcb:read-card8-at %buf (+ %p 7)))
    (values
     (make-instance 'touch-class :type type :len len :sourceid sourceid :mode mode :num-touches
                    num-touches)
     (+ %p 8))))

;;; xcb.Input.GestureClass
(defclass gesture-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (num-touches :initarg :num-touches :accessor num-touches :type (unsigned-byte 8))))
(defun encode-gesture-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (num-touches (slot-value %obj 'num-touches)))
    (declare (ignorable type len sourceid num-touches))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card8 %buf num-touches)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-gesture-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid num-touches)
    (declare (ignorable %p type len sourceid num-touches))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-touches (xcb:read-card8-at %buf (+ %p 6)))
    (values
     (make-instance 'gesture-class :type type :len len :sourceid sourceid :num-touches num-touches)
     (+ %p 8))))

;;; xcb.Input.ValuatorClass
(defclass valuator-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (number :initarg :number :accessor number :type (unsigned-byte 16))
           (label :initarg :label :accessor label :type xcb:atom)
           (min :initarg :min :accessor min :type fp3232)
           (max :initarg :max :accessor max :type fp3232)
           (value :initarg :value :accessor value :type fp3232)
           (resolution :initarg :resolution :accessor resolution :type (unsigned-byte 32))
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))))
(defun encode-valuator-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid))
         (number (slot-value %obj 'number))
         (label (slot-value %obj 'label))
         (min (slot-value %obj 'min))
         (max (slot-value %obj 'max))
         (value (slot-value %obj 'value))
         (resolution (slot-value %obj 'resolution))
         (mode (slot-value %obj 'mode)))
    (declare (ignorable type len sourceid number label min max value resolution mode))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (xcb:buffer-write-card16 %buf number)
    (xcb:buffer-write-card32 %buf label)
    (encode-fp3232 %buf min)
    (encode-fp3232 %buf max)
    (encode-fp3232 %buf value)
    (xcb:buffer-write-card32 %buf resolution)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-valuator-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type len sourceid number label min max value resolution mode)
    (declare (ignorable %p type len sourceid number label min max value resolution mode))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf number (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf label (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf min (decode-fp3232 %buf (+ %p 12) %order))
    (setf max (decode-fp3232 %buf (+ %p 20) %order))
    (setf value (decode-fp3232 %buf (+ %p 28) %order))
    (setf resolution (xcb:read-card32-at %buf (+ %p 36) %order))
    (setf mode (xcb:read-card8-at %buf (+ %p 40)))
    (values
     (make-instance 'valuator-class :type type :len len :sourceid sourceid :number number :label
                    label :min min :max max :value value :resolution resolution :mode mode)
     (+ %p 44))))

;;; xcb.Input.DeviceClass
(defclass device-class nil
          ((type :initarg :type :accessor type :type (unsigned-byte 16))
           (len :initarg :len :accessor len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (key-num-keys :initarg :key-num-keys :accessor key-num-keys :type (unsigned-byte 16))
           (key-keys :initarg :key-keys :accessor key-keys :type cl:sequence)
           (button-num-buttons :initarg :button-num-buttons :accessor button-num-buttons :type
            (unsigned-byte 16))
           (button-state :initarg :button-state :accessor button-state :type cl:sequence)
           (button-labels :initarg :button-labels :accessor button-labels :type cl:sequence)
           (valuator-number :initarg :valuator-number :accessor valuator-number :type
            (unsigned-byte 16))
           (valuator-label :initarg :valuator-label :accessor valuator-label :type xcb:atom)
           (valuator-min :initarg :valuator-min :accessor valuator-min :type fp3232)
           (valuator-max :initarg :valuator-max :accessor valuator-max :type fp3232)
           (valuator-value :initarg :valuator-value :accessor valuator-value :type fp3232)
           (valuator-resolution :initarg :valuator-resolution :accessor valuator-resolution :type
            (unsigned-byte 32))
           (valuator-mode :initarg :valuator-mode :accessor valuator-mode :type (unsigned-byte 8))
           (scroll-number :initarg :scroll-number :accessor scroll-number :type (unsigned-byte 16))
           (scroll-scroll-type :initarg :scroll-scroll-type :accessor scroll-scroll-type :type
            (unsigned-byte 16))
           (scroll-flags :initarg :scroll-flags :accessor scroll-flags :type (unsigned-byte 32))
           (scroll-increment :initarg :scroll-increment :accessor scroll-increment :type fp3232)
           (touch-mode :initarg :touch-mode :accessor touch-mode :type (unsigned-byte 8))
           (touch-num-touches :initarg :touch-num-touches :accessor touch-num-touches :type
            (unsigned-byte 8))
           (gesture-num-touches :initarg :gesture-num-touches :accessor gesture-num-touches :type
            (unsigned-byte 8))))
(defun encode-device-class (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (len (slot-value %obj 'len))
         (sourceid (slot-value %obj 'sourceid)))
    (declare (ignorable type len sourceid))
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf len)
    (xcb:buffer-write-card16 %buf sourceid)
    (let ((%mask type))
      (when (eql %mask 0)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'key-num-keys))
        (xcb:buffer-write-list %buf (slot-value %obj 'key-keys) (slot-value %obj 'key-num-keys)
         #'xcb:buffer-write-card32))
      (when (eql %mask 1)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'button-num-buttons))
        (xcb:buffer-write-list %buf (slot-value %obj 'button-state)
         (truncate (+ (slot-value %obj 'button-num-buttons) 31) 32) #'xcb:buffer-write-card32)
        (xcb:buffer-write-list %buf (slot-value %obj 'button-labels)
         (slot-value %obj 'button-num-buttons) #'xcb:buffer-write-card32))
      (when (eql %mask 2)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'valuator-number))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'valuator-label))
        (encode-fp3232 %buf (slot-value %obj 'valuator-min))
        (encode-fp3232 %buf (slot-value %obj 'valuator-max))
        (encode-fp3232 %buf (slot-value %obj 'valuator-value))
        (xcb:buffer-write-card32 %buf (slot-value %obj 'valuator-resolution))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'valuator-mode))
        (xcb:buffer-write-padding %buf 3))
      (when (eql %mask 3)
        (xcb:buffer-write-card16 %buf (slot-value %obj 'scroll-number))
        (xcb:buffer-write-card16 %buf (slot-value %obj 'scroll-scroll-type))
        (xcb:buffer-write-padding %buf 2)
        (xcb:buffer-write-card32 %buf (slot-value %obj 'scroll-flags))
        (encode-fp3232 %buf (slot-value %obj 'scroll-increment)))
      (when (eql %mask 8)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'touch-mode))
        (xcb:buffer-write-card8 %buf (slot-value %obj 'touch-num-touches)))
      (when (eql %mask 9)
        (xcb:buffer-write-card8 %buf (slot-value %obj 'gesture-num-touches))
        (xcb:buffer-write-padding %buf 1)))))
(defun decode-device-class (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        type
        len
        sourceid
        key-num-keys
        key-keys
        button-num-buttons
        button-state
        button-labels
        valuator-number
        valuator-label
        valuator-min
        valuator-max
        valuator-value
        valuator-resolution
        valuator-mode
        scroll-number
        scroll-scroll-type
        scroll-flags
        scroll-increment
        touch-mode
        touch-num-touches
        gesture-num-touches)
    (declare
     (ignorable %p type len sourceid key-num-keys key-keys button-num-buttons button-state
      button-labels valuator-number valuator-label valuator-min valuator-max valuator-value
      valuator-resolution valuator-mode scroll-number scroll-scroll-type scroll-flags
      scroll-increment touch-mode touch-num-touches gesture-num-touches))
    (setf type (xcb:read-card16-at %buf %p %order))
    (setf len (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf %p (+ %p 6))
    (let ((%mask type))
      (when (eql %mask 0)
        (setf key-num-keys (xcb:read-card16-at %buf %p %order))
        (setf %p (+ %p 2))
        (multiple-value-setq (key-keys %p)
          (xcb:read-vector-at %buf %p key-num-keys %order :card32)))
      (when (eql %mask 1)
        (setf button-num-buttons (xcb:read-card16-at %buf %p %order))
        (setf %p (+ %p 2))
        (multiple-value-setq (button-state %p)
          (xcb:read-vector-at %buf %p (truncate (+ button-num-buttons 31) 32) %order :card32))
        (multiple-value-setq (button-labels %p)
          (xcb:read-vector-at %buf %p button-num-buttons %order :card32)))
      (when (eql %mask 2)
        (setf valuator-number (xcb:read-card16-at %buf %p %order))
        (setf valuator-label (xcb:read-card32-at %buf (+ %p 2) %order))
        (setf valuator-min (decode-fp3232 %buf (+ %p 6) %order))
        (setf valuator-max (decode-fp3232 %buf (+ %p 14) %order))
        (setf valuator-value (decode-fp3232 %buf (+ %p 22) %order))
        (setf valuator-resolution (xcb:read-card32-at %buf (+ %p 30) %order))
        (setf valuator-mode (xcb:read-card8-at %buf (+ %p 34)))
        (setf %p (+ %p 38)))
      (when (eql %mask 3)
        (setf scroll-number (xcb:read-card16-at %buf %p %order))
        (setf scroll-scroll-type (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf scroll-flags (xcb:read-card32-at %buf (+ %p 6) %order))
        (setf scroll-increment (decode-fp3232 %buf (+ %p 10) %order))
        (setf %p (+ %p 18)))
      (when (eql %mask 8)
        (setf touch-mode (xcb:read-card8-at %buf %p))
        (setf touch-num-touches (xcb:read-card8-at %buf (+ %p 1)))
        (setf %p (+ %p 2)))
      (when (eql %mask 9)
        (setf gesture-num-touches (xcb:read-card8-at %buf %p))
        (setf %p (+ %p 2))))
    (let ((%obj (make-instance 'device-class :type type :len len :sourceid sourceid)))
      (when key-num-keys (setf (slot-value %obj 'key-num-keys) key-num-keys))
      (when key-keys (setf (slot-value %obj 'key-keys) key-keys))
      (when button-num-buttons (setf (slot-value %obj 'button-num-buttons) button-num-buttons))
      (when button-state (setf (slot-value %obj 'button-state) button-state))
      (when button-labels (setf (slot-value %obj 'button-labels) button-labels))
      (when valuator-number (setf (slot-value %obj 'valuator-number) valuator-number))
      (when valuator-label (setf (slot-value %obj 'valuator-label) valuator-label))
      (when valuator-min (setf (slot-value %obj 'valuator-min) valuator-min))
      (when valuator-max (setf (slot-value %obj 'valuator-max) valuator-max))
      (when valuator-value (setf (slot-value %obj 'valuator-value) valuator-value))
      (when valuator-resolution (setf (slot-value %obj 'valuator-resolution) valuator-resolution))
      (when valuator-mode (setf (slot-value %obj 'valuator-mode) valuator-mode))
      (when scroll-number (setf (slot-value %obj 'scroll-number) scroll-number))
      (when scroll-scroll-type (setf (slot-value %obj 'scroll-scroll-type) scroll-scroll-type))
      (when scroll-flags (setf (slot-value %obj 'scroll-flags) scroll-flags))
      (when scroll-increment (setf (slot-value %obj 'scroll-increment) scroll-increment))
      (when touch-mode (setf (slot-value %obj 'touch-mode) touch-mode))
      (when touch-num-touches (setf (slot-value %obj 'touch-num-touches) touch-num-touches))
      (when gesture-num-touches (setf (slot-value %obj 'gesture-num-touches) gesture-num-touches))
      (values %obj (+ %pos (* len 4))))))

;;; xcb.Input.XIDeviceInfo
(defclass xi-device-info nil
          ((deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (type :initarg :type :accessor type :type (unsigned-byte 16))
           (attachment :initarg :attachment :accessor attachment :type device-id)
           (num-classes :initarg :num-classes :accessor num-classes :type (unsigned-byte 16))
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (enabled :initarg :enabled :accessor enabled :type (or boolean (unsigned-byte 8)))
           (name :initarg :name :accessor name :type cl:sequence)
           (classes :initarg :classes :accessor classes :type cl:sequence)))
(defun encode-xi-device-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((deviceid (slot-value %obj 'deviceid))
         (type (slot-value %obj 'type))
         (attachment (slot-value %obj 'attachment))
         (enabled (slot-value %obj 'enabled))
         (name (slot-value %obj 'name))
         (classes (slot-value %obj 'classes))
         (name-len (cl:length name))
         (num-classes (cl:length classes)))
    (declare (ignorable deviceid type attachment enabled name classes name-len num-classes))
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf type)
    (xcb:buffer-write-card16 %buf attachment)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card16 %buf name-len)
    (xcb:buffer-write-bool %buf enabled)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-list %buf classes num-classes #'encode-device-class)))
(defun decode-xi-device-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) deviceid type attachment num-classes name-len enabled name classes)
    (declare (ignorable %p deviceid type attachment num-classes name-len enabled name classes))
    (setf deviceid (xcb:read-card16-at %buf %p %order))
    (setf type (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf attachment (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-classes (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf enabled (xcb:read-card8-at %buf (+ %p 10)))
    (setf %p (+ %p 12))
    (setf name (xcb:read-string-at %buf %p name-len))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (multiple-value-setq (classes %p)
      (xcb:read-struct-vector-at %buf %p num-classes %order #'decode-device-class))
    (values
     (make-instance 'xi-device-info :deviceid deviceid :type type :attachment attachment
                    :num-classes num-classes :name-len name-len :enabled enabled :name name
                    :classes classes)
     %p)))

;;; Request xcb.Input.XIQueryDevice
(defun xi-query-device (conn deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 48)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-query-device-request (xcb:request-with-reply)
          ((deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-query-device-request))
  (xi-query-device conn (slot-value %obj 'deviceid)))
(defclass xi-query-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-infos :initarg :num-infos :accessor num-infos :type (unsigned-byte 16))
           (infos :initarg :infos :accessor infos :type cl:sequence)))
(defun decode-xi-query-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-infos infos)
    (declare (ignorable %p response-type sequence length num-infos infos))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-infos (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (infos %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-infos (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-xi-device-info))
    (values
     (make-instance 'xi-query-device-reply :response-type response-type :sequence sequence :length
                    length :num-infos num-infos :infos infos)
     (+ %pos 32 (* 4 length)))))
(defun xi-query-device-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-query-device-reply))

;;; Request xcb.Input.XISetFocus
(defun xi-set-focus (conn window time deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 49)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-set-focus-request (xcb:request)
          ((window :initarg :window :type xcb:window) (time :initarg :time :type xcb:timestamp)
           (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-set-focus-request))
  (xi-set-focus conn (slot-value %obj 'window) (slot-value %obj 'time) (slot-value %obj 'deviceid)))

;;; Request xcb.Input.XIGetFocus
(defun xi-get-focus (conn deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 50)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-get-focus-request (xcb:request-with-reply)
          ((deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-get-focus-request))
  (xi-get-focus conn (slot-value %obj 'deviceid)))
(defclass xi-get-focus-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (focus :initarg :focus :accessor focus :type xcb:window)))
(defun decode-xi-get-focus-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length focus)
    (declare (ignorable %p response-type sequence length focus))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf focus (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'xi-get-focus-reply :response-type response-type :sequence sequence :length
                    length :focus focus)
     (+ %pos 32 (* 4 length)))))
(defun xi-get-focus-reply (conn cookie) (xcb:read-reply conn cookie #'decode-xi-get-focus-reply))

;;; Enum xcb.Input.GrabOwner
(xcb:defenum input-grab-owner
  (:no-owner 0)
  (:owner 1))

;;; Request xcb.Input.XIGrabDevice
(defun xi-grab-device (conn window time cursor deviceid mode paired-device-mode owner-events mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (mask-len (cl:length mask)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 51)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf paired-device-mode)
    (xcb:buffer-write-bool %buf owner-events)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf mask-len)
    (xcb:buffer-write-list %buf mask mask-len #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-grab-device-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window) (time :initarg :time :type xcb:timestamp)
           (cursor :initarg :cursor :type xcb:cursor) (deviceid :initarg :deviceid :type device-id)
           (mode :initarg :mode :type (unsigned-byte 8))
           (paired-device-mode :initarg :paired-device-mode :type (unsigned-byte 8))
           (owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (mask-len :initarg :mask-len :type (unsigned-byte 16))
           (mask :initarg :mask :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-grab-device-request))
  (xi-grab-device conn (slot-value %obj 'window) (slot-value %obj 'time) (slot-value %obj 'cursor)
   (slot-value %obj 'deviceid) (slot-value %obj 'mode) (slot-value %obj 'paired-device-mode)
   (slot-value %obj 'owner-events) (slot-value %obj 'mask)))
(defclass xi-grab-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun decode-xi-grab-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length status)
    (declare (ignorable %p response-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'xi-grab-device-reply :response-type response-type :sequence sequence :length
                    length :status status)
     (+ %pos 32 (* 4 length)))))
(defun xi-grab-device-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-grab-device-reply))

;;; Request xcb.Input.XIUngrabDevice
(defun xi-ungrab-device (conn time deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 52)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-ungrab-device-request (xcb:request)
          ((time :initarg :time :type xcb:timestamp) (deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-ungrab-device-request))
  (xi-ungrab-device conn (slot-value %obj 'time) (slot-value %obj 'deviceid)))

;;; Enum xcb.Input.EventMode
(xcb:defenum input-event-mode
  (:async-device 0)
  (:sync-device 1)
  (:replay-device 2)
  (:async-paired-device 3)
  (:async-pair 4)
  (:sync-pair 5)
  (:accept-touch 6)
  (:reject-touch 7))

;;; Request xcb.Input.XIAllowEvents
(defun xi-allow-events (conn time deviceid event-mode touchid grab-window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 53)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card8 %buf event-mode)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf touchid)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-allow-events-request (xcb:request)
          ((time :initarg :time :type xcb:timestamp) (deviceid :initarg :deviceid :type device-id)
           (event-mode :initarg :event-mode :type (unsigned-byte 8))
           (touchid :initarg :touchid :type (unsigned-byte 32))
           (grab-window :initarg :grab-window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj xi-allow-events-request))
  (xi-allow-events conn (slot-value %obj 'time) (slot-value %obj 'deviceid)
   (slot-value %obj 'event-mode) (slot-value %obj 'touchid) (slot-value %obj 'grab-window)))

;;; Enum xcb.Input.GrabMode22
(xcb:defenum input-grab-mode22
  (:sync 0)
  (:async 1)
  (:touch 2))

;;; Enum xcb.Input.GrabType
(xcb:defenum input-grab-type
  (:button 0)
  (:keycode 1)
  (:enter 2)
  (:focus-in 3)
  (:touch-begin 4)
  (:gesture-pinch-begin 5)
  (:gesture-swipe-begin 6))

;;; Enum xcb.Input.ModifierMask
(xcb:defenum input-modifier-mask
  (:any 2147483648))

;;; xcb.Input.GrabModifierInfo
(defclass grab-modifier-info nil
          ((modifiers :initarg :modifiers :accessor modifiers :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 8))))
(defun encode-grab-modifier-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((modifiers (slot-value %obj 'modifiers)) (status (slot-value %obj 'status)))
    (declare (ignorable modifiers status))
    (xcb:buffer-write-card32 %buf modifiers)
    (xcb:buffer-write-card8 %buf status)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-grab-modifier-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) modifiers status)
    (declare (ignorable %p modifiers status))
    (setf modifiers (xcb:read-card32-at %buf %p %order))
    (setf status (xcb:read-card8-at %buf (+ %p 4)))
    (values (make-instance 'grab-modifier-info :modifiers modifiers :status status) (+ %p 8))))

;;; Request xcb.Input.XIPassiveGrabDevice
(defun xi-passive-grab-device
       (conn time grab-window cursor detail deviceid grab-type grab-mode paired-device-mode
        owner-events mask modifiers)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (mask-len (cl:length mask))
         (num-modifiers (cl:length modifiers)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 54)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card32 %buf cursor)
    (xcb:buffer-write-card32 %buf detail)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf num-modifiers)
    (xcb:buffer-write-card16 %buf mask-len)
    (xcb:buffer-write-card8 %buf grab-type)
    (xcb:buffer-write-card8 %buf grab-mode)
    (xcb:buffer-write-card8 %buf paired-device-mode)
    (xcb:buffer-write-bool %buf owner-events)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf mask mask-len #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf modifiers num-modifiers #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-passive-grab-device-request (xcb:request-with-reply)
          ((time :initarg :time :type xcb:timestamp)
           (grab-window :initarg :grab-window :type xcb:window)
           (cursor :initarg :cursor :type xcb:cursor)
           (detail :initarg :detail :type (unsigned-byte 32))
           (deviceid :initarg :deviceid :type device-id)
           (num-modifiers :initarg :num-modifiers :type (unsigned-byte 16))
           (mask-len :initarg :mask-len :type (unsigned-byte 16))
           (grab-type :initarg :grab-type :type (unsigned-byte 8))
           (grab-mode :initarg :grab-mode :type (unsigned-byte 8))
           (paired-device-mode :initarg :paired-device-mode :type (unsigned-byte 8))
           (owner-events :initarg :owner-events :type (or boolean (unsigned-byte 8)))
           (mask :initarg :mask :type cl:sequence)
           (modifiers :initarg :modifiers :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-passive-grab-device-request))
  (xi-passive-grab-device conn (slot-value %obj 'time) (slot-value %obj 'grab-window)
   (slot-value %obj 'cursor) (slot-value %obj 'detail) (slot-value %obj 'deviceid)
   (slot-value %obj 'grab-type) (slot-value %obj 'grab-mode) (slot-value %obj 'paired-device-mode)
   (slot-value %obj 'owner-events) (slot-value %obj 'mask) (slot-value %obj 'modifiers)))
(defclass xi-passive-grab-device-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-modifiers :initarg :num-modifiers :accessor num-modifiers :type (unsigned-byte 16))
           (modifiers :initarg :modifiers :accessor modifiers :type cl:sequence)))
(defun decode-xi-passive-grab-device-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-modifiers modifiers)
    (declare (ignorable %p response-type sequence length num-modifiers modifiers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-modifiers (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (modifiers %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min num-modifiers (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
       #'decode-grab-modifier-info))
    (values
     (make-instance 'xi-passive-grab-device-reply :response-type response-type :sequence sequence
                    :length length :num-modifiers num-modifiers :modifiers modifiers)
     (+ %pos 32 (* 4 length)))))
(defun xi-passive-grab-device-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-passive-grab-device-reply))

;;; Request xcb.Input.XIPassiveUngrabDevice
(defun xi-passive-ungrab-device (conn grab-window detail deviceid grab-type modifiers)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-modifiers (cl:length modifiers)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 55)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf grab-window)
    (xcb:buffer-write-card32 %buf detail)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf num-modifiers)
    (xcb:buffer-write-card8 %buf grab-type)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-list %buf modifiers num-modifiers #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-passive-ungrab-device-request (xcb:request)
          ((grab-window :initarg :grab-window :type xcb:window)
           (detail :initarg :detail :type (unsigned-byte 32))
           (deviceid :initarg :deviceid :type device-id)
           (num-modifiers :initarg :num-modifiers :type (unsigned-byte 16))
           (grab-type :initarg :grab-type :type (unsigned-byte 8))
           (modifiers :initarg :modifiers :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-passive-ungrab-device-request))
  (xi-passive-ungrab-device conn (slot-value %obj 'grab-window) (slot-value %obj 'detail)
   (slot-value %obj 'deviceid) (slot-value %obj 'grab-type) (slot-value %obj 'modifiers)))

;;; Request xcb.Input.XIListProperties
(defun xi-list-properties (conn deviceid)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 56)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-list-properties-request (xcb:request-with-reply)
          ((deviceid :initarg :deviceid :type device-id)))
(defmethod xcb:send-request (conn (%obj xi-list-properties-request))
  (xi-list-properties conn (slot-value %obj 'deviceid)))
(defclass xi-list-properties-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-properties :initarg :num-properties :accessor num-properties :type
            (unsigned-byte 16))
           (properties :initarg :properties :accessor properties :type cl:sequence)))
(defun decode-xi-list-properties-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-properties properties)
    (declare (ignorable %p response-type sequence length num-properties properties))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-properties (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (properties %p)
      (xcb:read-vector-at %buf %p (cl:min num-properties (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance 'xi-list-properties-reply :response-type response-type :sequence sequence
                    :length length :num-properties num-properties :properties properties)
     (+ %pos 32 (* 4 length)))))
(defun xi-list-properties-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-list-properties-reply))

;;; Request xcb.Input.XIChangeProperty
(defun xi-change-property
       (conn deviceid mode format property type num-items &key data8 data16 data32)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 57)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf format)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card32 %buf num-items)
    (let ((%mask format))
      (when (eql %mask 8)
        (xcb:buffer-write-octets %buf data8 :end num-items)
        (xcb:buffer-pad-to-align %buf 4))
      (when (eql %mask 16)
        (xcb:buffer-write-list %buf data16 num-items #'xcb:buffer-write-card16)
        (xcb:buffer-pad-to-align %buf 4))
      (when (eql %mask 32)
        (xcb:buffer-write-list %buf data32 num-items #'xcb:buffer-write-card32)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-change-property-request (xcb:request)
          ((deviceid :initarg :deviceid :type device-id)
           (mode :initarg :mode :type (unsigned-byte 8))
           (format :initarg :format :type (unsigned-byte 8))
           (property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (num-items :initarg :num-items :type (unsigned-byte 32))
           (data8 :initarg :data8 :type cl:sequence) (data16 :initarg :data16 :type cl:sequence)
           (data32 :initarg :data32 :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-change-property-request))
  (apply #'xi-change-property conn (slot-value %obj 'deviceid) (slot-value %obj 'mode)
         (slot-value %obj 'format) (slot-value %obj 'property) (slot-value %obj 'type)
         (slot-value %obj 'num-items)
         (nconc (when (slot-boundp %obj 'data8) (list :data8 (slot-value %obj 'data8)))
                (when (slot-boundp %obj 'data16) (list :data16 (slot-value %obj 'data16)))
                (when (slot-boundp %obj 'data32) (list :data32 (slot-value %obj 'data32))))))

;;; Request xcb.Input.XIDeleteProperty
(defun xi-delete-property (conn deviceid property)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 58)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-delete-property-request (xcb:request)
          ((deviceid :initarg :deviceid :type device-id)
           (property :initarg :property :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj xi-delete-property-request))
  (xi-delete-property conn (slot-value %obj 'deviceid) (slot-value %obj 'property)))

;;; Request xcb.Input.XIGetProperty
(defun xi-get-property (conn deviceid delete property type offset len)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 59)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-bool %buf delete)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-card32 %buf type)
    (xcb:buffer-write-card32 %buf offset)
    (xcb:buffer-write-card32 %buf len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-get-property-request (xcb:request-with-reply)
          ((deviceid :initarg :deviceid :type device-id)
           (delete :initarg :delete :type (or boolean (unsigned-byte 8)))
           (property :initarg :property :type xcb:atom) (type :initarg :type :type xcb:atom)
           (offset :initarg :offset :type (unsigned-byte 32))
           (len :initarg :len :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj xi-get-property-request))
  (xi-get-property conn (slot-value %obj 'deviceid) (slot-value %obj 'delete)
   (slot-value %obj 'property) (slot-value %obj 'type) (slot-value %obj 'offset)
   (slot-value %obj 'len)))
(defclass xi-get-property-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (type :initarg :type :accessor type :type xcb:atom)
           (bytes-after :initarg :bytes-after :accessor bytes-after :type (unsigned-byte 32))
           (num-items :initarg :num-items :accessor num-items :type (unsigned-byte 32))
           (format :initarg :format :accessor format :type (unsigned-byte 8))
           (data8 :initarg :data8 :accessor data8 :type cl:sequence)
           (data16 :initarg :data16 :accessor data16 :type cl:sequence)
           (data32 :initarg :data32 :accessor data32 :type cl:sequence)))
(defun decode-xi-get-property-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        type
        bytes-after
        num-items
        format
        data8
        data16
        data32)
    (declare
     (ignorable %p response-type sequence length type bytes-after num-items format data8 data16
      data32))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf type (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf bytes-after (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-items (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf format (xcb:read-card8-at %buf (+ %p 20)))
    (setf %p (+ %p 32))
    (let ((%mask format))
      (when (eql %mask 8)
        (multiple-value-setq (data8 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 1))
           %order :card8))
        (setf %p (xcb:align-position %p 4)))
      (when (eql %mask 16)
        (multiple-value-setq (data16 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 2))
           %order :card16))
        (setf %p (xcb:align-position %p 4)))
      (when (eql %mask 32)
        (multiple-value-setq (data32 %p)
          (xcb:read-vector-at %buf %p (cl:min num-items (floor (- (+ %pos 32 (* 4 length)) %p) 4))
           %order :card32))))
    (let ((%obj
           (make-instance 'xi-get-property-reply :response-type response-type :sequence sequence
                          :length length :type type :bytes-after bytes-after :num-items num-items
                          :format format)))
      (when data8 (setf (slot-value %obj 'data8) data8))
      (when data16 (setf (slot-value %obj 'data16) data16))
      (when data32 (setf (slot-value %obj 'data32) data32))
      (values %obj (+ %pos 32 (* 4 length))))))
(defun xi-get-property-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-get-property-reply))

;;; Request xcb.Input.XIGetSelectedEvents
(defun xi-get-selected-events (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 60)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass xi-get-selected-events-request (xcb:request-with-reply)
          ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj xi-get-selected-events-request))
  (xi-get-selected-events conn (slot-value %obj 'window)))
(defclass xi-get-selected-events-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (num-masks :initarg :num-masks :accessor num-masks :type (unsigned-byte 16))
           (masks :initarg :masks :accessor masks :type cl:sequence)))
(defun decode-xi-get-selected-events-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length num-masks masks)
    (declare (ignorable %p response-type sequence length num-masks masks))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-masks (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (masks %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-masks (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-event-mask))
    (values
     (make-instance 'xi-get-selected-events-reply :response-type response-type :sequence sequence
                    :length length :num-masks num-masks :masks masks)
     (+ %pos 32 (* 4 length)))))
(defun xi-get-selected-events-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-xi-get-selected-events-reply))

;;; xcb.Input.BarrierReleasePointerInfo
(defclass barrier-release-pointer-info nil
          ((deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (barrier :initarg :barrier :accessor barrier :type xcb-xfixes:barrier)
           (eventid :initarg :eventid :accessor eventid :type (unsigned-byte 32))))
(defun encode-barrier-release-pointer-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((deviceid (slot-value %obj 'deviceid))
         (barrier (slot-value %obj 'barrier))
         (eventid (slot-value %obj 'eventid)))
    (declare (ignorable deviceid barrier eventid))
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf barrier)
    (xcb:buffer-write-card32 %buf eventid)))
(defun decode-barrier-release-pointer-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) deviceid barrier eventid)
    (declare (ignorable %p deviceid barrier eventid))
    (setf deviceid (xcb:read-card16-at %buf %p %order))
    (setf barrier (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf eventid (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'barrier-release-pointer-info :deviceid deviceid :barrier barrier :eventid
                    eventid)
     (+ %p 12))))

;;; Request xcb.Input.XIBarrierReleasePointer
(defun xi-barrier-release-pointer (conn barriers)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-barriers (cl:length barriers)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 61)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf num-barriers)
    (xcb:buffer-write-list %buf barriers num-barriers #'encode-barrier-release-pointer-info)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass xi-barrier-release-pointer-request (xcb:request)
          ((num-barriers :initarg :num-barriers :type (unsigned-byte 32))
           (barriers :initarg :barriers :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj xi-barrier-release-pointer-request))
  (xi-barrier-release-pointer conn (slot-value %obj 'barriers)))

;;; Event xcb.Input.DeviceValuator (0)
(defclass device-valuator (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (device-state :initarg :device-state :accessor device-state :type (unsigned-byte 16))
           (num-valuators :initarg :num-valuators :accessor num-valuators :type (unsigned-byte 8))
           (first-valuator :initarg :first-valuator :accessor first-valuator :type
            (unsigned-byte 8))
           (valuators :initarg :valuators :accessor valuators :type cl:sequence)))
(defun decode-device-valuator (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        device-state
        num-valuators
        first-valuator
        valuators)
    (declare
     (ignorable %p response-type device-id sequence device-state num-valuators first-valuator
      valuators))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf device-state (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf num-valuators (xcb:read-card8-at %buf (+ %p 6)))
    (setf first-valuator (xcb:read-card8-at %buf (+ %p 7)))
    (setf valuators (xcb:read-vector-at %buf (+ %p 8) 6 %order :int32))
    (values
     (make-instance 'device-valuator :response-type response-type :device-id device-id :sequence
                    sequence :device-state device-state :num-valuators num-valuators
                    :first-valuator first-valuator :valuators valuators)
     (+ %pos 32))))
(defun encode-device-valuator (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (device-state (slot-value %obj 'device-state))
         (num-valuators (slot-value %obj 'num-valuators))
         (first-valuator (slot-value %obj 'first-valuator))
         (valuators (slot-value %obj 'valuators)))
    (declare
     (ignorable response-type device-id sequence device-state num-valuators first-valuator
      valuators))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card16 %buf device-state)
    (xcb:buffer-write-card8 %buf num-valuators)
    (xcb:buffer-write-card8 %buf first-valuator)
    (xcb:buffer-write-fixed-list %buf valuators 6 #'xcb:buffer-write-card32 4)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-valuator)) (encode-device-valuator %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 0 #'decode-device-valuator)

;;; Enum xcb.Input.MoreEventsMask
(xcb:defenum input-more-events-mask
  (:more-events 128))

;;; Event xcb.Input.DeviceKeyPress (1)
(defclass device-key-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-key-press (%buf %pos %order &optional (%class 'device-key-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        detail
        sequence
        time
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        state
        same-screen
        device-id)
    (declare
     (ignorable %p response-type detail sequence time root event child root-x root-y event-x
      event-y state same-screen device-id))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf detail (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root-x (xcb:read-int16-at %buf (+ %p 20) %order))
    (setf root-y (xcb:read-int16-at %buf (+ %p 22) %order))
    (setf event-x (xcb:read-int16-at %buf (+ %p 24) %order))
    (setf event-y (xcb:read-int16-at %buf (+ %p 26) %order))
    (setf state (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf same-screen (xcb:read-card8-at %buf (+ %p 30)))
    (setf device-id (xcb:read-card8-at %buf (+ %p 31)))
    (values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :time
                    time :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :state state :same-screen same-screen
                    :device-id device-id)
     (+ %pos 32))))
(defun encode-device-key-press (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (root (slot-value %obj 'root))
         (event (slot-value %obj 'event))
         (child (slot-value %obj 'child))
         (root-x (slot-value %obj 'root-x))
         (root-y (slot-value %obj 'root-y))
         (event-x (slot-value %obj 'event-x))
         (event-y (slot-value %obj 'event-y))
         (state (slot-value %obj 'state))
         (same-screen (slot-value %obj 'same-screen))
         (device-id (slot-value %obj 'device-id)))
    (declare
     (ignorable response-type detail sequence time root event child root-x root-y event-x event-y
      state same-screen device-id))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf detail)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf root)
    (xcb:buffer-write-card32 %buf event)
    (xcb:buffer-write-card32 %buf child)
    (xcb:buffer-write-card16 %buf root-x)
    (xcb:buffer-write-card16 %buf root-y)
    (xcb:buffer-write-card16 %buf event-x)
    (xcb:buffer-write-card16 %buf event-y)
    (xcb:buffer-write-card16 %buf state)
    (xcb:buffer-write-bool %buf same-screen)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-key-press)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 1 #'decode-device-key-press)

;;; Event xcb.Input.DeviceKeyRelease (2)
(defclass device-key-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-key-release (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'device-key-release))
(defmethod xcb:encode-event (%buf (%obj device-key-release)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 2 #'decode-device-key-release)

;;; Event xcb.Input.DeviceButtonPress (3)
(defclass device-button-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-button-press (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'device-button-press))
(defmethod xcb:encode-event (%buf (%obj device-button-press)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 3 #'decode-device-button-press)

;;; Event xcb.Input.DeviceButtonRelease (4)
(defclass device-button-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-button-release (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'device-button-release))
(defmethod xcb:encode-event (%buf (%obj device-button-release)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 4 #'decode-device-button-release)

;;; Event xcb.Input.DeviceMotionNotify (5)
(defclass device-motion-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-motion-notify (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'device-motion-notify))
(defmethod xcb:encode-event (%buf (%obj device-motion-notify)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 5 #'decode-device-motion-notify)

;;; Event xcb.Input.DeviceFocusIn (6)
(defclass device-focus-in (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-focus-in (%buf %pos %order &optional (%class 'device-focus-in))
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type detail sequence time window mode device-id)
    (declare (ignorable %p response-type detail sequence time window mode device-id))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf detail (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf mode (xcb:read-card8-at %buf (+ %p 12)))
    (setf device-id (xcb:read-card8-at %buf (+ %p 13)))
    (values
     (make-instance %class :response-type response-type :detail detail :sequence sequence :time
                    time :window window :mode mode :device-id device-id)
     (+ %pos 32))))
(defun encode-device-focus-in (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (window (slot-value %obj 'window))
         (mode (slot-value %obj 'mode))
         (device-id (slot-value %obj 'device-id)))
    (declare (ignorable response-type detail sequence time window mode device-id))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf detail)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-card8 %buf mode)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 18)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-focus-in)) (encode-device-focus-in %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 6 #'decode-device-focus-in)

;;; Event xcb.Input.DeviceFocusOut (7)
(defclass device-focus-out (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (window :initarg :window :accessor window :type xcb:window)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-focus-out (%buf %pos %order)
  (decode-device-focus-in %buf %pos %order 'device-focus-out))
(defmethod xcb:encode-event (%buf (%obj device-focus-out)) (encode-device-focus-in %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 7 #'decode-device-focus-out)

;;; Event xcb.Input.ProximityIn (8)
(defclass proximity-in (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-proximity-in (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'proximity-in))
(defmethod xcb:encode-event (%buf (%obj proximity-in)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 8 #'decode-proximity-in)

;;; Event xcb.Input.ProximityOut (9)
(defclass proximity-out (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type (signed-byte 16))
           (root-y :initarg :root-y :accessor root-y :type (signed-byte 16))
           (event-x :initarg :event-x :accessor event-x :type (signed-byte 16))
           (event-y :initarg :event-y :accessor event-y :type (signed-byte 16))
           (state :initarg :state :accessor state :type (unsigned-byte 16))
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-proximity-out (%buf %pos %order)
  (decode-device-key-press %buf %pos %order 'proximity-out))
(defmethod xcb:encode-event (%buf (%obj proximity-out)) (encode-device-key-press %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 9 #'decode-proximity-out)

;;; Enum xcb.Input.ClassesReportedMask
(xcb:defenum input-classes-reported-mask
  (:out-of-proximity 128)
  (:device-mode-absolute 64)
  (:reporting-valuators 4)
  (:reporting-buttons 2)
  (:reporting-keys 1))

;;; Event xcb.Input.DeviceStateNotify (10)
(defclass device-state-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (num-keys :initarg :num-keys :accessor num-keys :type (unsigned-byte 8))
           (num-buttons :initarg :num-buttons :accessor num-buttons :type (unsigned-byte 8))
           (num-valuators :initarg :num-valuators :accessor num-valuators :type (unsigned-byte 8))
           (classes-reported :initarg :classes-reported :accessor classes-reported :type
            (unsigned-byte 8))
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)
           (keys :initarg :keys :accessor keys :type cl:sequence)
           (valuators :initarg :valuators :accessor valuators :type cl:sequence)))
(defun decode-device-state-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        time
        num-keys
        num-buttons
        num-valuators
        classes-reported
        buttons
        keys
        valuators)
    (declare
     (ignorable %p response-type device-id sequence time num-keys num-buttons num-valuators
      classes-reported buttons keys valuators))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf num-keys (xcb:read-card8-at %buf (+ %p 8)))
    (setf num-buttons (xcb:read-card8-at %buf (+ %p 9)))
    (setf num-valuators (xcb:read-card8-at %buf (+ %p 10)))
    (setf classes-reported (xcb:read-card8-at %buf (+ %p 11)))
    (setf buttons (xcb:read-vector-at %buf (+ %p 12) 4 %order :card8))
    (setf keys (xcb:read-vector-at %buf (+ %p 16) 4 %order :card8))
    (setf valuators (xcb:read-vector-at %buf (+ %p 20) 3 %order :card32))
    (values
     (make-instance 'device-state-notify :response-type response-type :device-id device-id
                    :sequence sequence :time time :num-keys num-keys :num-buttons num-buttons
                    :num-valuators num-valuators :classes-reported classes-reported :buttons
                    buttons :keys keys :valuators valuators)
     (+ %pos 32))))
(defun encode-device-state-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (num-keys (slot-value %obj 'num-keys))
         (num-buttons (slot-value %obj 'num-buttons))
         (num-valuators (slot-value %obj 'num-valuators))
         (classes-reported (slot-value %obj 'classes-reported))
         (buttons (slot-value %obj 'buttons))
         (keys (slot-value %obj 'keys))
         (valuators (slot-value %obj 'valuators)))
    (declare
     (ignorable response-type device-id sequence time num-keys num-buttons num-valuators
      classes-reported buttons keys valuators))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf num-keys)
    (xcb:buffer-write-card8 %buf num-buttons)
    (xcb:buffer-write-card8 %buf num-valuators)
    (xcb:buffer-write-card8 %buf classes-reported)
    (xcb:buffer-write-fixed-list %buf buttons 4 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-fixed-list %buf keys 4 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-fixed-list %buf valuators 3 #'xcb:buffer-write-card32 4)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-state-notify))
  (encode-device-state-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 10 #'decode-device-state-notify)

;;; Event xcb.Input.DeviceMappingNotify (11)
(defclass device-mapping-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (request :initarg :request :accessor request :type (unsigned-byte 8))
           (first-keycode :initarg :first-keycode :accessor first-keycode :type key-code)
           (count :initarg :count :accessor count :type (unsigned-byte 8))
           (time :initarg :time :accessor time :type xcb:timestamp)))
(defun decode-device-mapping-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence request first-keycode count time)
    (declare (ignorable %p response-type device-id sequence request first-keycode count time))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf request (xcb:read-card8-at %buf (+ %p 4)))
    (setf first-keycode (xcb:read-card8-at %buf (+ %p 5)))
    (setf count (xcb:read-card8-at %buf (+ %p 6)))
    (setf time (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'device-mapping-notify :response-type response-type :device-id device-id
                    :sequence sequence :request request :first-keycode first-keycode :count count
                    :time time)
     (+ %pos 32))))
(defun encode-device-mapping-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (request (slot-value %obj 'request))
         (first-keycode (slot-value %obj 'first-keycode))
         (count (slot-value %obj 'count))
         (time (slot-value %obj 'time)))
    (declare (ignorable response-type device-id sequence request first-keycode count time))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card8 %buf request)
    (xcb:buffer-write-card8 %buf first-keycode)
    (xcb:buffer-write-card8 %buf count)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-padding %buf 20)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-mapping-notify))
  (encode-device-mapping-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 11 #'decode-device-mapping-notify)

;;; Enum xcb.Input.ChangeDevice
(xcb:defenum input-change-device
  (:new-pointer 0)
  (:new-keyboard 1))

;;; Event xcb.Input.ChangeDeviceNotify (12)
(defclass change-device-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (request :initarg :request :accessor request :type (unsigned-byte 8))))
(defun decode-change-device-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence time request)
    (declare (ignorable %p response-type device-id sequence time request))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf request (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'change-device-notify :response-type response-type :device-id device-id
                    :sequence sequence :time time :request request)
     (+ %pos 32))))
(defun encode-change-device-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (request (slot-value %obj 'request)))
    (declare (ignorable response-type device-id sequence time request))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf request)
    (xcb:buffer-write-padding %buf 23)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj change-device-notify))
  (encode-change-device-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 12 #'decode-change-device-notify)

;;; Event xcb.Input.DeviceKeyStateNotify (13)
(defclass device-key-state-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun decode-device-key-state-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence keys)
    (declare (ignorable %p response-type device-id sequence keys))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf keys (xcb:read-vector-at %buf (+ %p 4) 28 %order :card8))
    (values
     (make-instance 'device-key-state-notify :response-type response-type :device-id device-id
                    :sequence sequence :keys keys)
     (+ %pos 32))))
(defun encode-device-key-state-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (keys (slot-value %obj 'keys)))
    (declare (ignorable response-type device-id sequence keys))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-fixed-list %buf keys 28 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-key-state-notify))
  (encode-device-key-state-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 13 #'decode-device-key-state-notify)

;;; Event xcb.Input.DeviceButtonStateNotify (14)
(defclass device-button-state-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-device-button-state-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence buttons)
    (declare (ignorable %p response-type device-id sequence buttons))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf buttons (xcb:read-vector-at %buf (+ %p 4) 28 %order :card8))
    (values
     (make-instance 'device-button-state-notify :response-type response-type :device-id device-id
                    :sequence sequence :buttons buttons)
     (+ %pos 32))))
(defun encode-device-button-state-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (device-id (slot-value %obj 'device-id))
         (sequence (slot-value %obj 'sequence))
         (buttons (slot-value %obj 'buttons)))
    (declare (ignorable response-type device-id sequence buttons))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-fixed-list %buf buttons 28 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-button-state-notify))
  (encode-device-button-state-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 14 #'decode-device-button-state-notify)

;;; Enum xcb.Input.DeviceChange
(xcb:defenum input-device-change
  (:added 0)
  (:removed 1)
  (:enabled 2)
  (:disabled 3)
  (:unrecoverable 4)
  (:control-changed 5))

;;; Event xcb.Input.DevicePresenceNotify (15)
(defclass device-presence-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (devchange :initarg :devchange :accessor devchange :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (control :initarg :control :accessor control :type (unsigned-byte 16))))
(defun decode-device-presence-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence time devchange device-id control)
    (declare (ignorable %p response-type sequence time devchange device-id control))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf devchange (xcb:read-card8-at %buf (+ %p 8)))
    (setf device-id (xcb:read-card8-at %buf (+ %p 9)))
    (setf control (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'device-presence-notify :response-type response-type :sequence sequence :time
                    time :devchange devchange :device-id device-id :control control)
     (+ %pos 32))))
(defun encode-device-presence-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (devchange (slot-value %obj 'devchange))
         (device-id (slot-value %obj 'device-id))
         (control (slot-value %obj 'control)))
    (declare (ignorable response-type sequence time devchange device-id control))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf devchange)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card16 %buf control)
    (xcb:buffer-write-padding %buf 20)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-presence-notify))
  (encode-device-presence-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 15 #'decode-device-presence-notify)

;;; Event xcb.Input.DevicePropertyNotify (16)
(defclass device-property-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (property :initarg :property :accessor property :type xcb:atom)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))))
(defun decode-device-property-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type state sequence time property device-id)
    (declare (ignorable %p response-type state sequence time property device-id))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf state (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf property (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 31)))
    (values
     (make-instance 'device-property-notify :response-type response-type :state state :sequence
                    sequence :time time :property property :device-id device-id)
     (+ %pos 32))))
(defun encode-device-property-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (state (slot-value %obj 'state))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (property (slot-value %obj 'property))
         (device-id (slot-value %obj 'device-id)))
    (declare (ignorable response-type state sequence time property device-id))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf state)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card32 %buf property)
    (xcb:buffer-write-padding %buf 19)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj device-property-notify))
  (encode-device-property-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-INPUT" 16 #'decode-device-property-notify)

;;; Enum xcb.Input.ChangeReason
(xcb:defenum input-change-reason
  (:slave-switch 1)
  (:device-change 2))

;;; Event xcb.Input.DeviceChanged (1)
(defclass device-changed (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (num-classes :initarg :num-classes :accessor num-classes :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (reason :initarg :reason :accessor reason :type (unsigned-byte 8))
           (classes :initarg :classes :accessor classes :type cl:sequence)))
(defun decode-device-changed (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        num-classes
        sourceid
        reason
        classes)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time num-classes
      sourceid reason classes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf num-classes (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf reason (xcb:read-card8-at %buf (+ %p 20)))
    (setf %p (+ %p 32))
    (multiple-value-setq (classes %p)
      (xcb:read-struct-vector-at %buf %p (cl:min num-classes (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-device-class))
    (values
     (make-instance 'device-changed :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :deviceid deviceid :time time
                    :num-classes num-classes :sourceid sourceid :reason reason :classes classes)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 1 #'decode-device-changed)

;;; Enum xcb.Input.KeyEventFlags
(xcb:defenum input-key-event-flags
  (:key-repeat 65536))

;;; Event xcb.Input.KeyPress (2)
(defclass key-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-key-press (%buf %pos %order &optional (%class 'key-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        buttons-len
        valuators-len
        sourceid
        flags
        mods
        group
        button-mask
        valuator-mask
        axisvalues)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail root
      event child root-x root-y event-x event-y buttons-len valuators-len sourceid flags mods group
      button-mask valuator-mask axisvalues))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf buttons-len (xcb:read-card16-at %buf (+ %p 48) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 50) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 52) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 56) %order))
    (setf mods (decode-modifier-info %buf (+ %p 60) %order))
    (setf group (decode-group-info %buf (+ %p 76) %order))
    (setf %p (+ %p 80))
    (multiple-value-setq (button-mask %p)
      (xcb:read-vector-at %buf %p (cl:min buttons-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :buttons-len buttons-len :valuators-len
                    valuators-len :sourceid sourceid :flags flags :mods mods :group group
                    :button-mask button-mask :valuator-mask valuator-mask :axisvalues axisvalues)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 2 #'decode-key-press)

;;; Event xcb.Input.KeyRelease (3)
(defclass key-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-key-release (%buf %pos %order) (decode-key-press %buf %pos %order 'key-release))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 3 #'decode-key-release)

;;; Enum xcb.Input.PointerEventFlags
(xcb:defenum input-pointer-event-flags
  (:pointer-emulated 65536))

;;; Event xcb.Input.ButtonPress (4)
(defclass button-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-button-press (%buf %pos %order &optional (%class 'button-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        buttons-len
        valuators-len
        sourceid
        flags
        mods
        group
        button-mask
        valuator-mask
        axisvalues)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail root
      event child root-x root-y event-x event-y buttons-len valuators-len sourceid flags mods group
      button-mask valuator-mask axisvalues))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf buttons-len (xcb:read-card16-at %buf (+ %p 48) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 50) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 52) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 56) %order))
    (setf mods (decode-modifier-info %buf (+ %p 60) %order))
    (setf group (decode-group-info %buf (+ %p 76) %order))
    (setf %p (+ %p 80))
    (multiple-value-setq (button-mask %p)
      (xcb:read-vector-at %buf %p (cl:min buttons-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :buttons-len buttons-len :valuators-len
                    valuators-len :sourceid sourceid :flags flags :mods mods :group group
                    :button-mask button-mask :valuator-mask valuator-mask :axisvalues axisvalues)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 4 #'decode-button-press)

;;; Event xcb.Input.ButtonRelease (5)
(defclass button-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-button-release (%buf %pos %order)
  (decode-button-press %buf %pos %order 'button-release))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 5 #'decode-button-release)

;;; Event xcb.Input.Motion (6)
(defclass motion (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-motion (%buf %pos %order) (decode-button-press %buf %pos %order 'motion))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 6 #'decode-motion)

;;; Enum xcb.Input.NotifyMode
(xcb:defenum input-notify-mode
  (:normal 0)
  (:grab 1)
  (:ungrab 2)
  (:while-grabbed 3)
  (:passive-grab 4)
  (:passive-ungrab 5))

;;; Enum xcb.Input.NotifyDetail
(xcb:defenum input-notify-detail
  (:ancestor 0)
  (:virtual 1)
  (:inferior 2)
  (:nonlinear 3)
  (:nonlinear-virtual 4)
  (:pointer 5)
  (:pointer-root 6)
  (:none 7))

;;; Event xcb.Input.Enter (7)
(defclass enter (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (focus :initarg :focus :accessor focus :type (or boolean (unsigned-byte 8)))
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-enter (%buf %pos %order &optional (%class 'enter))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        sourceid
        mode
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        same-screen
        focus
        buttons-len
        mods
        group
        buttons)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time sourceid mode
      detail root event child root-x root-y event-x event-y same-screen focus buttons-len mods
      group buttons))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf mode (xcb:read-card8-at %buf (+ %p 18)))
    (setf detail (xcb:read-card8-at %buf (+ %p 19)))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf same-screen (xcb:read-card8-at %buf (+ %p 48)))
    (setf focus (xcb:read-card8-at %buf (+ %p 49)))
    (setf buttons-len (xcb:read-card16-at %buf (+ %p 50) %order))
    (setf mods (decode-modifier-info %buf (+ %p 52) %order))
    (setf group (decode-group-info %buf (+ %p 68) %order))
    (setf %p (+ %p 72))
    (multiple-value-setq (buttons %p)
      (xcb:read-vector-at %buf %p (cl:min buttons-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :sourceid
                    sourceid :mode mode :detail detail :root root :event event :child child :root-x
                    root-x :root-y root-y :event-x event-x :event-y event-y :same-screen
                    same-screen :focus focus :buttons-len buttons-len :mods mods :group group
                    :buttons buttons)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 7 #'decode-enter)

;;; Event xcb.Input.Leave (8)
(defclass leave (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (focus :initarg :focus :accessor focus :type (or boolean (unsigned-byte 8)))
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-leave (%buf %pos %order) (decode-enter %buf %pos %order 'leave))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 8 #'decode-leave)

;;; Event xcb.Input.FocusIn (9)
(defclass focus-in (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (focus :initarg :focus :accessor focus :type (or boolean (unsigned-byte 8)))
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-focus-in (%buf %pos %order) (decode-enter %buf %pos %order 'focus-in))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 9 #'decode-focus-in)

;;; Event xcb.Input.FocusOut (10)
(defclass focus-out (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mode :initarg :mode :accessor mode :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (same-screen :initarg :same-screen :accessor same-screen :type
            (or boolean (unsigned-byte 8)))
           (focus :initarg :focus :accessor focus :type (or boolean (unsigned-byte 8)))
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (buttons :initarg :buttons :accessor buttons :type cl:sequence)))
(defun decode-focus-out (%buf %pos %order) (decode-enter %buf %pos %order 'focus-out))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 10 #'decode-focus-out)

;;; Enum xcb.Input.HierarchyMask
(xcb:defenum input-hierarchy-mask
  (:master-added 1)
  (:master-removed 2)
  (:slave-added 4)
  (:slave-removed 8)
  (:slave-attached 16)
  (:slave-detached 32)
  (:device-enabled 64)
  (:device-disabled 128))

;;; xcb.Input.HierarchyInfo
(defclass hierarchy-info nil
          ((deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (attachment :initarg :attachment :accessor attachment :type device-id)
           (type :initarg :type :accessor type :type (unsigned-byte 8))
           (enabled :initarg :enabled :accessor enabled :type (or boolean (unsigned-byte 8)))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun encode-hierarchy-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((deviceid (slot-value %obj 'deviceid))
         (attachment (slot-value %obj 'attachment))
         (type (slot-value %obj 'type))
         (enabled (slot-value %obj 'enabled))
         (flags (slot-value %obj 'flags)))
    (declare (ignorable deviceid attachment type enabled flags))
    (xcb:buffer-write-card16 %buf deviceid)
    (xcb:buffer-write-card16 %buf attachment)
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-bool %buf enabled)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)))
(defun decode-hierarchy-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) deviceid attachment type enabled flags)
    (declare (ignorable %p deviceid attachment type enabled flags))
    (setf deviceid (xcb:read-card16-at %buf %p %order))
    (setf attachment (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf type (xcb:read-card8-at %buf (+ %p 4)))
    (setf enabled (xcb:read-card8-at %buf (+ %p 5)))
    (setf flags (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'hierarchy-info :deviceid deviceid :attachment attachment :type type :enabled
                    enabled :flags flags)
     (+ %p 12))))

;;; Event xcb.Input.Hierarchy (11)
(defclass hierarchy (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (num-infos :initarg :num-infos :accessor num-infos :type (unsigned-byte 16))
           (infos :initarg :infos :accessor infos :type cl:sequence)))
(defun decode-hierarchy (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        flags
        num-infos
        infos)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time flags num-infos
      infos))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf num-infos (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (infos %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min num-infos (floor (- (+ %pos 32 (* 4 length)) %p) 12)) %order
       #'decode-hierarchy-info))
    (values
     (make-instance 'hierarchy :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :flags
                    flags :num-infos num-infos :infos infos)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 11 #'decode-hierarchy)

;;; Enum xcb.Input.PropertyFlag
(xcb:defenum input-property-flag
  (:deleted 0)
  (:created 1)
  (:modified 2))

;;; Event xcb.Input.Property (12)
(defclass property (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (property :initarg :property :accessor property :type xcb:atom)
           (what :initarg :what :accessor what :type (unsigned-byte 8))))
(defun decode-property (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type extension sequence length event-type deviceid time property what)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time property what))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf property (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf what (xcb:read-card8-at %buf (+ %p 20)))
    (values
     (make-instance 'property :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :property
                    property :what what)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 12 #'decode-property)

;;; Event xcb.Input.RawKeyPress (13)
(defclass raw-key-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-key-press (%buf %pos %order &optional (%class 'raw-key-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        sourceid
        valuators-len
        flags
        valuator-mask
        axisvalues
        axisvalues-raw)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail sourceid
      valuators-len flags valuator-mask axisvalues axisvalues-raw))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (multiple-value-setq (axisvalues-raw %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :sourceid sourceid :valuators-len valuators-len :flags flags
                    :valuator-mask valuator-mask :axisvalues axisvalues :axisvalues-raw
                    axisvalues-raw)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 13 #'decode-raw-key-press)

;;; Event xcb.Input.RawKeyRelease (14)
(defclass raw-key-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-key-release (%buf %pos %order)
  (decode-raw-key-press %buf %pos %order 'raw-key-release))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 14 #'decode-raw-key-release)

;;; Event xcb.Input.RawButtonPress (15)
(defclass raw-button-press (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-button-press (%buf %pos %order &optional (%class 'raw-button-press))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        sourceid
        valuators-len
        flags
        valuator-mask
        axisvalues
        axisvalues-raw)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail sourceid
      valuators-len flags valuator-mask axisvalues axisvalues-raw))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (multiple-value-setq (axisvalues-raw %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :sourceid sourceid :valuators-len valuators-len :flags flags
                    :valuator-mask valuator-mask :axisvalues axisvalues :axisvalues-raw
                    axisvalues-raw)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 15 #'decode-raw-button-press)

;;; Event xcb.Input.RawButtonRelease (16)
(defclass raw-button-release (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-button-release (%buf %pos %order)
  (decode-raw-button-press %buf %pos %order 'raw-button-release))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 16 #'decode-raw-button-release)

;;; Event xcb.Input.RawMotion (17)
(defclass raw-motion (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-motion (%buf %pos %order) (decode-raw-button-press %buf %pos %order 'raw-motion))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 17 #'decode-raw-motion)

;;; Enum xcb.Input.TouchEventFlags
(xcb:defenum input-touch-event-flags
  (:touch-pending-end 65536)
  (:touch-emulating-pointer 131072))

;;; Event xcb.Input.TouchBegin (18)
(defclass touch-begin (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-touch-begin (%buf %pos %order &optional (%class 'touch-begin))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        buttons-len
        valuators-len
        sourceid
        flags
        mods
        group
        button-mask
        valuator-mask
        axisvalues)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail root
      event child root-x root-y event-x event-y buttons-len valuators-len sourceid flags mods group
      button-mask valuator-mask axisvalues))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf buttons-len (xcb:read-card16-at %buf (+ %p 48) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 50) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 52) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 56) %order))
    (setf mods (decode-modifier-info %buf (+ %p 60) %order))
    (setf group (decode-group-info %buf (+ %p 76) %order))
    (setf %p (+ %p 80))
    (multiple-value-setq (button-mask %p)
      (xcb:read-vector-at %buf %p (cl:min buttons-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :buttons-len buttons-len :valuators-len
                    valuators-len :sourceid sourceid :flags flags :mods mods :group group
                    :button-mask button-mask :valuator-mask valuator-mask :axisvalues axisvalues)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 18 #'decode-touch-begin)

;;; Event xcb.Input.TouchUpdate (19)
(defclass touch-update (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-touch-update (%buf %pos %order) (decode-touch-begin %buf %pos %order 'touch-update))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 19 #'decode-touch-update)

;;; Event xcb.Input.TouchEnd (20)
(defclass touch-end (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (buttons-len :initarg :buttons-len :accessor buttons-len :type (unsigned-byte 16))
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (button-mask :initarg :button-mask :accessor button-mask :type cl:sequence)
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)))
(defun decode-touch-end (%buf %pos %order) (decode-touch-begin %buf %pos %order 'touch-end))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 20 #'decode-touch-end)

;;; Enum xcb.Input.TouchOwnershipFlags
(xcb:defenum input-touch-ownership-flags
  (:none 0))

;;; Event xcb.Input.TouchOwnership (21)
(defclass touch-ownership (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (touchid :initarg :touchid :accessor touchid :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-touch-ownership (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        touchid
        root
        event
        child
        sourceid
        flags)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time touchid root
      event child sourceid flags))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf touchid (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 32) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 36) %order))
    (values
     (make-instance 'touch-ownership :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :deviceid deviceid :time time
                    :touchid touchid :root root :event event :child child :sourceid sourceid :flags
                    flags)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 21 #'decode-touch-ownership)

;;; Event xcb.Input.RawTouchBegin (22)
(defclass raw-touch-begin (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-touch-begin (%buf %pos %order &optional (%class 'raw-touch-begin))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        sourceid
        valuators-len
        flags
        valuator-mask
        axisvalues
        axisvalues-raw)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail sourceid
      valuators-len flags valuator-mask axisvalues axisvalues-raw))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf valuators-len (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (valuator-mask %p)
      (xcb:read-vector-at %buf %p (cl:min valuators-len (floor (- (+ %pos 32 (* 4 length)) %p) 4))
       %order :card32))
    (multiple-value-setq (axisvalues %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (multiple-value-setq (axisvalues-raw %p)
      (xcb:read-struct-vector-at %buf %p
       (cl:min (xcb:sum-of (lambda (%e) (logcount %e)) valuator-mask)
               (floor (- (+ %pos 32 (* 4 length)) %p) 8))
       %order #'decode-fp3232))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :sourceid sourceid :valuators-len valuators-len :flags flags
                    :valuator-mask valuator-mask :axisvalues axisvalues :axisvalues-raw
                    axisvalues-raw)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 22 #'decode-raw-touch-begin)

;;; Event xcb.Input.RawTouchUpdate (23)
(defclass raw-touch-update (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-touch-update (%buf %pos %order)
  (decode-raw-touch-begin %buf %pos %order 'raw-touch-update))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 23 #'decode-raw-touch-update)

;;; Event xcb.Input.RawTouchEnd (24)
(defclass raw-touch-end (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (valuators-len :initarg :valuators-len :accessor valuators-len :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (valuator-mask :initarg :valuator-mask :accessor valuator-mask :type cl:sequence)
           (axisvalues :initarg :axisvalues :accessor axisvalues :type cl:sequence)
           (axisvalues-raw :initarg :axisvalues-raw :accessor axisvalues-raw :type cl:sequence)))
(defun decode-raw-touch-end (%buf %pos %order)
  (decode-raw-touch-begin %buf %pos %order 'raw-touch-end))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 24 #'decode-raw-touch-end)

;;; Enum xcb.Input.BarrierFlags
(xcb:defenum input-barrier-flags
  (:pointer-released 1)
  (:device-is-grabbed 2))

;;; Event xcb.Input.BarrierHit (25)
(defclass barrier-hit (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (eventid :initarg :eventid :accessor eventid :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (barrier :initarg :barrier :accessor barrier :type xcb-xfixes:barrier)
           (dtime :initarg :dtime :accessor dtime :type (unsigned-byte 32))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (dx :initarg :dx :accessor dx :type fp3232) (dy :initarg :dy :accessor dy :type fp3232)))
(defun decode-barrier-hit (%buf %pos %order &optional (%class 'barrier-hit))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        eventid
        root
        event
        barrier
        dtime
        flags
        sourceid
        root-x
        root-y
        dx
        dy)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time eventid root
      event barrier dtime flags sourceid root-x root-y dx dy))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf eventid (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf barrier (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf dtime (xcb:read-card32-at %buf (+ %p 32) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 36) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 40) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 48) %order))
    (setf dx (decode-fp3232 %buf (+ %p 52) %order))
    (setf dy (decode-fp3232 %buf (+ %p 60) %order))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :eventid
                    eventid :root root :event event :barrier barrier :dtime dtime :flags flags
                    :sourceid sourceid :root-x root-x :root-y root-y :dx dx :dy dy)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 25 #'decode-barrier-hit)

;;; Event xcb.Input.BarrierLeave (26)
(defclass barrier-leave (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (eventid :initarg :eventid :accessor eventid :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (barrier :initarg :barrier :accessor barrier :type xcb-xfixes:barrier)
           (dtime :initarg :dtime :accessor dtime :type (unsigned-byte 32))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (dx :initarg :dx :accessor dx :type fp3232) (dy :initarg :dy :accessor dy :type fp3232)))
(defun decode-barrier-leave (%buf %pos %order) (decode-barrier-hit %buf %pos %order 'barrier-leave))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 26 #'decode-barrier-leave)

;;; Enum xcb.Input.GesturePinchEventFlags
(xcb:defenum input-gesture-pinch-event-flags
  (:gesture-pinch-cancelled 1))

;;; Event xcb.Input.GesturePinchBegin (27)
(defclass gesture-pinch-begin (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (scale :initarg :scale :accessor scale :type fp1616)
           (delta-angle :initarg :delta-angle :accessor delta-angle :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-pinch-begin (%buf %pos %order &optional (%class 'gesture-pinch-begin))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        delta-x
        delta-y
        delta-unaccel-x
        delta-unaccel-y
        scale
        delta-angle
        sourceid
        mods
        group
        flags)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail root
      event child root-x root-y event-x event-y delta-x delta-y delta-unaccel-x delta-unaccel-y
      scale delta-angle sourceid mods group flags))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf delta-x (xcb:read-int32-at %buf (+ %p 48) %order))
    (setf delta-y (xcb:read-int32-at %buf (+ %p 52) %order))
    (setf delta-unaccel-x (xcb:read-int32-at %buf (+ %p 56) %order))
    (setf delta-unaccel-y (xcb:read-int32-at %buf (+ %p 60) %order))
    (setf scale (xcb:read-int32-at %buf (+ %p 64) %order))
    (setf delta-angle (xcb:read-int32-at %buf (+ %p 68) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 72) %order))
    (setf mods (decode-modifier-info %buf (+ %p 76) %order))
    (setf group (decode-group-info %buf (+ %p 92) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 96) %order))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :delta-x delta-x :delta-y delta-y
                    :delta-unaccel-x delta-unaccel-x :delta-unaccel-y delta-unaccel-y :scale scale
                    :delta-angle delta-angle :sourceid sourceid :mods mods :group group :flags
                    flags)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 27 #'decode-gesture-pinch-begin)

;;; Event xcb.Input.GesturePinchUpdate (28)
(defclass gesture-pinch-update (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (scale :initarg :scale :accessor scale :type fp1616)
           (delta-angle :initarg :delta-angle :accessor delta-angle :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-pinch-update (%buf %pos %order)
  (decode-gesture-pinch-begin %buf %pos %order 'gesture-pinch-update))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 28 #'decode-gesture-pinch-update)

;;; Event xcb.Input.GesturePinchEnd (29)
(defclass gesture-pinch-end (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (scale :initarg :scale :accessor scale :type fp1616)
           (delta-angle :initarg :delta-angle :accessor delta-angle :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-pinch-end (%buf %pos %order)
  (decode-gesture-pinch-begin %buf %pos %order 'gesture-pinch-end))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 29 #'decode-gesture-pinch-end)

;;; Enum xcb.Input.GestureSwipeEventFlags
(xcb:defenum input-gesture-swipe-event-flags
  (:gesture-swipe-cancelled 1))

;;; Event xcb.Input.GestureSwipeBegin (30)
(defclass gesture-swipe-begin (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-swipe-begin (%buf %pos %order &optional (%class 'gesture-swipe-begin))
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        extension
        sequence
        length
        event-type
        deviceid
        time
        detail
        root
        event
        child
        root-x
        root-y
        event-x
        event-y
        delta-x
        delta-y
        delta-unaccel-x
        delta-unaccel-y
        sourceid
        mods
        group
        flags)
    (declare
     (ignorable %p response-type extension sequence length event-type deviceid time detail root
      event child root-x root-y event-x event-y delta-x delta-y delta-unaccel-x delta-unaccel-y
      sourceid mods group flags))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf deviceid (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf detail (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf child (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf root-x (xcb:read-int32-at %buf (+ %p 32) %order))
    (setf root-y (xcb:read-int32-at %buf (+ %p 36) %order))
    (setf event-x (xcb:read-int32-at %buf (+ %p 40) %order))
    (setf event-y (xcb:read-int32-at %buf (+ %p 44) %order))
    (setf delta-x (xcb:read-int32-at %buf (+ %p 48) %order))
    (setf delta-y (xcb:read-int32-at %buf (+ %p 52) %order))
    (setf delta-unaccel-x (xcb:read-int32-at %buf (+ %p 56) %order))
    (setf delta-unaccel-y (xcb:read-int32-at %buf (+ %p 60) %order))
    (setf sourceid (xcb:read-card16-at %buf (+ %p 64) %order))
    (setf mods (decode-modifier-info %buf (+ %p 68) %order))
    (setf group (decode-group-info %buf (+ %p 84) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 88) %order))
    (values
     (make-instance %class :response-type response-type :extension extension :sequence sequence
                    :length length :event-type event-type :deviceid deviceid :time time :detail
                    detail :root root :event event :child child :root-x root-x :root-y root-y
                    :event-x event-x :event-y event-y :delta-x delta-x :delta-y delta-y
                    :delta-unaccel-x delta-unaccel-x :delta-unaccel-y delta-unaccel-y :sourceid
                    sourceid :mods mods :group group :flags flags)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 30 #'decode-gesture-swipe-begin)

;;; Event xcb.Input.GestureSwipeUpdate (31)
(defclass gesture-swipe-update (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-swipe-update (%buf %pos %order)
  (decode-gesture-swipe-begin %buf %pos %order 'gesture-swipe-update))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 31 #'decode-gesture-swipe-update)

;;; Event xcb.Input.GestureSwipeEnd (32)
(defclass gesture-swipe-end (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (deviceid :initarg :deviceid :accessor deviceid :type device-id)
           (time :initarg :time :accessor time :type xcb:timestamp)
           (detail :initarg :detail :accessor detail :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)
           (event :initarg :event :accessor event :type xcb:window)
           (child :initarg :child :accessor child :type xcb:window)
           (root-x :initarg :root-x :accessor root-x :type fp1616)
           (root-y :initarg :root-y :accessor root-y :type fp1616)
           (event-x :initarg :event-x :accessor event-x :type fp1616)
           (event-y :initarg :event-y :accessor event-y :type fp1616)
           (delta-x :initarg :delta-x :accessor delta-x :type fp1616)
           (delta-y :initarg :delta-y :accessor delta-y :type fp1616)
           (delta-unaccel-x :initarg :delta-unaccel-x :accessor delta-unaccel-x :type fp1616)
           (delta-unaccel-y :initarg :delta-unaccel-y :accessor delta-unaccel-y :type fp1616)
           (sourceid :initarg :sourceid :accessor sourceid :type device-id)
           (mods :initarg :mods :accessor mods :type modifier-info)
           (group :initarg :group :accessor group :type group-info)
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))))
(defun decode-gesture-swipe-end (%buf %pos %order)
  (decode-gesture-swipe-begin %buf %pos %order 'gesture-swipe-end))
(xcb:register-extension-ge-event-decoder "XCB-INPUT" 32 #'decode-gesture-swipe-end)

;;; xcb.Input.EventForSend: the raw 32 bytes of an event
(defclass event-for-send nil nil)
(defun encode-event-for-send (%buf %obj) (xcb:buffer-write-octets %buf %obj :end 32))
(defun decode-event-for-send (%buf %pos %order)
  (declare (ignore %order))
  (values (xcb:read-bytes-at %buf %pos 32) (+ %pos 32)))

;;; Request xcb.Input.SendExtensionEvent
(defun send-extension-event (conn destination device-id propagate events classes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-INPUT"))
         (%buf (xcb:conn-send-buffer conn))
         (num-events (cl:length events))
         (num-classes (cl:length classes)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 31)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf destination)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-bool %buf propagate)
    (xcb:buffer-write-card16 %buf num-classes)
    (xcb:buffer-write-card8 %buf num-events)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-list %buf events num-events #'encode-event-for-send)
    (xcb:buffer-write-list %buf classes num-classes #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass send-extension-event-request (xcb:request)
          ((destination :initarg :destination :type xcb:window)
           (device-id :initarg :device-id :type (unsigned-byte 8))
           (propagate :initarg :propagate :type (or boolean (unsigned-byte 8)))
           (num-classes :initarg :num-classes :type (unsigned-byte 16))
           (num-events :initarg :num-events :type (unsigned-byte 8))
           (events :initarg :events :type cl:sequence)
           (classes :initarg :classes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj send-extension-event-request))
  (send-extension-event conn (slot-value %obj 'destination) (slot-value %obj 'device-id)
   (slot-value %obj 'propagate) (slot-value %obj 'events) (slot-value %obj 'classes)))

;;; Error xcb.Input.Device (0)
(defclass device-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-device-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'device-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-INPUT" 0 #'decode-device-error)

;;; Error xcb.Input.Event (1)
(defclass event-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-event-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'event-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-INPUT" 1 #'decode-event-error)

;;; Error xcb.Input.Mode (2)
(defclass mode-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-mode-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'mode-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-INPUT" 2 #'decode-mode-error)

;;; Error xcb.Input.DeviceBusy (3)
(defclass device-busy-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-device-busy-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'device-busy-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-INPUT" 3 #'decode-device-busy-error)

;;; Error xcb.Input.Class (4)
(defclass class-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-class-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'class-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-INPUT" 4 #'decode-class-error)
