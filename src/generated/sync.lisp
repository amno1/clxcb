;;; Generated from sync.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-SYNC
  (:use #:cl)
  (:shadow #:COUNT #:LENGTH #:SEQUENCE)
  (:export
   #:alarm
   #:alarm-error
   #:alarm-notify
   #:alarm-value
   #:await
   #:await-fence
   #:await-fence-request
   #:await-request
   #:bad-alarm
   #:bad-counter
   #:change-alarm
   #:change-alarm-request
   #:change-counter
   #:change-counter-request
   #:count
   #:counter
   #:counter-error
   #:counter-notify
   #:counter-value
   #:counters
   #:counters-len
   #:create-alarm
   #:create-alarm-request
   #:create-counter
   #:create-counter-request
   #:create-fence
   #:create-fence-request
   #:decode-alarm-error
   #:decode-alarm-notify
   #:decode-counter-error
   #:decode-counter-notify
   #:decode-get-priority-reply
   #:decode-initialize-reply
   #:decode-int64
   #:decode-list-system-counters-reply
   #:decode-query-alarm-reply
   #:decode-query-counter-reply
   #:decode-query-fence-reply
   #:decode-systemcounter
   #:decode-trigger
   #:decode-waitcondition
   #:delta
   #:destroy-alarm
   #:destroy-alarm-request
   #:destroy-counter
   #:destroy-counter-request
   #:destroy-fence
   #:destroy-fence-request
   #:destroyed
   #:encode-alarm-notify
   #:encode-counter-notify
   #:encode-int64
   #:encode-systemcounter
   #:encode-trigger
   #:encode-waitcondition
   #:error-code
   #:event-threshold
   #:events
   #:fence
   #:get-priority
   #:get-priority-reply
   #:get-priority-request
   #:hi
   #:initialize
   #:initialize-reply
   #:initialize-request
   #:int64
   #:kind
   #:length
   #:list-system-counters
   #:list-system-counters-reply
   #:list-system-counters-request
   #:lo
   #:major-opcode
   #:major-version
   #:minor-opcode
   #:minor-version
   #:name
   #:name-len
   #:priority
   #:query-alarm
   #:query-alarm-reply
   #:query-alarm-request
   #:query-counter
   #:query-counter-reply
   #:query-counter-request
   #:query-fence
   #:query-fence-reply
   #:query-fence-request
   #:reset-fence
   #:reset-fence-request
   #:resolution
   #:response-type
   #:sequence
   #:set-counter
   #:set-counter-request
   #:set-priority
   #:set-priority-request
   #:state
   #:systemcounter
   #:test-type
   #:timestamp
   #:trigger
   #:trigger-fence
   #:trigger-fence-request
   #:triggered
   #:wait-type
   #:wait-value
   #:waitcondition))

(in-package #:XCB-SYNC)

(xcb:register-extension-xname "XCB-SYNC" "SYNC")
(deftype alarm () '(unsigned-byte 32))

;;; Enum xcb.Sync.ALARMSTATE
(xcb:defenum sync-alarmstate
  (:active 0)
  (:inactive 1)
  (:destroyed 2))
(deftype counter () '(unsigned-byte 32))
(deftype fence () '(unsigned-byte 32))

;;; Enum xcb.Sync.TESTTYPE
(xcb:defenum sync-testtype
  (:positive-transition 0)
  (:negative-transition 1)
  (:positive-comparison 2)
  (:negative-comparison 3))

;;; Enum xcb.Sync.VALUETYPE
(xcb:defenum sync-valuetype
  (:absolute 0)
  (:relative 1))

;;; Enum xcb.Sync.CA
(xcb:defenum sync-ca
  (:counter 1)
  (:value-type 2)
  (:value 4)
  (:test-type 8)
  (:delta 16)
  (:events 32))

;;; xcb.Sync.INT64
(defclass int64 nil
          ((hi :initarg :hi :accessor hi :type (signed-byte 32))
           (lo :initarg :lo :accessor lo :type (unsigned-byte 32))))
(defun encode-int64 (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((hi (slot-value %obj 'hi)) (lo (slot-value %obj 'lo)))
    (declare (ignorable hi lo))
    (xcb:buffer-write-card32 %buf hi)
    (xcb:buffer-write-card32 %buf lo)))
(defun decode-int64 (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) hi lo)
    (declare (ignorable %p hi lo))
    (setf hi (xcb:read-int32-at %buf %p %order))
    (setf lo (xcb:read-card32-at %buf (+ %p 4) %order))
    (values (make-instance 'int64 :hi hi :lo lo) (+ %p 8))))

;;; xcb.Sync.SYSTEMCOUNTER
(defclass systemcounter nil
          ((counter :initarg :counter :accessor counter :type counter)
           (resolution :initarg :resolution :accessor resolution :type int64)
           (name-len :initarg :name-len :accessor name-len :type (unsigned-byte 16))
           (name :initarg :name :accessor name :type cl:sequence)))
(defun encode-systemcounter (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((counter (slot-value %obj 'counter))
         (resolution (slot-value %obj 'resolution))
         (name (slot-value %obj 'name))
         (name-len (cl:length name)))
    (declare (ignorable counter resolution name name-len))
    (xcb:buffer-write-card32 %buf counter)
    (encode-int64 %buf resolution)
    (xcb:buffer-write-card16 %buf name-len)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-systemcounter (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) counter resolution name-len name)
    (declare (ignorable %p counter resolution name-len name))
    (setf counter (xcb:read-card32-at %buf %p %order))
    (setf resolution (decode-int64 %buf (+ %p 4) %order))
    (setf name-len (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf %p (+ %p 14))
    (setf name (xcb:read-string-at %buf %p name-len))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'systemcounter :counter counter :resolution resolution :name-len name-len :name
                    name)
     %p)))

;;; xcb.Sync.TRIGGER
(defclass trigger nil
          ((counter :initarg :counter :accessor counter :type counter)
           (wait-type :initarg :wait-type :accessor wait-type :type (unsigned-byte 32))
           (wait-value :initarg :wait-value :accessor wait-value :type int64)
           (test-type :initarg :test-type :accessor test-type :type (unsigned-byte 32))))
(defun encode-trigger (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((counter (slot-value %obj 'counter))
         (wait-type (slot-value %obj 'wait-type))
         (wait-value (slot-value %obj 'wait-value))
         (test-type (slot-value %obj 'test-type)))
    (declare (ignorable counter wait-type wait-value test-type))
    (xcb:buffer-write-card32 %buf counter)
    (xcb:buffer-write-card32 %buf wait-type)
    (encode-int64 %buf wait-value)
    (xcb:buffer-write-card32 %buf test-type)))
(defun decode-trigger (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) counter wait-type wait-value test-type)
    (declare (ignorable %p counter wait-type wait-value test-type))
    (setf counter (xcb:read-card32-at %buf %p %order))
    (setf wait-type (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf wait-value (decode-int64 %buf (+ %p 8) %order))
    (setf test-type (xcb:read-card32-at %buf (+ %p 16) %order))
    (values
     (make-instance 'trigger :counter counter :wait-type wait-type :wait-value wait-value
                    :test-type test-type)
     (+ %p 20))))

;;; xcb.Sync.WAITCONDITION
(defclass waitcondition nil
          ((trigger :initarg :trigger :accessor trigger :type trigger)
           (event-threshold :initarg :event-threshold :accessor event-threshold :type int64)))
(defun encode-waitcondition (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((trigger (slot-value %obj 'trigger)) (event-threshold (slot-value %obj 'event-threshold)))
    (declare (ignorable trigger event-threshold))
    (encode-trigger %buf trigger)
    (encode-int64 %buf event-threshold)))
(defun decode-waitcondition (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) trigger event-threshold)
    (declare (ignorable %p trigger event-threshold))
    (setf trigger (decode-trigger %buf %p %order))
    (setf event-threshold (decode-int64 %buf (+ %p 20) %order))
    (values (make-instance 'waitcondition :trigger trigger :event-threshold event-threshold)
            (+ %p 28))))

;;; Error xcb.Sync.Counter (0)
(defclass counter-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-counter :initarg :bad-counter :accessor bad-counter :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-counter-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-counter minor-opcode major-opcode)
    (declare
     (ignorable %p response-type error-code sequence bad-counter minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-counter (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'counter-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-counter bad-counter :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-SYNC" 0 #'decode-counter-error)

;;; Error xcb.Sync.Alarm (1)
(defclass alarm-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-alarm :initarg :bad-alarm :accessor bad-alarm :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-alarm-error (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type error-code sequence bad-alarm minor-opcode major-opcode)
    (declare (ignorable %p response-type error-code sequence bad-alarm minor-opcode major-opcode))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf error-code (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf bad-alarm (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf minor-opcode (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf major-opcode (xcb:read-card8-at %buf (+ %p 10)))
    (values
     (make-instance 'alarm-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-alarm bad-alarm :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-SYNC" 1 #'decode-alarm-error)

;;; Request xcb.Sync.Initialize
(defun initialize (conn desired-major-version desired-minor-version)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf desired-major-version)
    (xcb:buffer-write-card8 %buf desired-minor-version)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass initialize-request (xcb:request-with-reply)
          ((desired-major-version :initarg :desired-major-version :type (unsigned-byte 8))
           (desired-minor-version :initarg :desired-minor-version :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj initialize-request))
  (initialize conn (slot-value %obj 'desired-major-version)
   (slot-value %obj 'desired-minor-version)))
(defclass initialize-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 8))
           (minor-version :initarg :minor-version :accessor minor-version :type (unsigned-byte 8))))
(defun decode-initialize-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card8-at %buf (+ %p 8)))
    (setf minor-version (xcb:read-card8-at %buf (+ %p 9)))
    (values
     (make-instance 'initialize-reply :response-type response-type :sequence sequence :length
                    length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun initialize-reply (conn cookie) (xcb:read-reply conn cookie #'decode-initialize-reply))

;;; Request xcb.Sync.ListSystemCounters
(defun list-system-counters (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass list-system-counters-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj list-system-counters-request)) (list-system-counters conn))
(defclass list-system-counters-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (counters-len :initarg :counters-len :accessor counters-len :type (unsigned-byte 32))
           (counters :initarg :counters :accessor counters :type cl:sequence)))
(defun decode-list-system-counters-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length counters-len counters)
    (declare (ignorable %p response-type sequence length counters-len counters))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf counters-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (counters %p)
      (xcb:read-struct-vector-at %buf %p (min counters-len (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-systemcounter))
    (values
     (make-instance 'list-system-counters-reply :response-type response-type :sequence sequence
                    :length length :counters-len counters-len :counters counters)
     (+ %pos 32 (* 4 length)))))
(defun list-system-counters-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-list-system-counters-reply))

;;; Request xcb.Sync.CreateCounter
(defun create-counter (conn id initial-value)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf id)
    (encode-int64 %buf initial-value)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-counter-request (xcb:request)
          ((id :initarg :id :type counter) (initial-value :initarg :initial-value :type int64)))
(defmethod xcb:send-request (conn (%obj create-counter-request))
  (create-counter conn (slot-value %obj 'id) (slot-value %obj 'initial-value)))

;;; Request xcb.Sync.DestroyCounter
(defun destroy-counter (conn counter)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf counter)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-counter-request (xcb:request) ((counter :initarg :counter :type counter)))
(defmethod xcb:send-request (conn (%obj destroy-counter-request))
  (destroy-counter conn (slot-value %obj 'counter)))

;;; Request xcb.Sync.QueryCounter
(defun query-counter (conn counter)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf counter)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-counter-request (xcb:request-with-reply)
          ((counter :initarg :counter :type counter)))
(defmethod xcb:send-request (conn (%obj query-counter-request))
  (query-counter conn (slot-value %obj 'counter)))
(defclass query-counter-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (counter-value :initarg :counter-value :accessor counter-value :type int64)))
(defun decode-query-counter-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length counter-value)
    (declare (ignorable %p response-type sequence length counter-value))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf counter-value (decode-int64 %buf (+ %p 8) %order))
    (values
     (make-instance 'query-counter-reply :response-type response-type :sequence sequence :length
                    length :counter-value counter-value)
     (+ %pos 32 (* 4 length)))))
(defun query-counter-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-counter-reply))

;;; Request xcb.Sync.Await
(defun await (conn wait-list)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-list %buf wait-list nil #'encode-waitcondition)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass await-request (xcb:request) ((wait-list :initarg :wait-list :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj await-request)) (await conn (slot-value %obj 'wait-list)))

;;; Request xcb.Sync.ChangeCounter
(defun change-counter (conn counter amount)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf counter)
    (encode-int64 %buf amount)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-counter-request (xcb:request)
          ((counter :initarg :counter :type counter) (amount :initarg :amount :type int64)))
(defmethod xcb:send-request (conn (%obj change-counter-request))
  (change-counter conn (slot-value %obj 'counter) (slot-value %obj 'amount)))

;;; Request xcb.Sync.SetCounter
(defun set-counter (conn counter value)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf counter)
    (encode-int64 %buf value)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-counter-request (xcb:request)
          ((counter :initarg :counter :type counter) (value :initarg :value :type int64)))
(defmethod xcb:send-request (conn (%obj set-counter-request))
  (set-counter conn (slot-value %obj 'counter) (slot-value %obj 'value)))

;;; Request xcb.Sync.CreateAlarm
(defun create-alarm (conn id value-mask &key counter value-type value test-type delta events)
  (xcb:check-value-mask 'create-alarm value-mask (1 :counter counter nil)
   (2 :value-type value-type nil) (4 :value value nil) (8 :test-type test-type nil)
   (16 :delta delta nil) (32 :events events nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf counter))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf value-type))
      (when (logtest %mask 4) (encode-int64 %buf value))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf test-type))
      (when (logtest %mask 16) (encode-int64 %buf delta))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf events)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-alarm-request (xcb:request)
          ((id :initarg :id :type alarm) (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (counter :initarg :counter :type counter)
           (value-type :initarg :value-type :type (unsigned-byte 32))
           (value :initarg :value :type int64)
           (test-type :initarg :test-type :type (unsigned-byte 32))
           (delta :initarg :delta :type int64) (events :initarg :events :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj create-alarm-request))
  (apply #'create-alarm conn (slot-value %obj 'id) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'counter) (list :counter (slot-value %obj 'counter)))
                (when (slot-boundp %obj 'value-type)
                  (list :value-type (slot-value %obj 'value-type)))
                (when (slot-boundp %obj 'value) (list :value (slot-value %obj 'value)))
                (when (slot-boundp %obj 'test-type) (list :test-type (slot-value %obj 'test-type)))
                (when (slot-boundp %obj 'delta) (list :delta (slot-value %obj 'delta)))
                (when (slot-boundp %obj 'events) (list :events (slot-value %obj 'events))))))

;;; Request xcb.Sync.ChangeAlarm
(defun change-alarm (conn id value-mask &key counter value-type value test-type delta events)
  (xcb:check-value-mask 'change-alarm value-mask (1 :counter counter nil)
   (2 :value-type value-type nil) (4 :value value nil) (8 :test-type test-type nil)
   (16 :delta delta nil) (32 :events events nil))
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card32 %buf value-mask)
    (let ((%mask value-mask))
      (when (logtest %mask 1) (xcb:buffer-write-card32 %buf counter))
      (when (logtest %mask 2) (xcb:buffer-write-card32 %buf value-type))
      (when (logtest %mask 4) (encode-int64 %buf value))
      (when (logtest %mask 8) (xcb:buffer-write-card32 %buf test-type))
      (when (logtest %mask 16) (encode-int64 %buf delta))
      (when (logtest %mask 32) (xcb:buffer-write-card32 %buf events)))
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass change-alarm-request (xcb:request)
          ((id :initarg :id :type alarm) (value-mask :initarg :value-mask :type (unsigned-byte 32))
           (counter :initarg :counter :type counter)
           (value-type :initarg :value-type :type (unsigned-byte 32))
           (value :initarg :value :type int64)
           (test-type :initarg :test-type :type (unsigned-byte 32))
           (delta :initarg :delta :type int64) (events :initarg :events :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj change-alarm-request))
  (apply #'change-alarm conn (slot-value %obj 'id) (slot-value %obj 'value-mask)
         (nconc (when (slot-boundp %obj 'counter) (list :counter (slot-value %obj 'counter)))
                (when (slot-boundp %obj 'value-type)
                  (list :value-type (slot-value %obj 'value-type)))
                (when (slot-boundp %obj 'value) (list :value (slot-value %obj 'value)))
                (when (slot-boundp %obj 'test-type) (list :test-type (slot-value %obj 'test-type)))
                (when (slot-boundp %obj 'delta) (list :delta (slot-value %obj 'delta)))
                (when (slot-boundp %obj 'events) (list :events (slot-value %obj 'events))))))

;;; Request xcb.Sync.DestroyAlarm
(defun destroy-alarm (conn alarm)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf alarm)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-alarm-request (xcb:request) ((alarm :initarg :alarm :type alarm)))
(defmethod xcb:send-request (conn (%obj destroy-alarm-request))
  (destroy-alarm conn (slot-value %obj 'alarm)))

;;; Request xcb.Sync.QueryAlarm
(defun query-alarm (conn alarm)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf alarm)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-alarm-request (xcb:request-with-reply) ((alarm :initarg :alarm :type alarm)))
(defmethod xcb:send-request (conn (%obj query-alarm-request))
  (query-alarm conn (slot-value %obj 'alarm)))
(defclass query-alarm-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (trigger :initarg :trigger :accessor trigger :type trigger)
           (delta :initarg :delta :accessor delta :type int64)
           (events :initarg :events :accessor events :type (or boolean (unsigned-byte 8)))
           (state :initarg :state :accessor state :type (unsigned-byte 8))))
(defun decode-query-alarm-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length trigger delta events state)
    (declare (ignorable %p response-type sequence length trigger delta events state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf trigger (decode-trigger %buf (+ %p 8) %order))
    (setf delta (decode-int64 %buf (+ %p 28) %order))
    (setf events (xcb:read-card8-at %buf (+ %p 36)))
    (setf state (xcb:read-card8-at %buf (+ %p 37)))
    (values
     (make-instance 'query-alarm-reply :response-type response-type :sequence sequence :length
                    length :trigger trigger :delta delta :events events :state state)
     (+ %pos 32 (* 4 length)))))
(defun query-alarm-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-alarm-reply))

;;; Request xcb.Sync.SetPriority
(defun set-priority (conn id priority)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-write-card32 %buf priority)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass set-priority-request (xcb:request)
          ((id :initarg :id :type (unsigned-byte 32))
           (priority :initarg :priority :type (signed-byte 32))))
(defmethod xcb:send-request (conn (%obj set-priority-request))
  (set-priority conn (slot-value %obj 'id) (slot-value %obj 'priority)))

;;; Request xcb.Sync.GetPriority
(defun get-priority (conn id)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf id)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass get-priority-request (xcb:request-with-reply)
          ((id :initarg :id :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj get-priority-request))
  (get-priority conn (slot-value %obj 'id)))
(defclass get-priority-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (priority :initarg :priority :accessor priority :type (signed-byte 32))))
(defun decode-get-priority-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length priority)
    (declare (ignorable %p response-type sequence length priority))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf priority (xcb:read-int32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'get-priority-reply :response-type response-type :sequence sequence :length
                    length :priority priority)
     (+ %pos 32 (* 4 length)))))
(defun get-priority-reply (conn cookie) (xcb:read-reply conn cookie #'decode-get-priority-reply))

;;; Request xcb.Sync.CreateFence
(defun create-fence (conn drawable fence initially-triggered)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-write-bool %buf initially-triggered)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-fence-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable) (fence :initarg :fence :type fence)
           (initially-triggered :initarg :initially-triggered :type
            (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj create-fence-request))
  (create-fence conn (slot-value %obj 'drawable) (slot-value %obj 'fence)
   (slot-value %obj 'initially-triggered)))

;;; Request xcb.Sync.TriggerFence
(defun trigger-fence (conn fence)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass trigger-fence-request (xcb:request) ((fence :initarg :fence :type fence)))
(defmethod xcb:send-request (conn (%obj trigger-fence-request))
  (trigger-fence conn (slot-value %obj 'fence)))

;;; Request xcb.Sync.ResetFence
(defun reset-fence (conn fence)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass reset-fence-request (xcb:request) ((fence :initarg :fence :type fence)))
(defmethod xcb:send-request (conn (%obj reset-fence-request))
  (reset-fence conn (slot-value %obj 'fence)))

;;; Request xcb.Sync.DestroyFence
(defun destroy-fence (conn fence)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-fence-request (xcb:request) ((fence :initarg :fence :type fence)))
(defmethod xcb:send-request (conn (%obj destroy-fence-request))
  (destroy-fence conn (slot-value %obj 'fence)))

;;; Request xcb.Sync.QueryFence
(defun query-fence (conn fence)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf fence)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass query-fence-request (xcb:request-with-reply) ((fence :initarg :fence :type fence)))
(defmethod xcb:send-request (conn (%obj query-fence-request))
  (query-fence conn (slot-value %obj 'fence)))
(defclass query-fence-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (triggered :initarg :triggered :accessor triggered :type
            (or boolean (unsigned-byte 8)))))
(defun decode-query-fence-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length triggered)
    (declare (ignorable %p response-type sequence length triggered))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf triggered (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'query-fence-reply :response-type response-type :sequence sequence :length
                    length :triggered triggered)
     (+ %pos 32 (* 4 length)))))
(defun query-fence-reply (conn cookie) (xcb:read-reply conn cookie #'decode-query-fence-reply))

;;; Request xcb.Sync.AwaitFence
(defun await-fence (conn fence-list)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-SYNC")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-list %buf fence-list nil #'xcb:buffer-write-card32)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass await-fence-request (xcb:request) ((fence-list :initarg :fence-list :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj await-fence-request))
  (await-fence conn (slot-value %obj 'fence-list)))

;;; Event xcb.Sync.CounterNotify (0)
(defclass counter-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (kind :initarg :kind :accessor kind :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (counter :initarg :counter :accessor counter :type counter)
           (wait-value :initarg :wait-value :accessor wait-value :type int64)
           (counter-value :initarg :counter-value :accessor counter-value :type int64)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (count :initarg :count :accessor count :type (unsigned-byte 16))
           (destroyed :initarg :destroyed :accessor destroyed :type
            (or boolean (unsigned-byte 8)))))
(defun decode-counter-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        kind
        sequence
        counter
        wait-value
        counter-value
        timestamp
        count
        destroyed)
    (declare
     (ignorable %p response-type kind sequence counter wait-value counter-value timestamp count
      destroyed))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf kind (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf counter (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf wait-value (decode-int64 %buf (+ %p 8) %order))
    (setf counter-value (decode-int64 %buf (+ %p 16) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf count (xcb:read-card16-at %buf (+ %p 28) %order))
    (setf destroyed (xcb:read-card8-at %buf (+ %p 30)))
    (values
     (make-instance 'counter-notify :response-type response-type :kind kind :sequence sequence
                    :counter counter :wait-value wait-value :counter-value counter-value :timestamp
                    timestamp :count count :destroyed destroyed)
     (+ %pos 32))))
(defun encode-counter-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (kind (slot-value %obj 'kind))
         (sequence (slot-value %obj 'sequence))
         (counter (slot-value %obj 'counter))
         (wait-value (slot-value %obj 'wait-value))
         (counter-value (slot-value %obj 'counter-value))
         (timestamp (slot-value %obj 'timestamp))
         (count (slot-value %obj 'count))
         (destroyed (slot-value %obj 'destroyed)))
    (declare
     (ignorable response-type kind sequence counter wait-value counter-value timestamp count
      destroyed))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf kind)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf counter)
    (encode-int64 %buf wait-value)
    (encode-int64 %buf counter-value)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card16 %buf count)
    (xcb:buffer-write-bool %buf destroyed)
    (xcb:buffer-write-padding %buf 1)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj counter-notify)) (encode-counter-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-SYNC" 0 #'decode-counter-notify)

;;; Event xcb.Sync.AlarmNotify (1)
(defclass alarm-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (kind :initarg :kind :accessor kind :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (alarm :initarg :alarm :accessor alarm :type alarm)
           (counter-value :initarg :counter-value :accessor counter-value :type int64)
           (alarm-value :initarg :alarm-value :accessor alarm-value :type int64)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (state :initarg :state :accessor state :type (unsigned-byte 8))))
(defun decode-alarm-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type kind sequence alarm counter-value alarm-value timestamp state)
    (declare
     (ignorable %p response-type kind sequence alarm counter-value alarm-value timestamp state))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf kind (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf alarm (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf counter-value (decode-int64 %buf (+ %p 8) %order))
    (setf alarm-value (decode-int64 %buf (+ %p 16) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 24) %order))
    (setf state (xcb:read-card8-at %buf (+ %p 28)))
    (values
     (make-instance 'alarm-notify :response-type response-type :kind kind :sequence sequence :alarm
                    alarm :counter-value counter-value :alarm-value alarm-value :timestamp
                    timestamp :state state)
     (+ %pos 32))))
(defun encode-alarm-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (kind (slot-value %obj 'kind))
         (sequence (slot-value %obj 'sequence))
         (alarm (slot-value %obj 'alarm))
         (counter-value (slot-value %obj 'counter-value))
         (alarm-value (slot-value %obj 'alarm-value))
         (timestamp (slot-value %obj 'timestamp))
         (state (slot-value %obj 'state)))
    (declare
     (ignorable response-type kind sequence alarm counter-value alarm-value timestamp state))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf kind)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf alarm)
    (encode-int64 %buf counter-value)
    (encode-int64 %buf alarm-value)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:buffer-write-card8 %buf state)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj alarm-notify)) (encode-alarm-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-SYNC" 1 #'decode-alarm-notify)
