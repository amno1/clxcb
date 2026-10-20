;;; xinput-util.lisp — conveniences over the generated XInput binding.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:

;;; The generated XCB-INPUT package is a one-to-one binding of
;;; xinput.xml.  This file adds what every XInput 2 client otherwise
;;; writes for itself:
;;;
;;;   ENSURE-XI2-VERSION     negotiate the XI2 version once per connection
;;;   MAKE-XI-EVENT-MASK     an EVENT-MASK from event keywords
;;;   SELECT-XI-EVENTS       negotiate, build the mask, XISelectEvents
;;;   FP3232->DOUBLE ...     the protocol's fixed-point numbers as floats
;;;   XI-DEVICE-VALUATORS    pick classes of one kind out of a device
;;;   SEND-XI-EVENT          SendExtensionEvent of an event object
;;;
;;; Version negotiation is explicit rather than a side effect of the
;;; first XInput request.  XIQueryVersion declares this client an XI2
;;; client, which a program using only XI 1.x requests should not be
;;; made into behind its back; and a server may refuse a second
;;; XIQueryVersion asking for a different version than the first, which
;;; is what a program sending its own would then run into.

(in-package "XCB-INPUT")

;;; Version negotiation

(defun xi2-version (conn)
  "The XI2 version negotiated on CONN, as (MAJOR . MINOR), or NIL if
   ENSURE-XI2-VERSION has not run on it.  NIL does not mean the server
   lacks XI2; XI2-SUPPORTED-P answers that.  It is kept on the
   connection, so it goes with it."
  (xcb:conn-xi2-version conn))

(defun ensure-xi2-version (conn &optional (major 2) (minor 4))
  "Tell the server CONN speaks XInput MAJOR.MINOR, once per connection,
   and return the version the server agreed to as (VALUES MAJOR MINOR):
   the lower of MAJOR.MINOR and its own.  The server expects this before
   any other XI2 request.  Later calls return the cached result without
   a round trip, whatever version they ask for."
  (let ((cached (xi2-version conn)))
    (unless cached
      (let ((reply (xi-query-version-reply conn (xi-query-version conn major minor))))
        ;; Two threads negotiating at once both get the server's answer,
        ;; the same one, so storing it twice does no harm.
        (setf cached (cons (major-version reply) (minor-version reply))
              (xcb:conn-xi2-version conn) cached)))
    (cl:values (car cached) (cdr cached))))

(defun xi2-supported-p (conn)
  "True if the server behind CONN speaks XInput 2.  Negotiates the
   version (see ENSURE-XI2-VERSION) if the server has XInput."
  (and (xcb:extension-present-p conn "XCB-INPUT")
       ;; ENSURE-XI2-VERSION returns (VALUES MAJOR MINOR); >= sees MAJOR.
       (>= (ensure-xi2-version conn) 2)))

;;; Event masks
;;;
;;; An XI2 event mask is a bit per event type, sent as a list of CARD32
;;; words, least significant word first.  The event keywords are those
;;; of the INPUT-XI-EVENT-MASK enum (:KEY-PRESS, :RAW-MOTION, ...);
;;; an integer is taken as mask bits as they are.

(defun %xi-mask-integer (events)
  (apply #'xcb:enum-mask :input-xi-event-mask events))

(defun make-xi-event-mask (&key (deviceid 1) events)
  "An EVENT-MASK selecting EVENTS on DEVICEID (default 1, all master
   devices; 0 is all devices).  EVENTS is a list of INPUT-XI-EVENT-MASK
   keywords or integer mask bits."
  (let* ((bits (%xi-mask-integer events))
         (words (loop for shift from 0 by 32
                      repeat (cl:max 1 (ceiling (integer-length bits) 32))
                      collect (ldb (byte 32 shift) bits))))
    (make-instance 'event-mask :deviceid deviceid
                               :mask-len (cl:length words)
                               :mask words)))

(defun xi-event-mask-events (event-mask)
  "The INPUT-XI-EVENT-MASK keywords EVENT-MASK selects, and as a second
   value any set bits no keyword names."
  (let ((bits (loop for word in (coerce (mask event-mask) 'list)
                    for shift from 0 by 32
                    sum (ash word shift))))
    (let ((keys (loop for (key . value) in xcb-enum::input-xi-event-mask
                      when (and (plusp value) (= value (logand bits value)))
                        collect key
                        and do (setf bits (logandc2 bits value)))))
      (cl:values keys bits))))

(defun select-xi-events (conn window events &key (deviceid 1))
  "Select the XI2 EVENTS (see MAKE-XI-EVENT-MASK) on WINDOW for
   DEVICEID, negotiating the XI2 version first if need be.  Returns the
   XISelectEvents cookie."
  (ensure-xi2-version conn)
  (xi-select-events conn window
                    (mapcar (lambda (id) (make-xi-event-mask :deviceid id :events events))
                            (if (listp deviceid) deviceid (list deviceid)))))

(defun %mask-words (events)
  (mask (make-xi-event-mask :events events)))

(defun grab-xi-device (conn window deviceid events
                       &key (time 0) (cursor 0) (mode :async)
                         (paired-device-mode :async) owner-events)
  "Actively grab DEVICEID, reporting EVENTS relative to WINDOW.  MODE
   and PAIRED-DEVICE-MODE are :SYNC or :ASYNC; TIME 0 is CurrentTime.
   Returns the grab status as a GRAB-STATUS keyword (:SUCCESS, ...)."
  (ensure-xi2-version conn)
  (let ((reply (xi-grab-device-reply
                conn (xi-grab-device conn window time cursor deviceid
                                     (xcb:enum-value :grab-mode mode)
                                     (xcb:enum-value :grab-mode paired-device-mode)
                                     (if owner-events 1 0)
                                     (%mask-words events)))))
    (or (xcb:enum-key :grab-status (status reply)) (status reply))))

(defun ungrab-xi-device (conn deviceid &key (time 0))
  "Release an active grab of DEVICEID.  Returns the cookie."
  (xi-ungrab-device conn time deviceid))

(defun passive-grab-xi-device (conn window deviceid grab-type detail events
                               &key (modifiers (list :any)) (time 0) (cursor 0)
                                 (grab-mode :async) (paired-device-mode :async)
                                 owner-events)
  "Passively grab DEVICEID on WINDOW.  GRAB-TYPE is an INPUT-GRAB-TYPE
   keyword (:BUTTON, :KEYCODE, :ENTER, ...), DETAIL the button or
   keycode (0 otherwise), MODIFIERS a list of modifier states or :ANY.
   Returns the states the server could not grab, as a list of
   (MODIFIERS . STATUS-KEYWORD); NIL when every one succeeded."
  (ensure-xi2-version conn)
  (let ((reply (xi-passive-grab-device-reply
                conn (xi-passive-grab-device
                      conn time window cursor detail deviceid
                      (xcb:enum-value :input-grab-type grab-type)
                      (xcb:enum-value :input-grab-mode22 grab-mode)
                      (xcb:enum-value :grab-mode paired-device-mode)
                      (if owner-events 1 0)
                      (%mask-words events)
                      (mapcar (lambda (m) (xcb:enum-value :input-modifier-mask m)) modifiers)))))
    (cl:map 'list (lambda (failure)
                 (cons (modifiers failure)
                       (or (xcb:enum-key :grab-status (status failure)) (status failure))))
         (modifiers reply))))

(defun passive-ungrab-xi-device (conn window deviceid grab-type detail
                                 &key (modifiers (list :any)))
  "Release a passive grab made with PASSIVE-GRAB-XI-DEVICE."
  (xi-passive-ungrab-device conn window detail deviceid
                            (xcb:enum-value :input-grab-type grab-type)
                            (mapcar (lambda (m) (xcb:enum-value :input-modifier-mask m))
                                    modifiers)))

;;; Fixed-point numbers
;;;
;;; FP3232 is a 32.32 fixed-point number, an INTEGRAL part (INT32) and a
;;; FRAC part (CARD32, in units of 2^-32); FP1616 is a 16.16 number in
;;; one INT32.  Axis values, valuator ranges and scroll increments come
;;; in these.

(defun fp3232->double (fp)
  "FP (an FP3232) as a DOUBLE-FLOAT."
  (+ (integral fp) (/ (frac fp) #.(expt 2d0 32))))

(defun double->fp3232 (x)
  "The FP3232 nearest the real X.  Signals an error outside [-2^31, 2^31)."
  ;; Float arithmetic throughout: exact, and no ratios allocated.
  (let ((x (float x 1d0)))
   (unless (and (>= x #.(- (expt 2d0 31))) (< x #.(expt 2d0 31)))
     (cl:error "~S is outside the range of an FP3232" x))
   (multiple-value-bind (int fraction) (floor x)
    (let ((frac (round (* fraction #.(expt 2d0 32)))))
      (when (= frac (expt 2 32))
        (setf int (1+ int) frac 0))
      (make-instance 'fp3232 :integral int :frac frac)))))

(defun fp1616->double (fp)
  "FP, an FP1616 (a signed 32-bit integer), as a DOUBLE-FLOAT."
  (/ fp #.(expt 2d0 16)))

(defun double->fp1616 (x)
  "The FP1616 nearest the real X.  Signals an error outside [-2^15, 2^15)."
  (let ((fp (round (* (float x 1d0) #.(expt 2d0 16)))))
    (unless (typep fp '(signed-byte 32))
      (cl:error "~S is outside the range of an FP1616" x))
    fp))

(defparameter *fp1616-position-classes*
  '(xi-query-pointer-reply key-press key-release button-press button-release motion
    enter leave focus-in focus-out touch-begin touch-update touch-end
    barrier-hit barrier-leave gesture-pinch-begin gesture-pinch-update gesture-pinch-end
    gesture-swipe-begin gesture-swipe-update gesture-swipe-end)
  "The classes whose coordinates are FP1616; XI 1.x events have INT16 pixels.")

(defun %position (object x-slot y-slot)
  (unless (and (slot-exists-p object x-slot) (slot-exists-p object y-slot))
    (cl:error "~S has no ~(~A~) and ~(~A~)" object x-slot y-slot))
  (let ((x (slot-value object x-slot)) (y (slot-value object y-slot)))
    (if (member (class-name (class-of object)) *fp1616-position-classes*)
        (cl:values (fp1616->double x) (fp1616->double y))
        (cl:values (float x 1d0) (float y 1d0)))))

(defun xi-root-position (object)
  "The root position in OBJECT, an XInput event or XIQueryPointer
   reply, as (VALUES X Y) DOUBLE-FLOATs."
  (%position object 'root-x 'root-y))

(defun xi-window-position (object)
  "The window-relative position in OBJECT, an XInput event or
   XIQueryPointer reply, as (VALUES X Y) DOUBLE-FLOATs."
  (if (slot-exists-p object 'win-x)
      (%position object 'win-x 'win-y)
      (%position object 'event-x 'event-y)))

;;; Device classes
;;;
;;; XIQueryDevice's XI-DEVICE-INFO lists its classes as DEVICE-CLASS
;;; instances, one class for every kind: the TYPE slot says which (an
;;; INPUT-DEVICE-CLASS-TYPE value), and only that kind's slots are bound
;;; (VALUATOR-MIN, SCROLL-INCREMENT, TOUCH-NUM-TOUCHES, ...).

(defun xi-device-classes (device-info kind)
  "The classes of DEVICE-INFO (an XI-DEVICE-INFO) of KIND, an
   INPUT-DEVICE-CLASS-TYPE keyword (:KEY :BUTTON :VALUATOR :SCROLL
   :TOUCH :GESTURE) or its integer value, as a list."
  (let ((code (xcb:enum-value :input-device-class-type kind)))
    (remove-if-not (lambda (c) (eql (type c) code))
                   (coerce (classes device-info) 'list))))

(defun xi-device-valuators (device-info)
  "DEVICE-INFO's valuator classes, sorted by axis number.  The axis a
   class describes is its VALUATOR-NUMBER (the server may send them in
   any order, with gaps), not its position in this list."
  (sort (xi-device-classes device-info :valuator) #'<
        :key (lambda (c) (slot-value c 'valuator-number))))

(defun xi-device-scroll-axes (device-info)
  "DEVICE-INFO's scroll classes, sorted by SCROLL-NUMBER."
  (sort (xi-device-classes device-info :scroll) #'<
        :key (lambda (c) (slot-value c 'scroll-number))))

(defun xi-valuator-range (valuator-class)
  "VALUATOR-CLASS's axis as (VALUES MIN MAX VALUE RESOLUTION MODE):
   the first three DOUBLE-FLOATs, MODE :RELATIVE or :ABSOLUTE."
  (flet ((slot (name) (slot-value valuator-class name)))
    (cl:values (fp3232->double (slot 'valuator-min))
               (fp3232->double (slot 'valuator-max))
               (fp3232->double (slot 'valuator-value))
               (slot 'valuator-resolution)
               (if (eql (slot 'valuator-mode) 1) :absolute :relative))))

(defun xi-property-data (reply)
  "The items of an XIGetProperty or GetDeviceProperty REPLY: whichever
   of DATA8/DATA16/DATA32 its FORMAT names, or NIL."
  (let ((slot (case (slot-value reply 'format) (8 'data8) (16 'data16) (32 'data32))))
    (and slot (slot-boundp reply slot) (slot-value reply slot))))

(defun xi-device-touch-classes (device-info)
  "DEVICE-INFO's touch classes (at most one)."
  (xi-device-classes device-info :touch))

;;; Sending events

(defun send-xi-event (conn destination event &key (device-id 0) propagate classes)
  "Send EVENT, an XI 1.x event object, to the window DESTINATION with
   SendExtensionEvent.  CLASSES lists the XI 1.x event classes it is
   delivered to: CARD32 values, each (DEVICE-ID << 8) | EVENT-CODE,
   where EVENT-CODE is the event's wire code on this connection (the
   extension's first-event plus the event's number) -- what XI 1.x
   SelectExtensionEvent selects on.  Only XI 1.x events can be sent
   this way: SendExtensionEvent carries 32-byte events, and XI2 events
   are Generic Events of any length, which have no event classes.
   Returns the cookie."
  (unless (compute-applicable-methods #'xcb:encode-event (list nil event))
    (cl:error "~S cannot be sent with SendExtensionEvent: only XI 1.x ~
               events can, and XI2 events are Generic Events."
              (type-of event)))
  (let ((buf (xcb:make-buffer :byte-order (xcb:conn-byte-order conn) :capacity 32)))
    (xcb:encode-event buf event)
    (send-extension-event conn destination device-id (if propagate 1 0)
                          (list (coerce (xcb:buffer-octets buf) '(simple-array xcb:octet (*))))
                          classes)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export '(xi2-version
            ensure-xi2-version
            xi2-supported-p
            grab-xi-device
            ungrab-xi-device
            passive-grab-xi-device
            passive-ungrab-xi-device
            xi-root-position
            xi-window-position
            xi-valuator-range
            xi-property-data
            make-xi-event-mask
            xi-event-mask-events
            select-xi-events
            fp3232->double
            double->fp3232
            fp1616->double
            double->fp1616
            xi-device-classes
            xi-device-valuators
            xi-device-scroll-axes
            xi-device-touch-classes
            send-xi-event)
          (find-package "XCB-INPUT")))

;;; xinput-util.lisp ends here
