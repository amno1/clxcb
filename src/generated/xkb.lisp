;;; Generated from xkb.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XKB
  (:use #:cl)
  (:shadow #:COUNT #:LENGTH #:LOAD #:MAP #:REAL #:SEQUENCE #:STRING #:TIME #:TYPE)
  (:export
   #:access-x-notify
   #:access-x-option
   #:access-x-timeout
   #:access-x-timeout-mask
   #:access-x-timeout-options-mask
   #:access-x-timeout-options-values
   #:access-x-timeout-values
   #:action
   #:action-message
   #:active
   #:acts-rtrn-acts
   #:acts-rtrn-count
   #:affect
   #:alias
   #:alignment-pad
   #:approx-ndx
   #:auto-ctrls
   #:auto-ctrls-values
   #:base-group
   #:base-mods
   #:behavior
   #:behaviors-rtrn
   #:bell
   #:bell-class
   #:bell-class-spec
   #:bell-id
   #:bell-notify
   #:bell-request
   #:bool-ctrls-high
   #:bool-ctrls-low
   #:btn-actions
   #:button
   #:changed
   #:changed-controls
   #:changed-group-names
   #:changed-groups
   #:changed-indicators
   #:changed-virtual-mods
   #:color-ndx
   #:common
   #:common-behavior
   #:compat-grab-mods
   #:compat-loockup-mods
   #:compat-lookup-mods
   #:compat-map-compat-device-id
   #:compat-map-compatmap-length
   #:compat-map-compatmap-sequence
   #:compat-map-compatmap-type
   #:compat-map-first-si-rtrn
   #:compat-map-group-rtrn
   #:compat-map-groups-rtrn
   #:compat-map-n-si-rtrn
   #:compat-map-n-total-si
   #:compat-map-notify
   #:compat-map-si-rtrn
   #:compat-maps
   #:compat-name
   #:compat-state
   #:controls-notify
   #:corner-radius
   #:count
   #:counted-string16
   #:ctrls
   #:current-ctrls
   #:current-flags
   #:data
   #:debounce-delay
   #:decode-access-x-notify
   #:decode-action
   #:decode-action-message
   #:decode-behavior
   #:decode-bell-notify
   #:decode-common-behavior
   #:decode-compat-map-notify
   #:decode-controls-notify
   #:decode-counted-string16
   #:decode-default-behavior
   #:decode-device-led-info
   #:decode-extension-device-notify
   #:decode-get-compat-map-reply
   #:decode-get-controls-reply
   #:decode-get-device-info-reply
   #:decode-get-indicator-map-reply
   #:decode-get-indicator-state-reply
   #:decode-get-kbd-by-name-reply
   #:decode-get-map-reply
   #:decode-get-named-indicator-reply
   #:decode-get-names-reply
   #:decode-get-state-reply
   #:decode-indicator-map
   #:decode-indicator-map-notify
   #:decode-indicator-state-notify
   #:decode-key
   #:decode-key-alias
   #:decode-key-mod-map
   #:decode-key-name
   #:decode-key-sym-map
   #:decode-key-type
   #:decode-key-v-mod-map
   #:decode-keyboard-error
   #:decode-kt-map-entry
   #:decode-kt-set-map-entry
   #:decode-list-components-reply
   #:decode-listing
   #:decode-lock-behavior
   #:decode-map-notify
   #:decode-mod-def
   #:decode-names-notify
   #:decode-new-keyboard-notify
   #:decode-outline
   #:decode-overlay
   #:decode-overlay-behavior
   #:decode-overlay-key
   #:decode-overlay-row
   #:decode-per-client-flags-reply
   #:decode-permament-lock-behavior
   #:decode-permament-overlay-behavior
   #:decode-permament-radio-group-behavior
   #:decode-radio-group-behavior
   #:decode-row
   #:decode-sa-action-message
   #:decode-sa-device-btn
   #:decode-sa-device-valuator
   #:decode-sa-iso-lock
   #:decode-sa-latch-group
   #:decode-sa-latch-mods
   #:decode-sa-lock-controls
   #:decode-sa-lock-device-btn
   #:decode-sa-lock-group
   #:decode-sa-lock-mods
   #:decode-sa-lock-ptr-btn
   #:decode-sa-move-ptr
   #:decode-sa-no-action
   #:decode-sa-ptr-btn
   #:decode-sa-redirect-key
   #:decode-sa-set-controls
   #:decode-sa-set-group
   #:decode-sa-set-mods
   #:decode-sa-set-ptr-dflt
   #:decode-sa-switch-screen
   #:decode-sa-terminate
   #:decode-set-behavior
   #:decode-set-debugging-flags-reply
   #:decode-set-explicit
   #:decode-set-key-type
   #:decode-shape
   #:decode-si-action
   #:decode-state-notify
   #:decode-sym-interpret
   #:decode-use-extension-reply
   #:default
   #:default-behavior
   #:detailt
   #:dev-type
   #:devbtn
   #:device
   #:device-id
   #:device-led-info
   #:device-spec
   #:devval
   #:dflt-kbd-fb
   #:dflt-led-fb
   #:duration
   #:enabled-control-changes
   #:enabled-controls
   #:encode-access-x-notify
   #:encode-action
   #:encode-action-message
   #:encode-behavior
   #:encode-bell-notify
   #:encode-common-behavior
   #:encode-compat-map-notify
   #:encode-controls-notify
   #:encode-counted-string16
   #:encode-default-behavior
   #:encode-device-led-info
   #:encode-extension-device-notify
   #:encode-indicator-map
   #:encode-indicator-map-notify
   #:encode-indicator-state-notify
   #:encode-key
   #:encode-key-alias
   #:encode-key-mod-map
   #:encode-key-name
   #:encode-key-sym-map
   #:encode-key-type
   #:encode-key-v-mod-map
   #:encode-kt-map-entry
   #:encode-kt-set-map-entry
   #:encode-listing
   #:encode-lock-behavior
   #:encode-map-notify
   #:encode-mod-def
   #:encode-names-notify
   #:encode-new-keyboard-notify
   #:encode-outline
   #:encode-overlay
   #:encode-overlay-behavior
   #:encode-overlay-key
   #:encode-overlay-row
   #:encode-permament-lock-behavior
   #:encode-permament-overlay-behavior
   #:encode-permament-radio-group-behavior
   #:encode-radio-group-behavior
   #:encode-row
   #:encode-sa-action-message
   #:encode-sa-device-btn
   #:encode-sa-device-valuator
   #:encode-sa-iso-lock
   #:encode-sa-latch-group
   #:encode-sa-latch-mods
   #:encode-sa-lock-controls
   #:encode-sa-lock-device-btn
   #:encode-sa-lock-group
   #:encode-sa-lock-mods
   #:encode-sa-lock-ptr-btn
   #:encode-sa-move-ptr
   #:encode-sa-no-action
   #:encode-sa-ptr-btn
   #:encode-sa-redirect-key
   #:encode-sa-set-controls
   #:encode-sa-set-group
   #:encode-sa-set-mods
   #:encode-sa-set-ptr-dflt
   #:encode-sa-switch-screen
   #:encode-sa-terminate
   #:encode-set-behavior
   #:encode-set-explicit
   #:encode-set-key-type
   #:encode-shape
   #:encode-si-action
   #:encode-state-notify
   #:encode-sym-interpret
   #:entries
   #:error-code
   #:event-only
   #:event-type
   #:explicit
   #:explicit-rtrn
   #:extension-device-notify
   #:extra
   #:first-btn-rtrn
   #:first-btn-wanted
   #:first-button
   #:first-key
   #:first-key-act
   #:first-key-action
   #:first-key-behavior
   #:first-key-explicit
   #:first-key-sym
   #:first-level-name
   #:first-mod-map-key
   #:first-si
   #:first-si-rtrn
   #:first-type
   #:first-v-mod-map-key
   #:flags
   #:found
   #:gap
   #:geometries
   #:geometry-base-color-ndx
   #:geometry-geometry-device-id
   #:geometry-geometry-found
   #:geometry-geometry-length
   #:geometry-geometry-sequence
   #:geometry-geometry-type
   #:geometry-height-mm
   #:geometry-label-color-ndx
   #:geometry-label-font
   #:geometry-n-colors
   #:geometry-n-doodads
   #:geometry-n-key-aliases
   #:geometry-n-properties
   #:geometry-n-sections
   #:geometry-n-shapes
   #:geometry-name
   #:geometry-width-mm
   #:get-compat-map
   #:get-compat-map-reply
   #:get-compat-map-request
   #:get-controls
   #:get-controls-reply
   #:get-controls-request
   #:get-device-info
   #:get-device-info-reply
   #:get-device-info-request
   #:get-indicator-map
   #:get-indicator-map-reply
   #:get-indicator-map-request
   #:get-indicator-state
   #:get-indicator-state-reply
   #:get-indicator-state-request
   #:get-kbd-by-name
   #:get-kbd-by-name-reply
   #:get-kbd-by-name-request
   #:get-map
   #:get-map-reply
   #:get-map-request
   #:get-named-indicator
   #:get-named-indicator-reply
   #:get-named-indicator-request
   #:get-names
   #:get-names-reply
   #:get-names-request
   #:get-state
   #:get-state-reply
   #:get-state-request
   #:grab-mods
   #:group
   #:group-info
   #:group-names
   #:group-rtrn
   #:groups
   #:groups-rtrn
   #:groups-wrap
   #:has-own-state
   #:has-preserve
   #:id-spec
   #:ignore-lock-mods-mask
   #:ignore-lock-mods-real-mods
   #:ignore-lock-mods-vmods
   #:indicator
   #:indicator-map
   #:indicator-map-notify
   #:indicator-maps-indicator-device-id
   #:indicator-maps-indicatormap-length
   #:indicator-maps-indicatormap-sequence
   #:indicator-maps-indicatormap-type
   #:indicator-maps-maps
   #:indicator-maps-n-indicators
   #:indicator-maps-real-indicators
   #:indicator-maps-which
   #:indicator-names
   #:indicator-state-notify
   #:indicators
   #:internal-mods-mask
   #:internal-mods-real-mods
   #:internal-mods-vmods
   #:isolock
   #:key
   #:key-alias
   #:key-aliases
   #:key-event-follows
   #:key-mod-map
   #:key-name
   #:key-names
   #:key-names-compat-name
   #:key-names-first-key
   #:key-names-geometry-name
   #:key-names-group-names
   #:key-names-groups
   #:key-names-indicator-names
   #:key-names-indicators
   #:key-names-key-aliases
   #:key-names-key-device-id
   #:key-names-key-max-key-code
   #:key-names-key-min-key-code
   #:key-names-key-names
   #:key-names-keycodes-name
   #:key-names-keyname-length
   #:key-names-keyname-sequence
   #:key-names-keyname-type
   #:key-names-kt-level-names
   #:key-names-n-key-aliases
   #:key-names-n-keys
   #:key-names-n-kt-levels
   #:key-names-n-levels-per-type
   #:key-names-n-radio-groups
   #:key-names-n-types
   #:key-names-phys-symbols-name
   #:key-names-radio-group-names
   #:key-names-symbols-name
   #:key-names-type-names
   #:key-names-types-name
   #:key-names-value-list
   #:key-names-virtual-mod-names
   #:key-names-virtual-mods
   #:key-names-which
   #:key-sym-map
   #:key-type
   #:key-v-mod-map
   #:keyboard-error
   #:keycode
   #:keycodes
   #:keycodes-name
   #:keymaps
   #:keys
   #:kt-index
   #:kt-level-names
   #:kt-map-entry
   #:kt-set-map-entry
   #:latch-lock-state
   #:latch-lock-state-request
   #:latched-group
   #:latched-mods
   #:latchgroup
   #:latchmods
   #:led-class
   #:led-class-spec
   #:led-id
   #:led-state
   #:leds
   #:leds-defined
   #:left
   #:length
   #:level
   #:list-components
   #:list-components-reply
   #:list-components-request
   #:listing
   #:loaded
   #:lock
   #:lock-behavior
   #:lockcontrols
   #:lockdevbtn
   #:locked-group
   #:locked-mods
   #:lockgroup
   #:lockmods
   #:lockptrbtn
   #:lookup-mods
   #:major-opcode
   #:map
   #:map-changed
   #:map-ctrls
   #:map-flags
   #:map-groups
   #:map-mods
   #:map-notify
   #:map-real-mods
   #:map-vmod
   #:map-which-groups
   #:map-which-mods
   #:maps
   #:maps-present
   #:mask
   #:match
   #:max-key-code
   #:message
   #:min-key-code
   #:minor-opcode
   #:mod-def
   #:modmap-rtrn
   #:mods
   #:mods-mask
   #:mods-mods
   #:mods-vmods
   #:mouse-keys-curve
   #:mouse-keys-delay
   #:mouse-keys-dflt-btn
   #:mouse-keys-interval
   #:mouse-keys-max-speed
   #:mouse-keys-time-to-max
   #:moveptr
   #:n-btns-rtrn
   #:n-btns-wanted
   #:n-buttons
   #:n-compat-maps
   #:n-device-led-f-bs
   #:n-geometries
   #:n-indicators
   #:n-key-actions
   #:n-key-acts
   #:n-key-aliases
   #:n-key-behavior
   #:n-key-behaviors
   #:n-key-explicit
   #:n-key-syms
   #:n-keycodes
   #:n-keymaps
   #:n-keys
   #:n-kt-levels
   #:n-level-names
   #:n-levels-per-type
   #:n-map-entries
   #:n-mod-map-keys
   #:n-outlines
   #:n-points
   #:n-radio-groups
   #:n-rows
   #:n-si
   #:n-si-rtrn
   #:n-symbols
   #:n-syms
   #:n-total-si
   #:n-types
   #:n-v-mod-map-keys
   #:name
   #:name-len
   #:names
   #:names-notify
   #:names-present
   #:ndx
   #:new-keyboard
   #:new-keyboard-notify
   #:new-screen
   #:newkey
   #:noaction
   #:num-groups
   #:num-levels
   #:old-device-id
   #:old-max-key-code
   #:old-min-key-code
   #:on
   #:outline
   #:outlines
   #:over
   #:overlay
   #:overlay-behavior
   #:overlay-key
   #:overlay-row
   #:overlay1
   #:overlay2
   #:per-client-flags
   #:per-client-flags-reply
   #:per-client-flags-request
   #:per-key-repeat
   #:percent
   #:permament-lock
   #:permament-lock-behavior
   #:permament-overlay-behavior
   #:permament-overlay1
   #:permament-overlay2
   #:permament-radio-group
   #:permament-radio-group-behavior
   #:phys-indicators
   #:phys-symbols-name
   #:pitch
   #:points
   #:present
   #:preserve
   #:preserve-entries
   #:press
   #:primary-ndx
   #:ptr-btn-actions
   #:ptr-btn-state
   #:ptrbtn
   #:radio-group
   #:radio-group-behavior
   #:radio-group-names
   #:real
   #:real-indicator
   #:real-indicators
   #:real-modifiers
   #:real-mods
   #:reason
   #:redirect
   #:repeat-delay
   #:repeat-interval
   #:reported
   #:request-major
   #:request-minor
   #:response-type
   #:row
   #:row-under
   #:rows
   #:sa-action-message
   #:sa-device-btn
   #:sa-device-valuator
   #:sa-iso-lock
   #:sa-latch-group
   #:sa-latch-mods
   #:sa-lock-controls
   #:sa-lock-device-btn
   #:sa-lock-group
   #:sa-lock-mods
   #:sa-lock-ptr-btn
   #:sa-move-ptr
   #:sa-no-action
   #:sa-ptr-btn
   #:sa-redirect-key
   #:sa-set-controls
   #:sa-set-group
   #:sa-set-mods
   #:sa-set-ptr-dflt
   #:sa-switch-screen
   #:sa-terminate
   #:select-events
   #:select-events-request
   #:sequence
   #:server-major
   #:server-minor
   #:set-behavior
   #:set-compat-map
   #:set-compat-map-request
   #:set-controls
   #:set-controls-request
   #:set-debugging-flags
   #:set-debugging-flags-reply
   #:set-debugging-flags-request
   #:set-device-info
   #:set-device-info-request
   #:set-explicit
   #:set-indicator-map
   #:set-indicator-map-request
   #:set-key-type
   #:set-map
   #:set-map-request
   #:set-named-indicator
   #:set-named-indicator-request
   #:set-names
   #:set-names-request
   #:setcontrols
   #:setgroup
   #:setmods
   #:setptrdflt
   #:shape
   #:shape-ndx
   #:si-action
   #:si-rtrn
   #:slow-keys-delay
   #:state
   #:state-changed
   #:state-notify
   #:string
   #:string8
   #:supported
   #:supported-ctrls
   #:supported-flags
   #:switchscreen
   #:sym
   #:sym-interpret
   #:symbols
   #:symbols-name
   #:syms
   #:syms-rtrn
   #:terminate
   #:time
   #:top
   #:total-actions
   #:total-btns
   #:total-key-behaviors
   #:total-key-explicit
   #:total-mod-map-keys
   #:total-syms
   #:total-types
   #:total-v-mod-map-keys
   #:type
   #:type-names
   #:types
   #:types-acts-rtrn-acts
   #:types-acts-rtrn-count
   #:types-behaviors-rtrn
   #:types-explicit-rtrn
   #:types-first-key-action
   #:types-first-key-behavior
   #:types-first-key-explicit
   #:types-first-key-sym
   #:types-first-mod-map-key
   #:types-first-type
   #:types-first-v-mod-map-key
   #:types-getmap-length
   #:types-getmap-sequence
   #:types-getmap-type
   #:types-map
   #:types-modmap-rtrn
   #:types-n-key-actions
   #:types-n-key-behaviors
   #:types-n-key-explicit
   #:types-n-key-syms
   #:types-n-mod-map-keys
   #:types-n-types
   #:types-n-v-mod-map-keys
   #:types-name
   #:types-present
   #:types-rtrn
   #:types-syms-rtrn
   #:types-total-actions
   #:types-total-key-behaviors
   #:types-total-key-explicit
   #:types-total-mod-map-keys
   #:types-total-syms
   #:types-total-types
   #:types-total-v-mod-map-keys
   #:types-type-device-id
   #:types-type-max-key-code
   #:types-type-min-key-code
   #:types-types-rtrn
   #:types-virtual-mods
   #:types-vmodmap-rtrn
   #:types-vmods-rtrn
   #:under
   #:unsupported
   #:use-extension
   #:use-extension-reply
   #:use-extension-request
   #:val1index
   #:val1value
   #:val1what
   #:val2index
   #:val2value
   #:val2what
   #:value
   #:vertical
   #:virtual-mod
   #:virtual-mod-names
   #:virtual-mods
   #:vmodmap-rtrn
   #:vmods
   #:vmods-high
   #:vmods-low
   #:vmods-mask-high
   #:vmods-mask-low
   #:vmods-rtrn
   #:which
   #:which-groups
   #:which-mods
   #:width
   #:window
   #:x-high
   #:x-low
   #:xkb-type
   #:y-high
   #:y-low))

(in-package #:XCB-XKB)

(xcb:register-extension-xname "XCB-XKB" "XKEYBOARD")

;;; Enum xcb.xkb.Const
(xcb:defenum xkb-const
  (:max-legal-key-code 255)
  (:per-key-bit-array-size 32)
  (:key-name-length 4))

;;; Enum xcb.xkb.EventType
(xcb:defenum xkb-event-type
  (:new-keyboard-notify 1)
  (:map-notify 2)
  (:state-notify 4)
  (:controls-notify 8)
  (:indicator-state-notify 16)
  (:indicator-map-notify 32)
  (:names-notify 64)
  (:compat-map-notify 128)
  (:bell-notify 256)
  (:action-message 512)
  (:access-x-notify 1024)
  (:extension-device-notify 2048))

;;; Enum xcb.xkb.NKNDetail
(xcb:defenum xkb-nkn-detail
  (:keycodes 1)
  (:geometry 2)
  (:device-id 4))

;;; Enum xcb.xkb.AXNDetail
(xcb:defenum xkb-axn-detail
  (:sk-press 1)
  (:sk-accept 2)
  (:sk-reject 4)
  (:sk-release 8)
  (:bk-accept 16)
  (:bk-reject 32)
  (:axk-warning 64))

;;; Enum xcb.xkb.MapPart
(xcb:defenum xkb-map-part
  (:key-types 1)
  (:key-syms 2)
  (:modifier-map 4)
  (:explicit-components 8)
  (:key-actions 16)
  (:key-behaviors 32)
  (:virtual-mods 64)
  (:virtual-mod-map 128))

;;; Enum xcb.xkb.SetMapFlags
(xcb:defenum xkb-set-map-flags
  (:resize-types 1)
  (:recompute-actions 2))

;;; Enum xcb.xkb.StatePart
(xcb:defenum xkb-state-part
  (:modifier-state 1)
  (:modifier-base 2)
  (:modifier-latch 4)
  (:modifier-lock 8)
  (:group-state 16)
  (:group-base 32)
  (:group-latch 64)
  (:group-lock 128)
  (:compat-state 256)
  (:grab-mods 512)
  (:compat-grab-mods 1024)
  (:lookup-mods 2048)
  (:compat-lookup-mods 4096)
  (:pointer-buttons 8192))

;;; Enum xcb.xkb.BoolCtrl
(xcb:defenum xkb-bool-ctrl
  (:repeat-keys 1)
  (:slow-keys 2)
  (:bounce-keys 4)
  (:sticky-keys 8)
  (:mouse-keys 16)
  (:mouse-keys-accel 32)
  (:access-x-keys 64)
  (:access-x-timeout-mask 128)
  (:access-x-feedback-mask 256)
  (:audible-bell-mask 512)
  (:overlay1-mask 1024)
  (:overlay2-mask 2048)
  (:ignore-group-lock-mask 4096))

;;; Enum xcb.xkb.Control
(xcb:defenum xkb-control
  (:groups-wrap 134217728)
  (:internal-mods 268435456)
  (:ignore-lock-mods 536870912)
  (:per-key-repeat 1073741824)
  (:controls-enabled 2147483648))

;;; Enum xcb.xkb.AXOption
(xcb:defenum xkb-ax-option
  (:sk-press-fb 1)
  (:sk-accept-fb 2)
  (:feature-fb 4)
  (:slow-warn-fb 8)
  (:indicator-fb 16)
  (:sticky-keys-fb 32)
  (:two-keys 64)
  (:latch-to-lock 128)
  (:sk-release-fb 256)
  (:sk-reject-fb 512)
  (:bk-reject-fb 1024)
  (:dumb-bell 2048))
(deftype device-spec () '(unsigned-byte 16))

;;; Enum xcb.xkb.LedClassResult
(xcb:defenum xkb-led-class-result
  (:kbd-feedback-class 0)
  (:led-feedback-class 4))

;;; Enum xcb.xkb.LedClass
(xcb:defenum xkb-led-class
  (:kbd-feedback-class 0)
  (:led-feedback-class 4)
  (:dflt-xi-class 768)
  (:all-xi-classes 1280))
(deftype led-class-spec () '(unsigned-byte 16))

;;; Enum xcb.xkb.BellClassResult
(xcb:defenum xkb-bell-class-result
  (:kbd-feedback-class 0)
  (:bell-feedback-class 5))

;;; Enum xcb.xkb.BellClass
(xcb:defenum xkb-bell-class
  (:kbd-feedback-class 0)
  (:bell-feedback-class 5)
  (:dflt-xi-class 768))
(deftype bell-class-spec () '(unsigned-byte 16))

;;; Enum xcb.xkb.ID
(xcb:defenum xkb-id
  (:use-core-kbd 256)
  (:use-core-ptr 512)
  (:dflt-xi-class 768)
  (:dflt-xi-id 1024)
  (:all-xi-class 1280)
  (:all-xi-id 1536)
  (:xi-none 65280))
(deftype id-spec () '(unsigned-byte 16))

;;; Enum xcb.xkb.Group
(xcb:defenum xkb-group
  (:n1 0)
  (:n2 1)
  (:n3 2)
  (:n4 3))

;;; Enum xcb.xkb.Groups
(xcb:defenum xkb-groups
  (:any 254)
  (:all 255))

;;; Enum xcb.xkb.SetOfGroup
(xcb:defenum xkb-set-of-group
  (:group1 1)
  (:group2 2)
  (:group3 4)
  (:group4 8))

;;; Enum xcb.xkb.SetOfGroups
(xcb:defenum xkb-set-of-groups
  (:any 128))

;;; Enum xcb.xkb.GroupsWrap
(xcb:defenum xkb-groups-wrap
  (:wrap-into-range 0)
  (:clamp-into-range 64)
  (:redirect-into-range 128))

;;; Enum xcb.xkb.VModsHigh
(xcb:defenum xkb-v-mods-high
  (:n15 128)
  (:n14 64)
  (:n13 32)
  (:n12 16)
  (:n11 8)
  (:n10 4)
  (:n9 2)
  (:n8 1))

;;; Enum xcb.xkb.VModsLow
(xcb:defenum xkb-v-mods-low
  (:n7 128)
  (:n6 64)
  (:n5 32)
  (:n4 16)
  (:n3 8)
  (:n2 4)
  (:n1 2)
  (:n0 1))

;;; Enum xcb.xkb.VMod
(xcb:defenum xkb-v-mod
  (:n15 32768)
  (:n14 16384)
  (:n13 8192)
  (:n12 4096)
  (:n11 2048)
  (:n10 1024)
  (:n9 512)
  (:n8 256)
  (:n7 128)
  (:n6 64)
  (:n5 32)
  (:n4 16)
  (:n3 8)
  (:n2 4)
  (:n1 2)
  (:n0 1))

;;; Enum xcb.xkb.Explicit
(xcb:defenum xkb-explicit
  (:v-mod-map 128)
  (:behavior 64)
  (:auto-repeat 32)
  (:interpret 16)
  (:key-type4 8)
  (:key-type3 4)
  (:key-type2 2)
  (:key-type1 1))

;;; Enum xcb.xkb.SymInterpretMatch
(xcb:defenum xkb-sym-interpret-match
  (:none-of 0)
  (:any-of-or-none 1)
  (:any-of 2)
  (:all-of 3)
  (:exactly 4))

;;; Enum xcb.xkb.SymInterpMatch
(xcb:defenum xkb-sym-interp-match
  (:level-one-only 128)
  (:op-mask 127))

;;; Enum xcb.xkb.IMFlag
(xcb:defenum xkb-im-flag
  (:no-explicit 128)
  (:no-automatic 64)
  (:led-drives-kb 32))

;;; Enum xcb.xkb.IMModsWhich
(xcb:defenum xkb-im-mods-which
  (:use-compat 16)
  (:use-effective 8)
  (:use-locked 4)
  (:use-latched 2)
  (:use-base 1))

;;; Enum xcb.xkb.IMGroupsWhich
(xcb:defenum xkb-im-groups-which
  (:use-compat 16)
  (:use-effective 8)
  (:use-locked 4)
  (:use-latched 2)
  (:use-base 1))

;;; xcb.xkb.IndicatorMap
(defclass indicator-map nil
          ((flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (which-groups :initarg :which-groups :accessor which-groups :type (unsigned-byte 8))
           (groups :initarg :groups :accessor groups :type (unsigned-byte 8))
           (which-mods :initarg :which-mods :accessor which-mods :type (unsigned-byte 8))
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (vmods :initarg :vmods :accessor vmods :type (unsigned-byte 16))
           (ctrls :initarg :ctrls :accessor ctrls :type (unsigned-byte 32))))
(defun encode-indicator-map (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((flags (slot-value %obj 'flags))
         (which-groups (slot-value %obj 'which-groups))
         (groups (slot-value %obj 'groups))
         (which-mods (slot-value %obj 'which-mods))
         (mods (slot-value %obj 'mods))
         (real-mods (slot-value %obj 'real-mods))
         (vmods (slot-value %obj 'vmods))
         (ctrls (slot-value %obj 'ctrls)))
    (declare (ignorable flags which-groups groups which-mods mods real-mods vmods ctrls))
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf which-groups)
    (xcb:buffer-write-card8 %buf groups)
    (xcb:buffer-write-card8 %buf which-mods)
    (xcb:buffer-write-card8 %buf mods)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card16 %buf vmods)
    (xcb:buffer-write-card32 %buf ctrls)))
(defun decode-indicator-map (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) flags which-groups groups which-mods mods real-mods vmods ctrls)
    (declare (ignorable %p flags which-groups groups which-mods mods real-mods vmods ctrls))
    (setf flags (xcb:read-card8-at %buf %p))
    (setf which-groups (xcb:read-card8-at %buf (+ %p 1)))
    (setf groups (xcb:read-card8-at %buf (+ %p 2)))
    (setf which-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf mods (xcb:read-card8-at %buf (+ %p 4)))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 5)))
    (setf vmods (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf ctrls (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'indicator-map :flags flags :which-groups which-groups :groups groups
                    :which-mods which-mods :mods mods :real-mods real-mods :vmods vmods :ctrls
                    ctrls)
     (+ %p 12))))

;;; Enum xcb.xkb.CMDetail
(xcb:defenum xkb-cm-detail
  (:sym-interp 1)
  (:group-compat 2))

;;; Enum xcb.xkb.NameDetail
(xcb:defenum xkb-name-detail
  (:keycodes 1)
  (:geometry 2)
  (:symbols 4)
  (:phys-symbols 8)
  (:types 16)
  (:compat 32)
  (:key-type-names 64)
  (:kt-level-names 128)
  (:indicator-names 256)
  (:key-names 512)
  (:key-aliases 1024)
  (:virtual-mod-names 2048)
  (:group-names 4096)
  (:rg-names 8192))

;;; Enum xcb.xkb.GBNDetail
(xcb:defenum xkb-gbn-detail
  (:types 1)
  (:compat-map 2)
  (:client-symbols 4)
  (:server-symbols 8)
  (:indicator-maps 16)
  (:key-names 32)
  (:geometry 64)
  (:other-names 128))

;;; Enum xcb.xkb.XIFeature
(xcb:defenum xkb-xi-feature
  (:keyboards 1)
  (:button-actions 2)
  (:indicator-names 4)
  (:indicator-maps 8)
  (:indicator-state 16))

;;; Enum xcb.xkb.PerClientFlag
(xcb:defenum xkb-per-client-flag
  (:detectable-auto-repeat 1)
  (:grabs-use-xkb-state 2)
  (:auto-reset-controls 4)
  (:lookup-state-when-grabbed 8)
  (:send-event-uses-xkb-state 16))

;;; xcb.xkb.ModDef
(defclass mod-def nil
          ((mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (vmods :initarg :vmods :accessor vmods :type (unsigned-byte 16))))
(defun encode-mod-def (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (vmods (slot-value %obj 'vmods)))
    (declare (ignorable mask real-mods vmods))
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card16 %buf vmods)))
(defun decode-mod-def (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) mask real-mods vmods)
    (declare (ignorable %p mask real-mods vmods))
    (setf mask (xcb:read-card8-at %buf %p))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 1)))
    (setf vmods (xcb:read-card16-at %buf (+ %p 2) %order))
    (values (make-instance 'mod-def :mask mask :real-mods real-mods :vmods vmods) (+ %p 4))))

;;; xcb.xkb.KeyName
(defclass key-name nil ((name :initarg :name :accessor name :type cl:sequence)))
(defun encode-key-name (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name)))
    (declare (ignorable name))
    (xcb:buffer-write-fixed-list %buf name 4 #'xcb:buffer-write-char 1)))
(defun decode-key-name (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name)
    (declare (ignorable %p name))
    (setf name (xcb:read-string-at %buf %p 4))
    (values (make-instance 'key-name :name name) (+ %p 4))))

;;; xcb.xkb.KeyAlias
(defclass key-alias nil
          ((real :initarg :real :accessor real :type cl:sequence)
           (alias :initarg :alias :accessor alias :type cl:sequence)))
(defun encode-key-alias (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((real (slot-value %obj 'real)) (alias (slot-value %obj 'alias)))
    (declare (ignorable real alias))
    (xcb:buffer-write-fixed-list %buf real 4 #'xcb:buffer-write-char 1)
    (xcb:buffer-write-fixed-list %buf alias 4 #'xcb:buffer-write-char 1)))
(defun decode-key-alias (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) real alias)
    (declare (ignorable %p real alias))
    (setf real (xcb:read-string-at %buf %p 4))
    (setf alias (xcb:read-string-at %buf (+ %p 4) 4))
    (values (make-instance 'key-alias :real real :alias alias) (+ %p 8))))

;;; xcb.xkb.CountedString16
(defclass counted-string16 nil
          ((length :initarg :length :accessor length :type (unsigned-byte 16))
           (string :initarg :string :accessor string :type cl:sequence)
           (alignment-pad :initarg :alignment-pad :accessor alignment-pad :type cl:sequence)))
(defun encode-counted-string16 (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((string (slot-value %obj 'string))
         (alignment-pad (slot-value %obj 'alignment-pad))
         (length (cl:length string)))
    (declare (ignorable string alignment-pad length))
    (xcb:buffer-write-card16 %buf length)
    (xcb:buffer-write-string-octets %buf string length)
    (xcb:buffer-write-octets %buf alignment-pad :end
     (- (logand (+ length 5) (lognot 3)) (+ length 2)))))
(defun decode-counted-string16 (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) length string alignment-pad)
    (declare (ignorable %p length string alignment-pad))
    (setf length (xcb:read-card16-at %buf %p %order))
    (setf %p (+ %p 2))
    (setf string (xcb:read-string-at %buf %p length))
    (incf %p (cl:length string))
    (multiple-value-setq (alignment-pad %p)
      (xcb:read-vector-at %buf %p (- (logand (+ length 5) (lognot 3)) (+ length 2)) %order :card8))
    (values
     (make-instance 'counted-string16 :length length :string string :alignment-pad alignment-pad)
     %p)))

;;; xcb.xkb.KTMapEntry
(defclass kt-map-entry nil
          ((active :initarg :active :accessor active :type (or boolean (unsigned-byte 8)))
           (mods-mask :initarg :mods-mask :accessor mods-mask :type (unsigned-byte 8))
           (level :initarg :level :accessor level :type (unsigned-byte 8))
           (mods-mods :initarg :mods-mods :accessor mods-mods :type (unsigned-byte 8))
           (mods-vmods :initarg :mods-vmods :accessor mods-vmods :type (unsigned-byte 16))))
(defun encode-kt-map-entry (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((active (slot-value %obj 'active))
         (mods-mask (slot-value %obj 'mods-mask))
         (level (slot-value %obj 'level))
         (mods-mods (slot-value %obj 'mods-mods))
         (mods-vmods (slot-value %obj 'mods-vmods)))
    (declare (ignorable active mods-mask level mods-mods mods-vmods))
    (xcb:buffer-write-bool %buf active)
    (xcb:buffer-write-card8 %buf mods-mask)
    (xcb:buffer-write-card8 %buf level)
    (xcb:buffer-write-card8 %buf mods-mods)
    (xcb:buffer-write-card16 %buf mods-vmods)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-kt-map-entry (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) active mods-mask level mods-mods mods-vmods)
    (declare (ignorable %p active mods-mask level mods-mods mods-vmods))
    (setf active (xcb:read-card8-at %buf %p))
    (setf mods-mask (xcb:read-card8-at %buf (+ %p 1)))
    (setf level (xcb:read-card8-at %buf (+ %p 2)))
    (setf mods-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf mods-vmods (xcb:read-card16-at %buf (+ %p 4) %order))
    (values
     (make-instance 'kt-map-entry :active active :mods-mask mods-mask :level level :mods-mods
                    mods-mods :mods-vmods mods-vmods)
     (+ %p 8))))

;;; xcb.xkb.KeyType
(defclass key-type nil
          ((mods-mask :initarg :mods-mask :accessor mods-mask :type (unsigned-byte 8))
           (mods-mods :initarg :mods-mods :accessor mods-mods :type (unsigned-byte 8))
           (mods-vmods :initarg :mods-vmods :accessor mods-vmods :type (unsigned-byte 16))
           (num-levels :initarg :num-levels :accessor num-levels :type (unsigned-byte 8))
           (n-map-entries :initarg :n-map-entries :accessor n-map-entries :type (unsigned-byte 8))
           (has-preserve :initarg :has-preserve :accessor has-preserve :type
            (or boolean (unsigned-byte 8)))
           (map :initarg :map :accessor map :type cl:sequence)
           (preserve :initarg :preserve :accessor preserve :type cl:sequence)))
(defun encode-key-type (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((mods-mask (slot-value %obj 'mods-mask))
         (mods-mods (slot-value %obj 'mods-mods))
         (mods-vmods (slot-value %obj 'mods-vmods))
         (num-levels (slot-value %obj 'num-levels))
         (has-preserve (slot-value %obj 'has-preserve))
         (map (slot-value %obj 'map))
         (preserve (slot-value %obj 'preserve))
         (n-map-entries (cl:length map)))
    (declare
     (ignorable mods-mask mods-mods mods-vmods num-levels has-preserve map preserve n-map-entries))
    (xcb:buffer-write-card8 %buf mods-mask)
    (xcb:buffer-write-card8 %buf mods-mods)
    (xcb:buffer-write-card16 %buf mods-vmods)
    (xcb:buffer-write-card8 %buf num-levels)
    (xcb:buffer-write-card8 %buf n-map-entries)
    (xcb:buffer-write-bool %buf has-preserve)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-list %buf map n-map-entries #'encode-kt-map-entry)
    (xcb:buffer-write-list %buf preserve (* has-preserve n-map-entries) #'encode-mod-def)))
(defun decode-key-type (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) mods-mask mods-mods mods-vmods num-levels n-map-entries has-preserve map preserve)
    (declare
     (ignorable %p mods-mask mods-mods mods-vmods num-levels n-map-entries has-preserve map
      preserve))
    (setf mods-mask (xcb:read-card8-at %buf %p))
    (setf mods-mods (xcb:read-card8-at %buf (+ %p 1)))
    (setf mods-vmods (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf num-levels (xcb:read-card8-at %buf (+ %p 4)))
    (setf n-map-entries (xcb:read-card8-at %buf (+ %p 5)))
    (setf has-preserve (xcb:read-card8-at %buf (+ %p 6)))
    (setf %p (+ %p 8))
    (multiple-value-setq (map %p)
      (xcb:read-struct-vector-at %buf %p n-map-entries %order #'decode-kt-map-entry))
    (multiple-value-setq (preserve %p)
      (xcb:read-struct-vector-at %buf %p (* has-preserve n-map-entries) %order #'decode-mod-def))
    (values
     (make-instance 'key-type :mods-mask mods-mask :mods-mods mods-mods :mods-vmods mods-vmods
                    :num-levels num-levels :n-map-entries n-map-entries :has-preserve has-preserve
                    :map map :preserve preserve)
     %p)))

;;; xcb.xkb.KeySymMap
(defclass key-sym-map nil
          ((kt-index :initarg :kt-index :accessor kt-index :type cl:sequence)
           (group-info :initarg :group-info :accessor group-info :type (unsigned-byte 8))
           (width :initarg :width :accessor width :type (unsigned-byte 8))
           (n-syms :initarg :n-syms :accessor n-syms :type (unsigned-byte 16))
           (syms :initarg :syms :accessor syms :type cl:sequence)))
(defun encode-key-sym-map (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((kt-index (slot-value %obj 'kt-index))
         (group-info (slot-value %obj 'group-info))
         (width (slot-value %obj 'width))
         (syms (slot-value %obj 'syms))
         (n-syms (cl:length syms)))
    (declare (ignorable kt-index group-info width syms n-syms))
    (xcb:buffer-write-fixed-list %buf kt-index 4 #'xcb:buffer-write-card8 1)
    (xcb:buffer-write-card8 %buf group-info)
    (xcb:buffer-write-card8 %buf width)
    (xcb:buffer-write-card16 %buf n-syms)
    (xcb:buffer-write-list %buf syms n-syms #'xcb:buffer-write-card32)))
(defun decode-key-sym-map (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) kt-index group-info width n-syms syms)
    (declare (ignorable %p kt-index group-info width n-syms syms))
    (setf kt-index (xcb:read-vector-at %buf %p 4 %order :card8))
    (setf group-info (xcb:read-card8-at %buf (+ %p 4)))
    (setf width (xcb:read-card8-at %buf (+ %p 5)))
    (setf n-syms (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf %p (+ %p 8))
    (multiple-value-setq (syms %p) (xcb:read-vector-at %buf %p n-syms %order :card32))
    (values
     (make-instance 'key-sym-map :kt-index kt-index :group-info group-info :width width :n-syms
                    n-syms :syms syms)
     %p)))

;;; xcb.xkb.CommonBehavior
(defclass common-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (data :initarg :data :accessor data :type (unsigned-byte 8))))
(defun encode-common-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (data (slot-value %obj 'data)))
    (declare (ignorable type data))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf data)))
(defun decode-common-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type data)
    (declare (ignorable %p type data))
    (setf type (xcb:read-card8-at %buf %p))
    (setf data (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'common-behavior :type type :data data) (+ %p 2))))

;;; xcb.xkb.DefaultBehavior
(defclass default-behavior nil ((type :initarg :type :accessor type :type (unsigned-byte 8))))
(defun encode-default-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)))
    (declare (ignorable type))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-default-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type)
    (declare (ignorable %p type))
    (setf type (xcb:read-card8-at %buf %p))
    (values (make-instance 'default-behavior :type type) (+ %p 2))))

;;; xcb.xkb.DefaultBehavior
(defclass lock-behavior nil ((type :initarg :type :accessor type :type (unsigned-byte 8))))
(defun encode-lock-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)))
    (declare (ignorable type))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-lock-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type)
    (declare (ignorable %p type))
    (setf type (xcb:read-card8-at %buf %p))
    (values (make-instance 'lock-behavior :type type) (+ %p 2))))

;;; xcb.xkb.RadioGroupBehavior
(defclass radio-group-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (unsigned-byte 8))))
(defun encode-radio-group-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (group (slot-value %obj 'group)))
    (declare (ignorable type group))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf group)))
(defun decode-radio-group-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type group)
    (declare (ignorable %p type group))
    (setf type (xcb:read-card8-at %buf %p))
    (setf group (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'radio-group-behavior :type type :group group) (+ %p 2))))

;;; xcb.xkb.OverlayBehavior
(defclass overlay-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (key :initarg :key :accessor key :type xcb:keycode)))
(defun encode-overlay-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (key (slot-value %obj 'key)))
    (declare (ignorable type key))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf key)))
(defun decode-overlay-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type key)
    (declare (ignorable %p type key))
    (setf type (xcb:read-card8-at %buf %p))
    (setf key (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'overlay-behavior :type type :key key) (+ %p 2))))

;;; xcb.xkb.DefaultBehavior
(defclass permament-lock-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))))
(defun encode-permament-lock-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)))
    (declare (ignorable type))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-permament-lock-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type)
    (declare (ignorable %p type))
    (setf type (xcb:read-card8-at %buf %p))
    (values (make-instance 'permament-lock-behavior :type type) (+ %p 2))))

;;; xcb.xkb.RadioGroupBehavior
(defclass permament-radio-group-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (unsigned-byte 8))))
(defun encode-permament-radio-group-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (group (slot-value %obj 'group)))
    (declare (ignorable type group))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf group)))
(defun decode-permament-radio-group-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type group)
    (declare (ignorable %p type group))
    (setf type (xcb:read-card8-at %buf %p))
    (setf group (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'permament-radio-group-behavior :type type :group group) (+ %p 2))))

;;; xcb.xkb.OverlayBehavior
(defclass permament-overlay-behavior nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (key :initarg :key :accessor key :type xcb:keycode)))
(defun encode-permament-overlay-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (key (slot-value %obj 'key)))
    (declare (ignorable type key))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf key)))
(defun decode-permament-overlay-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type key)
    (declare (ignorable %p type key))
    (setf type (xcb:read-card8-at %buf %p))
    (setf key (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'permament-overlay-behavior :type type :key key) (+ %p 2))))

;;; xcb.xkb.Behavior
(defclass behavior nil
          ((common :initarg :common :accessor common :type common-behavior)
           (default :initarg :default :accessor default :type default-behavior)
           (lock :initarg :lock :accessor lock :type default-behavior)
           (radio-group :initarg :radio-group :accessor radio-group :type radio-group-behavior)
           (overlay1 :initarg :overlay1 :accessor overlay1 :type overlay-behavior)
           (overlay2 :initarg :overlay2 :accessor overlay2 :type overlay-behavior)
           (permament-lock :initarg :permament-lock :accessor permament-lock :type
            default-behavior)
           (permament-radio-group :initarg :permament-radio-group :accessor permament-radio-group
            :type radio-group-behavior)
           (permament-overlay1 :initarg :permament-overlay1 :accessor permament-overlay1 :type
            overlay-behavior)
           (permament-overlay2 :initarg :permament-overlay2 :accessor permament-overlay2 :type
            overlay-behavior)
           (type :initarg :type :accessor type :type (unsigned-byte 8)))
          (:documentation "A union: its members are views of the same bytes.
Decoding sets every member, each read from those bytes; encoding writes
the first member that is bound, in the order of the slots.  Re-encoding
a decoded instance therefore writes its first member, which in X's
unions spans the whole union, so the bytes come out the same.  To
encode a particular member, make an instance with only that one bound."))
(defun encode-behavior (%buf %obj)
  (let ((%start (xcb:buffer-position %buf)))
    (cond ((slot-boundp %obj 'common) (encode-common-behavior %buf (slot-value %obj 'common)))
          ((slot-boundp %obj 'default) (encode-default-behavior %buf (slot-value %obj 'default)))
          ((slot-boundp %obj 'lock) (encode-default-behavior %buf (slot-value %obj 'lock)))
          ((slot-boundp %obj 'radio-group)
           (encode-radio-group-behavior %buf (slot-value %obj 'radio-group)))
          ((slot-boundp %obj 'overlay1) (encode-overlay-behavior %buf (slot-value %obj 'overlay1)))
          ((slot-boundp %obj 'overlay2) (encode-overlay-behavior %buf (slot-value %obj 'overlay2)))
          ((slot-boundp %obj 'permament-lock)
           (encode-default-behavior %buf (slot-value %obj 'permament-lock)))
          ((slot-boundp %obj 'permament-radio-group)
           (encode-radio-group-behavior %buf (slot-value %obj 'permament-radio-group)))
          ((slot-boundp %obj 'permament-overlay1)
           (encode-overlay-behavior %buf (slot-value %obj 'permament-overlay1)))
          ((slot-boundp %obj 'permament-overlay2)
           (encode-overlay-behavior %buf (slot-value %obj 'permament-overlay2)))
          ((slot-boundp %obj 'type) (xcb:buffer-write-card8 %buf (slot-value %obj 'type)))
          (t (error "No member of union ~A is set" %obj)))
    (xcb:buffer-write-padding %buf (- 2 (- (xcb:buffer-position %buf) %start)))))
(defun decode-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        common
        default
        lock
        radio-group
        overlay1
        overlay2
        permament-lock
        permament-radio-group
        permament-overlay1
        permament-overlay2
        type)
    (declare
     (ignorable %p common default lock radio-group overlay1 overlay2 permament-lock
      permament-radio-group permament-overlay1 permament-overlay2 type))
    (setf common (decode-common-behavior %buf %p %order))
    (setf default (decode-default-behavior %buf %p %order))
    (setf lock (decode-default-behavior %buf %p %order))
    (setf radio-group (decode-radio-group-behavior %buf %p %order))
    (setf overlay1 (decode-overlay-behavior %buf %p %order))
    (setf overlay2 (decode-overlay-behavior %buf %p %order))
    (setf permament-lock (decode-default-behavior %buf %p %order))
    (setf permament-radio-group (decode-radio-group-behavior %buf %p %order))
    (setf permament-overlay1 (decode-overlay-behavior %buf %p %order))
    (setf permament-overlay2 (decode-overlay-behavior %buf %p %order))
    (setf type (xcb:read-card8-at %buf %p))
    (values
     (make-instance 'behavior :common common :default default :lock lock :radio-group radio-group
                    :overlay1 overlay1 :overlay2 overlay2 :permament-lock permament-lock
                    :permament-radio-group permament-radio-group :permament-overlay1
                    permament-overlay1 :permament-overlay2 permament-overlay2 :type type)
     (+ %pos 2))))

;;; Enum xcb.xkb.BehaviorType
(xcb:defenum xkb-behavior-type
  (:default 0)
  (:lock 1)
  (:radio-group 2)
  (:overlay1 3)
  (:overlay2 4)
  (:permament-lock 129)
  (:permament-radio-group 130)
  (:permament-overlay1 131)
  (:permament-overlay2 132))

;;; xcb.xkb.SetBehavior
(defclass set-behavior nil
          ((keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (behavior :initarg :behavior :accessor behavior :type behavior)))
(defun encode-set-behavior (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((keycode (slot-value %obj 'keycode)) (behavior (slot-value %obj 'behavior)))
    (declare (ignorable keycode behavior))
    (xcb:buffer-write-card8 %buf keycode)
    (encode-behavior %buf behavior)
    (xcb:buffer-write-padding %buf 1)))
(defun decode-set-behavior (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) keycode behavior)
    (declare (ignorable %p keycode behavior))
    (setf keycode (xcb:read-card8-at %buf %p))
    (setf behavior (decode-behavior %buf (+ %p 1) %order))
    (values (make-instance 'set-behavior :keycode keycode :behavior behavior) (+ %p 4))))

;;; xcb.xkb.SetExplicit
(defclass set-explicit nil
          ((keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (explicit :initarg :explicit :accessor explicit :type (unsigned-byte 8))))
(defun encode-set-explicit (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((keycode (slot-value %obj 'keycode)) (explicit (slot-value %obj 'explicit)))
    (declare (ignorable keycode explicit))
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-card8 %buf explicit)))
(defun decode-set-explicit (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) keycode explicit)
    (declare (ignorable %p keycode explicit))
    (setf keycode (xcb:read-card8-at %buf %p))
    (setf explicit (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'set-explicit :keycode keycode :explicit explicit) (+ %p 2))))

;;; xcb.xkb.KeyModMap
(defclass key-mod-map nil
          ((keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))))
(defun encode-key-mod-map (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((keycode (slot-value %obj 'keycode)) (mods (slot-value %obj 'mods)))
    (declare (ignorable keycode mods))
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-card8 %buf mods)))
(defun decode-key-mod-map (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) keycode mods)
    (declare (ignorable %p keycode mods))
    (setf keycode (xcb:read-card8-at %buf %p))
    (setf mods (xcb:read-card8-at %buf (+ %p 1)))
    (values (make-instance 'key-mod-map :keycode keycode :mods mods) (+ %p 2))))

;;; xcb.xkb.KeyVModMap
(defclass key-v-mod-map nil
          ((keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (vmods :initarg :vmods :accessor vmods :type (unsigned-byte 16))))
(defun encode-key-v-mod-map (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((keycode (slot-value %obj 'keycode)) (vmods (slot-value %obj 'vmods)))
    (declare (ignorable keycode vmods))
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf vmods)))
(defun decode-key-v-mod-map (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) keycode vmods)
    (declare (ignorable %p keycode vmods))
    (setf keycode (xcb:read-card8-at %buf %p))
    (setf vmods (xcb:read-card16-at %buf (+ %p 2) %order))
    (values (make-instance 'key-v-mod-map :keycode keycode :vmods vmods) (+ %p 4))))

;;; xcb.xkb.KTSetMapEntry
(defclass kt-set-map-entry nil
          ((level :initarg :level :accessor level :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :accessor virtual-mods :type (unsigned-byte 16))))
(defun encode-kt-set-map-entry (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((level (slot-value %obj 'level))
         (real-mods (slot-value %obj 'real-mods))
         (virtual-mods (slot-value %obj 'virtual-mods)))
    (declare (ignorable level real-mods virtual-mods))
    (xcb:buffer-write-card8 %buf level)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card16 %buf virtual-mods)))
(defun decode-kt-set-map-entry (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) level real-mods virtual-mods)
    (declare (ignorable %p level real-mods virtual-mods))
    (setf level (xcb:read-card8-at %buf %p))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 1)))
    (setf virtual-mods (xcb:read-card16-at %buf (+ %p 2) %order))
    (values
     (make-instance 'kt-set-map-entry :level level :real-mods real-mods :virtual-mods virtual-mods)
     (+ %p 4))))

;;; xcb.xkb.SetKeyType
(defclass set-key-type nil
          ((mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :accessor virtual-mods :type (unsigned-byte 16))
           (num-levels :initarg :num-levels :accessor num-levels :type (unsigned-byte 8))
           (n-map-entries :initarg :n-map-entries :accessor n-map-entries :type (unsigned-byte 8))
           (preserve :initarg :preserve :accessor preserve :type (or boolean (unsigned-byte 8)))
           (entries :initarg :entries :accessor entries :type cl:sequence)
           (preserve-entries :initarg :preserve-entries :accessor preserve-entries :type
            cl:sequence)))
(defun encode-set-key-type (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (virtual-mods (slot-value %obj 'virtual-mods))
         (num-levels (slot-value %obj 'num-levels))
         (preserve (slot-value %obj 'preserve))
         (entries (slot-value %obj 'entries))
         (preserve-entries (slot-value %obj 'preserve-entries))
         (n-map-entries (cl:length entries)))
    (declare
     (ignorable mask real-mods virtual-mods num-levels preserve entries preserve-entries
      n-map-entries))
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card16 %buf virtual-mods)
    (xcb:buffer-write-card8 %buf num-levels)
    (xcb:buffer-write-card8 %buf n-map-entries)
    (xcb:buffer-write-bool %buf preserve)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-list %buf entries n-map-entries #'encode-kt-set-map-entry)
    (xcb:buffer-write-list %buf preserve-entries (* preserve n-map-entries)
     #'encode-kt-set-map-entry)))
(defun decode-set-key-type (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        mask
        real-mods
        virtual-mods
        num-levels
        n-map-entries
        preserve
        entries
        preserve-entries)
    (declare
     (ignorable %p mask real-mods virtual-mods num-levels n-map-entries preserve entries
      preserve-entries))
    (setf mask (xcb:read-card8-at %buf %p))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 1)))
    (setf virtual-mods (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf num-levels (xcb:read-card8-at %buf (+ %p 4)))
    (setf n-map-entries (xcb:read-card8-at %buf (+ %p 5)))
    (setf preserve (xcb:read-card8-at %buf (+ %p 6)))
    (setf %p (+ %p 8))
    (multiple-value-setq (entries %p)
      (xcb:read-struct-vector-at %buf %p n-map-entries %order #'decode-kt-set-map-entry))
    (multiple-value-setq (preserve-entries %p)
      (xcb:read-struct-vector-at %buf %p (* preserve n-map-entries) %order
       #'decode-kt-set-map-entry))
    (values
     (make-instance 'set-key-type :mask mask :real-mods real-mods :virtual-mods virtual-mods
                    :num-levels num-levels :n-map-entries n-map-entries :preserve preserve :entries
                    entries :preserve-entries preserve-entries)
     %p)))
(deftype string8 () '(unsigned-byte 8))

;;; xcb.xkb.Outline
(defclass outline nil
          ((n-points :initarg :n-points :accessor n-points :type (unsigned-byte 8))
           (corner-radius :initarg :corner-radius :accessor corner-radius :type (unsigned-byte 8))
           (points :initarg :points :accessor points :type cl:sequence)))
(defun encode-outline (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((corner-radius (slot-value %obj 'corner-radius))
         (points (slot-value %obj 'points))
         (n-points (cl:length points)))
    (declare (ignorable corner-radius points n-points))
    (xcb:buffer-write-card8 %buf n-points)
    (xcb:buffer-write-card8 %buf corner-radius)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf points n-points #'xcb:encode-point)))
(defun decode-outline (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) n-points corner-radius points)
    (declare (ignorable %p n-points corner-radius points))
    (setf n-points (xcb:read-card8-at %buf %p))
    (setf corner-radius (xcb:read-card8-at %buf (+ %p 1)))
    (setf %p (+ %p 4))
    (multiple-value-setq (points %p)
      (xcb:read-struct-vector-at %buf %p n-points %order #'xcb:decode-point))
    (values (make-instance 'outline :n-points n-points :corner-radius corner-radius :points points)
            %p)))

;;; xcb.xkb.Shape
(defclass shape nil
          ((name :initarg :name :accessor name :type xcb:atom)
           (n-outlines :initarg :n-outlines :accessor n-outlines :type (unsigned-byte 8))
           (primary-ndx :initarg :primary-ndx :accessor primary-ndx :type (unsigned-byte 8))
           (approx-ndx :initarg :approx-ndx :accessor approx-ndx :type (unsigned-byte 8))
           (outlines :initarg :outlines :accessor outlines :type cl:sequence)))
(defun encode-shape (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name))
         (primary-ndx (slot-value %obj 'primary-ndx))
         (approx-ndx (slot-value %obj 'approx-ndx))
         (outlines (slot-value %obj 'outlines))
         (n-outlines (cl:length outlines)))
    (declare (ignorable name primary-ndx approx-ndx outlines n-outlines))
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card8 %buf n-outlines)
    (xcb:buffer-write-card8 %buf primary-ndx)
    (xcb:buffer-write-card8 %buf approx-ndx)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-list %buf outlines n-outlines #'encode-outline)))
(defun decode-shape (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name n-outlines primary-ndx approx-ndx outlines)
    (declare (ignorable %p name n-outlines primary-ndx approx-ndx outlines))
    (setf name (xcb:read-card32-at %buf %p %order))
    (setf n-outlines (xcb:read-card8-at %buf (+ %p 4)))
    (setf primary-ndx (xcb:read-card8-at %buf (+ %p 5)))
    (setf approx-ndx (xcb:read-card8-at %buf (+ %p 6)))
    (setf %p (+ %p 8))
    (multiple-value-setq (outlines %p)
      (xcb:read-struct-vector-at %buf %p n-outlines %order #'decode-outline))
    (values
     (make-instance 'shape :name name :n-outlines n-outlines :primary-ndx primary-ndx :approx-ndx
                    approx-ndx :outlines outlines)
     %p)))

;;; xcb.xkb.Key
(defclass key nil
          ((name :initarg :name :accessor name :type cl:sequence)
           (gap :initarg :gap :accessor gap :type (signed-byte 16))
           (shape-ndx :initarg :shape-ndx :accessor shape-ndx :type (unsigned-byte 8))
           (color-ndx :initarg :color-ndx :accessor color-ndx :type (unsigned-byte 8))))
(defun encode-key (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name))
         (gap (slot-value %obj 'gap))
         (shape-ndx (slot-value %obj 'shape-ndx))
         (color-ndx (slot-value %obj 'color-ndx)))
    (declare (ignorable name gap shape-ndx color-ndx))
    (xcb:buffer-write-fixed-list %buf name 4 #'xcb:buffer-write-char 1)
    (xcb:buffer-write-card16 %buf gap)
    (xcb:buffer-write-card8 %buf shape-ndx)
    (xcb:buffer-write-card8 %buf color-ndx)))
(defun decode-key (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name gap shape-ndx color-ndx)
    (declare (ignorable %p name gap shape-ndx color-ndx))
    (setf name (xcb:read-string-at %buf %p 4))
    (setf gap (xcb:read-int16-at %buf (+ %p 4) %order))
    (setf shape-ndx (xcb:read-card8-at %buf (+ %p 6)))
    (setf color-ndx (xcb:read-card8-at %buf (+ %p 7)))
    (values (make-instance 'key :name name :gap gap :shape-ndx shape-ndx :color-ndx color-ndx)
            (+ %p 8))))

;;; xcb.xkb.OverlayKey
(defclass overlay-key nil
          ((over :initarg :over :accessor over :type cl:sequence)
           (under :initarg :under :accessor under :type cl:sequence)))
(defun encode-overlay-key (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((over (slot-value %obj 'over)) (under (slot-value %obj 'under)))
    (declare (ignorable over under))
    (xcb:buffer-write-fixed-list %buf over 4 #'xcb:buffer-write-char 1)
    (xcb:buffer-write-fixed-list %buf under 4 #'xcb:buffer-write-char 1)))
(defun decode-overlay-key (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) over under)
    (declare (ignorable %p over under))
    (setf over (xcb:read-string-at %buf %p 4))
    (setf under (xcb:read-string-at %buf (+ %p 4) 4))
    (values (make-instance 'overlay-key :over over :under under) (+ %p 8))))

;;; xcb.xkb.OverlayRow
(defclass overlay-row nil
          ((row-under :initarg :row-under :accessor row-under :type (unsigned-byte 8))
           (n-keys :initarg :n-keys :accessor n-keys :type (unsigned-byte 8))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun encode-overlay-row (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((row-under (slot-value %obj 'row-under))
         (keys (slot-value %obj 'keys))
         (n-keys (cl:length keys)))
    (declare (ignorable row-under keys n-keys))
    (xcb:buffer-write-card8 %buf row-under)
    (xcb:buffer-write-card8 %buf n-keys)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf keys n-keys #'encode-overlay-key)))
(defun decode-overlay-row (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) row-under n-keys keys)
    (declare (ignorable %p row-under n-keys keys))
    (setf row-under (xcb:read-card8-at %buf %p))
    (setf n-keys (xcb:read-card8-at %buf (+ %p 1)))
    (setf %p (+ %p 4))
    (multiple-value-setq (keys %p)
      (xcb:read-struct-vector-at %buf %p n-keys %order #'decode-overlay-key))
    (values (make-instance 'overlay-row :row-under row-under :n-keys n-keys :keys keys) %p)))

;;; xcb.xkb.Overlay
(defclass overlay nil
          ((name :initarg :name :accessor name :type xcb:atom)
           (n-rows :initarg :n-rows :accessor n-rows :type (unsigned-byte 8))
           (rows :initarg :rows :accessor rows :type cl:sequence)))
(defun encode-overlay (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name)) (rows (slot-value %obj 'rows)) (n-rows (cl:length rows)))
    (declare (ignorable name rows n-rows))
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card8 %buf n-rows)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-list %buf rows n-rows #'encode-overlay-row)))
(defun decode-overlay (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name n-rows rows)
    (declare (ignorable %p name n-rows rows))
    (setf name (xcb:read-card32-at %buf %p %order))
    (setf n-rows (xcb:read-card8-at %buf (+ %p 4)))
    (setf %p (+ %p 8))
    (multiple-value-setq (rows %p)
      (xcb:read-struct-vector-at %buf %p n-rows %order #'decode-overlay-row))
    (values (make-instance 'overlay :name name :n-rows n-rows :rows rows) %p)))

;;; xcb.xkb.Row
(defclass row nil
          ((top :initarg :top :accessor top :type (signed-byte 16))
           (left :initarg :left :accessor left :type (signed-byte 16))
           (n-keys :initarg :n-keys :accessor n-keys :type (unsigned-byte 8))
           (vertical :initarg :vertical :accessor vertical :type (or boolean (unsigned-byte 8)))
           (keys :initarg :keys :accessor keys :type cl:sequence)))
(defun encode-row (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((top (slot-value %obj 'top))
         (left (slot-value %obj 'left))
         (vertical (slot-value %obj 'vertical))
         (keys (slot-value %obj 'keys))
         (n-keys (cl:length keys)))
    (declare (ignorable top left vertical keys n-keys))
    (xcb:buffer-write-card16 %buf top)
    (xcb:buffer-write-card16 %buf left)
    (xcb:buffer-write-card8 %buf n-keys)
    (xcb:buffer-write-bool %buf vertical)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf keys n-keys #'encode-key)))
(defun decode-row (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) top left n-keys vertical keys)
    (declare (ignorable %p top left n-keys vertical keys))
    (setf top (xcb:read-int16-at %buf %p %order))
    (setf left (xcb:read-int16-at %buf (+ %p 2) %order))
    (setf n-keys (xcb:read-card8-at %buf (+ %p 4)))
    (setf vertical (xcb:read-card8-at %buf (+ %p 5)))
    (setf %p (+ %p 8))
    (multiple-value-setq (keys %p) (xcb:read-struct-vector-at %buf %p n-keys %order #'decode-key))
    (values (make-instance 'row :top top :left left :n-keys n-keys :vertical vertical :keys keys)
            %p)))

;;; Enum xcb.xkb.DoodadType
(xcb:defenum xkb-doodad-type
  (:outline 1)
  (:solid 2)
  (:text 3)
  (:indicator 4)
  (:logo 5))

;;; xcb.xkb.Listing
(defclass listing nil
          ((flags :initarg :flags :accessor flags :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 16))
           (string :initarg :string :accessor string :type cl:sequence)))
(defun encode-listing (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((flags (slot-value %obj 'flags))
         (string (slot-value %obj 'string))
         (length (cl:length string)))
    (declare (ignorable flags string length))
    (xcb:buffer-write-card16 %buf flags)
    (xcb:buffer-write-card16 %buf length)
    (xcb:buffer-write-string-octets %buf string length)
    (xcb:buffer-pad-to-align %buf 2)))
(defun decode-listing (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) flags length string)
    (declare (ignorable %p flags length string))
    (setf flags (xcb:read-card16-at %buf %p %order))
    (setf length (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf %p (+ %p 4))
    (setf string (xcb:read-string-at %buf %p length))
    (incf %p (cl:length string))
    (setf %p (xcb:align-position %p 2))
    (values (make-instance 'listing :flags flags :length length :string string) %p)))

;;; xcb.xkb.DeviceLedInfo
(defclass device-led-info nil
          ((led-class :initarg :led-class :accessor led-class :type led-class-spec)
           (led-id :initarg :led-id :accessor led-id :type id-spec)
           (names-present :initarg :names-present :accessor names-present :type (unsigned-byte 32))
           (maps-present :initarg :maps-present :accessor maps-present :type (unsigned-byte 32))
           (phys-indicators :initarg :phys-indicators :accessor phys-indicators :type
            (unsigned-byte 32))
           (state :initarg :state :accessor state :type (unsigned-byte 32))
           (names :initarg :names :accessor names :type cl:sequence)
           (maps :initarg :maps :accessor maps :type cl:sequence)))
(defun encode-device-led-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((led-class (slot-value %obj 'led-class))
         (led-id (slot-value %obj 'led-id))
         (names-present (slot-value %obj 'names-present))
         (maps-present (slot-value %obj 'maps-present))
         (phys-indicators (slot-value %obj 'phys-indicators))
         (state (slot-value %obj 'state))
         (names (slot-value %obj 'names))
         (maps (slot-value %obj 'maps)))
    (declare
     (ignorable led-class led-id names-present maps-present phys-indicators state names maps))
    (xcb:buffer-write-card16 %buf led-class)
    (xcb:buffer-write-card16 %buf led-id)
    (xcb:buffer-write-card32 %buf names-present)
    (xcb:buffer-write-card32 %buf maps-present)
    (xcb:buffer-write-card32 %buf phys-indicators)
    (xcb:buffer-write-card32 %buf state)
    (xcb:buffer-write-list %buf names (logcount names-present) #'xcb:buffer-write-card32)
    (xcb:buffer-write-list %buf maps (logcount maps-present) #'encode-indicator-map)))
(defun decode-device-led-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) led-class led-id names-present maps-present phys-indicators state names maps)
    (declare
     (ignorable %p led-class led-id names-present maps-present phys-indicators state names maps))
    (setf led-class (xcb:read-card16-at %buf %p %order))
    (setf led-id (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf names-present (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf maps-present (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf phys-indicators (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf state (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 20))
    (multiple-value-setq (names %p)
      (xcb:read-vector-at %buf %p (logcount names-present) %order :card32))
    (multiple-value-setq (maps %p)
      (xcb:read-struct-vector-at %buf %p (logcount maps-present) %order #'decode-indicator-map))
    (values
     (make-instance 'device-led-info :led-class led-class :led-id led-id :names-present
                    names-present :maps-present maps-present :phys-indicators phys-indicators
                    :state state :names names :maps maps)
     %p)))

;;; Enum xcb.xkb.Error
(xcb:defenum xkb-error
  (:bad-device 255)
  (:bad-class 254)
  (:bad-id 253))

;;; Error xcb.xkb.Keyboard (0)
(defclass keyboard-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (value :initarg :value :accessor value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-keyboard-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence value minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence value minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf value (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'keyboard-error :response-type response-type :error-code error-code :sequence
                    sequence :value value :minor-opcode minor-opcode :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XKB" 0 #'decode-keyboard-error)

;;; Enum xcb.xkb.SA
(xcb:defenum xkb-sa
  (:clear-locks 1)
  (:latch-to-lock 2)
  (:use-mod-map-mods 4)
  (:group-absolute 4))

;;; Enum xcb.xkb.SAType
(xcb:defenum xkb-sa-type
  (:no-action 0)
  (:set-mods 1)
  (:latch-mods 2)
  (:lock-mods 3)
  (:set-group 4)
  (:latch-group 5)
  (:lock-group 6)
  (:move-ptr 7)
  (:ptr-btn 8)
  (:lock-ptr-btn 9)
  (:set-ptr-dflt 10)
  (:iso-lock 11)
  (:terminate 12)
  (:switch-screen 13)
  (:set-controls 14)
  (:lock-controls 15)
  (:action-message 16)
  (:redirect-key 17)
  (:device-btn 18)
  (:lock-device-btn 19)
  (:device-valuator 20))

;;; xcb.xkb.SANoAction
(defclass sa-no-action nil ((type :initarg :type :accessor type :type (unsigned-byte 8))))
(defun encode-sa-no-action (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)))
    (declare (ignorable type))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 7)))
(defun decode-sa-no-action (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type)
    (declare (ignorable %p type))
    (setf type (xcb:read-card8-at %buf %p))
    (values (make-instance 'sa-no-action :type type) (+ %p 8))))

;;; xcb.xkb.SASetMods
(defclass sa-set-mods nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (vmods-high :initarg :vmods-high :accessor vmods-high :type (unsigned-byte 8))
           (vmods-low :initarg :vmods-low :accessor vmods-low :type (unsigned-byte 8))))
(defun encode-sa-set-mods (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (vmods-high (slot-value %obj 'vmods-high))
         (vmods-low (slot-value %obj 'vmods-low)))
    (declare (ignorable type flags mask real-mods vmods-high vmods-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card8 %buf vmods-high)
    (xcb:buffer-write-card8 %buf vmods-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-set-mods (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags mask real-mods vmods-high vmods-low)
    (declare (ignorable %p type flags mask real-mods vmods-high vmods-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf mask (xcb:read-card8-at %buf (+ %p 2)))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf vmods-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf vmods-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-set-mods :type type :flags flags :mask mask :real-mods real-mods
                    :vmods-high vmods-high :vmods-low vmods-low)
     (+ %p 8))))

;;; xcb.xkb.SASetMods
(defclass sa-latch-mods nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (vmods-high :initarg :vmods-high :accessor vmods-high :type (unsigned-byte 8))
           (vmods-low :initarg :vmods-low :accessor vmods-low :type (unsigned-byte 8))))
(defun encode-sa-latch-mods (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (vmods-high (slot-value %obj 'vmods-high))
         (vmods-low (slot-value %obj 'vmods-low)))
    (declare (ignorable type flags mask real-mods vmods-high vmods-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card8 %buf vmods-high)
    (xcb:buffer-write-card8 %buf vmods-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-latch-mods (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags mask real-mods vmods-high vmods-low)
    (declare (ignorable %p type flags mask real-mods vmods-high vmods-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf mask (xcb:read-card8-at %buf (+ %p 2)))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf vmods-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf vmods-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-latch-mods :type type :flags flags :mask mask :real-mods real-mods
                    :vmods-high vmods-high :vmods-low vmods-low)
     (+ %p 8))))

;;; xcb.xkb.SASetMods
(defclass sa-lock-mods nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (vmods-high :initarg :vmods-high :accessor vmods-high :type (unsigned-byte 8))
           (vmods-low :initarg :vmods-low :accessor vmods-low :type (unsigned-byte 8))))
(defun encode-sa-lock-mods (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (vmods-high (slot-value %obj 'vmods-high))
         (vmods-low (slot-value %obj 'vmods-low)))
    (declare (ignorable type flags mask real-mods vmods-high vmods-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card8 %buf vmods-high)
    (xcb:buffer-write-card8 %buf vmods-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-lock-mods (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags mask real-mods vmods-high vmods-low)
    (declare (ignorable %p type flags mask real-mods vmods-high vmods-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf mask (xcb:read-card8-at %buf (+ %p 2)))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf vmods-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf vmods-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-lock-mods :type type :flags flags :mask mask :real-mods real-mods
                    :vmods-high vmods-high :vmods-low vmods-low)
     (+ %p 8))))

;;; xcb.xkb.SASetGroup
(defclass sa-set-group nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (signed-byte 8))))
(defun encode-sa-set-group (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (group (slot-value %obj 'group)))
    (declare (ignorable type flags group))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-padding %buf 5)))
(defun decode-sa-set-group (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags group)
    (declare (ignorable %p type flags group))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf group (xcb:read-int8-at %buf (+ %p 2)))
    (values (make-instance 'sa-set-group :type type :flags flags :group group) (+ %p 8))))

;;; xcb.xkb.SASetGroup
(defclass sa-latch-group nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (signed-byte 8))))
(defun encode-sa-latch-group (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (group (slot-value %obj 'group)))
    (declare (ignorable type flags group))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-padding %buf 5)))
(defun decode-sa-latch-group (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags group)
    (declare (ignorable %p type flags group))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf group (xcb:read-int8-at %buf (+ %p 2)))
    (values (make-instance 'sa-latch-group :type type :flags flags :group group) (+ %p 8))))

;;; xcb.xkb.SASetGroup
(defclass sa-lock-group nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (signed-byte 8))))
(defun encode-sa-lock-group (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (group (slot-value %obj 'group)))
    (declare (ignorable type flags group))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-padding %buf 5)))
(defun decode-sa-lock-group (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags group)
    (declare (ignorable %p type flags group))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf group (xcb:read-int8-at %buf (+ %p 2)))
    (values (make-instance 'sa-lock-group :type type :flags flags :group group) (+ %p 8))))

;;; Enum xcb.xkb.SAMovePtrFlag
(xcb:defenum xkb-sa-move-ptr-flag
  (:no-acceleration 1)
  (:move-absolute-x 2)
  (:move-absolute-y 4))

;;; xcb.xkb.SAMovePtr
(defclass sa-move-ptr nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (x-high :initarg :x-high :accessor x-high :type (signed-byte 8))
           (x-low :initarg :x-low :accessor x-low :type (unsigned-byte 8))
           (y-high :initarg :y-high :accessor y-high :type (signed-byte 8))
           (y-low :initarg :y-low :accessor y-low :type (unsigned-byte 8))))
(defun encode-sa-move-ptr (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (x-high (slot-value %obj 'x-high))
         (x-low (slot-value %obj 'x-low))
         (y-high (slot-value %obj 'y-high))
         (y-low (slot-value %obj 'y-low)))
    (declare (ignorable type flags x-high x-low y-high y-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf x-high)
    (xcb:buffer-write-card8 %buf x-low)
    (xcb:buffer-write-card8 %buf y-high)
    (xcb:buffer-write-card8 %buf y-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-move-ptr (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags x-high x-low y-high y-low)
    (declare (ignorable %p type flags x-high x-low y-high y-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf x-high (xcb:read-int8-at %buf (+ %p 2)))
    (setf x-low (xcb:read-card8-at %buf (+ %p 3)))
    (setf y-high (xcb:read-int8-at %buf (+ %p 4)))
    (setf y-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-move-ptr :type type :flags flags :x-high x-high :x-low x-low :y-high y-high
                    :y-low y-low)
     (+ %p 8))))

;;; xcb.xkb.SAPtrBtn
(defclass sa-ptr-btn nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (count :initarg :count :accessor count :type (unsigned-byte 8))
           (button :initarg :button :accessor button :type (unsigned-byte 8))))
(defun encode-sa-ptr-btn (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (count (slot-value %obj 'count))
         (button (slot-value %obj 'button)))
    (declare (ignorable type flags count button))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf count)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-padding %buf 4)))
(defun decode-sa-ptr-btn (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags count button)
    (declare (ignorable %p type flags count button))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf count (xcb:read-card8-at %buf (+ %p 2)))
    (setf button (xcb:read-card8-at %buf (+ %p 3)))
    (values (make-instance 'sa-ptr-btn :type type :flags flags :count count :button button)
            (+ %p 8))))

;;; xcb.xkb.SALockPtrBtn
(defclass sa-lock-ptr-btn nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (button :initarg :button :accessor button :type (unsigned-byte 8))))
(defun encode-sa-lock-ptr-btn (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (button (slot-value %obj 'button)))
    (declare (ignorable type flags button))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-padding %buf 4)))
(defun decode-sa-lock-ptr-btn (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags button)
    (declare (ignorable %p type flags button))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf button (xcb:read-card8-at %buf (+ %p 3)))
    (values (make-instance 'sa-lock-ptr-btn :type type :flags flags :button button) (+ %p 8))))

;;; Enum xcb.xkb.SASetPtrDfltFlag
(xcb:defenum xkb-sa-set-ptr-dflt-flag
  (:dflt-btn-absolute 4)
  (:affect-dflt-button 1))

;;; xcb.xkb.SASetPtrDflt
(defclass sa-set-ptr-dflt nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (affect :initarg :affect :accessor affect :type (unsigned-byte 8))
           (value :initarg :value :accessor value :type (signed-byte 8))))
(defun encode-sa-set-ptr-dflt (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (affect (slot-value %obj 'affect))
         (value (slot-value %obj 'value)))
    (declare (ignorable type flags affect value))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf affect)
    (xcb:buffer-write-card8 %buf value)
    (xcb:buffer-write-padding %buf 4)))
(defun decode-sa-set-ptr-dflt (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags affect value)
    (declare (ignorable %p type flags affect value))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf affect (xcb:read-card8-at %buf (+ %p 2)))
    (setf value (xcb:read-int8-at %buf (+ %p 3)))
    (values (make-instance 'sa-set-ptr-dflt :type type :flags flags :affect affect :value value)
            (+ %p 8))))

;;; Enum xcb.xkb.SAIsoLockFlag
(xcb:defenum xkb-sa-iso-lock-flag
  (:no-lock 1)
  (:no-unlock 2)
  (:use-mod-map-mods 4)
  (:group-absolute 4)
  (:iso-dflt-is-group 8))

;;; Enum xcb.xkb.SAIsoLockNoAffect
(xcb:defenum xkb-sa-iso-lock-no-affect
  (:ctrls 8)
  (:ptr 16)
  (:group 32)
  (:mods 64))

;;; xcb.xkb.SAIsoLock
(defclass sa-iso-lock nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-mods :initarg :real-mods :accessor real-mods :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (signed-byte 8))
           (affect :initarg :affect :accessor affect :type (unsigned-byte 8))
           (vmods-high :initarg :vmods-high :accessor vmods-high :type (unsigned-byte 8))
           (vmods-low :initarg :vmods-low :accessor vmods-low :type (unsigned-byte 8))))
(defun encode-sa-iso-lock (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (mask (slot-value %obj 'mask))
         (real-mods (slot-value %obj 'real-mods))
         (group (slot-value %obj 'group))
         (affect (slot-value %obj 'affect))
         (vmods-high (slot-value %obj 'vmods-high))
         (vmods-low (slot-value %obj 'vmods-low)))
    (declare (ignorable type flags mask real-mods group affect vmods-high vmods-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-mods)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-card8 %buf affect)
    (xcb:buffer-write-card8 %buf vmods-high)
    (xcb:buffer-write-card8 %buf vmods-low)))
(defun decode-sa-iso-lock (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags mask real-mods group affect vmods-high vmods-low)
    (declare (ignorable %p type flags mask real-mods group affect vmods-high vmods-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf mask (xcb:read-card8-at %buf (+ %p 2)))
    (setf real-mods (xcb:read-card8-at %buf (+ %p 3)))
    (setf group (xcb:read-int8-at %buf (+ %p 4)))
    (setf affect (xcb:read-card8-at %buf (+ %p 5)))
    (setf vmods-high (xcb:read-card8-at %buf (+ %p 6)))
    (setf vmods-low (xcb:read-card8-at %buf (+ %p 7)))
    (values
     (make-instance 'sa-iso-lock :type type :flags flags :mask mask :real-mods real-mods :group
                    group :affect affect :vmods-high vmods-high :vmods-low vmods-low)
     (+ %p 8))))

;;; xcb.xkb.SATerminate
(defclass sa-terminate nil ((type :initarg :type :accessor type :type (unsigned-byte 8))))
(defun encode-sa-terminate (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)))
    (declare (ignorable type))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 7)))
(defun decode-sa-terminate (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type)
    (declare (ignorable %p type))
    (setf type (xcb:read-card8-at %buf %p))
    (values (make-instance 'sa-terminate :type type) (+ %p 8))))

;;; Enum xcb.xkb.SwitchScreenFlag
(xcb:defenum xkb-switch-screen-flag
  (:application 1)
  (:absolute 4))

;;; xcb.xkb.SASwitchScreen
(defclass sa-switch-screen nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (new-screen :initarg :new-screen :accessor new-screen :type (signed-byte 8))))
(defun encode-sa-switch-screen (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (new-screen (slot-value %obj 'new-screen)))
    (declare (ignorable type flags new-screen))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf new-screen)
    (xcb:buffer-write-padding %buf 5)))
(defun decode-sa-switch-screen (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags new-screen)
    (declare (ignorable %p type flags new-screen))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf new-screen (xcb:read-int8-at %buf (+ %p 2)))
    (values (make-instance 'sa-switch-screen :type type :flags flags :new-screen new-screen)
            (+ %p 8))))

;;; Enum xcb.xkb.BoolCtrlsHigh
(xcb:defenum xkb-bool-ctrls-high
  (:access-x-feedback 1)
  (:audible-bell 2)
  (:overlay1 4)
  (:overlay2 8)
  (:ignore-group-lock 16))

;;; Enum xcb.xkb.BoolCtrlsLow
(xcb:defenum xkb-bool-ctrls-low
  (:repeat-keys 1)
  (:slow-keys 2)
  (:bounce-keys 4)
  (:sticky-keys 8)
  (:mouse-keys 16)
  (:mouse-keys-accel 32)
  (:access-x-keys 64)
  (:access-x-timeout 128))

;;; xcb.xkb.SASetControls
(defclass sa-set-controls nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (bool-ctrls-high :initarg :bool-ctrls-high :accessor bool-ctrls-high :type
            (unsigned-byte 8))
           (bool-ctrls-low :initarg :bool-ctrls-low :accessor bool-ctrls-low :type
            (unsigned-byte 8))))
(defun encode-sa-set-controls (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (bool-ctrls-high (slot-value %obj 'bool-ctrls-high))
         (bool-ctrls-low (slot-value %obj 'bool-ctrls-low)))
    (declare (ignorable type bool-ctrls-high bool-ctrls-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card8 %buf bool-ctrls-high)
    (xcb:buffer-write-card8 %buf bool-ctrls-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-set-controls (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type bool-ctrls-high bool-ctrls-low)
    (declare (ignorable %p type bool-ctrls-high bool-ctrls-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf bool-ctrls-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf bool-ctrls-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-set-controls :type type :bool-ctrls-high bool-ctrls-high :bool-ctrls-low
                    bool-ctrls-low)
     (+ %p 8))))

;;; xcb.xkb.SASetControls
(defclass sa-lock-controls nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (bool-ctrls-high :initarg :bool-ctrls-high :accessor bool-ctrls-high :type
            (unsigned-byte 8))
           (bool-ctrls-low :initarg :bool-ctrls-low :accessor bool-ctrls-low :type
            (unsigned-byte 8))))
(defun encode-sa-lock-controls (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (bool-ctrls-high (slot-value %obj 'bool-ctrls-high))
         (bool-ctrls-low (slot-value %obj 'bool-ctrls-low)))
    (declare (ignorable type bool-ctrls-high bool-ctrls-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card8 %buf bool-ctrls-high)
    (xcb:buffer-write-card8 %buf bool-ctrls-low)
    (xcb:buffer-write-padding %buf 2)))
(defun decode-sa-lock-controls (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type bool-ctrls-high bool-ctrls-low)
    (declare (ignorable %p type bool-ctrls-high bool-ctrls-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf bool-ctrls-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf bool-ctrls-low (xcb:read-card8-at %buf (+ %p 5)))
    (values
     (make-instance 'sa-lock-controls :type type :bool-ctrls-high bool-ctrls-high :bool-ctrls-low
                    bool-ctrls-low)
     (+ %p 8))))

;;; Enum xcb.xkb.ActionMessageFlag
(xcb:defenum xkb-action-message-flag
  (:on-press 1)
  (:on-release 2)
  (:gen-key-event 4))

;;; xcb.xkb.SAActionMessage
(defclass sa-action-message nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (message :initarg :message :accessor message :type cl:sequence)))
(defun encode-sa-action-message (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (message (slot-value %obj 'message)))
    (declare (ignorable type flags message))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-fixed-list %buf message 6 #'xcb:buffer-write-card8 1)))
(defun decode-sa-action-message (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags message)
    (declare (ignorable %p type flags message))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf message (xcb:read-vector-at %buf (+ %p 2) 6 %order :card8))
    (values (make-instance 'sa-action-message :type type :flags flags :message message) (+ %p 8))))

;;; xcb.xkb.SARedirectKey
(defclass sa-redirect-key nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (newkey :initarg :newkey :accessor newkey :type xcb:keycode)
           (mask :initarg :mask :accessor mask :type (unsigned-byte 8))
           (real-modifiers :initarg :real-modifiers :accessor real-modifiers :type
            (unsigned-byte 8))
           (vmods-mask-high :initarg :vmods-mask-high :accessor vmods-mask-high :type
            (unsigned-byte 8))
           (vmods-mask-low :initarg :vmods-mask-low :accessor vmods-mask-low :type
            (unsigned-byte 8))
           (vmods-high :initarg :vmods-high :accessor vmods-high :type (unsigned-byte 8))
           (vmods-low :initarg :vmods-low :accessor vmods-low :type (unsigned-byte 8))))
(defun encode-sa-redirect-key (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (newkey (slot-value %obj 'newkey))
         (mask (slot-value %obj 'mask))
         (real-modifiers (slot-value %obj 'real-modifiers))
         (vmods-mask-high (slot-value %obj 'vmods-mask-high))
         (vmods-mask-low (slot-value %obj 'vmods-mask-low))
         (vmods-high (slot-value %obj 'vmods-high))
         (vmods-low (slot-value %obj 'vmods-low)))
    (declare
     (ignorable type newkey mask real-modifiers vmods-mask-high vmods-mask-low vmods-high
      vmods-low))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf newkey)
    (xcb:buffer-write-card8 %buf mask)
    (xcb:buffer-write-card8 %buf real-modifiers)
    (xcb:buffer-write-card8 %buf vmods-mask-high)
    (xcb:buffer-write-card8 %buf vmods-mask-low)
    (xcb:buffer-write-card8 %buf vmods-high)
    (xcb:buffer-write-card8 %buf vmods-low)))
(defun decode-sa-redirect-key (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        type
        newkey
        mask
        real-modifiers
        vmods-mask-high
        vmods-mask-low
        vmods-high
        vmods-low)
    (declare
     (ignorable %p type newkey mask real-modifiers vmods-mask-high vmods-mask-low vmods-high
      vmods-low))
    (setf type (xcb:read-card8-at %buf %p))
    (setf newkey (xcb:read-card8-at %buf (+ %p 1)))
    (setf mask (xcb:read-card8-at %buf (+ %p 2)))
    (setf real-modifiers (xcb:read-card8-at %buf (+ %p 3)))
    (setf vmods-mask-high (xcb:read-card8-at %buf (+ %p 4)))
    (setf vmods-mask-low (xcb:read-card8-at %buf (+ %p 5)))
    (setf vmods-high (xcb:read-card8-at %buf (+ %p 6)))
    (setf vmods-low (xcb:read-card8-at %buf (+ %p 7)))
    (values
     (make-instance 'sa-redirect-key :type type :newkey newkey :mask mask :real-modifiers
                    real-modifiers :vmods-mask-high vmods-mask-high :vmods-mask-low vmods-mask-low
                    :vmods-high vmods-high :vmods-low vmods-low)
     (+ %p 8))))

;;; xcb.xkb.SADeviceBtn
(defclass sa-device-btn nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (count :initarg :count :accessor count :type (unsigned-byte 8))
           (button :initarg :button :accessor button :type (unsigned-byte 8))
           (device :initarg :device :accessor device :type (unsigned-byte 8))))
(defun encode-sa-device-btn (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (count (slot-value %obj 'count))
         (button (slot-value %obj 'button))
         (device (slot-value %obj 'device)))
    (declare (ignorable type flags count button device))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-card8 %buf count)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-card8 %buf device)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-sa-device-btn (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags count button device)
    (declare (ignorable %p type flags count button device))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf count (xcb:read-card8-at %buf (+ %p 2)))
    (setf button (xcb:read-card8-at %buf (+ %p 3)))
    (setf device (xcb:read-card8-at %buf (+ %p 4)))
    (values
     (make-instance 'sa-device-btn :type type :flags flags :count count :button button :device
                    device)
     (+ %p 8))))

;;; Enum xcb.xkb.LockDeviceFlags
(xcb:defenum xkb-lock-device-flags
  (:no-lock 1)
  (:no-unlock 2))

;;; xcb.xkb.SALockDeviceBtn
(defclass sa-lock-device-btn nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (button :initarg :button :accessor button :type (unsigned-byte 8))
           (device :initarg :device :accessor device :type (unsigned-byte 8))))
(defun encode-sa-lock-device-btn (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (flags (slot-value %obj 'flags))
         (button (slot-value %obj 'button))
         (device (slot-value %obj 'device)))
    (declare (ignorable type flags button device))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf flags)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card8 %buf button)
    (xcb:buffer-write-card8 %buf device)
    (xcb:buffer-write-padding %buf 3)))
(defun decode-sa-lock-device-btn (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type flags button device)
    (declare (ignorable %p type flags button device))
    (setf type (xcb:read-card8-at %buf %p))
    (setf flags (xcb:read-card8-at %buf (+ %p 1)))
    (setf button (xcb:read-card8-at %buf (+ %p 3)))
    (setf device (xcb:read-card8-at %buf (+ %p 4)))
    (values
     (make-instance 'sa-lock-device-btn :type type :flags flags :button button :device device)
     (+ %p 8))))

;;; Enum xcb.xkb.SAValWhat
(xcb:defenum xkb-sa-val-what
  (:ignore-val 0)
  (:set-val-min 1)
  (:set-val-center 2)
  (:set-val-max 3)
  (:set-val-relative 4)
  (:set-val-absolute 5))

;;; xcb.xkb.SADeviceValuator
(defclass sa-device-valuator nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (device :initarg :device :accessor device :type (unsigned-byte 8))
           (val1what :initarg :val1what :accessor val1what :type (unsigned-byte 8))
           (val1index :initarg :val1index :accessor val1index :type (unsigned-byte 8))
           (val1value :initarg :val1value :accessor val1value :type (unsigned-byte 8))
           (val2what :initarg :val2what :accessor val2what :type (unsigned-byte 8))
           (val2index :initarg :val2index :accessor val2index :type (unsigned-byte 8))
           (val2value :initarg :val2value :accessor val2value :type (unsigned-byte 8))))
(defun encode-sa-device-valuator (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type))
         (device (slot-value %obj 'device))
         (val1what (slot-value %obj 'val1what))
         (val1index (slot-value %obj 'val1index))
         (val1value (slot-value %obj 'val1value))
         (val2what (slot-value %obj 'val2what))
         (val2index (slot-value %obj 'val2index))
         (val2value (slot-value %obj 'val2value)))
    (declare (ignorable type device val1what val1index val1value val2what val2index val2value))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-card8 %buf device)
    (xcb:buffer-write-card8 %buf val1what)
    (xcb:buffer-write-card8 %buf val1index)
    (xcb:buffer-write-card8 %buf val1value)
    (xcb:buffer-write-card8 %buf val2what)
    (xcb:buffer-write-card8 %buf val2index)
    (xcb:buffer-write-card8 %buf val2value)))
(defun decode-sa-device-valuator (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type device val1what val1index val1value val2what val2index val2value)
    (declare (ignorable %p type device val1what val1index val1value val2what val2index val2value))
    (setf type (xcb:read-card8-at %buf %p))
    (setf device (xcb:read-card8-at %buf (+ %p 1)))
    (setf val1what (xcb:read-card8-at %buf (+ %p 2)))
    (setf val1index (xcb:read-card8-at %buf (+ %p 3)))
    (setf val1value (xcb:read-card8-at %buf (+ %p 4)))
    (setf val2what (xcb:read-card8-at %buf (+ %p 5)))
    (setf val2index (xcb:read-card8-at %buf (+ %p 6)))
    (setf val2value (xcb:read-card8-at %buf (+ %p 7)))
    (values
     (make-instance 'sa-device-valuator :type type :device device :val1what val1what :val1index
                    val1index :val1value val1value :val2what val2what :val2index val2index
                    :val2value val2value)
     (+ %p 8))))

;;; xcb.xkb.SIAction
(defclass si-action nil
          ((type :initarg :type :accessor type :type (unsigned-byte 8))
           (data :initarg :data :accessor data :type cl:sequence)))
(defun encode-si-action (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((type (slot-value %obj 'type)) (data (slot-value %obj 'data)))
    (declare (ignorable type data))
    (xcb:buffer-write-card8 %buf type)
    (xcb:buffer-write-fixed-list %buf data 7 #'xcb:buffer-write-card8 1)))
(defun decode-si-action (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) type data)
    (declare (ignorable %p type data))
    (setf type (xcb:read-card8-at %buf %p))
    (setf data (xcb:read-vector-at %buf (+ %p 1) 7 %order :card8))
    (values (make-instance 'si-action :type type :data data) (+ %p 8))))

;;; xcb.xkb.SymInterpret
(defclass sym-interpret nil
          ((sym :initarg :sym :accessor sym :type xcb:keysym)
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))
           (match :initarg :match :accessor match :type (unsigned-byte 8))
           (virtual-mod :initarg :virtual-mod :accessor virtual-mod :type (unsigned-byte 8))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 8))
           (action :initarg :action :accessor action :type si-action)))
(defun encode-sym-interpret (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((sym (slot-value %obj 'sym))
         (mods (slot-value %obj 'mods))
         (match (slot-value %obj 'match))
         (virtual-mod (slot-value %obj 'virtual-mod))
         (flags (slot-value %obj 'flags))
         (action (slot-value %obj 'action)))
    (declare (ignorable sym mods match virtual-mod flags action))
    (xcb:buffer-write-card32 %buf sym)
    (xcb:buffer-write-card8 %buf mods)
    (xcb:buffer-write-card8 %buf match)
    (xcb:buffer-write-card8 %buf virtual-mod)
    (xcb:buffer-write-card8 %buf flags)
    (encode-si-action %buf action)))
(defun decode-sym-interpret (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) sym mods match virtual-mod flags action)
    (declare (ignorable %p sym mods match virtual-mod flags action))
    (setf sym (xcb:read-card32-at %buf %p %order))
    (setf mods (xcb:read-card8-at %buf (+ %p 4)))
    (setf match (xcb:read-card8-at %buf (+ %p 5)))
    (setf virtual-mod (xcb:read-card8-at %buf (+ %p 6)))
    (setf flags (xcb:read-card8-at %buf (+ %p 7)))
    (setf action (decode-si-action %buf (+ %p 8) %order))
    (values
     (make-instance 'sym-interpret :sym sym :mods mods :match match :virtual-mod virtual-mod :flags
                    flags :action action)
     (+ %p 16))))

;;; xcb.xkb.Action
(defclass action nil
          ((noaction :initarg :noaction :accessor noaction :type sa-no-action)
           (setmods :initarg :setmods :accessor setmods :type sa-set-mods)
           (latchmods :initarg :latchmods :accessor latchmods :type sa-set-mods)
           (lockmods :initarg :lockmods :accessor lockmods :type sa-set-mods)
           (setgroup :initarg :setgroup :accessor setgroup :type sa-set-group)
           (latchgroup :initarg :latchgroup :accessor latchgroup :type sa-set-group)
           (lockgroup :initarg :lockgroup :accessor lockgroup :type sa-set-group)
           (moveptr :initarg :moveptr :accessor moveptr :type sa-move-ptr)
           (ptrbtn :initarg :ptrbtn :accessor ptrbtn :type sa-ptr-btn)
           (lockptrbtn :initarg :lockptrbtn :accessor lockptrbtn :type sa-lock-ptr-btn)
           (setptrdflt :initarg :setptrdflt :accessor setptrdflt :type sa-set-ptr-dflt)
           (isolock :initarg :isolock :accessor isolock :type sa-iso-lock)
           (terminate :initarg :terminate :accessor terminate :type sa-terminate)
           (switchscreen :initarg :switchscreen :accessor switchscreen :type sa-switch-screen)
           (setcontrols :initarg :setcontrols :accessor setcontrols :type sa-set-controls)
           (lockcontrols :initarg :lockcontrols :accessor lockcontrols :type sa-set-controls)
           (message :initarg :message :accessor message :type sa-action-message)
           (redirect :initarg :redirect :accessor redirect :type sa-redirect-key)
           (devbtn :initarg :devbtn :accessor devbtn :type sa-device-btn)
           (lockdevbtn :initarg :lockdevbtn :accessor lockdevbtn :type sa-lock-device-btn)
           (devval :initarg :devval :accessor devval :type sa-device-valuator)
           (type :initarg :type :accessor type :type (unsigned-byte 8)))
          (:documentation "A union: its members are views of the same bytes.
Decoding sets every member, each read from those bytes; encoding writes
the first member that is bound, in the order of the slots.  Re-encoding
a decoded instance therefore writes its first member, which in X's
unions spans the whole union, so the bytes come out the same.  To
encode a particular member, make an instance with only that one bound."))
(defun encode-action (%buf %obj)
  (let ((%start (xcb:buffer-position %buf)))
    (cond ((slot-boundp %obj 'noaction) (encode-sa-no-action %buf (slot-value %obj 'noaction)))
          ((slot-boundp %obj 'setmods) (encode-sa-set-mods %buf (slot-value %obj 'setmods)))
          ((slot-boundp %obj 'latchmods) (encode-sa-set-mods %buf (slot-value %obj 'latchmods)))
          ((slot-boundp %obj 'lockmods) (encode-sa-set-mods %buf (slot-value %obj 'lockmods)))
          ((slot-boundp %obj 'setgroup) (encode-sa-set-group %buf (slot-value %obj 'setgroup)))
          ((slot-boundp %obj 'latchgroup) (encode-sa-set-group %buf (slot-value %obj 'latchgroup)))
          ((slot-boundp %obj 'lockgroup) (encode-sa-set-group %buf (slot-value %obj 'lockgroup)))
          ((slot-boundp %obj 'moveptr) (encode-sa-move-ptr %buf (slot-value %obj 'moveptr)))
          ((slot-boundp %obj 'ptrbtn) (encode-sa-ptr-btn %buf (slot-value %obj 'ptrbtn)))
          ((slot-boundp %obj 'lockptrbtn)
           (encode-sa-lock-ptr-btn %buf (slot-value %obj 'lockptrbtn)))
          ((slot-boundp %obj 'setptrdflt)
           (encode-sa-set-ptr-dflt %buf (slot-value %obj 'setptrdflt)))
          ((slot-boundp %obj 'isolock) (encode-sa-iso-lock %buf (slot-value %obj 'isolock)))
          ((slot-boundp %obj 'terminate) (encode-sa-terminate %buf (slot-value %obj 'terminate)))
          ((slot-boundp %obj 'switchscreen)
           (encode-sa-switch-screen %buf (slot-value %obj 'switchscreen)))
          ((slot-boundp %obj 'setcontrols)
           (encode-sa-set-controls %buf (slot-value %obj 'setcontrols)))
          ((slot-boundp %obj 'lockcontrols)
           (encode-sa-set-controls %buf (slot-value %obj 'lockcontrols)))
          ((slot-boundp %obj 'message) (encode-sa-action-message %buf (slot-value %obj 'message)))
          ((slot-boundp %obj 'redirect) (encode-sa-redirect-key %buf (slot-value %obj 'redirect)))
          ((slot-boundp %obj 'devbtn) (encode-sa-device-btn %buf (slot-value %obj 'devbtn)))
          ((slot-boundp %obj 'lockdevbtn)
           (encode-sa-lock-device-btn %buf (slot-value %obj 'lockdevbtn)))
          ((slot-boundp %obj 'devval) (encode-sa-device-valuator %buf (slot-value %obj 'devval)))
          ((slot-boundp %obj 'type) (xcb:buffer-write-card8 %buf (slot-value %obj 'type)))
          (t (error "No member of union ~A is set" %obj)))
    (xcb:buffer-write-padding %buf (- 8 (- (xcb:buffer-position %buf) %start)))))
(defun decode-action (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        noaction
        setmods
        latchmods
        lockmods
        setgroup
        latchgroup
        lockgroup
        moveptr
        ptrbtn
        lockptrbtn
        setptrdflt
        isolock
        terminate
        switchscreen
        setcontrols
        lockcontrols
        message
        redirect
        devbtn
        lockdevbtn
        devval
        type)
    (declare
     (ignorable %p noaction setmods latchmods lockmods setgroup latchgroup lockgroup moveptr ptrbtn
      lockptrbtn setptrdflt isolock terminate switchscreen setcontrols lockcontrols message
      redirect devbtn lockdevbtn devval type))
    (setf noaction (decode-sa-no-action %buf %p %order))
    (setf setmods (decode-sa-set-mods %buf %p %order))
    (setf latchmods (decode-sa-set-mods %buf %p %order))
    (setf lockmods (decode-sa-set-mods %buf %p %order))
    (setf setgroup (decode-sa-set-group %buf %p %order))
    (setf latchgroup (decode-sa-set-group %buf %p %order))
    (setf lockgroup (decode-sa-set-group %buf %p %order))
    (setf moveptr (decode-sa-move-ptr %buf %p %order))
    (setf ptrbtn (decode-sa-ptr-btn %buf %p %order))
    (setf lockptrbtn (decode-sa-lock-ptr-btn %buf %p %order))
    (setf setptrdflt (decode-sa-set-ptr-dflt %buf %p %order))
    (setf isolock (decode-sa-iso-lock %buf %p %order))
    (setf terminate (decode-sa-terminate %buf %p %order))
    (setf switchscreen (decode-sa-switch-screen %buf %p %order))
    (setf setcontrols (decode-sa-set-controls %buf %p %order))
    (setf lockcontrols (decode-sa-set-controls %buf %p %order))
    (setf message (decode-sa-action-message %buf %p %order))
    (setf redirect (decode-sa-redirect-key %buf %p %order))
    (setf devbtn (decode-sa-device-btn %buf %p %order))
    (setf lockdevbtn (decode-sa-lock-device-btn %buf %p %order))
    (setf devval (decode-sa-device-valuator %buf %p %order))
    (setf type (xcb:read-card8-at %buf %p))
    (values
     (make-instance 'action :noaction noaction :setmods setmods :latchmods latchmods :lockmods
                    lockmods :setgroup setgroup :latchgroup latchgroup :lockgroup lockgroup
                    :moveptr moveptr :ptrbtn ptrbtn :lockptrbtn lockptrbtn :setptrdflt setptrdflt
                    :isolock isolock :terminate terminate :switchscreen switchscreen :setcontrols
                    setcontrols :lockcontrols lockcontrols :message message :redirect redirect
                    :devbtn devbtn :lockdevbtn lockdevbtn :devval devval :type type)
     (+ %pos 8))))

;;; Request xcb.xkb.UseExtension
(defun use-extension (conn wanted-major wanted-minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf wanted-major)
    (xcb:buffer-write-card16 %buf wanted-minor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass use-extension-request (xcb:request-with-reply)
          ((wanted-major :initarg :wanted-major :type (unsigned-byte 16))
           (wanted-minor :initarg :wanted-minor :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj use-extension-request))
  (use-extension conn (slot-value %obj 'wanted-major) (slot-value %obj 'wanted-minor)))
(defclass use-extension-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (supported :initarg :supported :accessor supported :type (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major :initarg :server-major :accessor server-major :type (unsigned-byte 16))
           (server-minor :initarg :server-minor :accessor server-minor :type (unsigned-byte 16))))
(defun decode-use-extension-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type supported sequence length server-major server-minor)
    (declare (ignorable %p response-type supported sequence length server-major server-minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf supported (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf server-major (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf server-minor (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'use-extension-reply :response-type response-type :supported supported
                    :sequence sequence :length length :server-major server-major :server-minor
                    server-minor)
     (+ %pos 32 (* 4 length)))))
(defun use-extension-reply (conn cookie) (xcb:read-reply conn cookie #'decode-use-extension-reply))

;;; Request xcb.xkb.SelectEvents
(defun select-events
       (conn device-spec affect-which clear select-all affect-map map
        &key affect-new-keyboard new-keyboard-details affect-state state-details affect-ctrls
        ctrl-details affect-indicator-state indicator-state-details affect-indicator-map
        indicator-map-details affect-names names-details affect-compat compat-details affect-bell
        bell-details affect-msg-details msg-details affect-access-x access-x-details affect-ext-dev
        extdev-details)
  (xcb:check-value-mask 'select-events
   (logand affect-which (logand (lognot clear) (lognot select-all)))
   (1 :affect-new-keyboard affect-new-keyboard nil)
   (1 :new-keyboard-details new-keyboard-details nil) (4 :affect-state affect-state nil)
   (4 :state-details state-details nil) (8 :affect-ctrls affect-ctrls nil)
   (8 :ctrl-details ctrl-details nil) (16 :affect-indicator-state affect-indicator-state nil)
   (16 :indicator-state-details indicator-state-details nil)
   (32 :affect-indicator-map affect-indicator-map nil)
   (32 :indicator-map-details indicator-map-details nil) (64 :affect-names affect-names nil)
   (64 :names-details names-details nil) (128 :affect-compat affect-compat nil)
   (128 :compat-details compat-details nil) (256 :affect-bell affect-bell nil)
   (256 :bell-details bell-details nil) (512 :affect-msg-details affect-msg-details nil)
   (512 :msg-details msg-details nil) (1024 :affect-access-x affect-access-x nil)
   (1024 :access-x-details access-x-details nil) (2048 :affect-ext-dev affect-ext-dev nil)
   (2048 :extdev-details extdev-details nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf affect-which)
    (xcb:buffer-write-card16 %buf clear)
    (xcb:buffer-write-card16 %buf select-all)
    (xcb:buffer-write-card16 %buf affect-map)
    (xcb:buffer-write-card16 %buf map)
    (let ((%mask (logand affect-which (logand (lognot clear) (lognot select-all)))))
      (when (logtest %mask 1)
        (xcb:buffer-write-card16 %buf affect-new-keyboard)
        (xcb:buffer-write-card16 %buf new-keyboard-details))
      (when (logtest %mask 4)
        (xcb:buffer-write-card16 %buf affect-state)
        (xcb:buffer-write-card16 %buf state-details))
      (when (logtest %mask 8)
        (xcb:buffer-write-card32 %buf affect-ctrls)
        (xcb:buffer-write-card32 %buf ctrl-details))
      (when (logtest %mask 16)
        (xcb:buffer-write-card32 %buf affect-indicator-state)
        (xcb:buffer-write-card32 %buf indicator-state-details))
      (when (logtest %mask 32)
        (xcb:buffer-write-card32 %buf affect-indicator-map)
        (xcb:buffer-write-card32 %buf indicator-map-details))
      (when (logtest %mask 64)
        (xcb:buffer-write-card16 %buf affect-names)
        (xcb:buffer-write-card16 %buf names-details))
      (when (logtest %mask 128)
        (xcb:buffer-write-card8 %buf affect-compat)
        (xcb:buffer-write-card8 %buf compat-details))
      (when (logtest %mask 256)
        (xcb:buffer-write-card8 %buf affect-bell)
        (xcb:buffer-write-card8 %buf bell-details))
      (when (logtest %mask 512)
        (xcb:buffer-write-card8 %buf affect-msg-details)
        (xcb:buffer-write-card8 %buf msg-details))
      (when (logtest %mask 1024)
        (xcb:buffer-write-card16 %buf affect-access-x)
        (xcb:buffer-write-card16 %buf access-x-details))
      (when (logtest %mask 2048)
        (xcb:buffer-write-card16 %buf affect-ext-dev)
        (xcb:buffer-write-card16 %buf extdev-details)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-events-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (affect-which :initarg :affect-which :type (unsigned-byte 16))
           (clear :initarg :clear :type (unsigned-byte 16))
           (select-all :initarg :select-all :type (unsigned-byte 16))
           (affect-map :initarg :affect-map :type (unsigned-byte 16))
           (map :initarg :map :type (unsigned-byte 16))
           (affect-new-keyboard :initarg :affect-new-keyboard :type (unsigned-byte 16))
           (new-keyboard-details :initarg :new-keyboard-details :type (unsigned-byte 16))
           (affect-state :initarg :affect-state :type (unsigned-byte 16))
           (state-details :initarg :state-details :type (unsigned-byte 16))
           (affect-ctrls :initarg :affect-ctrls :type (unsigned-byte 32))
           (ctrl-details :initarg :ctrl-details :type (unsigned-byte 32))
           (affect-indicator-state :initarg :affect-indicator-state :type (unsigned-byte 32))
           (indicator-state-details :initarg :indicator-state-details :type (unsigned-byte 32))
           (affect-indicator-map :initarg :affect-indicator-map :type (unsigned-byte 32))
           (indicator-map-details :initarg :indicator-map-details :type (unsigned-byte 32))
           (affect-names :initarg :affect-names :type (unsigned-byte 16))
           (names-details :initarg :names-details :type (unsigned-byte 16))
           (affect-compat :initarg :affect-compat :type (unsigned-byte 8))
           (compat-details :initarg :compat-details :type (unsigned-byte 8))
           (affect-bell :initarg :affect-bell :type (unsigned-byte 8))
           (bell-details :initarg :bell-details :type (unsigned-byte 8))
           (affect-msg-details :initarg :affect-msg-details :type (unsigned-byte 8))
           (msg-details :initarg :msg-details :type (unsigned-byte 8))
           (affect-access-x :initarg :affect-access-x :type (unsigned-byte 16))
           (access-x-details :initarg :access-x-details :type (unsigned-byte 16))
           (affect-ext-dev :initarg :affect-ext-dev :type (unsigned-byte 16))
           (extdev-details :initarg :extdev-details :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj select-events-request))
  (apply #'select-events conn (slot-value %obj 'device-spec) (slot-value %obj 'affect-which)
         (slot-value %obj 'clear) (slot-value %obj 'select-all) (slot-value %obj 'affect-map)
         (slot-value %obj 'map)
         (nconc
          (when (slot-boundp %obj 'affect-new-keyboard)
            (list :affect-new-keyboard (slot-value %obj 'affect-new-keyboard)))
          (when (slot-boundp %obj 'new-keyboard-details)
            (list :new-keyboard-details (slot-value %obj 'new-keyboard-details)))
          (when (slot-boundp %obj 'affect-state)
            (list :affect-state (slot-value %obj 'affect-state)))
          (when (slot-boundp %obj 'state-details)
            (list :state-details (slot-value %obj 'state-details)))
          (when (slot-boundp %obj 'affect-ctrls)
            (list :affect-ctrls (slot-value %obj 'affect-ctrls)))
          (when (slot-boundp %obj 'ctrl-details)
            (list :ctrl-details (slot-value %obj 'ctrl-details)))
          (when (slot-boundp %obj 'affect-indicator-state)
            (list :affect-indicator-state (slot-value %obj 'affect-indicator-state)))
          (when (slot-boundp %obj 'indicator-state-details)
            (list :indicator-state-details (slot-value %obj 'indicator-state-details)))
          (when (slot-boundp %obj 'affect-indicator-map)
            (list :affect-indicator-map (slot-value %obj 'affect-indicator-map)))
          (when (slot-boundp %obj 'indicator-map-details)
            (list :indicator-map-details (slot-value %obj 'indicator-map-details)))
          (when (slot-boundp %obj 'affect-names)
            (list :affect-names (slot-value %obj 'affect-names)))
          (when (slot-boundp %obj 'names-details)
            (list :names-details (slot-value %obj 'names-details)))
          (when (slot-boundp %obj 'affect-compat)
            (list :affect-compat (slot-value %obj 'affect-compat)))
          (when (slot-boundp %obj 'compat-details)
            (list :compat-details (slot-value %obj 'compat-details)))
          (when (slot-boundp %obj 'affect-bell) (list :affect-bell (slot-value %obj 'affect-bell)))
          (when (slot-boundp %obj 'bell-details)
            (list :bell-details (slot-value %obj 'bell-details)))
          (when (slot-boundp %obj 'affect-msg-details)
            (list :affect-msg-details (slot-value %obj 'affect-msg-details)))
          (when (slot-boundp %obj 'msg-details) (list :msg-details (slot-value %obj 'msg-details)))
          (when (slot-boundp %obj 'affect-access-x)
            (list :affect-access-x (slot-value %obj 'affect-access-x)))
          (when (slot-boundp %obj 'access-x-details)
            (list :access-x-details (slot-value %obj 'access-x-details)))
          (when (slot-boundp %obj 'affect-ext-dev)
            (list :affect-ext-dev (slot-value %obj 'affect-ext-dev)))
          (when (slot-boundp %obj 'extdev-details)
            (list :extdev-details (slot-value %obj 'extdev-details))))))

;;; Request xcb.xkb.Bell
(defun bell
       (conn device-spec bell-class bell-id percent force-sound event-only pitch duration name
        window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf bell-class)
    (xcb:buffer-write-card16 %buf bell-id)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-write-bool %buf force-sound)
    (xcb:buffer-write-bool %buf event-only)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf pitch)
    (xcb:buffer-write-card16 %buf duration)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass bell-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (bell-class :initarg :bell-class :type bell-class-spec)
           (bell-id :initarg :bell-id :type id-spec)
           (percent :initarg :percent :type (signed-byte 8))
           (force-sound :initarg :force-sound :type (or boolean (unsigned-byte 8)))
           (event-only :initarg :event-only :type (or boolean (unsigned-byte 8)))
           (pitch :initarg :pitch :type (signed-byte 16))
           (duration :initarg :duration :type (signed-byte 16))
           (name :initarg :name :type xcb:atom) (window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj bell-request))
  (bell conn (slot-value %obj 'device-spec) (slot-value %obj 'bell-class)
   (slot-value %obj 'bell-id) (slot-value %obj 'percent) (slot-value %obj 'force-sound)
   (slot-value %obj 'event-only) (slot-value %obj 'pitch) (slot-value %obj 'duration)
   (slot-value %obj 'name) (slot-value %obj 'window)))

;;; Request xcb.xkb.GetState
(defun get-state (conn device-spec)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-state-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)))
(defmethod xcb:send-request (conn (%obj get-state-request))
  (get-state conn (slot-value %obj 'device-spec)))
(defclass get-state-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))
           (base-mods :initarg :base-mods :accessor base-mods :type (unsigned-byte 8))
           (latched-mods :initarg :latched-mods :accessor latched-mods :type (unsigned-byte 8))
           (locked-mods :initarg :locked-mods :accessor locked-mods :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (unsigned-byte 8))
           (locked-group :initarg :locked-group :accessor locked-group :type (unsigned-byte 8))
           (base-group :initarg :base-group :accessor base-group :type (signed-byte 16))
           (latched-group :initarg :latched-group :accessor latched-group :type (signed-byte 16))
           (compat-state :initarg :compat-state :accessor compat-state :type (unsigned-byte 8))
           (grab-mods :initarg :grab-mods :accessor grab-mods :type (unsigned-byte 8))
           (compat-grab-mods :initarg :compat-grab-mods :accessor compat-grab-mods :type
            (unsigned-byte 8))
           (lookup-mods :initarg :lookup-mods :accessor lookup-mods :type (unsigned-byte 8))
           (compat-lookup-mods :initarg :compat-lookup-mods :accessor compat-lookup-mods :type
            (unsigned-byte 8))
           (ptr-btn-state :initarg :ptr-btn-state :accessor ptr-btn-state :type
            (unsigned-byte 16))))
(defun decode-get-state-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        mods
        base-mods
        latched-mods
        locked-mods
        group
        locked-group
        base-group
        latched-group
        compat-state
        grab-mods
        compat-grab-mods
        lookup-mods
        compat-lookup-mods
        ptr-btn-state)
    (declare
     (ignorable %p response-type device-id sequence length mods base-mods latched-mods locked-mods
      group locked-group base-group latched-group compat-state grab-mods compat-grab-mods
      lookup-mods compat-lookup-mods ptr-btn-state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf mods (xcb:read-card8-at %buf (+ %p 8)))
    (setf base-mods (xcb:read-card8-at %buf (+ %p 9)))
    (setf latched-mods (xcb:read-card8-at %buf (+ %p 10)))
    (setf locked-mods (xcb:read-card8-at %buf (+ %p 11)))
    (setf group (xcb:read-card8-at %buf (+ %p 12)))
    (setf locked-group (xcb:read-card8-at %buf (+ %p 13)))
    (setf base-group (xcb:read-int16-at %buf (+ %p 14) %order))
    (setf latched-group (xcb:read-int16-at %buf (+ %p 16) %order))
    (setf compat-state (xcb:read-card8-at %buf (+ %p 18)))
    (setf grab-mods (xcb:read-card8-at %buf (+ %p 19)))
    (setf compat-grab-mods (xcb:read-card8-at %buf (+ %p 20)))
    (setf lookup-mods (xcb:read-card8-at %buf (+ %p 21)))
    (setf compat-lookup-mods (xcb:read-card8-at %buf (+ %p 22)))
    (setf ptr-btn-state (xcb:read-card16-at %buf (+ %p 24) %order))
    (values
     (make-instance 'get-state-reply :response-type response-type :device-id device-id :sequence
                    sequence :length length :mods mods :base-mods base-mods :latched-mods
                    latched-mods :locked-mods locked-mods :group group :locked-group locked-group
                    :base-group base-group :latched-group latched-group :compat-state compat-state
                    :grab-mods grab-mods :compat-grab-mods compat-grab-mods :lookup-mods
                    lookup-mods :compat-lookup-mods compat-lookup-mods :ptr-btn-state
                    ptr-btn-state)
     (+ %pos 32 (* 4 length)))))
(defun get-state-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-state-reply))

;;; Request xcb.xkb.LatchLockState
(defun latch-lock-state
       (conn device-spec affect-mod-locks mod-locks lock-group group-lock affect-mod-latches
        latch-group group-latch)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card8 %buf affect-mod-locks)
    (xcb:buffer-write-card8 %buf mod-locks)
    (xcb:buffer-write-bool %buf lock-group)
    (xcb:buffer-write-card8 %buf group-lock)
    (xcb:buffer-write-card8 %buf affect-mod-latches)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-bool %buf latch-group)
    (xcb:buffer-write-card16 %buf group-latch)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass latch-lock-state-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (affect-mod-locks :initarg :affect-mod-locks :type (unsigned-byte 8))
           (mod-locks :initarg :mod-locks :type (unsigned-byte 8))
           (lock-group :initarg :lock-group :type (or boolean (unsigned-byte 8)))
           (group-lock :initarg :group-lock :type (unsigned-byte 8))
           (affect-mod-latches :initarg :affect-mod-latches :type (unsigned-byte 8))
           (latch-group :initarg :latch-group :type (or boolean (unsigned-byte 8)))
           (group-latch :initarg :group-latch :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj latch-lock-state-request))
  (latch-lock-state conn (slot-value %obj 'device-spec) (slot-value %obj 'affect-mod-locks)
   (slot-value %obj 'mod-locks) (slot-value %obj 'lock-group) (slot-value %obj 'group-lock)
   (slot-value %obj 'affect-mod-latches) (slot-value %obj 'latch-group)
   (slot-value %obj 'group-latch)))

;;; Request xcb.xkb.GetControls
(defun get-controls (conn device-spec)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-controls-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)))
(defmethod xcb:send-request (conn (%obj get-controls-request))
  (get-controls conn (slot-value %obj 'device-spec)))
(defclass get-controls-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (mouse-keys-dflt-btn :initarg :mouse-keys-dflt-btn :accessor mouse-keys-dflt-btn :type
            (unsigned-byte 8))
           (num-groups :initarg :num-groups :accessor num-groups :type (unsigned-byte 8))
           (groups-wrap :initarg :groups-wrap :accessor groups-wrap :type (unsigned-byte 8))
           (internal-mods-mask :initarg :internal-mods-mask :accessor internal-mods-mask :type
            (unsigned-byte 8))
           (ignore-lock-mods-mask :initarg :ignore-lock-mods-mask :accessor ignore-lock-mods-mask
            :type (unsigned-byte 8))
           (internal-mods-real-mods :initarg :internal-mods-real-mods :accessor
            internal-mods-real-mods :type (unsigned-byte 8))
           (ignore-lock-mods-real-mods :initarg :ignore-lock-mods-real-mods :accessor
            ignore-lock-mods-real-mods :type (unsigned-byte 8))
           (internal-mods-vmods :initarg :internal-mods-vmods :accessor internal-mods-vmods :type
            (unsigned-byte 16))
           (ignore-lock-mods-vmods :initarg :ignore-lock-mods-vmods :accessor
            ignore-lock-mods-vmods :type (unsigned-byte 16))
           (repeat-delay :initarg :repeat-delay :accessor repeat-delay :type (unsigned-byte 16))
           (repeat-interval :initarg :repeat-interval :accessor repeat-interval :type
            (unsigned-byte 16))
           (slow-keys-delay :initarg :slow-keys-delay :accessor slow-keys-delay :type
            (unsigned-byte 16))
           (debounce-delay :initarg :debounce-delay :accessor debounce-delay :type
            (unsigned-byte 16))
           (mouse-keys-delay :initarg :mouse-keys-delay :accessor mouse-keys-delay :type
            (unsigned-byte 16))
           (mouse-keys-interval :initarg :mouse-keys-interval :accessor mouse-keys-interval :type
            (unsigned-byte 16))
           (mouse-keys-time-to-max :initarg :mouse-keys-time-to-max :accessor
            mouse-keys-time-to-max :type (unsigned-byte 16))
           (mouse-keys-max-speed :initarg :mouse-keys-max-speed :accessor mouse-keys-max-speed
            :type (unsigned-byte 16))
           (mouse-keys-curve :initarg :mouse-keys-curve :accessor mouse-keys-curve :type
            (signed-byte 16))
           (access-x-option :initarg :access-x-option :accessor access-x-option :type
            (unsigned-byte 16))
           (access-x-timeout :initarg :access-x-timeout :accessor access-x-timeout :type
            (unsigned-byte 16))
           (access-x-timeout-options-mask :initarg :access-x-timeout-options-mask :accessor
            access-x-timeout-options-mask :type (unsigned-byte 16))
           (access-x-timeout-options-values :initarg :access-x-timeout-options-values :accessor
            access-x-timeout-options-values :type (unsigned-byte 16))
           (access-x-timeout-mask :initarg :access-x-timeout-mask :accessor access-x-timeout-mask
            :type (unsigned-byte 32))
           (access-x-timeout-values :initarg :access-x-timeout-values :accessor
            access-x-timeout-values :type (unsigned-byte 32))
           (enabled-controls :initarg :enabled-controls :accessor enabled-controls :type
            (unsigned-byte 32))
           (per-key-repeat :initarg :per-key-repeat :accessor per-key-repeat :type cl:sequence)))
(defun decode-get-controls-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        mouse-keys-dflt-btn
        num-groups
        groups-wrap
        internal-mods-mask
        ignore-lock-mods-mask
        internal-mods-real-mods
        ignore-lock-mods-real-mods
        internal-mods-vmods
        ignore-lock-mods-vmods
        repeat-delay
        repeat-interval
        slow-keys-delay
        debounce-delay
        mouse-keys-delay
        mouse-keys-interval
        mouse-keys-time-to-max
        mouse-keys-max-speed
        mouse-keys-curve
        access-x-option
        access-x-timeout
        access-x-timeout-options-mask
        access-x-timeout-options-values
        access-x-timeout-mask
        access-x-timeout-values
        enabled-controls
        per-key-repeat)
    (declare
     (ignorable %p response-type device-id sequence length mouse-keys-dflt-btn num-groups
      groups-wrap internal-mods-mask ignore-lock-mods-mask internal-mods-real-mods
      ignore-lock-mods-real-mods internal-mods-vmods ignore-lock-mods-vmods repeat-delay
      repeat-interval slow-keys-delay debounce-delay mouse-keys-delay mouse-keys-interval
      mouse-keys-time-to-max mouse-keys-max-speed mouse-keys-curve access-x-option access-x-timeout
      access-x-timeout-options-mask access-x-timeout-options-values access-x-timeout-mask
      access-x-timeout-values enabled-controls per-key-repeat))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf mouse-keys-dflt-btn (xcb:read-card8-at %buf (+ %p 8)))
    (setf num-groups (xcb:read-card8-at %buf (+ %p 9)))
    (setf groups-wrap (xcb:read-card8-at %buf (+ %p 10)))
    (setf internal-mods-mask (xcb:read-card8-at %buf (+ %p 11)))
    (setf ignore-lock-mods-mask (xcb:read-card8-at %buf (+ %p 12)))
    (setf internal-mods-real-mods (xcb:read-card8-at %buf (+ %p 13)))
    (setf ignore-lock-mods-real-mods (xcb:read-card8-at %buf (+ %p 14)))
    (setf internal-mods-vmods (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf ignore-lock-mods-vmods (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf repeat-delay (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf repeat-interval (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf slow-keys-delay (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf debounce-delay (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf mouse-keys-delay (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf mouse-keys-interval (xcb:read-card16-at %buf (+ %p 30) %order))
    (setf mouse-keys-time-to-max (xcb:read-card16-at %buf (+ %p 32) %order))
    (setf mouse-keys-max-speed (xcb:read-card16-at %buf (+ %p 34) %order))
    (setf mouse-keys-curve (xcb:read-int16-at %buf (+ %p 36) %order))
    (setf access-x-option (xcb:read-card16-at %buf (+ %p 38) %order))
    (setf access-x-timeout (xcb:read-card16-at %buf (+ %p 40) %order))
    (setf access-x-timeout-options-mask (xcb:read-card16-at %buf (+ %p 42) %order))
    (setf access-x-timeout-options-values (xcb:read-card16-at %buf (+ %p 44) %order))
    (setf access-x-timeout-mask (xcb:read-card32-at %buf (+ %p 48) %order))
    (setf access-x-timeout-values (xcb:read-card32-at %buf (+ %p 52) %order))
    (setf enabled-controls (xcb:read-card32-at %buf (+ %p 56) %order))
    (setf per-key-repeat (xcb:read-vector-at %buf (+ %p 60) 32 %order :card8))
    (values
     (make-instance 'get-controls-reply :response-type response-type :device-id device-id :sequence
                    sequence :length length :mouse-keys-dflt-btn mouse-keys-dflt-btn :num-groups
                    num-groups :groups-wrap groups-wrap :internal-mods-mask internal-mods-mask
                    :ignore-lock-mods-mask ignore-lock-mods-mask :internal-mods-real-mods
                    internal-mods-real-mods :ignore-lock-mods-real-mods ignore-lock-mods-real-mods
                    :internal-mods-vmods internal-mods-vmods :ignore-lock-mods-vmods
                    ignore-lock-mods-vmods :repeat-delay repeat-delay :repeat-interval
                    repeat-interval :slow-keys-delay slow-keys-delay :debounce-delay debounce-delay
                    :mouse-keys-delay mouse-keys-delay :mouse-keys-interval mouse-keys-interval
                    :mouse-keys-time-to-max mouse-keys-time-to-max :mouse-keys-max-speed
                    mouse-keys-max-speed :mouse-keys-curve mouse-keys-curve :access-x-option
                    access-x-option :access-x-timeout access-x-timeout
                    :access-x-timeout-options-mask access-x-timeout-options-mask
                    :access-x-timeout-options-values access-x-timeout-options-values
                    :access-x-timeout-mask access-x-timeout-mask :access-x-timeout-values
                    access-x-timeout-values :enabled-controls enabled-controls :per-key-repeat
                    per-key-repeat)
     (+ %pos 32 (* 4 length)))))
(defun get-controls-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-controls-reply))

;;; Request xcb.xkb.SetControls
(defun set-controls
       (conn device-spec affect-internal-real-mods internal-real-mods affect-ignore-lock-real-mods
        ignore-lock-real-mods affect-internal-virtual-mods internal-virtual-mods
        affect-ignore-lock-virtual-mods ignore-lock-virtual-mods mouse-keys-dflt-btn groups-wrap
        access-x-options affect-enabled-controls enabled-controls change-controls repeat-delay
        repeat-interval slow-keys-delay debounce-delay mouse-keys-delay mouse-keys-interval
        mouse-keys-time-to-max mouse-keys-max-speed mouse-keys-curve access-x-timeout
        access-x-timeout-mask access-x-timeout-values access-x-timeout-options-mask
        access-x-timeout-options-values per-key-repeat)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card8 %buf affect-internal-real-mods)
    (xcb:buffer-write-card8 %buf internal-real-mods)
    (xcb:buffer-write-card8 %buf affect-ignore-lock-real-mods)
    (xcb:buffer-write-card8 %buf ignore-lock-real-mods)
    (xcb:buffer-write-card16 %buf affect-internal-virtual-mods)
    (xcb:buffer-write-card16 %buf internal-virtual-mods)
    (xcb:buffer-write-card16 %buf affect-ignore-lock-virtual-mods)
    (xcb:buffer-write-card16 %buf ignore-lock-virtual-mods)
    (xcb:buffer-write-card8 %buf mouse-keys-dflt-btn)
    (xcb:buffer-write-card8 %buf groups-wrap)
    (xcb:buffer-write-card16 %buf access-x-options)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf affect-enabled-controls)
    (xcb:buffer-write-card32 %buf enabled-controls)
    (xcb:buffer-write-card32 %buf change-controls)
    (xcb:buffer-write-card16 %buf repeat-delay)
    (xcb:buffer-write-card16 %buf repeat-interval)
    (xcb:buffer-write-card16 %buf slow-keys-delay)
    (xcb:buffer-write-card16 %buf debounce-delay)
    (xcb:buffer-write-card16 %buf mouse-keys-delay)
    (xcb:buffer-write-card16 %buf mouse-keys-interval)
    (xcb:buffer-write-card16 %buf mouse-keys-time-to-max)
    (xcb:buffer-write-card16 %buf mouse-keys-max-speed)
    (xcb:buffer-write-card16 %buf mouse-keys-curve)
    (xcb:buffer-write-card16 %buf access-x-timeout)
    (xcb:buffer-write-card32 %buf access-x-timeout-mask)
    (xcb:buffer-write-card32 %buf access-x-timeout-values)
    (xcb:buffer-write-card16 %buf access-x-timeout-options-mask)
    (xcb:buffer-write-card16 %buf access-x-timeout-options-values)
    (xcb:buffer-write-fixed-list %buf per-key-repeat 32 #'xcb:buffer-write-card8 1)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-controls-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (affect-internal-real-mods :initarg :affect-internal-real-mods :type (unsigned-byte 8))
           (internal-real-mods :initarg :internal-real-mods :type (unsigned-byte 8))
           (affect-ignore-lock-real-mods :initarg :affect-ignore-lock-real-mods :type
            (unsigned-byte 8))
           (ignore-lock-real-mods :initarg :ignore-lock-real-mods :type (unsigned-byte 8))
           (affect-internal-virtual-mods :initarg :affect-internal-virtual-mods :type
            (unsigned-byte 16))
           (internal-virtual-mods :initarg :internal-virtual-mods :type (unsigned-byte 16))
           (affect-ignore-lock-virtual-mods :initarg :affect-ignore-lock-virtual-mods :type
            (unsigned-byte 16))
           (ignore-lock-virtual-mods :initarg :ignore-lock-virtual-mods :type (unsigned-byte 16))
           (mouse-keys-dflt-btn :initarg :mouse-keys-dflt-btn :type (unsigned-byte 8))
           (groups-wrap :initarg :groups-wrap :type (unsigned-byte 8))
           (access-x-options :initarg :access-x-options :type (unsigned-byte 16))
           (affect-enabled-controls :initarg :affect-enabled-controls :type (unsigned-byte 32))
           (enabled-controls :initarg :enabled-controls :type (unsigned-byte 32))
           (change-controls :initarg :change-controls :type (unsigned-byte 32))
           (repeat-delay :initarg :repeat-delay :type (unsigned-byte 16))
           (repeat-interval :initarg :repeat-interval :type (unsigned-byte 16))
           (slow-keys-delay :initarg :slow-keys-delay :type (unsigned-byte 16))
           (debounce-delay :initarg :debounce-delay :type (unsigned-byte 16))
           (mouse-keys-delay :initarg :mouse-keys-delay :type (unsigned-byte 16))
           (mouse-keys-interval :initarg :mouse-keys-interval :type (unsigned-byte 16))
           (mouse-keys-time-to-max :initarg :mouse-keys-time-to-max :type (unsigned-byte 16))
           (mouse-keys-max-speed :initarg :mouse-keys-max-speed :type (unsigned-byte 16))
           (mouse-keys-curve :initarg :mouse-keys-curve :type (signed-byte 16))
           (access-x-timeout :initarg :access-x-timeout :type (unsigned-byte 16))
           (access-x-timeout-mask :initarg :access-x-timeout-mask :type (unsigned-byte 32))
           (access-x-timeout-values :initarg :access-x-timeout-values :type (unsigned-byte 32))
           (access-x-timeout-options-mask :initarg :access-x-timeout-options-mask :type
            (unsigned-byte 16))
           (access-x-timeout-options-values :initarg :access-x-timeout-options-values :type
            (unsigned-byte 16))
           (per-key-repeat :initarg :per-key-repeat :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-controls-request))
  (set-controls conn (slot-value %obj 'device-spec) (slot-value %obj 'affect-internal-real-mods)
   (slot-value %obj 'internal-real-mods) (slot-value %obj 'affect-ignore-lock-real-mods)
   (slot-value %obj 'ignore-lock-real-mods) (slot-value %obj 'affect-internal-virtual-mods)
   (slot-value %obj 'internal-virtual-mods) (slot-value %obj 'affect-ignore-lock-virtual-mods)
   (slot-value %obj 'ignore-lock-virtual-mods) (slot-value %obj 'mouse-keys-dflt-btn)
   (slot-value %obj 'groups-wrap) (slot-value %obj 'access-x-options)
   (slot-value %obj 'affect-enabled-controls) (slot-value %obj 'enabled-controls)
   (slot-value %obj 'change-controls) (slot-value %obj 'repeat-delay)
   (slot-value %obj 'repeat-interval) (slot-value %obj 'slow-keys-delay)
   (slot-value %obj 'debounce-delay) (slot-value %obj 'mouse-keys-delay)
   (slot-value %obj 'mouse-keys-interval) (slot-value %obj 'mouse-keys-time-to-max)
   (slot-value %obj 'mouse-keys-max-speed) (slot-value %obj 'mouse-keys-curve)
   (slot-value %obj 'access-x-timeout) (slot-value %obj 'access-x-timeout-mask)
   (slot-value %obj 'access-x-timeout-values) (slot-value %obj 'access-x-timeout-options-mask)
   (slot-value %obj 'access-x-timeout-options-values) (slot-value %obj 'per-key-repeat)))

;;; Request xcb.xkb.GetMap
(defun get-map
       (conn device-spec full partial first-type n-types first-key-sym n-key-syms first-key-action
        n-key-actions first-key-behavior n-key-behaviors virtual-mods first-key-explicit
        n-key-explicit first-mod-map-key n-mod-map-keys first-v-mod-map-key n-v-mod-map-keys)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf full)
    (xcb:buffer-write-card16 %buf partial)
    (xcb:buffer-write-card8 %buf first-type)
    (xcb:buffer-write-card8 %buf n-types)
    (xcb:buffer-write-card8 %buf first-key-sym)
    (xcb:buffer-write-card8 %buf n-key-syms)
    (xcb:buffer-write-card8 %buf first-key-action)
    (xcb:buffer-write-card8 %buf n-key-actions)
    (xcb:buffer-write-card8 %buf first-key-behavior)
    (xcb:buffer-write-card8 %buf n-key-behaviors)
    (xcb:buffer-write-card16 %buf virtual-mods)
    (xcb:buffer-write-card8 %buf first-key-explicit)
    (xcb:buffer-write-card8 %buf n-key-explicit)
    (xcb:buffer-write-card8 %buf first-mod-map-key)
    (xcb:buffer-write-card8 %buf n-mod-map-keys)
    (xcb:buffer-write-card8 %buf first-v-mod-map-key)
    (xcb:buffer-write-card8 %buf n-v-mod-map-keys)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-map-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (full :initarg :full :type (unsigned-byte 16))
           (partial :initarg :partial :type (unsigned-byte 16))
           (first-type :initarg :first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :type (unsigned-byte 8))
           (first-key-sym :initarg :first-key-sym :type xcb:keycode)
           (n-key-syms :initarg :n-key-syms :type (unsigned-byte 8))
           (first-key-action :initarg :first-key-action :type xcb:keycode)
           (n-key-actions :initarg :n-key-actions :type (unsigned-byte 8))
           (first-key-behavior :initarg :first-key-behavior :type xcb:keycode)
           (n-key-behaviors :initarg :n-key-behaviors :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :type (unsigned-byte 16))
           (first-key-explicit :initarg :first-key-explicit :type xcb:keycode)
           (n-key-explicit :initarg :n-key-explicit :type (unsigned-byte 8))
           (first-mod-map-key :initarg :first-mod-map-key :type xcb:keycode)
           (n-mod-map-keys :initarg :n-mod-map-keys :type (unsigned-byte 8))
           (first-v-mod-map-key :initarg :first-v-mod-map-key :type xcb:keycode)
           (n-v-mod-map-keys :initarg :n-v-mod-map-keys :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj get-map-request))
  (get-map conn (slot-value %obj 'device-spec) (slot-value %obj 'full) (slot-value %obj 'partial)
   (slot-value %obj 'first-type) (slot-value %obj 'n-types) (slot-value %obj 'first-key-sym)
   (slot-value %obj 'n-key-syms) (slot-value %obj 'first-key-action)
   (slot-value %obj 'n-key-actions) (slot-value %obj 'first-key-behavior)
   (slot-value %obj 'n-key-behaviors) (slot-value %obj 'virtual-mods)
   (slot-value %obj 'first-key-explicit) (slot-value %obj 'n-key-explicit)
   (slot-value %obj 'first-mod-map-key) (slot-value %obj 'n-mod-map-keys)
   (slot-value %obj 'first-v-mod-map-key) (slot-value %obj 'n-v-mod-map-keys)))
(defclass get-map-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (min-key-code :initarg :min-key-code :accessor min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :accessor max-key-code :type xcb:keycode)
           (present :initarg :present :accessor present :type (unsigned-byte 16))
           (first-type :initarg :first-type :accessor first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :accessor n-types :type (unsigned-byte 8))
           (total-types :initarg :total-types :accessor total-types :type (unsigned-byte 8))
           (first-key-sym :initarg :first-key-sym :accessor first-key-sym :type xcb:keycode)
           (total-syms :initarg :total-syms :accessor total-syms :type (unsigned-byte 16))
           (n-key-syms :initarg :n-key-syms :accessor n-key-syms :type (unsigned-byte 8))
           (first-key-action :initarg :first-key-action :accessor first-key-action :type
            xcb:keycode)
           (total-actions :initarg :total-actions :accessor total-actions :type (unsigned-byte 16))
           (n-key-actions :initarg :n-key-actions :accessor n-key-actions :type (unsigned-byte 8))
           (first-key-behavior :initarg :first-key-behavior :accessor first-key-behavior :type
            xcb:keycode)
           (n-key-behaviors :initarg :n-key-behaviors :accessor n-key-behaviors :type
            (unsigned-byte 8))
           (total-key-behaviors :initarg :total-key-behaviors :accessor total-key-behaviors :type
            (unsigned-byte 8))
           (first-key-explicit :initarg :first-key-explicit :accessor first-key-explicit :type
            xcb:keycode)
           (n-key-explicit :initarg :n-key-explicit :accessor n-key-explicit :type
            (unsigned-byte 8))
           (total-key-explicit :initarg :total-key-explicit :accessor total-key-explicit :type
            (unsigned-byte 8))
           (first-mod-map-key :initarg :first-mod-map-key :accessor first-mod-map-key :type
            xcb:keycode)
           (n-mod-map-keys :initarg :n-mod-map-keys :accessor n-mod-map-keys :type
            (unsigned-byte 8))
           (total-mod-map-keys :initarg :total-mod-map-keys :accessor total-mod-map-keys :type
            (unsigned-byte 8))
           (first-v-mod-map-key :initarg :first-v-mod-map-key :accessor first-v-mod-map-key :type
            xcb:keycode)
           (n-v-mod-map-keys :initarg :n-v-mod-map-keys :accessor n-v-mod-map-keys :type
            (unsigned-byte 8))
           (total-v-mod-map-keys :initarg :total-v-mod-map-keys :accessor total-v-mod-map-keys
            :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :accessor virtual-mods :type (unsigned-byte 16))
           (types-rtrn :initarg :types-rtrn :accessor types-rtrn :type cl:sequence)
           (syms-rtrn :initarg :syms-rtrn :accessor syms-rtrn :type cl:sequence)
           (acts-rtrn-count :initarg :acts-rtrn-count :accessor acts-rtrn-count :type cl:sequence)
           (acts-rtrn-acts :initarg :acts-rtrn-acts :accessor acts-rtrn-acts :type cl:sequence)
           (behaviors-rtrn :initarg :behaviors-rtrn :accessor behaviors-rtrn :type cl:sequence)
           (vmods-rtrn :initarg :vmods-rtrn :accessor vmods-rtrn :type cl:sequence)
           (explicit-rtrn :initarg :explicit-rtrn :accessor explicit-rtrn :type cl:sequence)
           (modmap-rtrn :initarg :modmap-rtrn :accessor modmap-rtrn :type cl:sequence)
           (vmodmap-rtrn :initarg :vmodmap-rtrn :accessor vmodmap-rtrn :type cl:sequence)))
(defun decode-get-map-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        min-key-code
        max-key-code
        present
        first-type
        n-types
        total-types
        first-key-sym
        total-syms
        n-key-syms
        first-key-action
        total-actions
        n-key-actions
        first-key-behavior
        n-key-behaviors
        total-key-behaviors
        first-key-explicit
        n-key-explicit
        total-key-explicit
        first-mod-map-key
        n-mod-map-keys
        total-mod-map-keys
        first-v-mod-map-key
        n-v-mod-map-keys
        total-v-mod-map-keys
        virtual-mods
        types-rtrn
        syms-rtrn
        acts-rtrn-count
        acts-rtrn-acts
        behaviors-rtrn
        vmods-rtrn
        explicit-rtrn
        modmap-rtrn
        vmodmap-rtrn)
    (declare
     (ignorable %p response-type device-id sequence length min-key-code max-key-code present
      first-type n-types total-types first-key-sym total-syms n-key-syms first-key-action
      total-actions n-key-actions first-key-behavior n-key-behaviors total-key-behaviors
      first-key-explicit n-key-explicit total-key-explicit first-mod-map-key n-mod-map-keys
      total-mod-map-keys first-v-mod-map-key n-v-mod-map-keys total-v-mod-map-keys virtual-mods
      types-rtrn syms-rtrn acts-rtrn-count acts-rtrn-acts behaviors-rtrn vmods-rtrn explicit-rtrn
      modmap-rtrn vmodmap-rtrn))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf min-key-code (xcb:read-card8-at %buf (+ %p 10)))
    (setf max-key-code (xcb:read-card8-at %buf (+ %p 11)))
    (setf present (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf first-type (xcb:read-card8-at %buf (+ %p 14)))
    (setf n-types (xcb:read-card8-at %buf (+ %p 15)))
    (setf total-types (xcb:read-card8-at %buf (+ %p 16)))
    (setf first-key-sym (xcb:read-card8-at %buf (+ %p 17)))
    (setf total-syms (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf n-key-syms (xcb:read-card8-at %buf (+ %p 20)))
    (setf first-key-action (xcb:read-card8-at %buf (+ %p 21)))
    (setf total-actions (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf n-key-actions (xcb:read-card8-at %buf (+ %p 24)))
    (setf first-key-behavior (xcb:read-card8-at %buf (+ %p 25)))
    (setf n-key-behaviors (xcb:read-card8-at %buf (+ %p 26)))
    (setf total-key-behaviors (xcb:read-card8-at %buf (+ %p 27)))
    (setf first-key-explicit (xcb:read-card8-at %buf (+ %p 28)))
    (setf n-key-explicit (xcb:read-card8-at %buf (+ %p 29)))
    (setf total-key-explicit (xcb:read-card8-at %buf (+ %p 30)))
    (setf first-mod-map-key (xcb:read-card8-at %buf (+ %p 31)))
    (setf n-mod-map-keys (xcb:read-card8-at %buf (+ %p 32)))
    (setf total-mod-map-keys (xcb:read-card8-at %buf (+ %p 33)))
    (setf first-v-mod-map-key (xcb:read-card8-at %buf (+ %p 34)))
    (setf n-v-mod-map-keys (xcb:read-card8-at %buf (+ %p 35)))
    (setf total-v-mod-map-keys (xcb:read-card8-at %buf (+ %p 36)))
    (setf virtual-mods (xcb:read-card16-at %buf (+ %p 38) %order))
    (setf %p (+ %p 40))
    (let ((%mask present))
      (when (logtest %mask 1)
        (multiple-value-setq (types-rtrn %p)
          (xcb:read-struct-vector-at %buf %p (min n-types (- (+ %pos 32 (* 4 length)) %p)) %order
           #'decode-key-type)))
      (when (logtest %mask 2)
        (multiple-value-setq (syms-rtrn %p)
          (xcb:read-struct-vector-at %buf %p (min n-key-syms (- (+ %pos 32 (* 4 length)) %p))
           %order #'decode-key-sym-map)))
      (when (logtest %mask 16)
        (multiple-value-setq (acts-rtrn-count %p)
          (xcb:read-vector-at %buf %p (min n-key-actions (floor (- (+ %pos 32 (* 4 length)) %p) 1))
           %order :card8))
        (setf %p (xcb:align-position %p 4))
        (multiple-value-setq (acts-rtrn-acts %p)
          (xcb:read-struct-vector-at %buf %p
           (min total-actions (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order #'decode-action)))
      (when (logtest %mask 32)
        (multiple-value-setq (behaviors-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min total-key-behaviors (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
           #'decode-set-behavior)))
      (when (logtest %mask 64)
        (multiple-value-setq (vmods-rtrn %p)
          (xcb:read-vector-at %buf %p
           (min (logcount virtual-mods) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order :card8))
        (setf %p (xcb:align-position %p 4)))
      (when (logtest %mask 8)
        (multiple-value-setq (explicit-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min total-key-explicit (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
           #'decode-set-explicit))
        (setf %p (xcb:align-position %p 4)))
      (when (logtest %mask 4)
        (multiple-value-setq (modmap-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min total-mod-map-keys (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
           #'decode-key-mod-map))
        (setf %p (xcb:align-position %p 4)))
      (when (logtest %mask 128)
        (multiple-value-setq (vmodmap-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min total-v-mod-map-keys (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
           #'decode-key-v-mod-map))))
    (let ((%obj
           (make-instance 'get-map-reply :response-type response-type :device-id device-id
                          :sequence sequence :length length :min-key-code min-key-code
                          :max-key-code max-key-code :present present :first-type first-type
                          :n-types n-types :total-types total-types :first-key-sym first-key-sym
                          :total-syms total-syms :n-key-syms n-key-syms :first-key-action
                          first-key-action :total-actions total-actions :n-key-actions
                          n-key-actions :first-key-behavior first-key-behavior :n-key-behaviors
                          n-key-behaviors :total-key-behaviors total-key-behaviors
                          :first-key-explicit first-key-explicit :n-key-explicit n-key-explicit
                          :total-key-explicit total-key-explicit :first-mod-map-key
                          first-mod-map-key :n-mod-map-keys n-mod-map-keys :total-mod-map-keys
                          total-mod-map-keys :first-v-mod-map-key first-v-mod-map-key
                          :n-v-mod-map-keys n-v-mod-map-keys :total-v-mod-map-keys
                          total-v-mod-map-keys :virtual-mods virtual-mods)))
      (when types-rtrn (setf (slot-value %obj 'types-rtrn) types-rtrn))
      (when syms-rtrn (setf (slot-value %obj 'syms-rtrn) syms-rtrn))
      (when acts-rtrn-count (setf (slot-value %obj 'acts-rtrn-count) acts-rtrn-count))
      (when acts-rtrn-acts (setf (slot-value %obj 'acts-rtrn-acts) acts-rtrn-acts))
      (when behaviors-rtrn (setf (slot-value %obj 'behaviors-rtrn) behaviors-rtrn))
      (when vmods-rtrn (setf (slot-value %obj 'vmods-rtrn) vmods-rtrn))
      (when explicit-rtrn (setf (slot-value %obj 'explicit-rtrn) explicit-rtrn))
      (when modmap-rtrn (setf (slot-value %obj 'modmap-rtrn) modmap-rtrn))
      (when vmodmap-rtrn (setf (slot-value %obj 'vmodmap-rtrn) vmodmap-rtrn))
      (values %obj (+ %pos 32 (* 4 length))))))
(defun get-map-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-map-reply))

;;; Request xcb.xkb.SetMap
(defun set-map
       (conn device-spec present flags min-key-code max-key-code first-type n-types first-key-sym
        n-key-syms total-syms first-key-action n-key-actions total-actions first-key-behavior
        n-key-behaviors total-key-behaviors first-key-explicit n-key-explicit total-key-explicit
        first-mod-map-key n-mod-map-keys total-mod-map-keys first-v-mod-map-key n-v-mod-map-keys
        total-v-mod-map-keys virtual-mods
        &key types syms actions-count actions behaviors vmods explicit modmap vmodmap)
  (xcb:check-value-mask 'set-map present (1 :types types t) (2 :syms syms t)
   (16 :actions-count actions-count t) (16 :actions actions t) (32 :behaviors behaviors t)
   (64 :vmods vmods t) (8 :explicit explicit t) (4 :modmap modmap t) (128 :vmodmap vmodmap t))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf present)
    (xcb:buffer-write-card16 %buf flags)
    (xcb:buffer-write-card8 %buf min-key-code)
    (xcb:buffer-write-card8 %buf max-key-code)
    (xcb:buffer-write-card8 %buf first-type)
    (xcb:buffer-write-card8 %buf n-types)
    (xcb:buffer-write-card8 %buf first-key-sym)
    (xcb:buffer-write-card8 %buf n-key-syms)
    (xcb:buffer-write-card16 %buf total-syms)
    (xcb:buffer-write-card8 %buf first-key-action)
    (xcb:buffer-write-card8 %buf n-key-actions)
    (xcb:buffer-write-card16 %buf total-actions)
    (xcb:buffer-write-card8 %buf first-key-behavior)
    (xcb:buffer-write-card8 %buf n-key-behaviors)
    (xcb:buffer-write-card8 %buf total-key-behaviors)
    (xcb:buffer-write-card8 %buf first-key-explicit)
    (xcb:buffer-write-card8 %buf n-key-explicit)
    (xcb:buffer-write-card8 %buf total-key-explicit)
    (xcb:buffer-write-card8 %buf first-mod-map-key)
    (xcb:buffer-write-card8 %buf n-mod-map-keys)
    (xcb:buffer-write-card8 %buf total-mod-map-keys)
    (xcb:buffer-write-card8 %buf first-v-mod-map-key)
    (xcb:buffer-write-card8 %buf n-v-mod-map-keys)
    (xcb:buffer-write-card8 %buf total-v-mod-map-keys)
    (xcb:buffer-write-card16 %buf virtual-mods)
    (let ((%mask present))
      (when (logtest %mask 1) (xcb:buffer-write-list %buf types n-types #'encode-set-key-type))
      (when (logtest %mask 2) (xcb:buffer-write-list %buf syms n-key-syms #'encode-key-sym-map))
      (when (logtest %mask 16)
        (xcb:buffer-write-octets %buf actions-count :end n-key-actions)
        (xcb:buffer-pad-to-align %buf 4)
        (xcb:buffer-write-list %buf actions total-actions #'encode-action))
      (when (logtest %mask 32)
        (xcb:buffer-write-list %buf behaviors total-key-behaviors #'encode-set-behavior))
      (when (logtest %mask 64)
        (xcb:buffer-write-octets %buf vmods :end (logcount virtual-mods))
        (xcb:buffer-pad-to-align %buf 4))
      (when (logtest %mask 8)
        (xcb:buffer-write-list %buf explicit total-key-explicit #'encode-set-explicit))
      (when (logtest %mask 4)
        (xcb:buffer-write-list %buf modmap total-mod-map-keys #'encode-key-mod-map))
      (when (logtest %mask 128)
        (xcb:buffer-write-list %buf vmodmap total-v-mod-map-keys #'encode-key-v-mod-map)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-map-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (present :initarg :present :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 16))
           (min-key-code :initarg :min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :type xcb:keycode)
           (first-type :initarg :first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :type (unsigned-byte 8))
           (first-key-sym :initarg :first-key-sym :type xcb:keycode)
           (n-key-syms :initarg :n-key-syms :type (unsigned-byte 8))
           (total-syms :initarg :total-syms :type (unsigned-byte 16))
           (first-key-action :initarg :first-key-action :type xcb:keycode)
           (n-key-actions :initarg :n-key-actions :type (unsigned-byte 8))
           (total-actions :initarg :total-actions :type (unsigned-byte 16))
           (first-key-behavior :initarg :first-key-behavior :type xcb:keycode)
           (n-key-behaviors :initarg :n-key-behaviors :type (unsigned-byte 8))
           (total-key-behaviors :initarg :total-key-behaviors :type (unsigned-byte 8))
           (first-key-explicit :initarg :first-key-explicit :type xcb:keycode)
           (n-key-explicit :initarg :n-key-explicit :type (unsigned-byte 8))
           (total-key-explicit :initarg :total-key-explicit :type (unsigned-byte 8))
           (first-mod-map-key :initarg :first-mod-map-key :type xcb:keycode)
           (n-mod-map-keys :initarg :n-mod-map-keys :type (unsigned-byte 8))
           (total-mod-map-keys :initarg :total-mod-map-keys :type (unsigned-byte 8))
           (first-v-mod-map-key :initarg :first-v-mod-map-key :type xcb:keycode)
           (n-v-mod-map-keys :initarg :n-v-mod-map-keys :type (unsigned-byte 8))
           (total-v-mod-map-keys :initarg :total-v-mod-map-keys :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :type (unsigned-byte 16))
           (types :initarg :types :type cl:sequence) (syms :initarg :syms :type cl:sequence)
           (actions-count :initarg :actions-count :type cl:sequence)
           (actions :initarg :actions :type cl:sequence)
           (behaviors :initarg :behaviors :type cl:sequence)
           (vmods :initarg :vmods :type cl:sequence)
           (explicit :initarg :explicit :type cl:sequence)
           (modmap :initarg :modmap :type cl:sequence)
           (vmodmap :initarg :vmodmap :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-map-request))
  (apply #'set-map conn (slot-value %obj 'device-spec) (slot-value %obj 'present)
         (slot-value %obj 'flags) (slot-value %obj 'min-key-code) (slot-value %obj 'max-key-code)
         (slot-value %obj 'first-type) (slot-value %obj 'n-types) (slot-value %obj 'first-key-sym)
         (slot-value %obj 'n-key-syms) (slot-value %obj 'total-syms)
         (slot-value %obj 'first-key-action) (slot-value %obj 'n-key-actions)
         (slot-value %obj 'total-actions) (slot-value %obj 'first-key-behavior)
         (slot-value %obj 'n-key-behaviors) (slot-value %obj 'total-key-behaviors)
         (slot-value %obj 'first-key-explicit) (slot-value %obj 'n-key-explicit)
         (slot-value %obj 'total-key-explicit) (slot-value %obj 'first-mod-map-key)
         (slot-value %obj 'n-mod-map-keys) (slot-value %obj 'total-mod-map-keys)
         (slot-value %obj 'first-v-mod-map-key) (slot-value %obj 'n-v-mod-map-keys)
         (slot-value %obj 'total-v-mod-map-keys) (slot-value %obj 'virtual-mods)
         (nconc (when (slot-boundp %obj 'types) (list :types (slot-value %obj 'types)))
                (when (slot-boundp %obj 'syms) (list :syms (slot-value %obj 'syms)))
                (when (slot-boundp %obj 'actions-count)
                  (list :actions-count (slot-value %obj 'actions-count)))
                (when (slot-boundp %obj 'actions) (list :actions (slot-value %obj 'actions)))
                (when (slot-boundp %obj 'behaviors) (list :behaviors (slot-value %obj 'behaviors)))
                (when (slot-boundp %obj 'vmods) (list :vmods (slot-value %obj 'vmods)))
                (when (slot-boundp %obj 'explicit) (list :explicit (slot-value %obj 'explicit)))
                (when (slot-boundp %obj 'modmap) (list :modmap (slot-value %obj 'modmap)))
                (when (slot-boundp %obj 'vmodmap) (list :vmodmap (slot-value %obj 'vmodmap))))))

;;; Request xcb.xkb.GetCompatMap
(defun get-compat-map (conn device-spec groups get-all-si first-si n-si)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card8 %buf groups)
    (xcb:buffer-write-bool %buf get-all-si)
    (xcb:buffer-write-card16 %buf first-si)
    (xcb:buffer-write-card16 %buf n-si)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-compat-map-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (groups :initarg :groups :type (unsigned-byte 8))
           (get-all-si :initarg :get-all-si :type (or boolean (unsigned-byte 8)))
           (first-si :initarg :first-si :type (unsigned-byte 16))
           (n-si :initarg :n-si :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-compat-map-request))
  (get-compat-map conn (slot-value %obj 'device-spec) (slot-value %obj 'groups)
   (slot-value %obj 'get-all-si) (slot-value %obj 'first-si) (slot-value %obj 'n-si)))
(defclass get-compat-map-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (groups-rtrn :initarg :groups-rtrn :accessor groups-rtrn :type (unsigned-byte 8))
           (first-si-rtrn :initarg :first-si-rtrn :accessor first-si-rtrn :type (unsigned-byte 16))
           (n-si-rtrn :initarg :n-si-rtrn :accessor n-si-rtrn :type (unsigned-byte 16))
           (n-total-si :initarg :n-total-si :accessor n-total-si :type (unsigned-byte 16))
           (si-rtrn :initarg :si-rtrn :accessor si-rtrn :type cl:sequence)
           (group-rtrn :initarg :group-rtrn :accessor group-rtrn :type cl:sequence)))
(defun decode-get-compat-map-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        groups-rtrn
        first-si-rtrn
        n-si-rtrn
        n-total-si
        si-rtrn
        group-rtrn)
    (declare
     (ignorable %p response-type device-id sequence length groups-rtrn first-si-rtrn n-si-rtrn
      n-total-si si-rtrn group-rtrn))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf groups-rtrn (xcb:read-card8-at %buf (+ %p 8)))
    (setf first-si-rtrn (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf n-si-rtrn (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf n-total-si (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (si-rtrn %p)
      (xcb:read-struct-vector-at %buf %p (min n-si-rtrn (floor (- (+ %pos 32 (* 4 length)) %p) 16))
       %order #'decode-sym-interpret))
    (multiple-value-setq (group-rtrn %p)
      (xcb:read-struct-vector-at %buf %p
       (min (logcount groups-rtrn) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       #'decode-mod-def))
    (values
     (make-instance 'get-compat-map-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :groups-rtrn groups-rtrn :first-si-rtrn
                    first-si-rtrn :n-si-rtrn n-si-rtrn :n-total-si n-total-si :si-rtrn si-rtrn
                    :group-rtrn group-rtrn)
     (+ %pos 32 (* 4 length)))))
(defun get-compat-map-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-compat-map-reply))

;;; Request xcb.xkb.SetCompatMap
(defun set-compat-map
       (conn device-spec recompute-actions truncate-si groups first-si si group-maps)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB"))
         (%buf (xcb:conn-send-buffer conn))
         (n-si (cl:length si)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-bool %buf recompute-actions)
    (xcb:buffer-write-bool %buf truncate-si)
    (xcb:buffer-write-card8 %buf groups)
    (xcb:buffer-write-card16 %buf first-si)
    (xcb:buffer-write-card16 %buf n-si)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-list %buf si n-si #'encode-sym-interpret)
    (xcb:buffer-write-list %buf group-maps (logcount groups) #'encode-mod-def)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-compat-map-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (recompute-actions :initarg :recompute-actions :type (or boolean (unsigned-byte 8)))
           (truncate-si :initarg :truncate-si :type (or boolean (unsigned-byte 8)))
           (groups :initarg :groups :type (unsigned-byte 8))
           (first-si :initarg :first-si :type (unsigned-byte 16))
           (n-si :initarg :n-si :type (unsigned-byte 16)) (si :initarg :si :type cl:sequence)
           (group-maps :initarg :group-maps :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-compat-map-request))
  (set-compat-map conn (slot-value %obj 'device-spec) (slot-value %obj 'recompute-actions)
   (slot-value %obj 'truncate-si) (slot-value %obj 'groups) (slot-value %obj 'first-si)
   (slot-value %obj 'si) (slot-value %obj 'group-maps)))

;;; Request xcb.xkb.GetIndicatorState
(defun get-indicator-state (conn device-spec)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-indicator-state-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)))
(defmethod xcb:send-request (conn (%obj get-indicator-state-request))
  (get-indicator-state conn (slot-value %obj 'device-spec)))
(defclass get-indicator-state-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (state :initarg :state :accessor state :type (unsigned-byte 32))))
(defun decode-get-indicator-state-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence length state)
    (declare (ignorable %p response-type device-id sequence length state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf state (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-indicator-state-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :state state)
     (+ %pos 32 (* 4 length)))))
(defun get-indicator-state-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-indicator-state-reply))

;;; Request xcb.xkb.GetIndicatorMap
(defun get-indicator-map (conn device-spec which)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf which)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-indicator-map-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (which :initarg :which :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-indicator-map-request))
  (get-indicator-map conn (slot-value %obj 'device-spec) (slot-value %obj 'which)))
(defclass get-indicator-map-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (which :initarg :which :accessor which :type (unsigned-byte 32))
           (real-indicators :initarg :real-indicators :accessor real-indicators :type
            (unsigned-byte 32))
           (n-indicators :initarg :n-indicators :accessor n-indicators :type (unsigned-byte 8))
           (maps :initarg :maps :accessor maps :type cl:sequence)))
(defun decode-get-indicator-map-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type device-id sequence length which real-indicators n-indicators maps)
    (declare
     (ignorable %p response-type device-id sequence length which real-indicators n-indicators
      maps))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf which (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf real-indicators (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf n-indicators (xcb:read-card8-at %buf (+ %p 16)))
    (setf %p (+ %p 32))
    (multiple-value-setq (maps %p)
      (xcb:read-struct-vector-at %buf %p
       (min (logcount which) (floor (- (+ %pos 32 (* 4 length)) %p) 12)) %order
       #'decode-indicator-map))
    (values
     (make-instance 'get-indicator-map-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :which which :real-indicators real-indicators
                    :n-indicators n-indicators :maps maps)
     (+ %pos 32 (* 4 length)))))
(defun get-indicator-map-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-indicator-map-reply))

;;; Request xcb.xkb.SetIndicatorMap
(defun set-indicator-map (conn device-spec which maps)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf which)
    (xcb:buffer-write-list %buf maps (logcount which) #'encode-indicator-map)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-indicator-map-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (which :initarg :which :type (unsigned-byte 32))
           (maps :initarg :maps :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-indicator-map-request))
  (set-indicator-map conn (slot-value %obj 'device-spec) (slot-value %obj 'which)
   (slot-value %obj 'maps)))

;;; Request xcb.xkb.GetNamedIndicator
(defun get-named-indicator (conn device-spec led-class led-id indicator)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf led-class)
    (xcb:buffer-write-card16 %buf led-id)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf indicator)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-named-indicator-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (led-class :initarg :led-class :type led-class-spec)
           (led-id :initarg :led-id :type id-spec) (indicator :initarg :indicator :type xcb:atom)))
(defmethod xcb:send-request (conn (%obj get-named-indicator-request))
  (get-named-indicator conn (slot-value %obj 'device-spec) (slot-value %obj 'led-class)
   (slot-value %obj 'led-id) (slot-value %obj 'indicator)))
(defclass get-named-indicator-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (indicator :initarg :indicator :accessor indicator :type xcb:atom)
           (found :initarg :found :accessor found :type (or boolean (unsigned-byte 8)))
           (on :initarg :on :accessor on :type (or boolean (unsigned-byte 8)))
           (real-indicator :initarg :real-indicator :accessor real-indicator :type
            (or boolean (unsigned-byte 8)))
           (ndx :initarg :ndx :accessor ndx :type (unsigned-byte 8))
           (map-flags :initarg :map-flags :accessor map-flags :type (unsigned-byte 8))
           (map-which-groups :initarg :map-which-groups :accessor map-which-groups :type
            (unsigned-byte 8))
           (map-groups :initarg :map-groups :accessor map-groups :type (unsigned-byte 8))
           (map-which-mods :initarg :map-which-mods :accessor map-which-mods :type
            (unsigned-byte 8))
           (map-mods :initarg :map-mods :accessor map-mods :type (unsigned-byte 8))
           (map-real-mods :initarg :map-real-mods :accessor map-real-mods :type (unsigned-byte 8))
           (map-vmod :initarg :map-vmod :accessor map-vmod :type (unsigned-byte 16))
           (map-ctrls :initarg :map-ctrls :accessor map-ctrls :type (unsigned-byte 32))
           (supported :initarg :supported :accessor supported :type
            (or boolean (unsigned-byte 8)))))
(defun decode-get-named-indicator-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        indicator
        found
        on
        real-indicator
        ndx
        map-flags
        map-which-groups
        map-groups
        map-which-mods
        map-mods
        map-real-mods
        map-vmod
        map-ctrls
        supported)
    (declare
     (ignorable %p response-type device-id sequence length indicator found on real-indicator ndx
      map-flags map-which-groups map-groups map-which-mods map-mods map-real-mods map-vmod
      map-ctrls supported))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf indicator (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf found (xcb:read-card8-at %buf (+ %p 12)))
    (setf on (xcb:read-card8-at %buf (+ %p 13)))
    (setf real-indicator (xcb:read-card8-at %buf (+ %p 14)))
    (setf ndx (xcb:read-card8-at %buf (+ %p 15)))
    (setf map-flags (xcb:read-card8-at %buf (+ %p 16)))
    (setf map-which-groups (xcb:read-card8-at %buf (+ %p 17)))
    (setf map-groups (xcb:read-card8-at %buf (+ %p 18)))
    (setf map-which-mods (xcb:read-card8-at %buf (+ %p 19)))
    (setf map-mods (xcb:read-card8-at %buf (+ %p 20)))
    (setf map-real-mods (xcb:read-card8-at %buf (+ %p 21)))
    (setf map-vmod (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf map-ctrls (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf supported (xcb:read-card8-at %buf (+ %p 28)))
    (values
     (make-instance 'get-named-indicator-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :indicator indicator :found found :on on
                    :real-indicator real-indicator :ndx ndx :map-flags map-flags :map-which-groups
                    map-which-groups :map-groups map-groups :map-which-mods map-which-mods
                    :map-mods map-mods :map-real-mods map-real-mods :map-vmod map-vmod :map-ctrls
                    map-ctrls :supported supported)
     (+ %pos 32 (* 4 length)))))
(defun get-named-indicator-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-named-indicator-reply))

;;; Request xcb.xkb.SetNamedIndicator
(defun set-named-indicator
       (conn device-spec led-class led-id indicator set-state on set-map create-map map-flags
        map-which-groups map-groups map-which-mods map-real-mods map-vmods map-ctrls)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf led-class)
    (xcb:buffer-write-card16 %buf led-id)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf indicator)
    (xcb:buffer-write-bool %buf set-state)
    (xcb:buffer-write-bool %buf on)
    (xcb:buffer-write-bool %buf set-map)
    (xcb:buffer-write-bool %buf create-map)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card8 %buf map-flags)
    (xcb:buffer-write-card8 %buf map-which-groups)
    (xcb:buffer-write-card8 %buf map-groups)
    (xcb:buffer-write-card8 %buf map-which-mods)
    (xcb:buffer-write-card8 %buf map-real-mods)
    (xcb:buffer-write-card16 %buf map-vmods)
    (xcb:buffer-write-card32 %buf map-ctrls)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-named-indicator-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (led-class :initarg :led-class :type led-class-spec)
           (led-id :initarg :led-id :type id-spec) (indicator :initarg :indicator :type xcb:atom)
           (set-state :initarg :set-state :type (or boolean (unsigned-byte 8)))
           (on :initarg :on :type (or boolean (unsigned-byte 8)))
           (set-map :initarg :set-map :type (or boolean (unsigned-byte 8)))
           (create-map :initarg :create-map :type (or boolean (unsigned-byte 8)))
           (map-flags :initarg :map-flags :type (unsigned-byte 8))
           (map-which-groups :initarg :map-which-groups :type (unsigned-byte 8))
           (map-groups :initarg :map-groups :type (unsigned-byte 8))
           (map-which-mods :initarg :map-which-mods :type (unsigned-byte 8))
           (map-real-mods :initarg :map-real-mods :type (unsigned-byte 8))
           (map-vmods :initarg :map-vmods :type (unsigned-byte 16))
           (map-ctrls :initarg :map-ctrls :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj set-named-indicator-request))
  (set-named-indicator conn (slot-value %obj 'device-spec) (slot-value %obj 'led-class)
   (slot-value %obj 'led-id) (slot-value %obj 'indicator) (slot-value %obj 'set-state)
   (slot-value %obj 'on) (slot-value %obj 'set-map) (slot-value %obj 'create-map)
   (slot-value %obj 'map-flags) (slot-value %obj 'map-which-groups) (slot-value %obj 'map-groups)
   (slot-value %obj 'map-which-mods) (slot-value %obj 'map-real-mods) (slot-value %obj 'map-vmods)
   (slot-value %obj 'map-ctrls)))

;;; Request xcb.xkb.GetNames
(defun get-names (conn device-spec which)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf which)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-names-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (which :initarg :which :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-names-request))
  (get-names conn (slot-value %obj 'device-spec) (slot-value %obj 'which)))
(defclass get-names-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (which :initarg :which :accessor which :type (unsigned-byte 32))
           (min-key-code :initarg :min-key-code :accessor min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :accessor max-key-code :type xcb:keycode)
           (n-types :initarg :n-types :accessor n-types :type (unsigned-byte 8))
           (group-names :initarg :group-names :accessor group-names :type (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :accessor virtual-mods :type (unsigned-byte 16))
           (first-key :initarg :first-key :accessor first-key :type xcb:keycode)
           (n-keys :initarg :n-keys :accessor n-keys :type (unsigned-byte 8))
           (indicators :initarg :indicators :accessor indicators :type (unsigned-byte 32))
           (n-radio-groups :initarg :n-radio-groups :accessor n-radio-groups :type
            (unsigned-byte 8))
           (n-key-aliases :initarg :n-key-aliases :accessor n-key-aliases :type (unsigned-byte 8))
           (n-kt-levels :initarg :n-kt-levels :accessor n-kt-levels :type (unsigned-byte 16))
           (keycodes-name :initarg :keycodes-name :accessor keycodes-name :type xcb:atom)
           (geometry-name :initarg :geometry-name :accessor geometry-name :type xcb:atom)
           (symbols-name :initarg :symbols-name :accessor symbols-name :type xcb:atom)
           (phys-symbols-name :initarg :phys-symbols-name :accessor phys-symbols-name :type
            xcb:atom)
           (types-name :initarg :types-name :accessor types-name :type xcb:atom)
           (compat-name :initarg :compat-name :accessor compat-name :type xcb:atom)
           (type-names :initarg :type-names :accessor type-names :type cl:sequence)
           (n-levels-per-type :initarg :n-levels-per-type :accessor n-levels-per-type :type
            cl:sequence)
           (kt-level-names :initarg :kt-level-names :accessor kt-level-names :type cl:sequence)
           (indicator-names :initarg :indicator-names :accessor indicator-names :type cl:sequence)
           (virtual-mod-names :initarg :virtual-mod-names :accessor virtual-mod-names :type
            cl:sequence)
           (groups :initarg :groups :accessor groups :type cl:sequence)
           (key-names :initarg :key-names :accessor key-names :type cl:sequence)
           (key-aliases :initarg :key-aliases :accessor key-aliases :type cl:sequence)
           (radio-group-names :initarg :radio-group-names :accessor radio-group-names :type
            cl:sequence)))
(defun decode-get-names-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        which
        min-key-code
        max-key-code
        n-types
        group-names
        virtual-mods
        first-key
        n-keys
        indicators
        n-radio-groups
        n-key-aliases
        n-kt-levels
        keycodes-name
        geometry-name
        symbols-name
        phys-symbols-name
        types-name
        compat-name
        type-names
        n-levels-per-type
        kt-level-names
        indicator-names
        virtual-mod-names
        groups
        key-names
        key-aliases
        radio-group-names)
    (declare
     (ignorable %p response-type device-id sequence length which min-key-code max-key-code n-types
      group-names virtual-mods first-key n-keys indicators n-radio-groups n-key-aliases n-kt-levels
      keycodes-name geometry-name symbols-name phys-symbols-name types-name compat-name type-names
      n-levels-per-type kt-level-names indicator-names virtual-mod-names groups key-names
      key-aliases radio-group-names))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf which (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf min-key-code (xcb:read-card8-at %buf (+ %p 12)))
    (setf max-key-code (xcb:read-card8-at %buf (+ %p 13)))
    (setf n-types (xcb:read-card8-at %buf (+ %p 14)))
    (setf group-names (xcb:read-card8-at %buf (+ %p 15)))
    (setf virtual-mods (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf first-key (xcb:read-card8-at %buf (+ %p 18)))
    (setf n-keys (xcb:read-card8-at %buf (+ %p 19)))
    (setf indicators (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf n-radio-groups (xcb:read-card8-at %buf (+ %p 24)))
    (setf n-key-aliases (xcb:read-card8-at %buf (+ %p 25)))
    (setf n-kt-levels (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf %p (+ %p 32))
    (let ((%mask which))
      (when (logtest %mask 1)
        (setf keycodes-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 2)
        (setf geometry-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 4)
        (setf symbols-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 8)
        (setf phys-symbols-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 16)
        (setf types-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 32)
        (setf compat-name (xcb:read-card32-at %buf %p %order))
        (setf %p (+ %p 4)))
      (when (logtest %mask 64)
        (multiple-value-setq (type-names %p)
          (xcb:read-vector-at %buf %p (min n-types (floor (- (+ %pos 32 (* 4 length)) %p) 4))
           %order :card32)))
      (when (logtest %mask 128)
        (multiple-value-setq (n-levels-per-type %p)
          (xcb:read-vector-at %buf %p (min n-types (floor (- (+ %pos 32 (* 4 length)) %p) 1))
           %order :card8))
        (setf %p (xcb:align-position %p 4))
        (multiple-value-setq (kt-level-names %p)
          (xcb:read-vector-at %buf %p
           (min (xcb:sum-of #'identity n-levels-per-type)
                (floor (- (+ %pos 32 (* 4 length)) %p) 4))
           %order :card32)))
      (when (logtest %mask 256)
        (multiple-value-setq (indicator-names %p)
          (xcb:read-vector-at %buf %p
           (min (logcount indicators) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32)))
      (when (logtest %mask 2048)
        (multiple-value-setq (virtual-mod-names %p)
          (xcb:read-vector-at %buf %p
           (min (logcount virtual-mods) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
           :card32)))
      (when (logtest %mask 4096)
        (multiple-value-setq (groups %p)
          (xcb:read-vector-at %buf %p
           (min (logcount group-names) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32)))
      (when (logtest %mask 512)
        (multiple-value-setq (key-names %p)
          (xcb:read-struct-vector-at %buf %p (min n-keys (floor (- (+ %pos 32 (* 4 length)) %p) 4))
           %order #'decode-key-name)))
      (when (logtest %mask 1024)
        (multiple-value-setq (key-aliases %p)
          (xcb:read-struct-vector-at %buf %p
           (min n-key-aliases (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
           #'decode-key-alias)))
      (when (logtest %mask 8192)
        (multiple-value-setq (radio-group-names %p)
          (xcb:read-vector-at %buf %p
           (min n-radio-groups (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32))))
    (let ((%obj
           (make-instance 'get-names-reply :response-type response-type :device-id device-id
                          :sequence sequence :length length :which which :min-key-code min-key-code
                          :max-key-code max-key-code :n-types n-types :group-names group-names
                          :virtual-mods virtual-mods :first-key first-key :n-keys n-keys
                          :indicators indicators :n-radio-groups n-radio-groups :n-key-aliases
                          n-key-aliases :n-kt-levels n-kt-levels)))
      (when keycodes-name (setf (slot-value %obj 'keycodes-name) keycodes-name))
      (when geometry-name (setf (slot-value %obj 'geometry-name) geometry-name))
      (when symbols-name (setf (slot-value %obj 'symbols-name) symbols-name))
      (when phys-symbols-name (setf (slot-value %obj 'phys-symbols-name) phys-symbols-name))
      (when types-name (setf (slot-value %obj 'types-name) types-name))
      (when compat-name (setf (slot-value %obj 'compat-name) compat-name))
      (when type-names (setf (slot-value %obj 'type-names) type-names))
      (when n-levels-per-type (setf (slot-value %obj 'n-levels-per-type) n-levels-per-type))
      (when kt-level-names (setf (slot-value %obj 'kt-level-names) kt-level-names))
      (when indicator-names (setf (slot-value %obj 'indicator-names) indicator-names))
      (when virtual-mod-names (setf (slot-value %obj 'virtual-mod-names) virtual-mod-names))
      (when groups (setf (slot-value %obj 'groups) groups))
      (when key-names (setf (slot-value %obj 'key-names) key-names))
      (when key-aliases (setf (slot-value %obj 'key-aliases) key-aliases))
      (when radio-group-names (setf (slot-value %obj 'radio-group-names) radio-group-names))
      (values %obj (+ %pos 32 (* 4 length))))))
(defun get-names-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-names-reply))

;;; Request xcb.xkb.SetNames
(defun set-names
       (conn device-spec virtual-mods which first-type n-types first-kt-levelt n-kt-levels
        indicators group-names n-radio-groups first-key n-keys n-key-aliases total-kt-level-names
        &key keycodes-name geometry-name symbols-name phys-symbols-name types-name compat-name
        type-names n-levels-per-type kt-level-names indicator-names virtual-mod-names groups
        key-names key-aliases radio-group-names)
  (xcb:check-value-mask 'set-names which (1 :keycodes-name keycodes-name nil)
   (2 :geometry-name geometry-name nil) (4 :symbols-name symbols-name nil)
   (8 :phys-symbols-name phys-symbols-name nil) (16 :types-name types-name nil)
   (32 :compat-name compat-name nil) (64 :type-names type-names t)
   (128 :n-levels-per-type n-levels-per-type t) (128 :kt-level-names kt-level-names t)
   (256 :indicator-names indicator-names t) (2048 :virtual-mod-names virtual-mod-names t)
   (4096 :groups groups t) (512 :key-names key-names t) (1024 :key-aliases key-aliases t)
   (8192 :radio-group-names radio-group-names t))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf virtual-mods)
    (xcb:buffer-write-card32 %buf which)
    (xcb:buffer-write-card8 %buf first-type)
    (xcb:buffer-write-card8 %buf n-types)
    (xcb:buffer-write-card8 %buf first-kt-levelt)
    (xcb:buffer-write-card8 %buf n-kt-levels)
    (xcb:buffer-write-card32 %buf indicators)
    (xcb:buffer-write-card8 %buf group-names)
    (xcb:buffer-write-card8 %buf n-radio-groups)
    (xcb:buffer-write-card8 %buf first-key)
    (xcb:buffer-write-card8 %buf n-keys)
    (xcb:buffer-write-card8 %buf n-key-aliases)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf total-kt-level-names)
    (let ((%mask which))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf keycodes-name))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf geometry-name))
      (when (logtest %mask 4) (xcb:buffer-write-card32 %buf symbols-name))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf phys-symbols-name))
      (when (logtest %mask 16) (xcb:buffer-write-card32 %buf types-name))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf compat-name))
      (when (logtest %mask 64)
        (xcb:buffer-write-list %buf type-names n-types #'xcb:buffer-write-card32))
      (when (logtest %mask 128)
        (xcb:buffer-write-octets %buf n-levels-per-type :end n-types)
        (xcb:buffer-pad-to-align %buf 4)
        (xcb:buffer-write-list %buf kt-level-names (xcb:sum-of #'identity n-levels-per-type)
         #'xcb:buffer-write-card32))
      (when (logtest %mask 256)
        (xcb:buffer-write-list %buf indicator-names (logcount indicators)
         #'xcb:buffer-write-card32))
      (when (logtest %mask 2048)
        (xcb:buffer-write-list %buf virtual-mod-names (logcount virtual-mods)
         #'xcb:buffer-write-card32))
      (when (logtest %mask 4096)
        (xcb:buffer-write-list %buf groups (logcount group-names) #'xcb:buffer-write-card32))
      (when (logtest %mask 512) (xcb:buffer-write-list %buf key-names n-keys #'encode-key-name))
      (when (logtest %mask 1024)
        (xcb:buffer-write-list %buf key-aliases n-key-aliases #'encode-key-alias))
      (when (logtest %mask 8192)
        (xcb:buffer-write-list %buf radio-group-names n-radio-groups #'xcb:buffer-write-card32)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-names-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (virtual-mods :initarg :virtual-mods :type (unsigned-byte 16))
           (which :initarg :which :type (unsigned-byte 32))
           (first-type :initarg :first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :type (unsigned-byte 8))
           (first-kt-levelt :initarg :first-kt-levelt :type (unsigned-byte 8))
           (n-kt-levels :initarg :n-kt-levels :type (unsigned-byte 8))
           (indicators :initarg :indicators :type (unsigned-byte 32))
           (group-names :initarg :group-names :type (unsigned-byte 8))
           (n-radio-groups :initarg :n-radio-groups :type (unsigned-byte 8))
           (first-key :initarg :first-key :type xcb:keycode)
           (n-keys :initarg :n-keys :type (unsigned-byte 8))
           (n-key-aliases :initarg :n-key-aliases :type (unsigned-byte 8))
           (total-kt-level-names :initarg :total-kt-level-names :type (unsigned-byte 16))
           (keycodes-name :initarg :keycodes-name :type xcb:atom)
           (geometry-name :initarg :geometry-name :type xcb:atom)
           (symbols-name :initarg :symbols-name :type xcb:atom)
           (phys-symbols-name :initarg :phys-symbols-name :type xcb:atom)
           (types-name :initarg :types-name :type xcb:atom)
           (compat-name :initarg :compat-name :type xcb:atom)
           (type-names :initarg :type-names :type cl:sequence)
           (n-levels-per-type :initarg :n-levels-per-type :type cl:sequence)
           (kt-level-names :initarg :kt-level-names :type cl:sequence)
           (indicator-names :initarg :indicator-names :type cl:sequence)
           (virtual-mod-names :initarg :virtual-mod-names :type cl:sequence)
           (groups :initarg :groups :type cl:sequence)
           (key-names :initarg :key-names :type cl:sequence)
           (key-aliases :initarg :key-aliases :type cl:sequence)
           (radio-group-names :initarg :radio-group-names :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-names-request))
  (apply #'set-names conn (slot-value %obj 'device-spec) (slot-value %obj 'virtual-mods)
         (slot-value %obj 'which) (slot-value %obj 'first-type) (slot-value %obj 'n-types)
         (slot-value %obj 'first-kt-levelt) (slot-value %obj 'n-kt-levels)
         (slot-value %obj 'indicators) (slot-value %obj 'group-names)
         (slot-value %obj 'n-radio-groups) (slot-value %obj 'first-key) (slot-value %obj 'n-keys)
         (slot-value %obj 'n-key-aliases) (slot-value %obj 'total-kt-level-names)
         (nconc
          (when (slot-boundp %obj 'keycodes-name)
            (list :keycodes-name (slot-value %obj 'keycodes-name)))
          (when (slot-boundp %obj 'geometry-name)
            (list :geometry-name (slot-value %obj 'geometry-name)))
          (when (slot-boundp %obj 'symbols-name)
            (list :symbols-name (slot-value %obj 'symbols-name)))
          (when (slot-boundp %obj 'phys-symbols-name)
            (list :phys-symbols-name (slot-value %obj 'phys-symbols-name)))
          (when (slot-boundp %obj 'types-name) (list :types-name (slot-value %obj 'types-name)))
          (when (slot-boundp %obj 'compat-name) (list :compat-name (slot-value %obj 'compat-name)))
          (when (slot-boundp %obj 'type-names) (list :type-names (slot-value %obj 'type-names)))
          (when (slot-boundp %obj 'n-levels-per-type)
            (list :n-levels-per-type (slot-value %obj 'n-levels-per-type)))
          (when (slot-boundp %obj 'kt-level-names)
            (list :kt-level-names (slot-value %obj 'kt-level-names)))
          (when (slot-boundp %obj 'indicator-names)
            (list :indicator-names (slot-value %obj 'indicator-names)))
          (when (slot-boundp %obj 'virtual-mod-names)
            (list :virtual-mod-names (slot-value %obj 'virtual-mod-names)))
          (when (slot-boundp %obj 'groups) (list :groups (slot-value %obj 'groups)))
          (when (slot-boundp %obj 'key-names) (list :key-names (slot-value %obj 'key-names)))
          (when (slot-boundp %obj 'key-aliases) (list :key-aliases (slot-value %obj 'key-aliases)))
          (when (slot-boundp %obj 'radio-group-names)
            (list :radio-group-names (slot-value %obj 'radio-group-names))))))

;;; Request xcb.xkb.PerClientFlags
(defun per-client-flags
       (conn device-spec change value ctrls-to-change auto-ctrls auto-ctrls-values)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf change)
    (xcb:buffer-write-card32 %buf value)
    (xcb:buffer-write-card32 %buf ctrls-to-change)
    (xcb:buffer-write-card32 %buf auto-ctrls)
    (xcb:buffer-write-card32 %buf auto-ctrls-values)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass per-client-flags-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (change :initarg :change :type (unsigned-byte 32))
           (value :initarg :value :type (unsigned-byte 32))
           (ctrls-to-change :initarg :ctrls-to-change :type (unsigned-byte 32))
           (auto-ctrls :initarg :auto-ctrls :type (unsigned-byte 32))
           (auto-ctrls-values :initarg :auto-ctrls-values :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj per-client-flags-request))
  (per-client-flags conn (slot-value %obj 'device-spec) (slot-value %obj 'change)
   (slot-value %obj 'value) (slot-value %obj 'ctrls-to-change) (slot-value %obj 'auto-ctrls)
   (slot-value %obj 'auto-ctrls-values)))
(defclass per-client-flags-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (supported :initarg :supported :accessor supported :type (unsigned-byte 32))
           (value :initarg :value :accessor value :type (unsigned-byte 32))
           (auto-ctrls :initarg :auto-ctrls :accessor auto-ctrls :type (unsigned-byte 32))
           (auto-ctrls-values :initarg :auto-ctrls-values :accessor auto-ctrls-values :type
            (unsigned-byte 32))))
(defun decode-per-client-flags-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        supported
        value
        auto-ctrls
        auto-ctrls-values)
    (declare
     (ignorable %p response-type device-id sequence length supported value auto-ctrls
      auto-ctrls-values))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf supported (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf value (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf auto-ctrls (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf auto-ctrls-values (xcb:read-card32-at %buf (+ %p 20) %order))
    (values
     (make-instance 'per-client-flags-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :supported supported :value value :auto-ctrls
                    auto-ctrls :auto-ctrls-values auto-ctrls-values)
     (+ %pos 32 (* 4 length)))))
(defun per-client-flags-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-per-client-flags-reply))

;;; Request xcb.xkb.ListComponents
(defun list-components (conn device-spec max-names)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf max-names)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-components-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (max-names :initarg :max-names :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj list-components-request))
  (list-components conn (slot-value %obj 'device-spec) (slot-value %obj 'max-names)))
(defclass list-components-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (n-keymaps :initarg :n-keymaps :accessor n-keymaps :type (unsigned-byte 16))
           (n-keycodes :initarg :n-keycodes :accessor n-keycodes :type (unsigned-byte 16))
           (n-types :initarg :n-types :accessor n-types :type (unsigned-byte 16))
           (n-compat-maps :initarg :n-compat-maps :accessor n-compat-maps :type (unsigned-byte 16))
           (n-symbols :initarg :n-symbols :accessor n-symbols :type (unsigned-byte 16))
           (n-geometries :initarg :n-geometries :accessor n-geometries :type (unsigned-byte 16))
           (extra :initarg :extra :accessor extra :type (unsigned-byte 16))
           (keymaps :initarg :keymaps :accessor keymaps :type cl:sequence)
           (keycodes :initarg :keycodes :accessor keycodes :type cl:sequence)
           (types :initarg :types :accessor types :type cl:sequence)
           (compat-maps :initarg :compat-maps :accessor compat-maps :type cl:sequence)
           (symbols :initarg :symbols :accessor symbols :type cl:sequence)
           (geometries :initarg :geometries :accessor geometries :type cl:sequence)))
(defun decode-list-components-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        n-keymaps
        n-keycodes
        n-types
        n-compat-maps
        n-symbols
        n-geometries
        extra
        keymaps
        keycodes
        types
        compat-maps
        symbols
        geometries)
    (declare
     (ignorable %p response-type device-id sequence length n-keymaps n-keycodes n-types
      n-compat-maps n-symbols n-geometries extra keymaps keycodes types compat-maps symbols
      geometries))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf n-keymaps (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf n-keycodes (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf n-types (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf n-compat-maps (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf n-symbols (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf n-geometries (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf extra (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (keymaps %p)
      (xcb:read-struct-vector-at %buf %p (min n-keymaps (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (multiple-value-setq (keycodes %p)
      (xcb:read-struct-vector-at %buf %p (min n-keycodes (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (multiple-value-setq (types %p)
      (xcb:read-struct-vector-at %buf %p (min n-types (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (multiple-value-setq (compat-maps %p)
      (xcb:read-struct-vector-at %buf %p (min n-compat-maps (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (multiple-value-setq (symbols %p)
      (xcb:read-struct-vector-at %buf %p (min n-symbols (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (multiple-value-setq (geometries %p)
      (xcb:read-struct-vector-at %buf %p (min n-geometries (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-listing))
    (values
     (make-instance 'list-components-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :n-keymaps n-keymaps :n-keycodes n-keycodes
                    :n-types n-types :n-compat-maps n-compat-maps :n-symbols n-symbols
                    :n-geometries n-geometries :extra extra :keymaps keymaps :keycodes keycodes
                    :types types :compat-maps compat-maps :symbols symbols :geometries geometries)
     (+ %pos 32 (* 4 length)))))
(defun list-components-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-components-reply))

;;; Request xcb.xkb.GetKbdByName
(defun get-kbd-by-name (conn device-spec need want load)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf need)
    (xcb:buffer-write-card16 %buf want)
    (xcb:buffer-write-bool %buf load)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-kbd-by-name-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (need :initarg :need :type (unsigned-byte 16))
           (want :initarg :want :type (unsigned-byte 16))
           (load :initarg :load :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj get-kbd-by-name-request))
  (get-kbd-by-name conn (slot-value %obj 'device-spec) (slot-value %obj 'need)
   (slot-value %obj 'want) (slot-value %obj 'load)))
(defclass get-kbd-by-name-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (min-key-code :initarg :min-key-code :accessor min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :accessor max-key-code :type xcb:keycode)
           (loaded :initarg :loaded :accessor loaded :type (or boolean (unsigned-byte 8)))
           (new-keyboard :initarg :new-keyboard :accessor new-keyboard :type
            (or boolean (unsigned-byte 8)))
           (found :initarg :found :accessor found :type (unsigned-byte 16))
           (reported :initarg :reported :accessor reported :type (unsigned-byte 16))
           (types-getmap-type :initarg :types-getmap-type :accessor types-getmap-type :type
            (unsigned-byte 8))
           (types-type-device-id :initarg :types-type-device-id :accessor types-type-device-id
            :type (unsigned-byte 8))
           (types-getmap-sequence :initarg :types-getmap-sequence :accessor types-getmap-sequence
            :type (unsigned-byte 16))
           (types-getmap-length :initarg :types-getmap-length :accessor types-getmap-length :type
            (unsigned-byte 32))
           (types-type-min-key-code :initarg :types-type-min-key-code :accessor
            types-type-min-key-code :type xcb:keycode)
           (types-type-max-key-code :initarg :types-type-max-key-code :accessor
            types-type-max-key-code :type xcb:keycode)
           (types-present :initarg :types-present :accessor types-present :type (unsigned-byte 16))
           (types-first-type :initarg :types-first-type :accessor types-first-type :type
            (unsigned-byte 8))
           (types-n-types :initarg :types-n-types :accessor types-n-types :type (unsigned-byte 8))
           (types-total-types :initarg :types-total-types :accessor types-total-types :type
            (unsigned-byte 8))
           (types-first-key-sym :initarg :types-first-key-sym :accessor types-first-key-sym :type
            xcb:keycode)
           (types-total-syms :initarg :types-total-syms :accessor types-total-syms :type
            (unsigned-byte 16))
           (types-n-key-syms :initarg :types-n-key-syms :accessor types-n-key-syms :type
            (unsigned-byte 8))
           (types-first-key-action :initarg :types-first-key-action :accessor
            types-first-key-action :type xcb:keycode)
           (types-total-actions :initarg :types-total-actions :accessor types-total-actions :type
            (unsigned-byte 16))
           (types-n-key-actions :initarg :types-n-key-actions :accessor types-n-key-actions :type
            (unsigned-byte 8))
           (types-first-key-behavior :initarg :types-first-key-behavior :accessor
            types-first-key-behavior :type xcb:keycode)
           (types-n-key-behaviors :initarg :types-n-key-behaviors :accessor types-n-key-behaviors
            :type (unsigned-byte 8))
           (types-total-key-behaviors :initarg :types-total-key-behaviors :accessor
            types-total-key-behaviors :type (unsigned-byte 8))
           (types-first-key-explicit :initarg :types-first-key-explicit :accessor
            types-first-key-explicit :type xcb:keycode)
           (types-n-key-explicit :initarg :types-n-key-explicit :accessor types-n-key-explicit
            :type (unsigned-byte 8))
           (types-total-key-explicit :initarg :types-total-key-explicit :accessor
            types-total-key-explicit :type (unsigned-byte 8))
           (types-first-mod-map-key :initarg :types-first-mod-map-key :accessor
            types-first-mod-map-key :type xcb:keycode)
           (types-n-mod-map-keys :initarg :types-n-mod-map-keys :accessor types-n-mod-map-keys
            :type (unsigned-byte 8))
           (types-total-mod-map-keys :initarg :types-total-mod-map-keys :accessor
            types-total-mod-map-keys :type (unsigned-byte 8))
           (types-first-v-mod-map-key :initarg :types-first-v-mod-map-key :accessor
            types-first-v-mod-map-key :type xcb:keycode)
           (types-n-v-mod-map-keys :initarg :types-n-v-mod-map-keys :accessor
            types-n-v-mod-map-keys :type (unsigned-byte 8))
           (types-total-v-mod-map-keys :initarg :types-total-v-mod-map-keys :accessor
            types-total-v-mod-map-keys :type (unsigned-byte 8))
           (types-virtual-mods :initarg :types-virtual-mods :accessor types-virtual-mods :type
            (unsigned-byte 16))
           (types-map :initarg :types-map :accessor types-map)
           (types-types-rtrn :initarg :types-types-rtrn :accessor types-types-rtrn :type
            cl:sequence)
           (types-syms-rtrn :initarg :types-syms-rtrn :accessor types-syms-rtrn :type cl:sequence)
           (types-acts-rtrn-count :initarg :types-acts-rtrn-count :accessor types-acts-rtrn-count
            :type cl:sequence)
           (types-acts-rtrn-acts :initarg :types-acts-rtrn-acts :accessor types-acts-rtrn-acts
            :type cl:sequence)
           (types-behaviors-rtrn :initarg :types-behaviors-rtrn :accessor types-behaviors-rtrn
            :type cl:sequence)
           (types-vmods-rtrn :initarg :types-vmods-rtrn :accessor types-vmods-rtrn :type
            cl:sequence)
           (types-explicit-rtrn :initarg :types-explicit-rtrn :accessor types-explicit-rtrn :type
            cl:sequence)
           (types-modmap-rtrn :initarg :types-modmap-rtrn :accessor types-modmap-rtrn :type
            cl:sequence)
           (types-vmodmap-rtrn :initarg :types-vmodmap-rtrn :accessor types-vmodmap-rtrn :type
            cl:sequence)
           (compat-map-compatmap-type :initarg :compat-map-compatmap-type :accessor
            compat-map-compatmap-type :type (unsigned-byte 8))
           (compat-map-compat-device-id :initarg :compat-map-compat-device-id :accessor
            compat-map-compat-device-id :type (unsigned-byte 8))
           (compat-map-compatmap-sequence :initarg :compat-map-compatmap-sequence :accessor
            compat-map-compatmap-sequence :type (unsigned-byte 16))
           (compat-map-compatmap-length :initarg :compat-map-compatmap-length :accessor
            compat-map-compatmap-length :type (unsigned-byte 32))
           (compat-map-groups-rtrn :initarg :compat-map-groups-rtrn :accessor
            compat-map-groups-rtrn :type (unsigned-byte 8))
           (compat-map-first-si-rtrn :initarg :compat-map-first-si-rtrn :accessor
            compat-map-first-si-rtrn :type (unsigned-byte 16))
           (compat-map-n-si-rtrn :initarg :compat-map-n-si-rtrn :accessor compat-map-n-si-rtrn
            :type (unsigned-byte 16))
           (compat-map-n-total-si :initarg :compat-map-n-total-si :accessor compat-map-n-total-si
            :type (unsigned-byte 16))
           (compat-map-si-rtrn :initarg :compat-map-si-rtrn :accessor compat-map-si-rtrn :type
            cl:sequence)
           (compat-map-group-rtrn :initarg :compat-map-group-rtrn :accessor compat-map-group-rtrn
            :type cl:sequence)
           (indicator-maps-indicatormap-type :initarg :indicator-maps-indicatormap-type :accessor
            indicator-maps-indicatormap-type :type (unsigned-byte 8))
           (indicator-maps-indicator-device-id :initarg :indicator-maps-indicator-device-id
            :accessor indicator-maps-indicator-device-id :type (unsigned-byte 8))
           (indicator-maps-indicatormap-sequence :initarg :indicator-maps-indicatormap-sequence
            :accessor indicator-maps-indicatormap-sequence :type (unsigned-byte 16))
           (indicator-maps-indicatormap-length :initarg :indicator-maps-indicatormap-length
            :accessor indicator-maps-indicatormap-length :type (unsigned-byte 32))
           (indicator-maps-which :initarg :indicator-maps-which :accessor indicator-maps-which
            :type (unsigned-byte 32))
           (indicator-maps-real-indicators :initarg :indicator-maps-real-indicators :accessor
            indicator-maps-real-indicators :type (unsigned-byte 32))
           (indicator-maps-n-indicators :initarg :indicator-maps-n-indicators :accessor
            indicator-maps-n-indicators :type (unsigned-byte 8))
           (indicator-maps-maps :initarg :indicator-maps-maps :accessor indicator-maps-maps :type
            cl:sequence)
           (key-names-keyname-type :initarg :key-names-keyname-type :accessor
            key-names-keyname-type :type (unsigned-byte 8))
           (key-names-key-device-id :initarg :key-names-key-device-id :accessor
            key-names-key-device-id :type (unsigned-byte 8))
           (key-names-keyname-sequence :initarg :key-names-keyname-sequence :accessor
            key-names-keyname-sequence :type (unsigned-byte 16))
           (key-names-keyname-length :initarg :key-names-keyname-length :accessor
            key-names-keyname-length :type (unsigned-byte 32))
           (key-names-which :initarg :key-names-which :accessor key-names-which :type
            (unsigned-byte 32))
           (key-names-key-min-key-code :initarg :key-names-key-min-key-code :accessor
            key-names-key-min-key-code :type xcb:keycode)
           (key-names-key-max-key-code :initarg :key-names-key-max-key-code :accessor
            key-names-key-max-key-code :type xcb:keycode)
           (key-names-n-types :initarg :key-names-n-types :accessor key-names-n-types :type
            (unsigned-byte 8))
           (key-names-group-names :initarg :key-names-group-names :accessor key-names-group-names
            :type (unsigned-byte 8))
           (key-names-virtual-mods :initarg :key-names-virtual-mods :accessor
            key-names-virtual-mods :type (unsigned-byte 16))
           (key-names-first-key :initarg :key-names-first-key :accessor key-names-first-key :type
            xcb:keycode)
           (key-names-n-keys :initarg :key-names-n-keys :accessor key-names-n-keys :type
            (unsigned-byte 8))
           (key-names-indicators :initarg :key-names-indicators :accessor key-names-indicators
            :type (unsigned-byte 32))
           (key-names-n-radio-groups :initarg :key-names-n-radio-groups :accessor
            key-names-n-radio-groups :type (unsigned-byte 8))
           (key-names-n-key-aliases :initarg :key-names-n-key-aliases :accessor
            key-names-n-key-aliases :type (unsigned-byte 8))
           (key-names-n-kt-levels :initarg :key-names-n-kt-levels :accessor key-names-n-kt-levels
            :type (unsigned-byte 16))
           (key-names-value-list :initarg :key-names-value-list :accessor key-names-value-list)
           (key-names-keycodes-name :initarg :key-names-keycodes-name :accessor
            key-names-keycodes-name :type xcb:atom)
           (key-names-geometry-name :initarg :key-names-geometry-name :accessor
            key-names-geometry-name :type xcb:atom)
           (key-names-symbols-name :initarg :key-names-symbols-name :accessor
            key-names-symbols-name :type xcb:atom)
           (key-names-phys-symbols-name :initarg :key-names-phys-symbols-name :accessor
            key-names-phys-symbols-name :type xcb:atom)
           (key-names-types-name :initarg :key-names-types-name :accessor key-names-types-name
            :type xcb:atom)
           (key-names-compat-name :initarg :key-names-compat-name :accessor key-names-compat-name
            :type xcb:atom)
           (key-names-type-names :initarg :key-names-type-names :accessor key-names-type-names
            :type cl:sequence)
           (key-names-n-levels-per-type :initarg :key-names-n-levels-per-type :accessor
            key-names-n-levels-per-type :type cl:sequence)
           (key-names-kt-level-names :initarg :key-names-kt-level-names :accessor
            key-names-kt-level-names :type cl:sequence)
           (key-names-indicator-names :initarg :key-names-indicator-names :accessor
            key-names-indicator-names :type cl:sequence)
           (key-names-virtual-mod-names :initarg :key-names-virtual-mod-names :accessor
            key-names-virtual-mod-names :type cl:sequence)
           (key-names-groups :initarg :key-names-groups :accessor key-names-groups :type
            cl:sequence)
           (key-names-key-names :initarg :key-names-key-names :accessor key-names-key-names :type
            cl:sequence)
           (key-names-key-aliases :initarg :key-names-key-aliases :accessor key-names-key-aliases
            :type cl:sequence)
           (key-names-radio-group-names :initarg :key-names-radio-group-names :accessor
            key-names-radio-group-names :type cl:sequence)
           (geometry-geometry-type :initarg :geometry-geometry-type :accessor
            geometry-geometry-type :type (unsigned-byte 8))
           (geometry-geometry-device-id :initarg :geometry-geometry-device-id :accessor
            geometry-geometry-device-id :type (unsigned-byte 8))
           (geometry-geometry-sequence :initarg :geometry-geometry-sequence :accessor
            geometry-geometry-sequence :type (unsigned-byte 16))
           (geometry-geometry-length :initarg :geometry-geometry-length :accessor
            geometry-geometry-length :type (unsigned-byte 32))
           (geometry-name :initarg :geometry-name :accessor geometry-name :type xcb:atom)
           (geometry-geometry-found :initarg :geometry-geometry-found :accessor
            geometry-geometry-found :type (or boolean (unsigned-byte 8)))
           (geometry-width-mm :initarg :geometry-width-mm :accessor geometry-width-mm :type
            (unsigned-byte 16))
           (geometry-height-mm :initarg :geometry-height-mm :accessor geometry-height-mm :type
            (unsigned-byte 16))
           (geometry-n-properties :initarg :geometry-n-properties :accessor geometry-n-properties
            :type (unsigned-byte 16))
           (geometry-n-colors :initarg :geometry-n-colors :accessor geometry-n-colors :type
            (unsigned-byte 16))
           (geometry-n-shapes :initarg :geometry-n-shapes :accessor geometry-n-shapes :type
            (unsigned-byte 16))
           (geometry-n-sections :initarg :geometry-n-sections :accessor geometry-n-sections :type
            (unsigned-byte 16))
           (geometry-n-doodads :initarg :geometry-n-doodads :accessor geometry-n-doodads :type
            (unsigned-byte 16))
           (geometry-n-key-aliases :initarg :geometry-n-key-aliases :accessor
            geometry-n-key-aliases :type (unsigned-byte 16))
           (geometry-base-color-ndx :initarg :geometry-base-color-ndx :accessor
            geometry-base-color-ndx :type (unsigned-byte 8))
           (geometry-label-color-ndx :initarg :geometry-label-color-ndx :accessor
            geometry-label-color-ndx :type (unsigned-byte 8))
           (geometry-label-font :initarg :geometry-label-font :accessor geometry-label-font :type
            counted-string16)))
(defun decode-get-kbd-by-name-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        min-key-code
        max-key-code
        loaded
        new-keyboard
        found
        reported
        types-getmap-type
        types-type-device-id
        types-getmap-sequence
        types-getmap-length
        types-type-min-key-code
        types-type-max-key-code
        types-present
        types-first-type
        types-n-types
        types-total-types
        types-first-key-sym
        types-total-syms
        types-n-key-syms
        types-first-key-action
        types-total-actions
        types-n-key-actions
        types-first-key-behavior
        types-n-key-behaviors
        types-total-key-behaviors
        types-first-key-explicit
        types-n-key-explicit
        types-total-key-explicit
        types-first-mod-map-key
        types-n-mod-map-keys
        types-total-mod-map-keys
        types-first-v-mod-map-key
        types-n-v-mod-map-keys
        types-total-v-mod-map-keys
        types-virtual-mods
        types-types-rtrn
        types-syms-rtrn
        types-acts-rtrn-count
        types-acts-rtrn-acts
        types-behaviors-rtrn
        types-vmods-rtrn
        types-explicit-rtrn
        types-modmap-rtrn
        types-vmodmap-rtrn
        compat-map-compatmap-type
        compat-map-compat-device-id
        compat-map-compatmap-sequence
        compat-map-compatmap-length
        compat-map-groups-rtrn
        compat-map-first-si-rtrn
        compat-map-n-si-rtrn
        compat-map-n-total-si
        compat-map-si-rtrn
        compat-map-group-rtrn
        indicator-maps-indicatormap-type
        indicator-maps-indicator-device-id
        indicator-maps-indicatormap-sequence
        indicator-maps-indicatormap-length
        indicator-maps-which
        indicator-maps-real-indicators
        indicator-maps-n-indicators
        indicator-maps-maps
        key-names-keyname-type
        key-names-key-device-id
        key-names-keyname-sequence
        key-names-keyname-length
        key-names-which
        key-names-key-min-key-code
        key-names-key-max-key-code
        key-names-n-types
        key-names-group-names
        key-names-virtual-mods
        key-names-first-key
        key-names-n-keys
        key-names-indicators
        key-names-n-radio-groups
        key-names-n-key-aliases
        key-names-n-kt-levels
        key-names-keycodes-name
        key-names-geometry-name
        key-names-symbols-name
        key-names-phys-symbols-name
        key-names-types-name
        key-names-compat-name
        key-names-type-names
        key-names-n-levels-per-type
        key-names-kt-level-names
        key-names-indicator-names
        key-names-virtual-mod-names
        key-names-groups
        key-names-key-names
        key-names-key-aliases
        key-names-radio-group-names
        geometry-geometry-type
        geometry-geometry-device-id
        geometry-geometry-sequence
        geometry-geometry-length
        geometry-name
        geometry-geometry-found
        geometry-width-mm
        geometry-height-mm
        geometry-n-properties
        geometry-n-colors
        geometry-n-shapes
        geometry-n-sections
        geometry-n-doodads
        geometry-n-key-aliases
        geometry-base-color-ndx
        geometry-label-color-ndx
        geometry-label-font)
    (declare
     (ignorable %p response-type device-id sequence length min-key-code max-key-code loaded
      new-keyboard found reported types-getmap-type types-type-device-id types-getmap-sequence
      types-getmap-length types-type-min-key-code types-type-max-key-code types-present
      types-first-type types-n-types types-total-types types-first-key-sym types-total-syms
      types-n-key-syms types-first-key-action types-total-actions types-n-key-actions
      types-first-key-behavior types-n-key-behaviors types-total-key-behaviors
      types-first-key-explicit types-n-key-explicit types-total-key-explicit
      types-first-mod-map-key types-n-mod-map-keys types-total-mod-map-keys
      types-first-v-mod-map-key types-n-v-mod-map-keys types-total-v-mod-map-keys
      types-virtual-mods types-types-rtrn types-syms-rtrn types-acts-rtrn-count
      types-acts-rtrn-acts types-behaviors-rtrn types-vmods-rtrn types-explicit-rtrn
      types-modmap-rtrn types-vmodmap-rtrn compat-map-compatmap-type compat-map-compat-device-id
      compat-map-compatmap-sequence compat-map-compatmap-length compat-map-groups-rtrn
      compat-map-first-si-rtrn compat-map-n-si-rtrn compat-map-n-total-si compat-map-si-rtrn
      compat-map-group-rtrn indicator-maps-indicatormap-type indicator-maps-indicator-device-id
      indicator-maps-indicatormap-sequence indicator-maps-indicatormap-length indicator-maps-which
      indicator-maps-real-indicators indicator-maps-n-indicators indicator-maps-maps
      key-names-keyname-type key-names-key-device-id key-names-keyname-sequence
      key-names-keyname-length key-names-which key-names-key-min-key-code
      key-names-key-max-key-code key-names-n-types key-names-group-names key-names-virtual-mods
      key-names-first-key key-names-n-keys key-names-indicators key-names-n-radio-groups
      key-names-n-key-aliases key-names-n-kt-levels key-names-keycodes-name key-names-geometry-name
      key-names-symbols-name key-names-phys-symbols-name key-names-types-name key-names-compat-name
      key-names-type-names key-names-n-levels-per-type key-names-kt-level-names
      key-names-indicator-names key-names-virtual-mod-names key-names-groups key-names-key-names
      key-names-key-aliases key-names-radio-group-names geometry-geometry-type
      geometry-geometry-device-id geometry-geometry-sequence geometry-geometry-length geometry-name
      geometry-geometry-found geometry-width-mm geometry-height-mm geometry-n-properties
      geometry-n-colors geometry-n-shapes geometry-n-sections geometry-n-doodads
      geometry-n-key-aliases geometry-base-color-ndx geometry-label-color-ndx geometry-label-font))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf min-key-code (xcb:read-card8-at %buf (+ %p 8)))
    (setf max-key-code (xcb:read-card8-at %buf (+ %p 9)))
    (setf loaded (xcb:read-card8-at %buf (+ %p 10)))
    (setf new-keyboard (xcb:read-card8-at %buf (+ %p 11)))
    (setf found (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf reported (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf %p (+ %p 32))
    (let ((%mask reported))
      (when (logtest %mask 13)
        (setf types-getmap-type (xcb:read-card8-at %buf %p))
        (setf types-type-device-id (xcb:read-card8-at %buf (+ %p 1)))
        (setf types-getmap-sequence (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf types-getmap-length (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf types-type-min-key-code (xcb:read-card8-at %buf (+ %p 10)))
        (setf types-type-max-key-code (xcb:read-card8-at %buf (+ %p 11)))
        (setf types-present (xcb:read-card16-at %buf (+ %p 12) %order))
        (setf types-first-type (xcb:read-card8-at %buf (+ %p 14)))
        (setf types-n-types (xcb:read-card8-at %buf (+ %p 15)))
        (setf types-total-types (xcb:read-card8-at %buf (+ %p 16)))
        (setf types-first-key-sym (xcb:read-card8-at %buf (+ %p 17)))
        (setf types-total-syms (xcb:read-card16-at %buf (+ %p 18) %order))
        (setf types-n-key-syms (xcb:read-card8-at %buf (+ %p 20)))
        (setf types-first-key-action (xcb:read-card8-at %buf (+ %p 21)))
        (setf types-total-actions (xcb:read-card16-at %buf (+ %p 22) %order))
        (setf types-n-key-actions (xcb:read-card8-at %buf (+ %p 24)))
        (setf types-first-key-behavior (xcb:read-card8-at %buf (+ %p 25)))
        (setf types-n-key-behaviors (xcb:read-card8-at %buf (+ %p 26)))
        (setf types-total-key-behaviors (xcb:read-card8-at %buf (+ %p 27)))
        (setf types-first-key-explicit (xcb:read-card8-at %buf (+ %p 28)))
        (setf types-n-key-explicit (xcb:read-card8-at %buf (+ %p 29)))
        (setf types-total-key-explicit (xcb:read-card8-at %buf (+ %p 30)))
        (setf types-first-mod-map-key (xcb:read-card8-at %buf (+ %p 31)))
        (setf types-n-mod-map-keys (xcb:read-card8-at %buf (+ %p 32)))
        (setf types-total-mod-map-keys (xcb:read-card8-at %buf (+ %p 33)))
        (setf types-first-v-mod-map-key (xcb:read-card8-at %buf (+ %p 34)))
        (setf types-n-v-mod-map-keys (xcb:read-card8-at %buf (+ %p 35)))
        (setf types-total-v-mod-map-keys (xcb:read-card8-at %buf (+ %p 36)))
        (setf types-virtual-mods (xcb:read-card16-at %buf (+ %p 38) %order))
        (setf %p (+ %p 40))
        (let ((%mask2 types-present))
          (when (logtest %mask2 1)
            (multiple-value-setq (types-types-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-n-types (- (+ %pos 32 (* 4 length)) %p)) %order #'decode-key-type)))
          (when (logtest %mask2 2)
            (multiple-value-setq (types-syms-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-n-key-syms (- (+ %pos 32 (* 4 length)) %p)) %order
               #'decode-key-sym-map)))
          (when (logtest %mask2 16)
            (multiple-value-setq (types-acts-rtrn-count %p)
              (xcb:read-vector-at %buf %p
               (min types-n-key-actions (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order :card8))
            (setf %p (xcb:align-position %p 4))
            (multiple-value-setq (types-acts-rtrn-acts %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-total-actions (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
               #'decode-action)))
          (when (logtest %mask2 32)
            (multiple-value-setq (types-behaviors-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-total-key-behaviors (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
               #'decode-set-behavior)))
          (when (logtest %mask2 64)
            (multiple-value-setq (types-vmods-rtrn %p)
              (xcb:read-vector-at %buf %p
               (min (logcount types-virtual-mods) (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
               :card8))
            (setf %p (xcb:align-position %p 4)))
          (when (logtest %mask2 8)
            (multiple-value-setq (types-explicit-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-total-key-explicit (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
               #'decode-set-explicit))
            (setf %p (xcb:align-position %p 4)))
          (when (logtest %mask2 4)
            (multiple-value-setq (types-modmap-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-total-mod-map-keys (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
               #'decode-key-mod-map))
            (setf %p (xcb:align-position %p 4)))
          (when (logtest %mask2 128)
            (multiple-value-setq (types-vmodmap-rtrn %p)
              (xcb:read-struct-vector-at %buf %p
               (min types-total-v-mod-map-keys (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
               #'decode-key-v-mod-map)))))
      (when (logtest %mask 2)
        (setf compat-map-compatmap-type (xcb:read-card8-at %buf %p))
        (setf compat-map-compat-device-id (xcb:read-card8-at %buf (+ %p 1)))
        (setf compat-map-compatmap-sequence (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf compat-map-compatmap-length (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf compat-map-groups-rtrn (xcb:read-card8-at %buf (+ %p 8)))
        (setf compat-map-first-si-rtrn (xcb:read-card16-at %buf (+ %p 10) %order))
        (setf compat-map-n-si-rtrn (xcb:read-card16-at %buf (+ %p 12) %order))
        (setf compat-map-n-total-si (xcb:read-card16-at %buf (+ %p 14) %order))
        (setf %p (+ %p 32))
        (multiple-value-setq (compat-map-si-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min compat-map-n-si-rtrn (floor (- (+ %pos 32 (* 4 length)) %p) 16)) %order
           #'decode-sym-interpret))
        (multiple-value-setq (compat-map-group-rtrn %p)
          (xcb:read-struct-vector-at %buf %p
           (min (logcount compat-map-groups-rtrn) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
           #'decode-mod-def)))
      (when (logtest %mask 16)
        (setf indicator-maps-indicatormap-type (xcb:read-card8-at %buf %p))
        (setf indicator-maps-indicator-device-id (xcb:read-card8-at %buf (+ %p 1)))
        (setf indicator-maps-indicatormap-sequence (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf indicator-maps-indicatormap-length (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf indicator-maps-which (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf indicator-maps-real-indicators (xcb:read-card32-at %buf (+ %p 12) %order))
        (setf indicator-maps-n-indicators (xcb:read-card8-at %buf (+ %p 16)))
        (setf %p (+ %p 32))
        (multiple-value-setq (indicator-maps-maps %p)
          (xcb:read-struct-vector-at %buf %p
           (min indicator-maps-n-indicators (floor (- (+ %pos 32 (* 4 length)) %p) 12)) %order
           #'decode-indicator-map)))
      (when (logtest %mask 160)
        (setf key-names-keyname-type (xcb:read-card8-at %buf %p))
        (setf key-names-key-device-id (xcb:read-card8-at %buf (+ %p 1)))
        (setf key-names-keyname-sequence (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf key-names-keyname-length (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf key-names-which (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf key-names-key-min-key-code (xcb:read-card8-at %buf (+ %p 12)))
        (setf key-names-key-max-key-code (xcb:read-card8-at %buf (+ %p 13)))
        (setf key-names-n-types (xcb:read-card8-at %buf (+ %p 14)))
        (setf key-names-group-names (xcb:read-card8-at %buf (+ %p 15)))
        (setf key-names-virtual-mods (xcb:read-card16-at %buf (+ %p 16) %order))
        (setf key-names-first-key (xcb:read-card8-at %buf (+ %p 18)))
        (setf key-names-n-keys (xcb:read-card8-at %buf (+ %p 19)))
        (setf key-names-indicators (xcb:read-card32-at %buf (+ %p 20) %order))
        (setf key-names-n-radio-groups (xcb:read-card8-at %buf (+ %p 24)))
        (setf key-names-n-key-aliases (xcb:read-card8-at %buf (+ %p 25)))
        (setf key-names-n-kt-levels (xcb:read-card16-at %buf (+ %p 26) %order))
        (setf %p (+ %p 32))
        (let ((%mask2 key-names-which))
          (when (logtest %mask2 1)
            (setf key-names-keycodes-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 2)
            (setf key-names-geometry-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 4)
            (setf key-names-symbols-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 8)
            (setf key-names-phys-symbols-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 16)
            (setf key-names-types-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 32)
            (setf key-names-compat-name (xcb:read-card32-at %buf %p %order))
            (setf %p (+ %p 4)))
          (when (logtest %mask2 64)
            (multiple-value-setq (key-names-type-names %p)
              (xcb:read-vector-at %buf %p
               (min key-names-n-types (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order :card32)))
          (when (logtest %mask2 128)
            (multiple-value-setq (key-names-n-levels-per-type %p)
              (xcb:read-vector-at %buf %p
               (min key-names-n-types (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order :card8))
            (setf %p (xcb:align-position %p 4))
            (multiple-value-setq (key-names-kt-level-names %p)
              (xcb:read-vector-at %buf %p
               (min (xcb:sum-of #'identity key-names-n-levels-per-type)
                    (floor (- (+ %pos 32 (* 4 length)) %p) 4))
               %order :card32)))
          (when (logtest %mask2 256)
            (multiple-value-setq (key-names-indicator-names %p)
              (xcb:read-vector-at %buf %p
               (min (logcount key-names-indicators) (floor (- (+ %pos 32 (* 4 length)) %p) 4))
               %order :card32)))
          (when (logtest %mask2 2048)
            (multiple-value-setq (key-names-virtual-mod-names %p)
              (xcb:read-vector-at %buf %p
               (min (logcount key-names-virtual-mods) (floor (- (+ %pos 32 (* 4 length)) %p) 4))
               %order :card32)))
          (when (logtest %mask2 4096)
            (multiple-value-setq (key-names-groups %p)
              (xcb:read-vector-at %buf %p
               (min (logcount key-names-group-names) (floor (- (+ %pos 32 (* 4 length)) %p) 4))
               %order :card32)))
          (when (logtest %mask2 512)
            (multiple-value-setq (key-names-key-names %p)
              (xcb:read-struct-vector-at %buf %p
               (min key-names-n-keys (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
               #'decode-key-name)))
          (when (logtest %mask2 1024)
            (multiple-value-setq (key-names-key-aliases %p)
              (xcb:read-struct-vector-at %buf %p
               (min key-names-n-key-aliases (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order
               #'decode-key-alias)))
          (when (logtest %mask2 8192)
            (multiple-value-setq (key-names-radio-group-names %p)
              (xcb:read-vector-at %buf %p
               (min key-names-n-radio-groups (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
               :card32)))))
      (when (logtest %mask 64)
        (setf geometry-geometry-type (xcb:read-card8-at %buf %p))
        (setf geometry-geometry-device-id (xcb:read-card8-at %buf (+ %p 1)))
        (setf geometry-geometry-sequence (xcb:read-card16-at %buf (+ %p 2) %order))
        (setf geometry-geometry-length (xcb:read-card32-at %buf (+ %p 4) %order))
        (setf geometry-name (xcb:read-card32-at %buf (+ %p 8) %order))
        (setf geometry-geometry-found (xcb:read-card8-at %buf (+ %p 12)))
        (setf geometry-width-mm (xcb:read-card16-at %buf (+ %p 14) %order))
        (setf geometry-height-mm (xcb:read-card16-at %buf (+ %p 16) %order))
        (setf geometry-n-properties (xcb:read-card16-at %buf (+ %p 18) %order))
        (setf geometry-n-colors (xcb:read-card16-at %buf (+ %p 20) %order))
        (setf geometry-n-shapes (xcb:read-card16-at %buf (+ %p 22) %order))
        (setf geometry-n-sections (xcb:read-card16-at %buf (+ %p 24) %order))
        (setf geometry-n-doodads (xcb:read-card16-at %buf (+ %p 26) %order))
        (setf geometry-n-key-aliases (xcb:read-card16-at %buf (+ %p 28) %order))
        (setf geometry-base-color-ndx (xcb:read-card8-at %buf (+ %p 30)))
        (setf geometry-label-color-ndx (xcb:read-card8-at %buf (+ %p 31)))
        (setf %p (+ %p 32))
        (multiple-value-setq (geometry-label-font %p) (decode-counted-string16 %buf %p %order))))
    (let ((%obj
           (make-instance 'get-kbd-by-name-reply :response-type response-type :device-id device-id
                          :sequence sequence :length length :min-key-code min-key-code
                          :max-key-code max-key-code :loaded loaded :new-keyboard new-keyboard
                          :found found :reported reported)))
      (when types-getmap-type (setf (slot-value %obj 'types-getmap-type) types-getmap-type))
      (when types-type-device-id
        (setf (slot-value %obj 'types-type-device-id) types-type-device-id))
      (when types-getmap-sequence
        (setf (slot-value %obj 'types-getmap-sequence) types-getmap-sequence))
      (when types-getmap-length (setf (slot-value %obj 'types-getmap-length) types-getmap-length))
      (when types-type-min-key-code
        (setf (slot-value %obj 'types-type-min-key-code) types-type-min-key-code))
      (when types-type-max-key-code
        (setf (slot-value %obj 'types-type-max-key-code) types-type-max-key-code))
      (when types-present (setf (slot-value %obj 'types-present) types-present))
      (when types-first-type (setf (slot-value %obj 'types-first-type) types-first-type))
      (when types-n-types (setf (slot-value %obj 'types-n-types) types-n-types))
      (when types-total-types (setf (slot-value %obj 'types-total-types) types-total-types))
      (when types-first-key-sym (setf (slot-value %obj 'types-first-key-sym) types-first-key-sym))
      (when types-total-syms (setf (slot-value %obj 'types-total-syms) types-total-syms))
      (when types-n-key-syms (setf (slot-value %obj 'types-n-key-syms) types-n-key-syms))
      (when types-first-key-action
        (setf (slot-value %obj 'types-first-key-action) types-first-key-action))
      (when types-total-actions (setf (slot-value %obj 'types-total-actions) types-total-actions))
      (when types-n-key-actions (setf (slot-value %obj 'types-n-key-actions) types-n-key-actions))
      (when types-first-key-behavior
        (setf (slot-value %obj 'types-first-key-behavior) types-first-key-behavior))
      (when types-n-key-behaviors
        (setf (slot-value %obj 'types-n-key-behaviors) types-n-key-behaviors))
      (when types-total-key-behaviors
        (setf (slot-value %obj 'types-total-key-behaviors) types-total-key-behaviors))
      (when types-first-key-explicit
        (setf (slot-value %obj 'types-first-key-explicit) types-first-key-explicit))
      (when types-n-key-explicit
        (setf (slot-value %obj 'types-n-key-explicit) types-n-key-explicit))
      (when types-total-key-explicit
        (setf (slot-value %obj 'types-total-key-explicit) types-total-key-explicit))
      (when types-first-mod-map-key
        (setf (slot-value %obj 'types-first-mod-map-key) types-first-mod-map-key))
      (when types-n-mod-map-keys
        (setf (slot-value %obj 'types-n-mod-map-keys) types-n-mod-map-keys))
      (when types-total-mod-map-keys
        (setf (slot-value %obj 'types-total-mod-map-keys) types-total-mod-map-keys))
      (when types-first-v-mod-map-key
        (setf (slot-value %obj 'types-first-v-mod-map-key) types-first-v-mod-map-key))
      (when types-n-v-mod-map-keys
        (setf (slot-value %obj 'types-n-v-mod-map-keys) types-n-v-mod-map-keys))
      (when types-total-v-mod-map-keys
        (setf (slot-value %obj 'types-total-v-mod-map-keys) types-total-v-mod-map-keys))
      (when types-virtual-mods (setf (slot-value %obj 'types-virtual-mods) types-virtual-mods))
      (when types-types-rtrn (setf (slot-value %obj 'types-types-rtrn) types-types-rtrn))
      (when types-syms-rtrn (setf (slot-value %obj 'types-syms-rtrn) types-syms-rtrn))
      (when types-acts-rtrn-count
        (setf (slot-value %obj 'types-acts-rtrn-count) types-acts-rtrn-count))
      (when types-acts-rtrn-acts
        (setf (slot-value %obj 'types-acts-rtrn-acts) types-acts-rtrn-acts))
      (when types-behaviors-rtrn
        (setf (slot-value %obj 'types-behaviors-rtrn) types-behaviors-rtrn))
      (when types-vmods-rtrn (setf (slot-value %obj 'types-vmods-rtrn) types-vmods-rtrn))
      (when types-explicit-rtrn (setf (slot-value %obj 'types-explicit-rtrn) types-explicit-rtrn))
      (when types-modmap-rtrn (setf (slot-value %obj 'types-modmap-rtrn) types-modmap-rtrn))
      (when types-vmodmap-rtrn (setf (slot-value %obj 'types-vmodmap-rtrn) types-vmodmap-rtrn))
      (when compat-map-compatmap-type
        (setf (slot-value %obj 'compat-map-compatmap-type) compat-map-compatmap-type))
      (when compat-map-compat-device-id
        (setf (slot-value %obj 'compat-map-compat-device-id) compat-map-compat-device-id))
      (when compat-map-compatmap-sequence
        (setf (slot-value %obj 'compat-map-compatmap-sequence) compat-map-compatmap-sequence))
      (when compat-map-compatmap-length
        (setf (slot-value %obj 'compat-map-compatmap-length) compat-map-compatmap-length))
      (when compat-map-groups-rtrn
        (setf (slot-value %obj 'compat-map-groups-rtrn) compat-map-groups-rtrn))
      (when compat-map-first-si-rtrn
        (setf (slot-value %obj 'compat-map-first-si-rtrn) compat-map-first-si-rtrn))
      (when compat-map-n-si-rtrn
        (setf (slot-value %obj 'compat-map-n-si-rtrn) compat-map-n-si-rtrn))
      (when compat-map-n-total-si
        (setf (slot-value %obj 'compat-map-n-total-si) compat-map-n-total-si))
      (when compat-map-si-rtrn (setf (slot-value %obj 'compat-map-si-rtrn) compat-map-si-rtrn))
      (when compat-map-group-rtrn
        (setf (slot-value %obj 'compat-map-group-rtrn) compat-map-group-rtrn))
      (when indicator-maps-indicatormap-type
        (setf (slot-value %obj 'indicator-maps-indicatormap-type)
                indicator-maps-indicatormap-type))
      (when indicator-maps-indicator-device-id
        (setf (slot-value %obj 'indicator-maps-indicator-device-id)
                indicator-maps-indicator-device-id))
      (when indicator-maps-indicatormap-sequence
        (setf (slot-value %obj 'indicator-maps-indicatormap-sequence)
                indicator-maps-indicatormap-sequence))
      (when indicator-maps-indicatormap-length
        (setf (slot-value %obj 'indicator-maps-indicatormap-length)
                indicator-maps-indicatormap-length))
      (when indicator-maps-which
        (setf (slot-value %obj 'indicator-maps-which) indicator-maps-which))
      (when indicator-maps-real-indicators
        (setf (slot-value %obj 'indicator-maps-real-indicators) indicator-maps-real-indicators))
      (when indicator-maps-n-indicators
        (setf (slot-value %obj 'indicator-maps-n-indicators) indicator-maps-n-indicators))
      (when indicator-maps-maps (setf (slot-value %obj 'indicator-maps-maps) indicator-maps-maps))
      (when key-names-keyname-type
        (setf (slot-value %obj 'key-names-keyname-type) key-names-keyname-type))
      (when key-names-key-device-id
        (setf (slot-value %obj 'key-names-key-device-id) key-names-key-device-id))
      (when key-names-keyname-sequence
        (setf (slot-value %obj 'key-names-keyname-sequence) key-names-keyname-sequence))
      (when key-names-keyname-length
        (setf (slot-value %obj 'key-names-keyname-length) key-names-keyname-length))
      (when key-names-which (setf (slot-value %obj 'key-names-which) key-names-which))
      (when key-names-key-min-key-code
        (setf (slot-value %obj 'key-names-key-min-key-code) key-names-key-min-key-code))
      (when key-names-key-max-key-code
        (setf (slot-value %obj 'key-names-key-max-key-code) key-names-key-max-key-code))
      (when key-names-n-types (setf (slot-value %obj 'key-names-n-types) key-names-n-types))
      (when key-names-group-names
        (setf (slot-value %obj 'key-names-group-names) key-names-group-names))
      (when key-names-virtual-mods
        (setf (slot-value %obj 'key-names-virtual-mods) key-names-virtual-mods))
      (when key-names-first-key (setf (slot-value %obj 'key-names-first-key) key-names-first-key))
      (when key-names-n-keys (setf (slot-value %obj 'key-names-n-keys) key-names-n-keys))
      (when key-names-indicators
        (setf (slot-value %obj 'key-names-indicators) key-names-indicators))
      (when key-names-n-radio-groups
        (setf (slot-value %obj 'key-names-n-radio-groups) key-names-n-radio-groups))
      (when key-names-n-key-aliases
        (setf (slot-value %obj 'key-names-n-key-aliases) key-names-n-key-aliases))
      (when key-names-n-kt-levels
        (setf (slot-value %obj 'key-names-n-kt-levels) key-names-n-kt-levels))
      (when key-names-keycodes-name
        (setf (slot-value %obj 'key-names-keycodes-name) key-names-keycodes-name))
      (when key-names-geometry-name
        (setf (slot-value %obj 'key-names-geometry-name) key-names-geometry-name))
      (when key-names-symbols-name
        (setf (slot-value %obj 'key-names-symbols-name) key-names-symbols-name))
      (when key-names-phys-symbols-name
        (setf (slot-value %obj 'key-names-phys-symbols-name) key-names-phys-symbols-name))
      (when key-names-types-name
        (setf (slot-value %obj 'key-names-types-name) key-names-types-name))
      (when key-names-compat-name
        (setf (slot-value %obj 'key-names-compat-name) key-names-compat-name))
      (when key-names-type-names
        (setf (slot-value %obj 'key-names-type-names) key-names-type-names))
      (when key-names-n-levels-per-type
        (setf (slot-value %obj 'key-names-n-levels-per-type) key-names-n-levels-per-type))
      (when key-names-kt-level-names
        (setf (slot-value %obj 'key-names-kt-level-names) key-names-kt-level-names))
      (when key-names-indicator-names
        (setf (slot-value %obj 'key-names-indicator-names) key-names-indicator-names))
      (when key-names-virtual-mod-names
        (setf (slot-value %obj 'key-names-virtual-mod-names) key-names-virtual-mod-names))
      (when key-names-groups (setf (slot-value %obj 'key-names-groups) key-names-groups))
      (when key-names-key-names (setf (slot-value %obj 'key-names-key-names) key-names-key-names))
      (when key-names-key-aliases
        (setf (slot-value %obj 'key-names-key-aliases) key-names-key-aliases))
      (when key-names-radio-group-names
        (setf (slot-value %obj 'key-names-radio-group-names) key-names-radio-group-names))
      (when geometry-geometry-type
        (setf (slot-value %obj 'geometry-geometry-type) geometry-geometry-type))
      (when geometry-geometry-device-id
        (setf (slot-value %obj 'geometry-geometry-device-id) geometry-geometry-device-id))
      (when geometry-geometry-sequence
        (setf (slot-value %obj 'geometry-geometry-sequence) geometry-geometry-sequence))
      (when geometry-geometry-length
        (setf (slot-value %obj 'geometry-geometry-length) geometry-geometry-length))
      (when geometry-name (setf (slot-value %obj 'geometry-name) geometry-name))
      (when geometry-geometry-found
        (setf (slot-value %obj 'geometry-geometry-found) geometry-geometry-found))
      (when geometry-width-mm (setf (slot-value %obj 'geometry-width-mm) geometry-width-mm))
      (when geometry-height-mm (setf (slot-value %obj 'geometry-height-mm) geometry-height-mm))
      (when geometry-n-properties
        (setf (slot-value %obj 'geometry-n-properties) geometry-n-properties))
      (when geometry-n-colors (setf (slot-value %obj 'geometry-n-colors) geometry-n-colors))
      (when geometry-n-shapes (setf (slot-value %obj 'geometry-n-shapes) geometry-n-shapes))
      (when geometry-n-sections (setf (slot-value %obj 'geometry-n-sections) geometry-n-sections))
      (when geometry-n-doodads (setf (slot-value %obj 'geometry-n-doodads) geometry-n-doodads))
      (when geometry-n-key-aliases
        (setf (slot-value %obj 'geometry-n-key-aliases) geometry-n-key-aliases))
      (when geometry-base-color-ndx
        (setf (slot-value %obj 'geometry-base-color-ndx) geometry-base-color-ndx))
      (when geometry-label-color-ndx
        (setf (slot-value %obj 'geometry-label-color-ndx) geometry-label-color-ndx))
      (when geometry-label-font (setf (slot-value %obj 'geometry-label-font) geometry-label-font))
      (values %obj (+ %pos 32 (* 4 length))))))
(defun get-kbd-by-name-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-kbd-by-name-reply))

;;; Request xcb.xkb.GetDeviceInfo
(defun get-device-info
       (conn device-spec wanted all-buttons first-button n-buttons led-class led-id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card16 %buf wanted)
    (xcb:buffer-write-bool %buf all-buttons)
    (xcb:buffer-write-card8 %buf first-button)
    (xcb:buffer-write-card8 %buf n-buttons)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf led-class)
    (xcb:buffer-write-card16 %buf led-id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-device-info-request (xcb:request-with-reply)
          ((device-spec :initarg :device-spec :type device-spec)
           (wanted :initarg :wanted :type (unsigned-byte 16))
           (all-buttons :initarg :all-buttons :type (or boolean (unsigned-byte 8)))
           (first-button :initarg :first-button :type (unsigned-byte 8))
           (n-buttons :initarg :n-buttons :type (unsigned-byte 8))
           (led-class :initarg :led-class :type led-class-spec)
           (led-id :initarg :led-id :type id-spec)))
(defmethod xcb:send-request (conn (%obj get-device-info-request))
  (get-device-info conn (slot-value %obj 'device-spec) (slot-value %obj 'wanted)
   (slot-value %obj 'all-buttons) (slot-value %obj 'first-button) (slot-value %obj 'n-buttons)
   (slot-value %obj 'led-class) (slot-value %obj 'led-id)))
(defclass get-device-info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (present :initarg :present :accessor present :type (unsigned-byte 16))
           (supported :initarg :supported :accessor supported :type (unsigned-byte 16))
           (unsupported :initarg :unsupported :accessor unsupported :type (unsigned-byte 16))
           (n-device-led-f-bs :initarg :n-device-led-f-bs :accessor n-device-led-f-bs :type
            (unsigned-byte 16))
           (first-btn-wanted :initarg :first-btn-wanted :accessor first-btn-wanted :type
            (unsigned-byte 8))
           (n-btns-wanted :initarg :n-btns-wanted :accessor n-btns-wanted :type (unsigned-byte 8))
           (first-btn-rtrn :initarg :first-btn-rtrn :accessor first-btn-rtrn :type
            (unsigned-byte 8))
           (n-btns-rtrn :initarg :n-btns-rtrn :accessor n-btns-rtrn :type (unsigned-byte 8))
           (total-btns :initarg :total-btns :accessor total-btns :type (unsigned-byte 8))
           (has-own-state :initarg :has-own-state :accessor has-own-state :type
            (or boolean (unsigned-byte 8)))
           (dflt-kbd-fb :initarg :dflt-kbd-fb :accessor dflt-kbd-fb :type (unsigned-byte 16))
           (dflt-led-fb :initarg :dflt-led-fb :accessor dflt-led-fb :type (unsigned-byte 16))
           (dev-type :initarg :dev-type :accessor dev-type :type xcb:atom)
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (name :initarg :name :accessor name :type cl:sequence)
           (btn-actions :initarg :btn-actions :accessor btn-actions :type cl:sequence)
           (leds :initarg :leds :accessor leds :type cl:sequence)))
(defun decode-get-device-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        device-id
        sequence
        length
        present
        supported
        unsupported
        n-device-led-f-bs
        first-btn-wanted
        n-btns-wanted
        first-btn-rtrn
        n-btns-rtrn
        total-btns
        has-own-state
        dflt-kbd-fb
        dflt-led-fb
        dev-type
        name-len
        name
        btn-actions
        leds)
    (declare
     (ignorable %p response-type device-id sequence length present supported unsupported
      n-device-led-f-bs first-btn-wanted n-btns-wanted first-btn-rtrn n-btns-rtrn total-btns
      has-own-state dflt-kbd-fb dflt-led-fb dev-type name-len name btn-actions leds))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf device-id (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf present (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf supported (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf unsupported (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf n-device-led-f-bs (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf first-btn-wanted (xcb:read-card8-at %buf (+ %p 16)))
    (setf n-btns-wanted (xcb:read-card8-at %buf (+ %p 17)))
    (setf first-btn-rtrn (xcb:read-card8-at %buf (+ %p 18)))
    (setf n-btns-rtrn (xcb:read-card8-at %buf (+ %p 19)))
    (setf total-btns (xcb:read-card8-at %buf (+ %p 20)))
    (setf has-own-state (xcb:read-card8-at %buf (+ %p 21)))
    (setf dflt-kbd-fb (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf dflt-led-fb (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf dev-type (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 32) %order))
    (setf %p (+ %p 34))
    (setf name
            (xcb:read-string-at %buf %p (min name-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (multiple-value-setq (btn-actions %p)
      (xcb:read-struct-vector-at %buf %p
       (min n-btns-rtrn (floor (- (+ %pos 32 (* 4 length)) %p) 8)) %order #'decode-action))
    (multiple-value-setq (leds %p)
      (xcb:read-struct-vector-at %buf %p (min n-device-led-f-bs (- (+ %pos 32 (* 4 length)) %p))
       %order #'decode-device-led-info))
    (values
     (make-instance 'get-device-info-reply :response-type response-type :device-id device-id
                    :sequence sequence :length length :present present :supported supported
                    :unsupported unsupported :n-device-led-f-bs n-device-led-f-bs :first-btn-wanted
                    first-btn-wanted :n-btns-wanted n-btns-wanted :first-btn-rtrn first-btn-rtrn
                    :n-btns-rtrn n-btns-rtrn :total-btns total-btns :has-own-state has-own-state
                    :dflt-kbd-fb dflt-kbd-fb :dflt-led-fb dflt-led-fb :dev-type dev-type :name-len
                    name-len :name name :btn-actions btn-actions :leds leds)
     (+ %pos 32 (* 4 length)))))
(defun get-device-info-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-device-info-reply))

;;; Request xcb.xkb.SetDeviceInfo
(defun set-device-info (conn device-spec first-btn change btn-actions leds)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB"))
         (%buf (xcb:conn-send-buffer conn))
         (n-btns (cl:length btn-actions))
         (n-device-led-f-bs (cl:length leds)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 25)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf device-spec)
    (xcb:buffer-write-card8 %buf first-btn)
    (xcb:buffer-write-card8 %buf n-btns)
    (xcb:buffer-write-card16 %buf change)
    (xcb:buffer-write-card16 %buf n-device-led-f-bs)
    (xcb:buffer-write-list %buf btn-actions n-btns #'encode-action)
    (xcb:buffer-write-list %buf leds n-device-led-f-bs #'encode-device-led-info)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-device-info-request (xcb:request)
          ((device-spec :initarg :device-spec :type device-spec)
           (first-btn :initarg :first-btn :type (unsigned-byte 8))
           (n-btns :initarg :n-btns :type (unsigned-byte 8))
           (change :initarg :change :type (unsigned-byte 16))
           (n-device-led-f-bs :initarg :n-device-led-f-bs :type (unsigned-byte 16))
           (btn-actions :initarg :btn-actions :type cl:sequence)
           (leds :initarg :leds :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-device-info-request))
  (set-device-info conn (slot-value %obj 'device-spec) (slot-value %obj 'first-btn)
   (slot-value %obj 'change) (slot-value %obj 'btn-actions) (slot-value %obj 'leds)))

;;; Request xcb.xkb.SetDebuggingFlags
(defun set-debugging-flags (conn affect-flags flags affect-ctrls ctrls message)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XKB"))
         (%buf (xcb:conn-send-buffer conn))
         (msg-length (cl:length message)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 101)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf msg-length)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf affect-flags)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-card32 %buf affect-ctrls)
    (xcb:buffer-write-card32 %buf ctrls)
    (xcb:buffer-write-string-octets %buf message msg-length)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass set-debugging-flags-request (xcb:request-with-reply)
          ((msg-length :initarg :msg-length :type (unsigned-byte 16))
           (affect-flags :initarg :affect-flags :type (unsigned-byte 32))
           (flags :initarg :flags :type (unsigned-byte 32))
           (affect-ctrls :initarg :affect-ctrls :type (unsigned-byte 32))
           (ctrls :initarg :ctrls :type (unsigned-byte 32))
           (message :initarg :message :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-debugging-flags-request))
  (set-debugging-flags conn (slot-value %obj 'affect-flags) (slot-value %obj 'flags)
   (slot-value %obj 'affect-ctrls) (slot-value %obj 'ctrls) (slot-value %obj 'message)))
(defclass set-debugging-flags-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (current-flags :initarg :current-flags :accessor current-flags :type (unsigned-byte 32))
           (current-ctrls :initarg :current-ctrls :accessor current-ctrls :type (unsigned-byte 32))
           (supported-flags :initarg :supported-flags :accessor supported-flags :type
            (unsigned-byte 32))
           (supported-ctrls :initarg :supported-ctrls :accessor supported-ctrls :type
            (unsigned-byte 32))))
(defun decode-set-debugging-flags-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        current-flags
        current-ctrls
        supported-flags
        supported-ctrls)
    (declare
     (ignorable %p response-type sequence length current-flags current-ctrls supported-flags
      supported-ctrls))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf current-flags (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf current-ctrls (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf supported-flags (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf supported-ctrls (xcb:read-card32-at %buf (+ %p 20) %order))
    (values
     (make-instance 'set-debugging-flags-reply :response-type response-type :sequence sequence
                    :length length :current-flags current-flags :current-ctrls current-ctrls
                    :supported-flags supported-flags :supported-ctrls supported-ctrls)
     (+ %pos 32 (* 4 length)))))
(defun set-debugging-flags-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-set-debugging-flags-reply))

;;; Event xcb.xkb.NewKeyboardNotify (0)
(defclass new-keyboard-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (old-device-id :initarg :old-device-id :accessor old-device-id :type (unsigned-byte 8))
           (min-key-code :initarg :min-key-code :accessor min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :accessor max-key-code :type xcb:keycode)
           (old-min-key-code :initarg :old-min-key-code :accessor old-min-key-code :type
            xcb:keycode)
           (old-max-key-code :initarg :old-max-key-code :accessor old-max-key-code :type
            xcb:keycode)
           (request-major :initarg :request-major :accessor request-major :type (unsigned-byte 8))
           (request-minor :initarg :request-minor :accessor request-minor :type (unsigned-byte 8))
           (changed :initarg :changed :accessor changed :type (unsigned-byte 16))))
(defun decode-new-keyboard-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        old-device-id
        min-key-code
        max-key-code
        old-min-key-code
        old-max-key-code
        request-major
        request-minor
        changed)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id old-device-id min-key-code
      max-key-code old-min-key-code old-max-key-code request-major request-minor changed))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf old-device-id (xcb:read-card8-at %buf (+ %p 9)))
    (setf min-key-code (xcb:read-card8-at %buf (+ %p 10)))
    (setf max-key-code (xcb:read-card8-at %buf (+ %p 11)))
    (setf old-min-key-code (xcb:read-card8-at %buf (+ %p 12)))
    (setf old-max-key-code (xcb:read-card8-at %buf (+ %p 13)))
    (setf request-major (xcb:read-card8-at %buf (+ %p 14)))
    (setf request-minor (xcb:read-card8-at %buf (+ %p 15)))
    (setf changed (xcb:read-card16-at %buf (+ %p 16) %order))
    (values
     (make-instance 'new-keyboard-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :old-device-id old-device-id
                    :min-key-code min-key-code :max-key-code max-key-code :old-min-key-code
                    old-min-key-code :old-max-key-code old-max-key-code :request-major
                    request-major :request-minor request-minor :changed changed)
     (+ %pos 32))))
(defun encode-new-keyboard-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (old-device-id (slot-value %obj 'old-device-id))
         (min-key-code (slot-value %obj 'min-key-code))
         (max-key-code (slot-value %obj 'max-key-code))
         (old-min-key-code (slot-value %obj 'old-min-key-code))
         (old-max-key-code (slot-value %obj 'old-max-key-code))
         (request-major (slot-value %obj 'request-major))
         (request-minor (slot-value %obj 'request-minor))
         (changed (slot-value %obj 'changed)))
    (declare
     (ignorable response-type xkb-type sequence time device-id old-device-id min-key-code
      max-key-code old-min-key-code old-max-key-code request-major request-minor changed))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf old-device-id)
    (xcb:buffer-write-card8 %buf min-key-code)
    (xcb:buffer-write-card8 %buf max-key-code)
    (xcb:buffer-write-card8 %buf old-min-key-code)
    (xcb:buffer-write-card8 %buf old-max-key-code)
    (xcb:buffer-write-card8 %buf request-major)
    (xcb:buffer-write-card8 %buf request-minor)
    (xcb:buffer-write-card16 %buf changed)
    (xcb:buffer-write-padding %buf 14)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj new-keyboard-notify))
  (encode-new-keyboard-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 0 #'decode-new-keyboard-notify)

;;; Event xcb.xkb.MapNotify (1)
(defclass map-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (ptr-btn-actions :initarg :ptr-btn-actions :accessor ptr-btn-actions :type
            (unsigned-byte 8))
           (changed :initarg :changed :accessor changed :type (unsigned-byte 16))
           (min-key-code :initarg :min-key-code :accessor min-key-code :type xcb:keycode)
           (max-key-code :initarg :max-key-code :accessor max-key-code :type xcb:keycode)
           (first-type :initarg :first-type :accessor first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :accessor n-types :type (unsigned-byte 8))
           (first-key-sym :initarg :first-key-sym :accessor first-key-sym :type xcb:keycode)
           (n-key-syms :initarg :n-key-syms :accessor n-key-syms :type (unsigned-byte 8))
           (first-key-act :initarg :first-key-act :accessor first-key-act :type xcb:keycode)
           (n-key-acts :initarg :n-key-acts :accessor n-key-acts :type (unsigned-byte 8))
           (first-key-behavior :initarg :first-key-behavior :accessor first-key-behavior :type
            xcb:keycode)
           (n-key-behavior :initarg :n-key-behavior :accessor n-key-behavior :type
            (unsigned-byte 8))
           (first-key-explicit :initarg :first-key-explicit :accessor first-key-explicit :type
            xcb:keycode)
           (n-key-explicit :initarg :n-key-explicit :accessor n-key-explicit :type
            (unsigned-byte 8))
           (first-mod-map-key :initarg :first-mod-map-key :accessor first-mod-map-key :type
            xcb:keycode)
           (n-mod-map-keys :initarg :n-mod-map-keys :accessor n-mod-map-keys :type
            (unsigned-byte 8))
           (first-v-mod-map-key :initarg :first-v-mod-map-key :accessor first-v-mod-map-key :type
            xcb:keycode)
           (n-v-mod-map-keys :initarg :n-v-mod-map-keys :accessor n-v-mod-map-keys :type
            (unsigned-byte 8))
           (virtual-mods :initarg :virtual-mods :accessor virtual-mods :type (unsigned-byte 16))))
(defun decode-map-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        ptr-btn-actions
        changed
        min-key-code
        max-key-code
        first-type
        n-types
        first-key-sym
        n-key-syms
        first-key-act
        n-key-acts
        first-key-behavior
        n-key-behavior
        first-key-explicit
        n-key-explicit
        first-mod-map-key
        n-mod-map-keys
        first-v-mod-map-key
        n-v-mod-map-keys
        virtual-mods)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id ptr-btn-actions changed
      min-key-code max-key-code first-type n-types first-key-sym n-key-syms first-key-act
      n-key-acts first-key-behavior n-key-behavior first-key-explicit n-key-explicit
      first-mod-map-key n-mod-map-keys first-v-mod-map-key n-v-mod-map-keys virtual-mods))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf ptr-btn-actions (xcb:read-card8-at %buf (+ %p 9)))
    (setf changed (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf min-key-code (xcb:read-card8-at %buf (+ %p 12)))
    (setf max-key-code (xcb:read-card8-at %buf (+ %p 13)))
    (setf first-type (xcb:read-card8-at %buf (+ %p 14)))
    (setf n-types (xcb:read-card8-at %buf (+ %p 15)))
    (setf first-key-sym (xcb:read-card8-at %buf (+ %p 16)))
    (setf n-key-syms (xcb:read-card8-at %buf (+ %p 17)))
    (setf first-key-act (xcb:read-card8-at %buf (+ %p 18)))
    (setf n-key-acts (xcb:read-card8-at %buf (+ %p 19)))
    (setf first-key-behavior (xcb:read-card8-at %buf (+ %p 20)))
    (setf n-key-behavior (xcb:read-card8-at %buf (+ %p 21)))
    (setf first-key-explicit (xcb:read-card8-at %buf (+ %p 22)))
    (setf n-key-explicit (xcb:read-card8-at %buf (+ %p 23)))
    (setf first-mod-map-key (xcb:read-card8-at %buf (+ %p 24)))
    (setf n-mod-map-keys (xcb:read-card8-at %buf (+ %p 25)))
    (setf first-v-mod-map-key (xcb:read-card8-at %buf (+ %p 26)))
    (setf n-v-mod-map-keys (xcb:read-card8-at %buf (+ %p 27)))
    (setf virtual-mods (xcb:read-card16-at %buf (+ %p 28) %order))
    (values
     (make-instance 'map-notify :response-type response-type :xkb-type xkb-type :sequence sequence
                    :time time :device-id device-id :ptr-btn-actions ptr-btn-actions :changed
                    changed :min-key-code min-key-code :max-key-code max-key-code :first-type
                    first-type :n-types n-types :first-key-sym first-key-sym :n-key-syms n-key-syms
                    :first-key-act first-key-act :n-key-acts n-key-acts :first-key-behavior
                    first-key-behavior :n-key-behavior n-key-behavior :first-key-explicit
                    first-key-explicit :n-key-explicit n-key-explicit :first-mod-map-key
                    first-mod-map-key :n-mod-map-keys n-mod-map-keys :first-v-mod-map-key
                    first-v-mod-map-key :n-v-mod-map-keys n-v-mod-map-keys :virtual-mods
                    virtual-mods)
     (+ %pos 32))))
(defun encode-map-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (ptr-btn-actions (slot-value %obj 'ptr-btn-actions))
         (changed (slot-value %obj 'changed))
         (min-key-code (slot-value %obj 'min-key-code))
         (max-key-code (slot-value %obj 'max-key-code))
         (first-type (slot-value %obj 'first-type))
         (n-types (slot-value %obj 'n-types))
         (first-key-sym (slot-value %obj 'first-key-sym))
         (n-key-syms (slot-value %obj 'n-key-syms))
         (first-key-act (slot-value %obj 'first-key-act))
         (n-key-acts (slot-value %obj 'n-key-acts))
         (first-key-behavior (slot-value %obj 'first-key-behavior))
         (n-key-behavior (slot-value %obj 'n-key-behavior))
         (first-key-explicit (slot-value %obj 'first-key-explicit))
         (n-key-explicit (slot-value %obj 'n-key-explicit))
         (first-mod-map-key (slot-value %obj 'first-mod-map-key))
         (n-mod-map-keys (slot-value %obj 'n-mod-map-keys))
         (first-v-mod-map-key (slot-value %obj 'first-v-mod-map-key))
         (n-v-mod-map-keys (slot-value %obj 'n-v-mod-map-keys))
         (virtual-mods (slot-value %obj 'virtual-mods)))
    (declare
     (ignorable response-type xkb-type sequence time device-id ptr-btn-actions changed min-key-code
      max-key-code first-type n-types first-key-sym n-key-syms first-key-act n-key-acts
      first-key-behavior n-key-behavior first-key-explicit n-key-explicit first-mod-map-key
      n-mod-map-keys first-v-mod-map-key n-v-mod-map-keys virtual-mods))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf ptr-btn-actions)
    (xcb:buffer-write-card16 %buf changed)
    (xcb:buffer-write-card8 %buf min-key-code)
    (xcb:buffer-write-card8 %buf max-key-code)
    (xcb:buffer-write-card8 %buf first-type)
    (xcb:buffer-write-card8 %buf n-types)
    (xcb:buffer-write-card8 %buf first-key-sym)
    (xcb:buffer-write-card8 %buf n-key-syms)
    (xcb:buffer-write-card8 %buf first-key-act)
    (xcb:buffer-write-card8 %buf n-key-acts)
    (xcb:buffer-write-card8 %buf first-key-behavior)
    (xcb:buffer-write-card8 %buf n-key-behavior)
    (xcb:buffer-write-card8 %buf first-key-explicit)
    (xcb:buffer-write-card8 %buf n-key-explicit)
    (xcb:buffer-write-card8 %buf first-mod-map-key)
    (xcb:buffer-write-card8 %buf n-mod-map-keys)
    (xcb:buffer-write-card8 %buf first-v-mod-map-key)
    (xcb:buffer-write-card8 %buf n-v-mod-map-keys)
    (xcb:buffer-write-card16 %buf virtual-mods)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj map-notify)) (encode-map-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 1 #'decode-map-notify)

;;; Event xcb.xkb.StateNotify (2)
(defclass state-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))
           (base-mods :initarg :base-mods :accessor base-mods :type (unsigned-byte 8))
           (latched-mods :initarg :latched-mods :accessor latched-mods :type (unsigned-byte 8))
           (locked-mods :initarg :locked-mods :accessor locked-mods :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (unsigned-byte 8))
           (base-group :initarg :base-group :accessor base-group :type (signed-byte 16))
           (latched-group :initarg :latched-group :accessor latched-group :type (signed-byte 16))
           (locked-group :initarg :locked-group :accessor locked-group :type (unsigned-byte 8))
           (compat-state :initarg :compat-state :accessor compat-state :type (unsigned-byte 8))
           (grab-mods :initarg :grab-mods :accessor grab-mods :type (unsigned-byte 8))
           (compat-grab-mods :initarg :compat-grab-mods :accessor compat-grab-mods :type
            (unsigned-byte 8))
           (lookup-mods :initarg :lookup-mods :accessor lookup-mods :type (unsigned-byte 8))
           (compat-loockup-mods :initarg :compat-loockup-mods :accessor compat-loockup-mods :type
            (unsigned-byte 8))
           (ptr-btn-state :initarg :ptr-btn-state :accessor ptr-btn-state :type (unsigned-byte 16))
           (changed :initarg :changed :accessor changed :type (unsigned-byte 16))
           (keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 8))
           (request-major :initarg :request-major :accessor request-major :type (unsigned-byte 8))
           (request-minor :initarg :request-minor :accessor request-minor :type (unsigned-byte 8))))
(defun decode-state-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        mods
        base-mods
        latched-mods
        locked-mods
        group
        base-group
        latched-group
        locked-group
        compat-state
        grab-mods
        compat-grab-mods
        lookup-mods
        compat-loockup-mods
        ptr-btn-state
        changed
        keycode
        event-type
        request-major
        request-minor)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id mods base-mods latched-mods
      locked-mods group base-group latched-group locked-group compat-state grab-mods
      compat-grab-mods lookup-mods compat-loockup-mods ptr-btn-state changed keycode event-type
      request-major request-minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf mods (xcb:read-card8-at %buf (+ %p 9)))
    (setf base-mods (xcb:read-card8-at %buf (+ %p 10)))
    (setf latched-mods (xcb:read-card8-at %buf (+ %p 11)))
    (setf locked-mods (xcb:read-card8-at %buf (+ %p 12)))
    (setf group (xcb:read-card8-at %buf (+ %p 13)))
    (setf base-group (xcb:read-int16-at %buf (+ %p 14) %order))
    (setf latched-group (xcb:read-int16-at %buf (+ %p 16) %order))
    (setf locked-group (xcb:read-card8-at %buf (+ %p 18)))
    (setf compat-state (xcb:read-card8-at %buf (+ %p 19)))
    (setf grab-mods (xcb:read-card8-at %buf (+ %p 20)))
    (setf compat-grab-mods (xcb:read-card8-at %buf (+ %p 21)))
    (setf lookup-mods (xcb:read-card8-at %buf (+ %p 22)))
    (setf compat-loockup-mods (xcb:read-card8-at %buf (+ %p 23)))
    (setf ptr-btn-state (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf changed (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf keycode (xcb:read-card8-at %buf (+ %p 28)))
    (setf event-type (xcb:read-card8-at %buf (+ %p 29)))
    (setf request-major (xcb:read-card8-at %buf (+ %p 30)))
    (setf request-minor (xcb:read-card8-at %buf (+ %p 31)))
    (values
     (make-instance 'state-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :mods mods :base-mods base-mods
                    :latched-mods latched-mods :locked-mods locked-mods :group group :base-group
                    base-group :latched-group latched-group :locked-group locked-group
                    :compat-state compat-state :grab-mods grab-mods :compat-grab-mods
                    compat-grab-mods :lookup-mods lookup-mods :compat-loockup-mods
                    compat-loockup-mods :ptr-btn-state ptr-btn-state :changed changed :keycode
                    keycode :event-type event-type :request-major request-major :request-minor
                    request-minor)
     (+ %pos 32))))
(defun encode-state-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (mods (slot-value %obj 'mods))
         (base-mods (slot-value %obj 'base-mods))
         (latched-mods (slot-value %obj 'latched-mods))
         (locked-mods (slot-value %obj 'locked-mods))
         (group (slot-value %obj 'group))
         (base-group (slot-value %obj 'base-group))
         (latched-group (slot-value %obj 'latched-group))
         (locked-group (slot-value %obj 'locked-group))
         (compat-state (slot-value %obj 'compat-state))
         (grab-mods (slot-value %obj 'grab-mods))
         (compat-grab-mods (slot-value %obj 'compat-grab-mods))
         (lookup-mods (slot-value %obj 'lookup-mods))
         (compat-loockup-mods (slot-value %obj 'compat-loockup-mods))
         (ptr-btn-state (slot-value %obj 'ptr-btn-state))
         (changed (slot-value %obj 'changed))
         (keycode (slot-value %obj 'keycode))
         (event-type (slot-value %obj 'event-type))
         (request-major (slot-value %obj 'request-major))
         (request-minor (slot-value %obj 'request-minor)))
    (declare
     (ignorable response-type xkb-type sequence time device-id mods base-mods latched-mods
      locked-mods group base-group latched-group locked-group compat-state grab-mods
      compat-grab-mods lookup-mods compat-loockup-mods ptr-btn-state changed keycode event-type
      request-major request-minor))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf mods)
    (xcb:buffer-write-card8 %buf base-mods)
    (xcb:buffer-write-card8 %buf latched-mods)
    (xcb:buffer-write-card8 %buf locked-mods)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-card16 %buf base-group)
    (xcb:buffer-write-card16 %buf latched-group)
    (xcb:buffer-write-card8 %buf locked-group)
    (xcb:buffer-write-card8 %buf compat-state)
    (xcb:buffer-write-card8 %buf grab-mods)
    (xcb:buffer-write-card8 %buf compat-grab-mods)
    (xcb:buffer-write-card8 %buf lookup-mods)
    (xcb:buffer-write-card8 %buf compat-loockup-mods)
    (xcb:buffer-write-card16 %buf ptr-btn-state)
    (xcb:buffer-write-card16 %buf changed)
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-card8 %buf event-type)
    (xcb:buffer-write-card8 %buf request-major)
    (xcb:buffer-write-card8 %buf request-minor)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj state-notify)) (encode-state-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 2 #'decode-state-notify)

;;; Event xcb.xkb.ControlsNotify (3)
(defclass controls-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (num-groups :initarg :num-groups :accessor num-groups :type (unsigned-byte 8))
           (changed-controls :initarg :changed-controls :accessor changed-controls :type
            (unsigned-byte 32))
           (enabled-controls :initarg :enabled-controls :accessor enabled-controls :type
            (unsigned-byte 32))
           (enabled-control-changes :initarg :enabled-control-changes :accessor
            enabled-control-changes :type (unsigned-byte 32))
           (keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 8))
           (request-major :initarg :request-major :accessor request-major :type (unsigned-byte 8))
           (request-minor :initarg :request-minor :accessor request-minor :type (unsigned-byte 8))))
(defun decode-controls-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        num-groups
        changed-controls
        enabled-controls
        enabled-control-changes
        keycode
        event-type
        request-major
        request-minor)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id num-groups changed-controls
      enabled-controls enabled-control-changes keycode event-type request-major request-minor))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf num-groups (xcb:read-card8-at %buf (+ %p 9)))
    (setf changed-controls (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf enabled-controls (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf enabled-control-changes (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf keycode (xcb:read-card8-at %buf (+ %p 24)))
    (setf event-type (xcb:read-card8-at %buf (+ %p 25)))
    (setf request-major (xcb:read-card8-at %buf (+ %p 26)))
    (setf request-minor (xcb:read-card8-at %buf (+ %p 27)))
    (values
     (make-instance 'controls-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :num-groups num-groups
                    :changed-controls changed-controls :enabled-controls enabled-controls
                    :enabled-control-changes enabled-control-changes :keycode keycode :event-type
                    event-type :request-major request-major :request-minor request-minor)
     (+ %pos 32))))
(defun encode-controls-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (num-groups (slot-value %obj 'num-groups))
         (changed-controls (slot-value %obj 'changed-controls))
         (enabled-controls (slot-value %obj 'enabled-controls))
         (enabled-control-changes (slot-value %obj 'enabled-control-changes))
         (keycode (slot-value %obj 'keycode))
         (event-type (slot-value %obj 'event-type))
         (request-major (slot-value %obj 'request-major))
         (request-minor (slot-value %obj 'request-minor)))
    (declare
     (ignorable response-type xkb-type sequence time device-id num-groups changed-controls
      enabled-controls enabled-control-changes keycode event-type request-major request-minor))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf num-groups)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf changed-controls)
    (xcb:buffer-write-card32 %buf enabled-controls)
    (xcb:buffer-write-card32 %buf enabled-control-changes)
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-card8 %buf event-type)
    (xcb:buffer-write-card8 %buf request-major)
    (xcb:buffer-write-card8 %buf request-minor)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj controls-notify)) (encode-controls-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 3 #'decode-controls-notify)

;;; Event xcb.xkb.IndicatorStateNotify (4)
(defclass indicator-state-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 32))
           (state-changed :initarg :state-changed :accessor state-changed :type
            (unsigned-byte 32))))
(defun decode-indicator-state-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xkb-type sequence time device-id state state-changed)
    (declare (ignorable %p response-type xkb-type sequence time device-id state state-changed))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf state (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf state-changed (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'indicator-state-notify :response-type response-type :xkb-type xkb-type
                    :sequence sequence :time time :device-id device-id :state state :state-changed
                    state-changed)
     (+ %pos 32))))
(defun encode-indicator-state-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (state (slot-value %obj 'state))
         (state-changed (slot-value %obj 'state-changed)))
    (declare (ignorable response-type xkb-type sequence time device-id state state-changed))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf state)
    (xcb:buffer-write-card32 %buf state-changed)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj indicator-state-notify))
  (encode-indicator-state-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 4 #'decode-indicator-state-notify)

;;; Event xcb.xkb.IndicatorMapNotify (5)
(defclass indicator-map-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (state :initarg :state :accessor state :type (unsigned-byte 32))
           (map-changed :initarg :map-changed :accessor map-changed :type (unsigned-byte 32))))
(defun decode-indicator-map-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type xkb-type sequence time device-id state map-changed)
    (declare (ignorable %p response-type xkb-type sequence time device-id state map-changed))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf state (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf map-changed (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'indicator-map-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :state state :map-changed map-changed)
     (+ %pos 32))))
(defun encode-indicator-map-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (state (slot-value %obj 'state))
         (map-changed (slot-value %obj 'map-changed)))
    (declare (ignorable response-type xkb-type sequence time device-id state map-changed))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-card32 %buf state)
    (xcb:buffer-write-card32 %buf map-changed)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj indicator-map-notify))
  (encode-indicator-map-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 5 #'decode-indicator-map-notify)

;;; Event xcb.xkb.NamesNotify (6)
(defclass names-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (changed :initarg :changed :accessor changed :type (unsigned-byte 16))
           (first-type :initarg :first-type :accessor first-type :type (unsigned-byte 8))
           (n-types :initarg :n-types :accessor n-types :type (unsigned-byte 8))
           (first-level-name :initarg :first-level-name :accessor first-level-name :type
            (unsigned-byte 8))
           (n-level-names :initarg :n-level-names :accessor n-level-names :type (unsigned-byte 8))
           (n-radio-groups :initarg :n-radio-groups :accessor n-radio-groups :type
            (unsigned-byte 8))
           (n-key-aliases :initarg :n-key-aliases :accessor n-key-aliases :type (unsigned-byte 8))
           (changed-group-names :initarg :changed-group-names :accessor changed-group-names :type
            (unsigned-byte 8))
           (changed-virtual-mods :initarg :changed-virtual-mods :accessor changed-virtual-mods
            :type (unsigned-byte 16))
           (first-key :initarg :first-key :accessor first-key :type xcb:keycode)
           (n-keys :initarg :n-keys :accessor n-keys :type (unsigned-byte 8))
           (changed-indicators :initarg :changed-indicators :accessor changed-indicators :type
            (unsigned-byte 32))))
(defun decode-names-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        changed
        first-type
        n-types
        first-level-name
        n-level-names
        n-radio-groups
        n-key-aliases
        changed-group-names
        changed-virtual-mods
        first-key
        n-keys
        changed-indicators)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id changed first-type n-types
      first-level-name n-level-names n-radio-groups n-key-aliases changed-group-names
      changed-virtual-mods first-key n-keys changed-indicators))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf changed (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf first-type (xcb:read-card8-at %buf (+ %p 12)))
    (setf n-types (xcb:read-card8-at %buf (+ %p 13)))
    (setf first-level-name (xcb:read-card8-at %buf (+ %p 14)))
    (setf n-level-names (xcb:read-card8-at %buf (+ %p 15)))
    (setf n-radio-groups (xcb:read-card8-at %buf (+ %p 17)))
    (setf n-key-aliases (xcb:read-card8-at %buf (+ %p 18)))
    (setf changed-group-names (xcb:read-card8-at %buf (+ %p 19)))
    (setf changed-virtual-mods (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf first-key (xcb:read-card8-at %buf (+ %p 22)))
    (setf n-keys (xcb:read-card8-at %buf (+ %p 23)))
    (setf changed-indicators (xcb:read-card32-at %buf (+ %p 24) %order))
    (values
     (make-instance 'names-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :changed changed :first-type
                    first-type :n-types n-types :first-level-name first-level-name :n-level-names
                    n-level-names :n-radio-groups n-radio-groups :n-key-aliases n-key-aliases
                    :changed-group-names changed-group-names :changed-virtual-mods
                    changed-virtual-mods :first-key first-key :n-keys n-keys :changed-indicators
                    changed-indicators)
     (+ %pos 32))))
(defun encode-names-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (changed (slot-value %obj 'changed))
         (first-type (slot-value %obj 'first-type))
         (n-types (slot-value %obj 'n-types))
         (first-level-name (slot-value %obj 'first-level-name))
         (n-level-names (slot-value %obj 'n-level-names))
         (n-radio-groups (slot-value %obj 'n-radio-groups))
         (n-key-aliases (slot-value %obj 'n-key-aliases))
         (changed-group-names (slot-value %obj 'changed-group-names))
         (changed-virtual-mods (slot-value %obj 'changed-virtual-mods))
         (first-key (slot-value %obj 'first-key))
         (n-keys (slot-value %obj 'n-keys))
         (changed-indicators (slot-value %obj 'changed-indicators)))
    (declare
     (ignorable response-type xkb-type sequence time device-id changed first-type n-types
      first-level-name n-level-names n-radio-groups n-key-aliases changed-group-names
      changed-virtual-mods first-key n-keys changed-indicators))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf changed)
    (xcb:buffer-write-card8 %buf first-type)
    (xcb:buffer-write-card8 %buf n-types)
    (xcb:buffer-write-card8 %buf first-level-name)
    (xcb:buffer-write-card8 %buf n-level-names)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card8 %buf n-radio-groups)
    (xcb:buffer-write-card8 %buf n-key-aliases)
    (xcb:buffer-write-card8 %buf changed-group-names)
    (xcb:buffer-write-card16 %buf changed-virtual-mods)
    (xcb:buffer-write-card8 %buf first-key)
    (xcb:buffer-write-card8 %buf n-keys)
    (xcb:buffer-write-card32 %buf changed-indicators)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj names-notify)) (encode-names-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 6 #'decode-names-notify)

;;; Event xcb.xkb.CompatMapNotify (7)
(defclass compat-map-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (changed-groups :initarg :changed-groups :accessor changed-groups :type
            (unsigned-byte 8))
           (first-si :initarg :first-si :accessor first-si :type (unsigned-byte 16))
           (n-si :initarg :n-si :accessor n-si :type (unsigned-byte 16))
           (n-total-si :initarg :n-total-si :accessor n-total-si :type (unsigned-byte 16))))
(defun decode-compat-map-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        changed-groups
        first-si
        n-si
        n-total-si)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id changed-groups first-si n-si
      n-total-si))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf changed-groups (xcb:read-card8-at %buf (+ %p 9)))
    (setf first-si (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf n-si (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf n-total-si (xcb:read-card16-at %buf (+ %p 14) %order))
    (values
     (make-instance 'compat-map-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :changed-groups changed-groups
                    :first-si first-si :n-si n-si :n-total-si n-total-si)
     (+ %pos 32))))
(defun encode-compat-map-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (changed-groups (slot-value %obj 'changed-groups))
         (first-si (slot-value %obj 'first-si))
         (n-si (slot-value %obj 'n-si))
         (n-total-si (slot-value %obj 'n-total-si)))
    (declare
     (ignorable response-type xkb-type sequence time device-id changed-groups first-si n-si
      n-total-si))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf changed-groups)
    (xcb:buffer-write-card16 %buf first-si)
    (xcb:buffer-write-card16 %buf n-si)
    (xcb:buffer-write-card16 %buf n-total-si)
    (xcb:buffer-write-padding %buf 16)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj compat-map-notify)) (encode-compat-map-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 7 #'decode-compat-map-notify)

;;; Event xcb.xkb.BellNotify (8)
(defclass bell-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (bell-class :initarg :bell-class :accessor bell-class :type (unsigned-byte 8))
           (bell-id :initarg :bell-id :accessor bell-id :type (unsigned-byte 8))
           (percent :initarg :percent :accessor percent :type (unsigned-byte 8))
           (pitch :initarg :pitch :accessor pitch :type (unsigned-byte 16))
           (duration :initarg :duration :accessor duration :type (unsigned-byte 16))
           (name :initarg :name :accessor name :type xcb:atom)
           (window :initarg :window :accessor window :type xcb:window)
           (event-only :initarg :event-only :accessor event-only :type
            (or boolean (unsigned-byte 8)))))
(defun decode-bell-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        bell-class
        bell-id
        percent
        pitch
        duration
        name
        window
        event-only)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id bell-class bell-id percent pitch
      duration name window event-only))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf bell-class (xcb:read-card8-at %buf (+ %p 9)))
    (setf bell-id (xcb:read-card8-at %buf (+ %p 10)))
    (setf percent (xcb:read-card8-at %buf (+ %p 11)))
    (setf pitch (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf duration (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf name (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf window (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf event-only (xcb:read-card8-at %buf (+ %p 24)))
    (values
     (make-instance 'bell-notify :response-type response-type :xkb-type xkb-type :sequence sequence
                    :time time :device-id device-id :bell-class bell-class :bell-id bell-id
                    :percent percent :pitch pitch :duration duration :name name :window window
                    :event-only event-only)
     (+ %pos 32))))
(defun encode-bell-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (bell-class (slot-value %obj 'bell-class))
         (bell-id (slot-value %obj 'bell-id))
         (percent (slot-value %obj 'percent))
         (pitch (slot-value %obj 'pitch))
         (duration (slot-value %obj 'duration))
         (name (slot-value %obj 'name))
         (window (slot-value %obj 'window))
         (event-only (slot-value %obj 'event-only)))
    (declare
     (ignorable response-type xkb-type sequence time device-id bell-class bell-id percent pitch
      duration name window event-only))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf bell-class)
    (xcb:buffer-write-card8 %buf bell-id)
    (xcb:buffer-write-card8 %buf percent)
    (xcb:buffer-write-card16 %buf pitch)
    (xcb:buffer-write-card16 %buf duration)
    (xcb:buffer-write-card32 %buf name)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-write-bool %buf event-only)
    (xcb:buffer-write-padding %buf 7)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj bell-notify)) (encode-bell-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 8 #'decode-bell-notify)

;;; Event xcb.xkb.ActionMessage (9)
(defclass action-message (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (press :initarg :press :accessor press :type (or boolean (unsigned-byte 8)))
           (key-event-follows :initarg :key-event-follows :accessor key-event-follows :type
            (or boolean (unsigned-byte 8)))
           (mods :initarg :mods :accessor mods :type (unsigned-byte 8))
           (group :initarg :group :accessor group :type (unsigned-byte 8))
           (message :initarg :message :accessor message :type cl:sequence)))
(defun decode-action-message (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        keycode
        press
        key-event-follows
        mods
        group
        message)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id keycode press key-event-follows
      mods group message))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf keycode (xcb:read-card8-at %buf (+ %p 9)))
    (setf press (xcb:read-card8-at %buf (+ %p 10)))
    (setf key-event-follows (xcb:read-card8-at %buf (+ %p 11)))
    (setf mods (xcb:read-card8-at %buf (+ %p 12)))
    (setf group (xcb:read-card8-at %buf (+ %p 13)))
    (setf message (xcb:read-string-at %buf (+ %p 14) 8))
    (values
     (make-instance 'action-message :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :keycode keycode :press press
                    :key-event-follows key-event-follows :mods mods :group group :message message)
     (+ %pos 32))))
(defun encode-action-message (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (keycode (slot-value %obj 'keycode))
         (press (slot-value %obj 'press))
         (key-event-follows (slot-value %obj 'key-event-follows))
         (mods (slot-value %obj 'mods))
         (group (slot-value %obj 'group))
         (message (slot-value %obj 'message)))
    (declare
     (ignorable response-type xkb-type sequence time device-id keycode press key-event-follows mods
      group message))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-bool %buf press)
    (xcb:buffer-write-bool %buf key-event-follows)
    (xcb:buffer-write-card8 %buf mods)
    (xcb:buffer-write-card8 %buf group)
    (xcb:buffer-write-fixed-list %buf message 8 #'xcb:buffer-write-char 1)
    (xcb:buffer-write-padding %buf 10)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj action-message)) (encode-action-message %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 9 #'decode-action-message)

;;; Event xcb.xkb.AccessXNotify (10)
(defclass access-x-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (keycode :initarg :keycode :accessor keycode :type xcb:keycode)
           (detailt :initarg :detailt :accessor detailt :type (unsigned-byte 16))
           (slow-keys-delay :initarg :slow-keys-delay :accessor slow-keys-delay :type
            (unsigned-byte 16))
           (debounce-delay :initarg :debounce-delay :accessor debounce-delay :type
            (unsigned-byte 16))))
(defun decode-access-x-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        keycode
        detailt
        slow-keys-delay
        debounce-delay)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id keycode detailt slow-keys-delay
      debounce-delay))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf keycode (xcb:read-card8-at %buf (+ %p 9)))
    (setf detailt (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf slow-keys-delay (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf debounce-delay (xcb:read-card16-at %buf (+ %p 14) %order))
    (values
     (make-instance 'access-x-notify :response-type response-type :xkb-type xkb-type :sequence
                    sequence :time time :device-id device-id :keycode keycode :detailt detailt
                    :slow-keys-delay slow-keys-delay :debounce-delay debounce-delay)
     (+ %pos 32))))
(defun encode-access-x-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (keycode (slot-value %obj 'keycode))
         (detailt (slot-value %obj 'detailt))
         (slow-keys-delay (slot-value %obj 'slow-keys-delay))
         (debounce-delay (slot-value %obj 'debounce-delay)))
    (declare
     (ignorable response-type xkb-type sequence time device-id keycode detailt slow-keys-delay
      debounce-delay))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-card8 %buf keycode)
    (xcb:buffer-write-card16 %buf detailt)
    (xcb:buffer-write-card16 %buf slow-keys-delay)
    (xcb:buffer-write-card16 %buf debounce-delay)
    (xcb:buffer-write-padding %buf 16)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj access-x-notify)) (encode-access-x-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 10 #'decode-access-x-notify)

;;; Event xcb.xkb.ExtensionDeviceNotify (11)
(defclass extension-device-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (xkb-type :initarg :xkb-type :accessor xkb-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (time :initarg :time :accessor time :type xcb:timestamp)
           (device-id :initarg :device-id :accessor device-id :type (unsigned-byte 8))
           (reason :initarg :reason :accessor reason :type (unsigned-byte 16))
           (led-class :initarg :led-class :accessor led-class :type (unsigned-byte 16))
           (led-id :initarg :led-id :accessor led-id :type (unsigned-byte 16))
           (leds-defined :initarg :leds-defined :accessor leds-defined :type (unsigned-byte 32))
           (led-state :initarg :led-state :accessor led-state :type (unsigned-byte 32))
           (first-button :initarg :first-button :accessor first-button :type (unsigned-byte 8))
           (n-buttons :initarg :n-buttons :accessor n-buttons :type (unsigned-byte 8))
           (supported :initarg :supported :accessor supported :type (unsigned-byte 16))
           (unsupported :initarg :unsupported :accessor unsupported :type (unsigned-byte 16))))
(defun decode-extension-device-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        xkb-type
        sequence
        time
        device-id
        reason
        led-class
        led-id
        leds-defined
        led-state
        first-button
        n-buttons
        supported
        unsupported)
    (declare
     (ignorable %p response-type xkb-type sequence time device-id reason led-class led-id
      leds-defined led-state first-button n-buttons supported unsupported))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf xkb-type (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf time (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf device-id (xcb:read-card8-at %buf (+ %p 8)))
    (setf reason (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf led-class (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf led-id (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf leds-defined (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf led-state (xcb:read-card32-at %buf (+ %p 20) %order))
    (setf first-button (xcb:read-card8-at %buf (+ %p 24)))
    (setf n-buttons (xcb:read-card8-at %buf (+ %p 25)))
    (setf supported (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf unsupported (xcb:read-card16-at %buf (+ %p 28) %order))
    (values
     (make-instance 'extension-device-notify :response-type response-type :xkb-type xkb-type
                    :sequence sequence :time time :device-id device-id :reason reason :led-class
                    led-class :led-id led-id :leds-defined leds-defined :led-state led-state
                    :first-button first-button :n-buttons n-buttons :supported supported
                    :unsupported unsupported)
     (+ %pos 32))))
(defun encode-extension-device-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (xkb-type (slot-value %obj 'xkb-type))
         (sequence (slot-value %obj 'sequence))
         (time (slot-value %obj 'time))
         (device-id (slot-value %obj 'device-id))
         (reason (slot-value %obj 'reason))
         (led-class (slot-value %obj 'led-class))
         (led-id (slot-value %obj 'led-id))
         (leds-defined (slot-value %obj 'leds-defined))
         (led-state (slot-value %obj 'led-state))
         (first-button (slot-value %obj 'first-button))
         (n-buttons (slot-value %obj 'n-buttons))
         (supported (slot-value %obj 'supported))
         (unsupported (slot-value %obj 'unsupported)))
    (declare
     (ignorable response-type xkb-type sequence time device-id reason led-class led-id leds-defined
      led-state first-button n-buttons supported unsupported))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf xkb-type)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf time)
    (xcb:buffer-write-card8 %buf device-id)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-card16 %buf reason)
    (xcb:buffer-write-card16 %buf led-class)
    (xcb:buffer-write-card16 %buf led-id)
    (xcb:buffer-write-card32 %buf leds-defined)
    (xcb:buffer-write-card32 %buf led-state)
    (xcb:buffer-write-card8 %buf first-button)
    (xcb:buffer-write-card8 %buf n-buttons)
    (xcb:buffer-write-card16 %buf supported)
    (xcb:buffer-write-card16 %buf unsupported)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj extension-device-notify))
  (encode-extension-device-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XKB" 11 #'decode-extension-device-notify)
