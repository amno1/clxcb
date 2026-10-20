;;; Generated from damage.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-DAMAGE
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:add
   #:add-request
   #:area
   #:bad-damage-error
   #:bad-value
   #:create
   #:create-request
   #:damage
   #:decode-bad-damage-error
   #:decode-notify
   #:decode-query-version-reply
   #:destroy
   #:destroy-request
   #:drawable
   #:encode-notify
   #:error-code
   #:geometry
   #:length
   #:level
   #:major-opcode
   #:major-version
   #:minor-opcode
   #:minor-version
   #:notify
   #:query-version
   #:query-version-reply
   #:query-version-request
   #:response-type
   #:sequence
   #:subtract
   #:subtract-request
   #:timestamp))

(in-package #:XCB-DAMAGE)

(xcb:register-extension-xname "XCB-DAMAGE" "DAMAGE")
(deftype damage () '(unsigned-byte 32))

;;; Enum xcb.Damage.ReportLevel
(xcb:defenum damage-report-level
  (:raw-rectangles 0)
  (:delta-rectangles 1)
  (:bounding-box 2)
  (:non-empty 3))

;;; Error xcb.Damage.BadDamage (0)
(defclass bad-damage-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-damage-error (%buf %pos %order)
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
     (make-instance 'bad-damage-error :response-type response-type :error-code error-code :sequence
                    sequence :bad-value bad-value :minor-opcode minor-opcode :major-opcode
                    major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-DAMAGE" 0 #'decode-bad-damage-error)

;;; Request xcb.Damage.QueryVersion
(defun query-version (conn client-major-version client-minor-version)
  "Negotiate the version of the DAMAGE extension

This negotiates the version of the DAMAGE extension.  It must precede any other
request using the DAMAGE extension.  Failure to do so will cause a BadRequest
error for those requests."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DAMAGE")) (%buf (xcb:conn-send-buffer conn)))
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
          (:documentation "Negotiate the version of the DAMAGE extension

This negotiates the version of the DAMAGE extension.  It must precede any other
request using the DAMAGE extension.  Failure to do so will cause a BadRequest
error for those requests."))
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
          (:documentation "The negotiated version of the DAMAGE extension

This indicates the version of the DAMAGE extension chosen by the server.
It will always be less than or equal to the version offered by the client."))
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

;;; Request xcb.Damage.Create
(defun create (conn damage drawable level)
  "Creates a Damage object to monitor changes to a drawable.

This creates a Damage object to monitor changes to a drawable, and specifies
the level of detail to be reported for changes.

We call changes made to pixel contents of windows and pixmaps 'damage'
throughout this extension.

Damage accumulates as drawing occurs in the drawable.  Each drawing operation
'damages' one or more rectangular areas within the drawable.  The rectangles
are guaranteed to include the set of pixels modified by each operation, but
may include significantly more than just those pixels.  The desire is for
the damage to strike a balance between the number of rectangles reported and
the extraneous area included.  A reasonable goal is for each primitive
object drawn (line, string, rectangle) to be represented as a single
rectangle and for the damage area of the operation to be the union of these
rectangles.

The DAMAGE extension allows applications to either receive the raw
rectangles as a stream of events, or to have them partially processed within
the X server to reduce the amount of data transmitted as well as reduce the
processing latency once the repaint operation has started.

The Damage object holds any accumulated damage region and reflects the
relationship between the drawable selected for damage notification and the
drawable for which damage is tracked."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DAMAGE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf damage)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card8 %buf level)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-request (xcb:request)
          ((damage :initarg :damage :type damage) (drawable :initarg :drawable :type xcb:drawable)
           (level :initarg :level :type (unsigned-byte 8)))
          (:documentation "Creates a Damage object to monitor changes to a drawable.

This creates a Damage object to monitor changes to a drawable, and specifies
the level of detail to be reported for changes.

We call changes made to pixel contents of windows and pixmaps 'damage'
throughout this extension.

Damage accumulates as drawing occurs in the drawable.  Each drawing operation
'damages' one or more rectangular areas within the drawable.  The rectangles
are guaranteed to include the set of pixels modified by each operation, but
may include significantly more than just those pixels.  The desire is for
the damage to strike a balance between the number of rectangles reported and
the extraneous area included.  A reasonable goal is for each primitive
object drawn (line, string, rectangle) to be represented as a single
rectangle and for the damage area of the operation to be the union of these
rectangles.

The DAMAGE extension allows applications to either receive the raw
rectangles as a stream of events, or to have them partially processed within
the X server to reduce the amount of data transmitted as well as reduce the
processing latency once the repaint operation has started.

The Damage object holds any accumulated damage region and reflects the
relationship between the drawable selected for damage notification and the
drawable for which damage is tracked."))
(defmethod xcb:send-request (conn (%obj create-request))
  (create conn (slot-value %obj 'damage) (slot-value %obj 'drawable) (slot-value %obj 'level)))

;;; Request xcb.Damage.Destroy
(defun destroy (conn damage)
  "Destroys a previously created Damage object.

This destroys a Damage object and requests the X server stop reporting
the changes it was tracking."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DAMAGE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf damage)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass destroy-request (xcb:request) ((damage :initarg :damage :type damage))
          (:documentation "Destroys a previously created Damage object.

This destroys a Damage object and requests the X server stop reporting
the changes it was tracking."))
(defmethod xcb:send-request (conn (%obj destroy-request)) (destroy conn (slot-value %obj 'damage)))

;;; Request xcb.Damage.Subtract
(defun subtract (conn damage repair parts)
  "Remove regions from a previously created Damage object.

This updates the regions of damage recorded in a a Damage object.
See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
for details."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DAMAGE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf damage)
    (xcb:buffer-write-card32 %buf repair)
    (xcb:buffer-write-card32 %buf parts)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass subtract-request (xcb:request)
          ((damage :initarg :damage :type damage) (repair :initarg :repair :type xcb-xfixes:region)
           (parts :initarg :parts :type xcb-xfixes:region))
          (:documentation "Remove regions from a previously created Damage object.

This updates the regions of damage recorded in a a Damage object.
See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
for details."))
(defmethod xcb:send-request (conn (%obj subtract-request))
  (subtract conn (slot-value %obj 'damage) (slot-value %obj 'repair) (slot-value %obj 'parts)))

;;; Request xcb.Damage.Add
(defun add (conn drawable region)
  "Add a region to a previously created Damage object.

This updates the regions of damage recorded in a a Damage object.
See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
for details."
  (let* ((%major (xcb:extension-major-opcode conn "XCB-DAMAGE")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf region)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass add-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (region :initarg :region :type xcb-xfixes:region))
          (:documentation "Add a region to a previously created Damage object.

This updates the regions of damage recorded in a a Damage object.
See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
for details."))
(defmethod xcb:send-request (conn (%obj add-request))
  (add conn (slot-value %obj 'drawable) (slot-value %obj 'region)))

;;; Event xcb.Damage.Notify (0)
(defclass notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (level :initarg :level :accessor level :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (drawable :initarg :drawable :accessor drawable :type xcb:drawable)
           (damage :initarg :damage :accessor damage :type damage)
           (timestamp :initarg :timestamp :accessor timestamp :type xcb:timestamp)
           (area :initarg :area :accessor area :type xcb:rectangle)
           (geometry :initarg :geometry :accessor geometry :type xcb:rectangle))
          (:documentation "the contents of the monitored drawable have changed"))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type level sequence drawable damage timestamp area geometry)
    (declare (ignorable %p response-type level sequence drawable damage timestamp area geometry))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf level (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf drawable (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf damage (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf timestamp (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf area (xcb:decode-rectangle %buf (+ %p 16) %order))
    (setf geometry (xcb:decode-rectangle %buf (+ %p 24) %order))
    (values
     (make-instance 'notify :response-type response-type :level level :sequence sequence :drawable
                    drawable :damage damage :timestamp timestamp :area area :geometry geometry)
     (+ %pos 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (level (slot-value %obj 'level))
         (sequence (slot-value %obj 'sequence))
         (drawable (slot-value %obj 'drawable))
         (damage (slot-value %obj 'damage))
         (timestamp (slot-value %obj 'timestamp))
         (area (slot-value %obj 'area))
         (geometry (slot-value %obj 'geometry)))
    (declare (ignorable response-type level sequence drawable damage timestamp area geometry))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf level)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf damage)
    (xcb:buffer-write-card32 %buf timestamp)
    (xcb:encode-rectangle %buf area)
    (xcb:encode-rectangle %buf geometry)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj notify)) (encode-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-DAMAGE" 0 #'decode-notify)
