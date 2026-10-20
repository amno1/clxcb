;;; Generated from dpms.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-DPMS
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:capable
   #:capable-reply
   #:capable-request
   #:decode-capable-reply
   #:decode-get-timeouts-reply
   #:decode-get-version-reply
   #:decode-info-notify
   #:decode-info-reply
   #:disable
   #:disable-request
   #:enable
   #:enable-request
   #:event-type
   #:extension
   #:force-level
   #:force-level-request
   #:get-timeouts
   #:get-timeouts-reply
   #:get-timeouts-request
   #:get-version
   #:get-version-reply
   #:get-version-request
   #:info
   #:info-notify
   #:info-reply
   #:info-request
   #:length
   #:off-timeout
   #:power-level
   #:response-type
   #:select-input
   #:select-input-request
   #:sequence
   #:server-major-version
   #:server-minor-version
   #:set-timeouts
   #:set-timeouts-request
   #:standby-timeout
   #:state
   #:suspend-timeout
   #:timestamp))

(in-package #:XCB-DPMS)

(xcb:register-extension-xname "XCB-DPMS" "DPMS")

;;; Request xcb.DPMS.GetVersion
(defun get-version (conn client-major-version client-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf client-major-version)
    (xcb:buffer-write-card16 %buf client-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-version-request (xcb:request-with-reply)
          ((client-major-version :initarg :client-major-version :type (unsigned-byte 16))
           (client-minor-version :initarg :client-minor-version :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj get-version-request))
  (get-version conn (slot-value %obj 'client-major-version)
   (slot-value %obj 'client-minor-version)))
(defclass get-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (server-major-version :initarg :server-major-version :accessor server-major-version
            :type (unsigned-byte 16))
           (server-minor-version :initarg :server-minor-version :accessor server-minor-version
            :type (unsigned-byte 16))))
(defun decode-get-version-reply (%buf %pos %order)
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
     (make-instance 'get-version-reply :response-type response-type :sequence sequence :length
                    length :server-major-version server-major-version :server-minor-version
                    server-minor-version)
     (+ %pos 32 (* 4 length)))))
(defun get-version-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-version-reply))

;;; Request xcb.DPMS.Capable
(defun capable (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass capable-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj capable-request)) (capable conn))
(defclass capable-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (capable :initarg :capable :type (or boolean (unsigned-byte 8)))))
(defun decode-capable-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length capable)
    (declare (ignorable %p response-type sequence length capable))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf capable (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'capable-reply :response-type response-type :sequence sequence :length length
                    :capable capable)
     (+ %pos 32 (* 4 length)))))
(defun capable-reply (conn cookie) (xcb:read-reply conn cookie #'decode-capable-reply))

;;; Request xcb.DPMS.GetTimeouts
(defun get-timeouts (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-timeouts-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj get-timeouts-request)) (get-timeouts conn))
(defclass get-timeouts-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (standby-timeout :initarg :standby-timeout :accessor standby-timeout :type
            (unsigned-byte 16))
           (suspend-timeout :initarg :suspend-timeout :accessor suspend-timeout :type
            (unsigned-byte 16))
           (off-timeout :initarg :off-timeout :accessor off-timeout :type (unsigned-byte 16))))
(defun decode-get-timeouts-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length standby-timeout suspend-timeout off-timeout)
    (declare
     (ignorable %p response-type sequence length standby-timeout suspend-timeout off-timeout))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf standby-timeout (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf suspend-timeout (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf off-timeout (xcb:read-card16-at %buf (+ %p 12) %order))
    (values
     (make-instance 'get-timeouts-reply :response-type response-type :sequence sequence :length
                    length :standby-timeout standby-timeout :suspend-timeout suspend-timeout
                    :off-timeout off-timeout)
     (+ %pos 32 (* 4 length)))))
(defun get-timeouts-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-timeouts-reply))

;;; Request xcb.DPMS.SetTimeouts
(defun set-timeouts (conn standby-timeout suspend-timeout off-timeout)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf standby-timeout)
    (xcb:buffer-write-card16 %buf suspend-timeout)
    (xcb:buffer-write-card16 %buf off-timeout)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-timeouts-request (xcb:request)
          ((standby-timeout :initarg :standby-timeout :type (unsigned-byte 16))
           (suspend-timeout :initarg :suspend-timeout :type (unsigned-byte 16))
           (off-timeout :initarg :off-timeout :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj set-timeouts-request))
  (set-timeouts conn (slot-value %obj 'standby-timeout) (slot-value %obj 'suspend-timeout)
   (slot-value %obj 'off-timeout)))

;;; Request xcb.DPMS.Enable
(defun enable (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass enable-request (xcb:request) nil)
(defmethod xcb:send-request (conn (%obj enable-request)) (enable conn))

;;; Request xcb.DPMS.Disable
(defun disable (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass disable-request (xcb:request) nil)
(defmethod xcb:send-request (conn (%obj disable-request)) (disable conn))

;;; Enum xcb.DPMS.DPMSMode
(xcb:defenum dpms-mode
  (:on 0)
  (:standby 1)
  (:suspend 2)
  (:off 3))

;;; Request xcb.DPMS.ForceLevel
(defun force-level (conn power-level)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card16 %buf power-level)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass force-level-request (xcb:request)
          ((power-level :initarg :power-level :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj force-level-request))
  (force-level conn (slot-value %obj 'power-level)))

;;; Request xcb.DPMS.Info
(defun info (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass info-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj info-request)) (info conn))
(defclass info-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (power-level :initarg :power-level :accessor power-level :type (unsigned-byte 16))
           (state :initarg :state :accessor state :type (or boolean (unsigned-byte 8)))))
(defun decode-info-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length power-level state)
    (declare (ignorable %p response-type sequence length power-level state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf power-level (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf state (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'info-reply :response-type response-type :sequence sequence :length length
                    :power-level power-level :state state)
     (+ %pos 32 (* 4 length)))))
(defun info-reply (conn cookie) (xcb:read-reply conn cookie #'decode-info-reply))

;;; Enum xcb.DPMS.EventMask
(xcb:defenum dpms-event-mask
  (:info-notify 1))

;;; Request xcb.DPMS.SelectInput
(defun select-input (conn event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DPMS")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass select-input-request (xcb:request)
          ((event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj select-input-request))
  (select-input conn (slot-value %obj 'event-mask)))

;;; Event xcb.DPMS.InfoNotify (0)
(defclass info-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (extension :initarg :extension :accessor extension :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-type :initarg :event-type :accessor event-type :type (unsigned-byte 16))
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (power-level :initarg :power-level :accessor power-level :type (unsigned-byte 16))
           (state :initarg :state :accessor state :type (or boolean (unsigned-byte 8)))))
(defun decode-info-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type extension sequence length event-type timestamp power-level state)
    (declare
     (ignorable %p response-type extension sequence length event-type timestamp power-level state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf extension (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-type (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf power-level (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf state (xcb:read-card8-at %buf (+ %p 18)))
    (values
     (make-instance 'info-notify :response-type response-type :extension extension :sequence
                    sequence :length length :event-type event-type :timestamp timestamp
                    :power-level power-level :state state)
     (+ %pos 32 (* 4 length)))))
(xcb:register-extension-ge-event-decoder "XCB-DPMS" 0 #'decode-info-notify)
