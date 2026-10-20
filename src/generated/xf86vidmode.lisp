;;; Generated from xf86vidmode.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XF86VIDMODE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:add-mode-line
   #:add-mode-line-request
   #:alignment-pad
   #:bad-clock-error
   #:bad-h-timings-error
   #:bad-v-timings-error
   #:bad-value
   #:blue
   #:client-not-local-error
   #:clock
   #:clocks
   #:decode-bad-clock-error
   #:decode-bad-h-timings-error
   #:decode-bad-v-timings-error
   #:decode-client-not-local-error
   #:decode-extension-disabled-error
   #:decode-get-all-mode-lines-reply
   #:decode-get-dot-clocks-reply
   #:decode-get-gamma-ramp-reply
   #:decode-get-gamma-ramp-size-reply
   #:decode-get-gamma-reply
   #:decode-get-mode-line-reply
   #:decode-get-monitor-reply
   #:decode-get-permissions-reply
   #:decode-get-view-port-reply
   #:decode-mode-info
   #:decode-mode-unsuitable-error
   #:decode-query-version-reply
   #:decode-validate-mode-line-reply
   #:decode-zoom-locked-error
   #:delete-mode-line
   #:delete-mode-line-request
   #:dotclock
   #:encode-mode-info
   #:error-code
   #:extension-disabled-error
   #:flags
   #:get-all-mode-lines
   #:get-all-mode-lines-reply
   #:get-all-mode-lines-request
   #:get-dot-clocks
   #:get-dot-clocks-reply
   #:get-dot-clocks-request
   #:get-gamma
   #:get-gamma-ramp
   #:get-gamma-ramp-reply
   #:get-gamma-ramp-request
   #:get-gamma-ramp-size
   #:get-gamma-ramp-size-reply
   #:get-gamma-ramp-size-request
   #:get-gamma-reply
   #:get-gamma-request
   #:get-mode-line
   #:get-mode-line-reply
   #:get-mode-line-request
   #:get-monitor
   #:get-monitor-reply
   #:get-monitor-request
   #:get-permissions
   #:get-permissions-reply
   #:get-permissions-request
   #:get-view-port
   #:get-view-port-reply
   #:get-view-port-request
   #:green
   #:hdisplay
   #:hskew
   #:hsync
   #:hsyncend
   #:hsyncstart
   #:htotal
   #:length
   #:lock-mode-switch
   #:lock-mode-switch-request
   #:major-opcode
   #:major-version
   #:maxclocks
   #:minor-opcode
   #:minor-version
   #:mod-mode-line
   #:mod-mode-line-request
   #:mode-info
   #:mode-unsuitable-error
   #:modecount
   #:modeinfo
   #:model
   #:model-length
   #:num-hsync
   #:num-vsync
   #:permissions
   #:private
   #:privsize
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:red
   #:response-type
   #:sequence
   #:set-client-version
   #:set-client-version-request
   #:set-gamma
   #:set-gamma-ramp
   #:set-gamma-ramp-request
   #:set-gamma-request
   #:set-view-port
   #:set-view-port-request
   #:size
   #:status
   #:switch-mode
   #:switch-mode-request
   #:switch-to-mode
   #:switch-to-mode-request
   #:syncrange
   #:validate-mode-line
   #:validate-mode-line-reply
   #:validate-mode-line-request
   #:vdisplay
   #:vendor
   #:vendor-length
   #:vsync
   #:vsyncend
   #:vsyncstart
   #:vtotal
   #:x
   #:y
   #:zoom-locked-error))

(in-package #:XCB-XF86VIDMODE)

(xcb:register-extension-xname "XCB-XF86VIDMODE" "XFree86-VidModeExtension")
(deftype syncrange () '(unsigned-byte 32))
(deftype dotclock () '(unsigned-byte 32))

;;; Enum xcb.XF86VidMode.ModeFlag
(xcb:defenum xf86-vid-mode-mode-flag
  (:positive-h-sync 1)
  (:negative-h-sync 2)
  (:positive-v-sync 4)
  (:negative-v-sync 8)
  (:interlace 16)
  (:composite-sync 32)
  (:positive-c-sync 64)
  (:negative-c-sync 128)
  (:h-skew 256)
  (:broadcast 512)
  (:pixmux 1024)
  (:double-clock 2048)
  (:half-clock 4096))

;;; Enum xcb.XF86VidMode.ClockFlag
(xcb:defenum xf86-vid-mode-clock-flag
  (:programable 1))

;;; Enum xcb.XF86VidMode.Permission
(xcb:defenum xf86-vid-mode-permission
  (:read 1)
  (:write 2))

;;; xcb.XF86VidMode.ModeInfo
(defclass mode-info nil
          ((dotclock :initarg :dotclock :accessor dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :accessor hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :accessor hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :accessor hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :accessor htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :accessor hskew :type (unsigned-byte 32))
           (vdisplay :initarg :vdisplay :accessor vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :accessor vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :accessor vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :accessor vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :accessor privsize :type (unsigned-byte 32))))
(defun encode-mode-info (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((dotclock (slot-value %obj 'dotclock))
         (hdisplay (slot-value %obj 'hdisplay))
         (hsyncstart (slot-value %obj 'hsyncstart))
         (hsyncend (slot-value %obj 'hsyncend))
         (htotal (slot-value %obj 'htotal))
         (hskew (slot-value %obj 'hskew))
         (vdisplay (slot-value %obj 'vdisplay))
         (vsyncstart (slot-value %obj 'vsyncstart))
         (vsyncend (slot-value %obj 'vsyncend))
         (vtotal (slot-value %obj 'vtotal))
         (flags (slot-value %obj 'flags))
         (privsize (slot-value %obj 'privsize)))
    (declare
     (ignorable dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
      vtotal flags privsize))
    (xcb:buffer-write-card32 %buf dotclock)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card32 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 4)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)))
(defun decode-mode-info (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        dotclock
        hdisplay
        hsyncstart
        hsyncend
        htotal
        hskew
        vdisplay
        vsyncstart
        vsyncend
        vtotal
        flags
        privsize)
    (declare
     (ignorable %p dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
      vtotal flags privsize))
    (setf dotclock (xcb:read-card32-at %buf %p %order))
    (setf hdisplay (xcb:read-card16-at %buf (+ %p 4) %order))
    (setf hsyncstart (xcb:read-card16-at %buf (+ %p 6) %order))
    (setf hsyncend (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf htotal (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf hskew (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf vdisplay (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf vsyncstart (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf vsyncend (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf vtotal (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 28) %order))
    (setf privsize (xcb:read-card32-at %buf (+ %p 44) %order))
    (values
     (make-instance 'mode-info :dotclock dotclock :hdisplay hdisplay :hsyncstart hsyncstart
                    :hsyncend hsyncend :htotal htotal :hskew hskew :vdisplay vdisplay :vsyncstart
                    vsyncstart :vsyncend vsyncend :vtotal vtotal :flags flags :privsize privsize)
     (+ %p 48))))

;;; Request xcb.XF86VidMode.QueryVersion
(defun query-version (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-version-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj query-version-request)) (query-version conn))
(defclass query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 16))))
(defun decode-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'query-version-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun query-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-version-reply))

;;; Request xcb.XF86VidMode.GetModeLine
(defun get-mode-line (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-mode-line-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-mode-line-request))
  (get-mode-line conn (slot-value %obj 'screen)))
(defclass get-mode-line-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (dotclock :initarg :dotclock :accessor dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :accessor hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :accessor hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :accessor hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :accessor htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :accessor hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :accessor vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :accessor vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :accessor vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :accessor vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :accessor privsize :type (unsigned-byte 32))
           (private :initarg :private :accessor private :type cl:sequence)))
(defun decode-get-mode-line-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        dotclock
        hdisplay
        hsyncstart
        hsyncend
        htotal
        hskew
        vdisplay
        vsyncstart
        vsyncend
        vtotal
        flags
        privsize
        private)
    (declare
     (ignorable %p response-type sequence length dotclock hdisplay hsyncstart hsyncend htotal hskew
      vdisplay vsyncstart vsyncend vtotal flags privsize private))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf dotclock (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf hdisplay (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf hsyncstart (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf hsyncend (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf htotal (xcb:read-card16-at %buf (+ %p 18) %order))
    (setf hskew (xcb:read-card16-at %buf (+ %p 20) %order))
    (setf vdisplay (xcb:read-card16-at %buf (+ %p 22) %order))
    (setf vsyncstart (xcb:read-card16-at %buf (+ %p 24) %order))
    (setf vsyncend (xcb:read-card16-at %buf (+ %p 26) %order))
    (setf vtotal (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 32) %order))
    (setf privsize (xcb:read-card32-at %buf (+ %p 48) %order))
    (setf %p (+ %p 52))
    (multiple-value-setq (private %p)
      (xcb:read-vector-at %buf %p (min privsize (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (values
     (make-instance 'get-mode-line-reply :response-type response-type :sequence sequence :length
                    length :dotclock dotclock :hdisplay hdisplay :hsyncstart hsyncstart :hsyncend
                    hsyncend :htotal htotal :hskew hskew :vdisplay vdisplay :vsyncstart vsyncstart
                    :vsyncend vsyncend :vtotal vtotal :flags flags :privsize privsize :private
                    private)
     (+ %pos 32 (* 4 length)))))
(defun get-mode-line-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-mode-line-reply))

;;; Request xcb.XF86VidMode.ModModeLine
(defun mod-mode-line
       (conn screen hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend vtotal
        flags private)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn))
         (privsize (cl:length private)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)
    (xcb:buffer-write-octets %buf private :end privsize)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass mod-mode-line-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (hdisplay :initarg :hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :type (unsigned-byte 32))
           (private :initarg :private :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj mod-mode-line-request))
  (mod-mode-line conn (slot-value %obj 'screen) (slot-value %obj 'hdisplay)
   (slot-value %obj 'hsyncstart) (slot-value %obj 'hsyncend) (slot-value %obj 'htotal)
   (slot-value %obj 'hskew) (slot-value %obj 'vdisplay) (slot-value %obj 'vsyncstart)
   (slot-value %obj 'vsyncend) (slot-value %obj 'vtotal) (slot-value %obj 'flags)
   (slot-value %obj 'private)))

;;; Request xcb.XF86VidMode.SwitchMode
(defun switch-mode (conn screen zoom)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-card16 %buf zoom)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass switch-mode-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (zoom :initarg :zoom :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj switch-mode-request))
  (switch-mode conn (slot-value %obj 'screen) (slot-value %obj 'zoom)))

;;; Request xcb.XF86VidMode.GetMonitor
(defun get-monitor (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-monitor-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-monitor-request))
  (get-monitor conn (slot-value %obj 'screen)))
(defclass get-monitor-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (vendor-length :initarg :vendor-length :accessor vendor-length :type (unsigned-byte 8))
           (model-length :initarg :model-length :accessor model-length :type (unsigned-byte 8))
           (num-hsync :initarg :num-hsync :accessor num-hsync :type (unsigned-byte 8))
           (num-vsync :initarg :num-vsync :accessor num-vsync :type (unsigned-byte 8))
           (hsync :initarg :hsync :accessor hsync :type cl:sequence)
           (vsync :initarg :vsync :accessor vsync :type cl:sequence)
           (vendor :initarg :vendor :accessor vendor :type cl:sequence)
           (alignment-pad :initarg :alignment-pad :accessor alignment-pad :type cl:sequence)
           (model :initarg :model :accessor model :type cl:sequence)))
(defun decode-get-monitor-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        vendor-length
        model-length
        num-hsync
        num-vsync
        hsync
        vsync
        vendor
        alignment-pad
        model)
    (declare
     (ignorable %p response-type sequence length vendor-length model-length num-hsync num-vsync
      hsync vsync vendor alignment-pad model))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf vendor-length (xcb:read-card8-at %buf (+ %p 8)))
    (setf model-length (xcb:read-card8-at %buf (+ %p 9)))
    (setf num-hsync (xcb:read-card8-at %buf (+ %p 10)))
    (setf num-vsync (xcb:read-card8-at %buf (+ %p 11)))
    (setf %p (+ %p 32))
    (multiple-value-setq (hsync %p)
      (xcb:read-vector-at %buf %p (min num-hsync (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (multiple-value-setq (vsync %p)
      (xcb:read-vector-at %buf %p (min num-vsync (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (setf vendor
            (xcb:read-string-at %buf %p
             (min vendor-length (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length vendor))
    (multiple-value-setq (alignment-pad %p)
      (xcb:read-vector-at %buf %p
       (min (- (logand (+ vendor-length 3) (lognot 3)) vendor-length)
            (floor (- (+ %pos 32 (* 4 length)) %p) 1))
       %order :card8))
    (setf model
            (xcb:read-string-at %buf %p
             (min model-length (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length model))
    (values
     (make-instance 'get-monitor-reply :response-type response-type :sequence sequence :length
                    length :vendor-length vendor-length :model-length model-length :num-hsync
                    num-hsync :num-vsync num-vsync :hsync hsync :vsync vsync :vendor vendor
                    :alignment-pad alignment-pad :model model)
     (+ %pos 32 (* 4 length)))))
(defun get-monitor-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-monitor-reply))

;;; Request xcb.XF86VidMode.LockModeSwitch
(defun lock-mode-switch (conn screen lock)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-card16 %buf lock)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass lock-mode-switch-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (lock :initarg :lock :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj lock-mode-switch-request))
  (lock-mode-switch conn (slot-value %obj 'screen) (slot-value %obj 'lock)))

;;; Request xcb.XF86VidMode.GetAllModeLines
(defun get-all-mode-lines (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-all-mode-lines-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-all-mode-lines-request))
  (get-all-mode-lines conn (slot-value %obj 'screen)))
(defclass get-all-mode-lines-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (modecount :initarg :modecount :accessor modecount :type (unsigned-byte 32))
           (modeinfo :initarg :modeinfo :accessor modeinfo :type cl:sequence)))
(defun decode-get-all-mode-lines-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length modecount modeinfo)
    (declare (ignorable %p response-type sequence length modecount modeinfo))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf modecount (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (modeinfo %p)
      (xcb:read-struct-vector-at %buf %p (min modecount (floor (- (+ %pos 32 (* 4 length)) %p) 48))
       %order #'decode-mode-info))
    (values
     (make-instance 'get-all-mode-lines-reply :response-type response-type :sequence sequence
                    :length length :modecount modecount :modeinfo modeinfo)
     (+ %pos 32 (* 4 length)))))
(defun get-all-mode-lines-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-all-mode-lines-reply))

;;; Request xcb.XF86VidMode.AddModeLine
(defun add-mode-line
       (conn screen dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
        vtotal flags after-dotclock after-hdisplay after-hsyncstart after-hsyncend after-htotal
        after-hskew after-vdisplay after-vsyncstart after-vsyncend after-vtotal after-flags
        private)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn))
         (privsize (cl:length private)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf dotclock)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)
    (xcb:buffer-write-card32 %buf after-dotclock)
    (xcb:buffer-write-card16 %buf after-hdisplay)
    (xcb:buffer-write-card16 %buf after-hsyncstart)
    (xcb:buffer-write-card16 %buf after-hsyncend)
    (xcb:buffer-write-card16 %buf after-htotal)
    (xcb:buffer-write-card16 %buf after-hskew)
    (xcb:buffer-write-card16 %buf after-vdisplay)
    (xcb:buffer-write-card16 %buf after-vsyncstart)
    (xcb:buffer-write-card16 %buf after-vsyncend)
    (xcb:buffer-write-card16 %buf after-vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf after-flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-octets %buf private :end privsize)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass add-mode-line-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (dotclock :initarg :dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :type (unsigned-byte 32))
           (after-dotclock :initarg :after-dotclock :type dotclock)
           (after-hdisplay :initarg :after-hdisplay :type (unsigned-byte 16))
           (after-hsyncstart :initarg :after-hsyncstart :type (unsigned-byte 16))
           (after-hsyncend :initarg :after-hsyncend :type (unsigned-byte 16))
           (after-htotal :initarg :after-htotal :type (unsigned-byte 16))
           (after-hskew :initarg :after-hskew :type (unsigned-byte 16))
           (after-vdisplay :initarg :after-vdisplay :type (unsigned-byte 16))
           (after-vsyncstart :initarg :after-vsyncstart :type (unsigned-byte 16))
           (after-vsyncend :initarg :after-vsyncend :type (unsigned-byte 16))
           (after-vtotal :initarg :after-vtotal :type (unsigned-byte 16))
           (after-flags :initarg :after-flags :type (unsigned-byte 32))
           (private :initarg :private :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj add-mode-line-request))
  (add-mode-line conn (slot-value %obj 'screen) (slot-value %obj 'dotclock)
   (slot-value %obj 'hdisplay) (slot-value %obj 'hsyncstart) (slot-value %obj 'hsyncend)
   (slot-value %obj 'htotal) (slot-value %obj 'hskew) (slot-value %obj 'vdisplay)
   (slot-value %obj 'vsyncstart) (slot-value %obj 'vsyncend) (slot-value %obj 'vtotal)
   (slot-value %obj 'flags) (slot-value %obj 'after-dotclock) (slot-value %obj 'after-hdisplay)
   (slot-value %obj 'after-hsyncstart) (slot-value %obj 'after-hsyncend)
   (slot-value %obj 'after-htotal) (slot-value %obj 'after-hskew) (slot-value %obj 'after-vdisplay)
   (slot-value %obj 'after-vsyncstart) (slot-value %obj 'after-vsyncend)
   (slot-value %obj 'after-vtotal) (slot-value %obj 'after-flags) (slot-value %obj 'private)))

;;; Request xcb.XF86VidMode.DeleteModeLine
(defun delete-mode-line
       (conn screen dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
        vtotal flags private)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn))
         (privsize (cl:length private)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf dotclock)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)
    (xcb:buffer-write-octets %buf private :end privsize)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass delete-mode-line-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (dotclock :initarg :dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :type (unsigned-byte 32))
           (private :initarg :private :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj delete-mode-line-request))
  (delete-mode-line conn (slot-value %obj 'screen) (slot-value %obj 'dotclock)
   (slot-value %obj 'hdisplay) (slot-value %obj 'hsyncstart) (slot-value %obj 'hsyncend)
   (slot-value %obj 'htotal) (slot-value %obj 'hskew) (slot-value %obj 'vdisplay)
   (slot-value %obj 'vsyncstart) (slot-value %obj 'vsyncend) (slot-value %obj 'vtotal)
   (slot-value %obj 'flags) (slot-value %obj 'private)))

;;; Request xcb.XF86VidMode.ValidateModeLine
(defun validate-mode-line
       (conn screen dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
        vtotal flags private)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn))
         (privsize (cl:length private)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf dotclock)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)
    (xcb:buffer-write-octets %buf private :end privsize)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass validate-mode-line-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (dotclock :initarg :dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :type (unsigned-byte 32))
           (private :initarg :private :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj validate-mode-line-request))
  (validate-mode-line conn (slot-value %obj 'screen) (slot-value %obj 'dotclock)
   (slot-value %obj 'hdisplay) (slot-value %obj 'hsyncstart) (slot-value %obj 'hsyncend)
   (slot-value %obj 'htotal) (slot-value %obj 'hskew) (slot-value %obj 'vdisplay)
   (slot-value %obj 'vsyncstart) (slot-value %obj 'vsyncend) (slot-value %obj 'vtotal)
   (slot-value %obj 'flags) (slot-value %obj 'private)))
(defclass validate-mode-line-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status :initarg :status :accessor status :type (unsigned-byte 32))))
(defun decode-validate-mode-line-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length status)
    (declare (ignorable %p response-type sequence length status))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'validate-mode-line-reply :response-type response-type :sequence sequence
                    :length length :status status)
     (+ %pos 32 (* 4 length)))))
(defun validate-mode-line-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-validate-mode-line-reply))

;;; Request xcb.XF86VidMode.SwitchToMode
(defun switch-to-mode
       (conn screen dotclock hdisplay hsyncstart hsyncend htotal hskew vdisplay vsyncstart vsyncend
        vtotal flags private)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn))
         (privsize (cl:length private)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf screen)
    (xcb:buffer-write-card32 %buf dotclock)
    (xcb:buffer-write-card16 %buf hdisplay)
    (xcb:buffer-write-card16 %buf hsyncstart)
    (xcb:buffer-write-card16 %buf hsyncend)
    (xcb:buffer-write-card16 %buf htotal)
    (xcb:buffer-write-card16 %buf hskew)
    (xcb:buffer-write-card16 %buf vdisplay)
    (xcb:buffer-write-card16 %buf vsyncstart)
    (xcb:buffer-write-card16 %buf vsyncend)
    (xcb:buffer-write-card16 %buf vtotal)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf flags)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-write-card32 %buf privsize)
    (xcb:buffer-write-octets %buf private :end privsize)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass switch-to-mode-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 32))
           (dotclock :initarg :dotclock :type dotclock)
           (hdisplay :initarg :hdisplay :type (unsigned-byte 16))
           (hsyncstart :initarg :hsyncstart :type (unsigned-byte 16))
           (hsyncend :initarg :hsyncend :type (unsigned-byte 16))
           (htotal :initarg :htotal :type (unsigned-byte 16))
           (hskew :initarg :hskew :type (unsigned-byte 16))
           (vdisplay :initarg :vdisplay :type (unsigned-byte 16))
           (vsyncstart :initarg :vsyncstart :type (unsigned-byte 16))
           (vsyncend :initarg :vsyncend :type (unsigned-byte 16))
           (vtotal :initarg :vtotal :type (unsigned-byte 16))
           (flags :initarg :flags :type (unsigned-byte 32))
           (privsize :initarg :privsize :type (unsigned-byte 32))
           (private :initarg :private :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj switch-to-mode-request))
  (switch-to-mode conn (slot-value %obj 'screen) (slot-value %obj 'dotclock)
   (slot-value %obj 'hdisplay) (slot-value %obj 'hsyncstart) (slot-value %obj 'hsyncend)
   (slot-value %obj 'htotal) (slot-value %obj 'hskew) (slot-value %obj 'vdisplay)
   (slot-value %obj 'vsyncstart) (slot-value %obj 'vsyncend) (slot-value %obj 'vtotal)
   (slot-value %obj 'flags) (slot-value %obj 'private)))

;;; Request xcb.XF86VidMode.GetViewPort
(defun get-view-port (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-view-port-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-view-port-request))
  (get-view-port conn (slot-value %obj 'screen)))
(defclass get-view-port-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (x :initarg :x :accessor x :type (unsigned-byte 32))
           (y :initarg :y :accessor y :type (unsigned-byte 32))))
(defun decode-get-view-port-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length x y)
    (declare (ignorable %p response-type sequence length x y))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf x (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf y (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'get-view-port-reply :response-type response-type :sequence sequence :length
                    length :x x :y y)
     (+ %pos 32 (* 4 length)))))
(defun get-view-port-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-view-port-reply))

;;; Request xcb.XF86VidMode.SetViewPort
(defun set-view-port (conn screen x y)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf x)
    (xcb:buffer-write-card32 %buf y)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-view-port-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (x :initarg :x :type (unsigned-byte 32)) (y :initarg :y :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj set-view-port-request))
  (set-view-port conn (slot-value %obj 'screen) (slot-value %obj 'x) (slot-value %obj 'y)))

;;; Request xcb.XF86VidMode.GetDotClocks
(defun get-dot-clocks (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-dot-clocks-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-dot-clocks-request))
  (get-dot-clocks conn (slot-value %obj 'screen)))
(defclass get-dot-clocks-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (flags :initarg :flags :accessor flags :type (unsigned-byte 32))
           (clocks :initarg :clocks :accessor clocks :type (unsigned-byte 32))
           (maxclocks :initarg :maxclocks :accessor maxclocks :type (unsigned-byte 32))
           (clock :initarg :clock :accessor clock :type cl:sequence)))
(defun decode-get-dot-clocks-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length flags clocks maxclocks clock)
    (declare (ignorable %p response-type sequence length flags clocks maxclocks clock))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf flags (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf clocks (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf maxclocks (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (clock %p)
      (xcb:read-vector-at %buf %p
       (min (* (- 1 (logand flags 1)) clocks) (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'get-dot-clocks-reply :response-type response-type :sequence sequence :length
                    length :flags flags :clocks clocks :maxclocks maxclocks :clock clock)
     (+ %pos 32 (* 4 length)))))
(defun get-dot-clocks-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-dot-clocks-reply))

;;; Request xcb.XF86VidMode.SetClientVersion
(defun set-client-version (conn major minor)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf major)
    (xcb:buffer-write-card16 %buf minor)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-client-version-request (xcb:request)
          ((major :initarg :major :type (unsigned-byte 16))
           (minor :initarg :minor :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj set-client-version-request))
  (set-client-version conn (slot-value %obj 'major) (slot-value %obj 'minor)))

;;; Request xcb.XF86VidMode.SetGamma
(defun set-gamma (conn screen red green blue)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-card32 %buf red)
    (xcb:buffer-write-card32 %buf green)
    (xcb:buffer-write-card32 %buf blue)
    (xcb:buffer-write-padding %buf 12)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-gamma-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (red :initarg :red :type (unsigned-byte 32))
           (green :initarg :green :type (unsigned-byte 32))
           (blue :initarg :blue :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj set-gamma-request))
  (set-gamma conn (slot-value %obj 'screen) (slot-value %obj 'red) (slot-value %obj 'green)
   (slot-value %obj 'blue)))

;;; Request xcb.XF86VidMode.GetGamma
(defun get-gamma (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 26)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-gamma-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-gamma-request))
  (get-gamma conn (slot-value %obj 'screen)))
(defclass get-gamma-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (red :initarg :red :accessor red :type (unsigned-byte 32))
           (green :initarg :green :accessor green :type (unsigned-byte 32))
           (blue :initarg :blue :accessor blue :type (unsigned-byte 32))))
(defun decode-get-gamma-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length red green blue)
    (declare (ignorable %p response-type sequence length red green blue))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf red (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf green (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf blue (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'get-gamma-reply :response-type response-type :sequence sequence :length length
                    :red red :green green :blue blue)
     (+ %pos 32 (* 4 length)))))
(defun get-gamma-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-gamma-reply))

;;; Request xcb.XF86VidMode.GetGammaRamp
(defun get-gamma-ramp (conn screen size)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-card16 %buf size)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-gamma-ramp-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (size :initarg :size :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-gamma-ramp-request))
  (get-gamma-ramp conn (slot-value %obj 'screen) (slot-value %obj 'size)))
(defclass get-gamma-ramp-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 16))
           (red :initarg :red :accessor red :type cl:sequence)
           (green :initarg :green :accessor green :type cl:sequence)
           (blue :initarg :blue :accessor blue :type cl:sequence)))
(defun decode-get-gamma-ramp-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length size red green blue)
    (declare (ignorable %p response-type sequence length size red green blue))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf size (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (red %p)
      (xcb:read-vector-at %buf %p
       (min (logand (+ size 1) (lognot 1)) (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (multiple-value-setq (green %p)
      (xcb:read-vector-at %buf %p
       (min (logand (+ size 1) (lognot 1)) (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (multiple-value-setq (blue %p)
      (xcb:read-vector-at %buf %p
       (min (logand (+ size 1) (lognot 1)) (floor (- (+ %pos 32 (* 4 length)) %p) 2)) %order
       :card16))
    (values
     (make-instance 'get-gamma-ramp-reply :response-type response-type :sequence sequence :length
                    length :size size :red red :green green :blue blue)
     (+ %pos 32 (* 4 length)))))
(defun get-gamma-ramp-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-gamma-ramp-reply))

;;; Request xcb.XF86VidMode.SetGammaRamp
(defun set-gamma-ramp (conn screen size red green blue)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-card16 %buf size)
    (xcb:buffer-write-list %buf red (logand (+ size 1) (lognot 1)) #'xcb:buffer-write-card16)
    (xcb:buffer-write-list %buf green (logand (+ size 1) (lognot 1)) #'xcb:buffer-write-card16)
    (xcb:buffer-write-list %buf blue (logand (+ size 1) (lognot 1)) #'xcb:buffer-write-card16)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-gamma-ramp-request (xcb:request)
          ((screen :initarg :screen :type (unsigned-byte 16))
           (size :initarg :size :type (unsigned-byte 16)) (red :initarg :red :type cl:sequence)
           (green :initarg :green :type cl:sequence) (blue :initarg :blue :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj set-gamma-ramp-request))
  (set-gamma-ramp conn (slot-value %obj 'screen) (slot-value %obj 'size) (slot-value %obj 'red)
   (slot-value %obj 'green) (slot-value %obj 'blue)))

;;; Request xcb.XF86VidMode.GetGammaRampSize
(defun get-gamma-ramp-size (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-gamma-ramp-size-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-gamma-ramp-size-request))
  (get-gamma-ramp-size conn (slot-value %obj 'screen)))
(defclass get-gamma-ramp-size-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (size :initarg :size :accessor size :type (unsigned-byte 16))))
(defun decode-get-gamma-ramp-size-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length size)
    (declare (ignorable %p response-type sequence length size))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf size (xcb:read-card16-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-gamma-ramp-size-reply :response-type response-type :sequence sequence
                    :length length :size size)
     (+ %pos 32 (* 4 length)))))
(defun get-gamma-ramp-size-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-gamma-ramp-size-reply))

;;; Request xcb.XF86VidMode.GetPermissions
(defun get-permissions (conn screen)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XF86VIDMODE"))
         (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf screen)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-permissions-request (xcb:request-with-reply)
          ((screen :initarg :screen :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-permissions-request))
  (get-permissions conn (slot-value %obj 'screen)))
(defclass get-permissions-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (permissions :initarg :permissions :accessor permissions :type (unsigned-byte 32))))
(defun decode-get-permissions-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length permissions)
    (declare (ignorable %p response-type sequence length permissions))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf permissions (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-permissions-reply :response-type response-type :sequence sequence :length
                    length :permissions permissions)
     (+ %pos 32 (* 4 length)))))
(defun get-permissions-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-get-permissions-reply))

;;; Error xcb.XF86VidMode.BadClock (0)
(defclass bad-clock-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-clock-error (%buf %pos %order)
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
     (make-instance 'bad-clock-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 0 #'decode-bad-clock-error)

;;; Error xcb.XF86VidMode.BadHTimings (1)
(defclass bad-h-timings-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-h-timings-error (%buf %pos %order)
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
     (make-instance 'bad-h-timings-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 1 #'decode-bad-h-timings-error)

;;; Error xcb.XF86VidMode.BadVTimings (2)
(defclass bad-v-timings-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-v-timings-error (%buf %pos %order)
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
     (make-instance 'bad-v-timings-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 2 #'decode-bad-v-timings-error)

;;; Error xcb.XF86VidMode.ModeUnsuitable (3)
(defclass mode-unsuitable-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-mode-unsuitable-error (%buf %pos %order)
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
     (make-instance 'mode-unsuitable-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 3 #'decode-mode-unsuitable-error)

;;; Error xcb.XF86VidMode.ExtensionDisabled (4)
(defclass extension-disabled-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-extension-disabled-error (%buf %pos %order)
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
     (make-instance 'extension-disabled-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 4 #'decode-extension-disabled-error)

;;; Error xcb.XF86VidMode.ClientNotLocal (5)
(defclass client-not-local-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-client-not-local-error (%buf %pos %order)
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
     (make-instance 'client-not-local-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 5 #'decode-client-not-local-error)

;;; Error xcb.XF86VidMode.ZoomLocked (6)
(defclass zoom-locked-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-zoom-locked-error (%buf %pos %order)
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
     (make-instance 'zoom-locked-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XF86VIDMODE" 6 #'decode-zoom-locked-error)
