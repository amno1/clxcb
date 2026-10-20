;;; connection-setup.lisp — the X11 connection handshake.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.


;;; Commentary:

;;; Loads within the CLXCB system, after CLXCB/GENERATED, because it
;;; uses the generated decoders for the setup reply (DECODE-SETUP,
;;; DECODE-SETUP-FAILED, DECODE-SETUP-AUTHENTICATE) and the generated
;;; QUERY-EXTENSION request.

(in-package "XCB")


;;; Hand-written serializers for the setup handshake
;;;
;;; The setup exchange is not a normal request/reply: it happens before
;;; the connection is fully established, uses no sequence numbers, and
;;; the reply is one of three possible outcomes.  The request is written
;;; by hand below; the response is decoded by the generated decoders.

(defun write-setup (conn auth-name auth-data)
  "Write the initial connection request to CONN's stream.
   AUTH-NAME and AUTH-DATA come from READ-XAUTH.

   ORDER (the connection's byte order, taken from *DEFAULT-BYTE-ORDER*
   at the time the connection was made -- host endianness unless a
   caller rebound it) is written here as the very first byte of the
   request.  Per the X11 spec the client unilaterally picks the byte
   order for the whole connection this way; the server has no byte-order
   preference of its own to negotiate against, so always encoding in
   host order is correct, not a limitation."
  (let* ((out      (conn-stream conn))
         (order    (conn-byte-order conn))
         (*default-byte-order* order)
         (name-len (cl:length auth-name))
         (data-len (cl:length auth-data)))
    (write-byte order out)
    (write-byte 0 out)  ; unused byte
    (write-card16 +protocol-major-version+ out order)
    (write-card16 +protocol-minor-version+ out order)
    (write-card16 name-len out order)
    (write-card16 data-len out order)
    (write-card16 0 out order)  ; unused 2 bytes
    (dotimes (i name-len)
      (write-byte (char-code (aref auth-name i)) out))
    (loop repeat (mod (- 4 (mod name-len 4)) 4)
          do (write-byte 0 out))
    (dotimes (i data-len)
      (write-byte (aref auth-data i) out))
    (loop repeat (mod (- 4 (mod data-len 4)) 4)
          do (write-byte 0 out))
    (finish-output out)))

;;; Reading the setup response
;;;
;;; Every outcome starts with the same 8 bytes -- a status byte, and at
;;; offset 6 the length of the rest in 4-byte units -- so the whole
;;; response is read as one block and handed to the generated decoder
;;; for its status: DECODE-SETUP, DECODE-SETUP-FAILED or
;;; DECODE-SETUP-AUTHENTICATE.

(defun read-setup (conn)
  "Read the server's setup response from CONN.  Returns an instance of
   SETUP, SETUP-FAILED or SETUP-AUTHENTICATE."
  (let* ((order (conn-byte-order conn))
         (head (%conn-read-octets conn 8))
         (rest (%conn-read-octets conn (* 4 (read-card16-at head 6 order))))
         (all (concatenate '(simple-array octet (*)) head rest)))
    (cl:values
     (case (aref all 0)
       (0 (decode-setup-failed all 0 order))
       (1 (decode-setup all 0 order))
       (2 (decode-setup-authenticate all 0 order))
       (t (cl:error "Unknown setup status byte: ~D" (aref all 0)))))))

(defun setup-failure-reason (setup-failed)
  "The server's reason for refusing the connection, as a string."
  (slot-value setup-failed 'reason))


;;; Extension enablement

(defun ensure-extension (conn internal-key)
  "Query the X server for the extension known internally as INTERNAL-KEY
   (its CL package name, e.g. \"XCB-XKB\" -- registered by the generated
   code via REGISTER-EXTENSION-XNAME), caching the result on CONN.

   Returns the plist (:present :major-opcode :first-event :first-error).
   Must be called before events or errors belonging to that extension
   can be decoded, since their wire codes are only known relative to
   FIRST-EVENT/FIRST-ERROR, which the server assigns per-connection.
   Sending any request of the extension calls it implicitly."
  ;; The cache is checked and filled under the extension lock, and the
  ;; round trip made with it released (doc/threads.md, section 7).  Two
  ;; threads querying the same extension at once get the same answer.
  (let ((cached (with-lock ((conn-extension-lock conn))
                  (gethash internal-key (conn-extensions conn)))))
    (when cached (return-from ensure-extension cached)))
  (let ((xname (lookup-extension-xname internal-key)))
    (unless xname
      (cl:error "Unknown extension ~S: no wire name registered for it"
                internal-key))
    (let* ((reply (query-extension-reply conn (query-extension conn xname)))
           (info  (list :present      (not (zerop (slot-value reply 'present)))
                        :major-opcode (slot-value reply 'major-opcode)
                        :first-event  (slot-value reply 'first-event)
                        :first-error  (slot-value reply 'first-error))))
      (with-lock ((conn-extension-lock conn))
        (setf (gethash internal-key (conn-extensions conn)) info))
      info)))

(define-condition extension-not-present (cl:error)
  ((extension :initarg :extension :reader extension-not-present-extension
              :documentation "The extension's internal key, e.g. \"XCB-INPUT\".")
   (xname :initarg :xname :reader extension-not-present-xname
          :documentation "The name the server knows it by, e.g. \"XInputExtension\"."))
  (:documentation
   "Signalled when a request of an extension the X server does not have
    is about to be sent.  Nothing has been sent when it is.")
  (:report (lambda (c s)
             (cl:format s "Extension ~A (~A) is not present on this X server"
                        (extension-not-present-extension c)
                        (extension-not-present-xname c)))))

(defun extension-present-p (conn internal-key)
  "True if the X server behind CONN has the extension INTERNAL-KEY
   (e.g. \"XCB-INPUT\").  Queries the server the first time."
  (getf (ensure-extension conn internal-key) :present))

;;; XID ranges
;;;
;;; The range of XIDs the server hands out at setup (typically about two
;;; million) is used up by a long-running client that keeps creating
;;; resources, since XIDs are never reused.  GENERATE-ID then asks for a
;;; new range with this function, unless the caller installed its own.

(defun %xc-misc-refill (conn)
  "Install a new XID range on CONN from XC-MISC's GetXIDRange: the
   range starts at the reply's START-ID and holds COUNT XIDs.  Signals
   RESOURCE-ID-EXHAUSTED if the server lacks XC-MISC or has no XIDs
   left.  Called by GENERATE-ID with the XID lock held."
  (unless (extension-present-p conn "XCB-XCMISC")
    (cl:error 'resource-id-exhausted :connection conn))
  (let* ((reply (xcb-xcmisc:get-xid-range-reply conn (xcb-xcmisc:get-xid-range conn)))
         (start (xcb-xcmisc:start-id reply))
         (count (slot-value reply 'xcb-xcmisc::count))
         (mask (conn-resource-id-mask conn))
         (inc (logand mask (- mask))))
    ;; What the server answers when it is out of XIDs (as in libxcb).
    (when (or (zerop count) (and (zerop start) (= count 1)))
      (cl:error 'resource-id-exhausted :connection conn))
    (setf (conn-resource-id-next conn) start
          (conn-resource-id-max conn) (+ start (* (1- count) inc)))
    t))

;;; BIG-REQUESTS
;;;
;;; libxcb enables BIG-REQUESTS as soon as a request needs it; so does
;;; FLUSH-REQUEST, through this function.  Enabling raises the longest
;;; request the server accepts, and CONN-MAXIMUM-REQUEST-LENGTH then
;;; reports that, as libxcb's xcb_get_maximum_request_length does, so
;;; PUT-IMAGE-CHUNKED sends larger chunks.

(defun %ensure-big-requests (conn words)
  "Make sure CONN may send a request of WORDS 4-byte units in the
   BIG-REQUESTS form, enabling the extension the first time; signal an
   error if the server does not have it or the request is still too
   long.  Two threads enabling it at once both get the same answer."
  (let ((max (%conn-big-requests conn)))
    (unless max
      (setf max
            (if (extension-present-p conn "XCB-BIGREQUESTS")
                (let ((reply (xcb-bigrequests:enable-reply
                              conn (xcb-bigrequests:enable conn))))
                  (slot-value reply 'xcb-bigrequests::maximum-request-length))
                :absent))
      (setf (%conn-big-requests conn) max)
      (when (integerp max)
        (setf (conn-maximum-request-length conn) max)))
    (cond ((eq max :absent)
           (cl:error "Request of ~D bytes is longer than 256 KiB, and the X ~
                      server does not have the BIG-REQUESTS extension."
                     (* 4 words)))
          ((> words max)
           (cl:error "Request of ~D bytes is longer than the ~D bytes the X ~
                      server accepts."
                     (* 4 words) (* 4 max))))))

(defun extension-major-opcode (conn internal-key)
  "The major opcode the server assigned to the extension INTERNAL-KEY
   on CONN.  Signals EXTENSION-NOT-PRESENT if the server does not have
   it.  Every generated extension request calls this before encoding,
   since it may itself have to send a QueryExtension request."
  (let ((info (ensure-extension conn internal-key)))
    (unless (getf info :present)
      (cl:error 'extension-not-present
                :extension internal-key
                :xname (lookup-extension-xname internal-key)))
    (getf info :major-opcode)))


;;; Connection handshake

(defun %setup-screens-as-lists (roots)
  "The screens of a decoded setup reply as a list, each screen's
   ALLOWED-DEPTHS and each depth's VISUALS as lists too -- the shape the
   connection's screen tree has always had.  (Every other decoded list
   is a vector, as READ-VECTOR-AT and READ-STRUCT-VECTOR-AT return.)"
  (loop for screen across roots
        do (setf (slot-value screen 'allowed-depths)
                 (loop for depth across (slot-value screen 'allowed-depths)
                       do (setf (slot-value depth 'visuals)
                                (coerce (slot-value depth 'visuals) 'list))
                       collect depth))
        collect screen))

(defun handshake (conn auth-name auth-data)
  "Perform the initial X11 connection handshake on CONN, populating
   the connection's setup fields from the server's reply."
  (write-setup conn auth-name auth-data)
  (let ((reply (read-setup conn)))
    (when (typep reply 'setup-failed)
      (cl:error "X server refused connection: ~A" (setup-failure-reason reply)))
    (when (typep reply 'setup-authenticate)
      (cl:error "X server requested authentication; not supported yet"))
    (flet ((slot (name) (slot-value reply name)))
      (setf (conn-protocol-major-version conn)      (slot 'protocol-major-version)
            (conn-protocol-minor-version conn)      (slot 'protocol-minor-version)
            (conn-release-number conn)              (slot 'release-number)
            (conn-resource-id-base conn)            (slot 'resource-id-base)
            (conn-resource-id-mask conn)            (slot 'resource-id-mask)
            (conn-motion-buffer-size conn)          (slot 'motion-buffer-size)
            (conn-maximum-request-length conn)      (slot 'maximum-request-length)
            (conn-image-byte-order conn)            (slot 'image-byte-order)
            (conn-bitmap-format-bit-order conn)     (slot 'bitmap-format-bit-order)
            (conn-bitmap-format-scanline-unit conn) (slot 'bitmap-format-scanline-unit)
            (conn-bitmap-format-scanline-pad conn)  (slot 'bitmap-format-scanline-pad)
            (conn-min-keycode conn)                 (slot 'min-keycode)
            (conn-max-keycode conn)                 (slot 'max-keycode)
            ;; The vendor as the list of its byte codes, and the formats
            ;; and screens as lists, as the connection has always kept them.
            (conn-vendor conn)                      (cl:map 'list #'char-code (slot 'vendor))
            (conn-pixmap-formats conn)              (coerce (slot 'pixmap-formats) 'list)
            (conn-roots conn)                       (%setup-screens-as-lists
                                                     (slot 'roots))))
    conn))


;;; Atom caching
;;;
;;; The generated wire functions are INTERN-ATOM (returns a cookie) and
;;; INTERN-ATOM-REPLY (reads the reply).  INTERN-ATOM-ID wraps both and
;;; caches the result on the connection, so a name need only be resolved
;;; once.  The "ID" suffix names what the function gives you back, not
;;; why it's cheap.

(defun intern-atom-id (conn name &optional (only-if-exists nil))
  "Intern NAME on CONN and return the atom's numeric ID.
   Caches the result on CONN so subsequent lookups of the same name
   don't require a round trip to the server."
  ;; Checked and filled under the atom lock, the round trip made with it
  ;; released; two threads interning the same name get the same atom.
  (let ((cached (with-lock ((conn-atom-lock conn))
                  (gethash name (conn-atoms conn)))))
    (when cached (return-from intern-atom-id cached)))
  (let* ((cookie  (intern-atom conn only-if-exists name))
         (reply   (intern-atom-reply conn cookie))
         (atom-id (slot-value reply 'atom)))
    (unless (zerop atom-id)
      (with-lock ((conn-atom-lock conn))
        (setf (gethash name (conn-atoms conn)) atom-id)))
    atom-id))

(defun atom-name (conn atom-id)
  "Return the name string of ATOM-ID."
  (let* ((cookie (get-atom-name conn atom-id))
         (reply  (get-atom-name-reply conn cookie)))
    (slot-value reply 'name)))

;;; ====================================================================
;;; Connection lifecycle: CALL-WITH-X-CONNECTION and WITH-X-CONNECTION
;;;
;;; This is the user-facing entry point of the library.  It glues
;;; together the four steps every XCB client performs at startup:
;;;
;;;   1. Parse $DISPLAY (or an explicit string) into host, display
;;;      number, screen, protocol, and -- for the two socket-path
;;;      forms -- a socket path.
;;;   2. Look up matching credentials in .Xauthority.
;;;   3. Open the socket (via WITH-OPEN-X-CONNECTION, defined in
;;;      connection.lisp).
;;;   4. Perform the setup handshake, so the server knows this client
;;;      exists and the connection is usable.
;;;
;;; The macro preserves all values returned by BODY, and closes the
;;; connection unconditionally on exit, including on signalled errors
;;; and non-local exits.  If any step *before* the handshake fails,
;;; the partially opened socket is closed before the condition
;;; propagates, so callers never leak a file descriptor.

(define-condition connection-error (cl:error)
  ((display :initarg :display :reader connection-error-display
            :documentation "The DISPLAY string that could not be used.")
   (cause   :initarg :cause   :reader connection-error-cause
            :documentation "A human-readable description of why the
            connection could not be established."))
  (:documentation
   "Signalled by CALL-WITH-X-CONNECTION when a connection cannot be
    established for a reason other than a socket-level failure.  The
    most common case is a DISPLAY string naming an unsupported
    protocol (e.g. DECnet); socket errors propagate unchanged from the
    underlying socket library, and X server refusals propagate as the
    SETUP-FAILED condition from the handshake.")
  (:report (lambda (c s)
             (cl:format s "Failed to establish an XCB connection to ~S~@[: ~A~]"
                     (connection-error-display c)
                     (connection-error-cause c)))))


;;; Xauthority lookup
;;;
;;; A compatibility wrapper over CLXAU:XAU-LOOKUP-FOR-DISPLAY,
;;; which has the same signature and return convention:
;;;
;;;     (VALUES FAMILY ADDRESS NUMBER NAME DATA) on a match,
;;;     NIL on no match / missing file / empty file.
;;;
;;; The clXau function resolves the FamilyLocal address from
;;; $XAUTHLOCALHOSTNAME then gethostname(3), treats "localhost" and
;;; the loopback addresses as :LOCAL, and ranks auth names by
;;; CLXAU:*XAU-DEFAULT-PREFERENCES*

(declaim (inline read-xauth))
(defun read-xauth (hostname display-number &key (protocol :local))
  "Compatibility wrapper around CLXAU:XAU-LOOKUP-FOR-DISPLAY.

   Returns (VALUES FAMILY ADDRESS NUMBER NAME DATA), or NIL if
   no entry matches, the Xauthority file is missing, or the file is
   empty.  See the clXau system for the full semantics of HOSTNAME,
   DISPLAY-NUMBER and PROTOCOL."
  (clxau:xau-lookup-for-display hostname display-number
                                :protocol protocol))

(defun xauth-for-display (host display-number protocol)
  "Return (VALUES AUTH-NAME AUTH-DATA), the credentials to send during
   the setup handshake.  When the Xauthority file has no matching
   entry, returns two empty values; the server may still accept the
   connection (a wildcard or an unauthenticated setup), and a refusal
   will surface as SETUP-FAILED, which is the correct place for that
   decision."
  (multiple-value-bind (family address number name data)
      (clxau:xau-lookup-for-display host display-number
                                    :protocol protocol)
    (declare (ignore family address number))
    (cl:values (or name "")
               (or data #()))))

(defun %peer-address (conn)
  "The numeric address of CONN's TCP peer, as an octet vector (4 bytes
   for IPv4, 16 for IPv6), for looking up its Xauthority entry."
  (coerce (%socket-peer-address (conn-socket conn))
          '(simple-array octet (*))))

(defun connect (&key display timeout)
  "Open and set up a connection to DISPLAY (defaulting to $DISPLAY), as
   libxcb's xcb_connect does, and return it.  The caller closes it with
   CLOSE-CONNECTION; CALL-WITH-X-CONNECTION and WITH-X-CONNECTION do
   that for you.

   A display without a host (:0) or naming a socket path uses a
   Unix-domain socket; one with a host (host:0, localhost:10.0 as set by
   ssh -X) uses TCP to port 6000 plus the display number.  For TCP the
   Xauthority entry is looked up by the peer's address, as libxcb does,
   so a loopback connection finds the local cookie.  Signals
   CONNECTION-ERROR for a display that cannot be parsed or names an
   unsupported protocol (DECnet)."
  (let* ((display-string (or display (uiop:getenv "DISPLAY")))
         (parsed (multiple-value-list (parse-display display-string))))
    (destructuring-bind (host display-number screen protocol socket-path)
        parsed
      (declare (ignore screen))
      (let ((conn
              (cond
                ((or socket-path (eq protocol :local))
                  (open-connection :path (or socket-path (socket-path display-number))
                                   :timeout timeout))
                ((eq protocol :internet)
                 (open-connection :host host :port (+ +x-tcp-port+ display-number)
                                  :timeout timeout))
                (t
                 (cl:error 'connection-error
                           :display display-string
                           :cause (cl:format nil "unsupported protocol ~S" protocol))))))
        (handler-bind ((cl:error (lambda (e)
                                   (declare (ignore e))
                                   (close-connection conn))))
          (multiple-value-bind (auth-name auth-data)
              (if (eq (conn-transport conn) :tcp)
                  (let ((address (%peer-address conn)))
                    (xauth-for-display address display-number
                                       (if (= (cl:length address) 16) :internet6 :internet)))
                  (xauth-for-display host display-number :local))
            (handshake conn auth-name auth-data)
            conn))))))

(defun call-with-x-connection (function &key display timeout)
  "Establish a fully set-up XCB connection to DISPLAY (defaulting to
   $DISPLAY), call FUNCTION with it, and close it unconditionally on
   exit.  FUNCTION's values are returned unchanged.

   DISPLAY may name a local or a TCP display; see CONNECT.  Signals
   CONNECTION-ERROR if DISPLAY cannot be parsed or names an
   unsupported protocol.  Socket and handshake failures propagate from
   OPEN-CONNECTION and HANDSHAKE respectively, with any partially
   opened socket closed first."
  (let ((conn (connect :display display :timeout timeout)))
    (unwind-protect (funcall function conn)
      (close-connection conn))))

(defmacro with-x-connection ((conn-var &key display timeout) &body body)
  "Establish a fully set-up XCB connection, bind it to CONN-VAR for
   the dynamic extent of BODY, and close it on exit.  All values
   returned by BODY are returned by the macro.

   DISPLAY defaults to $DISPLAY, resolved at the time the expansion
   runs, not at compile time -- so rebinding $DISPLAY inside the
   running image is respected.  TIMEOUT, when supplied, is a connect
   timeout in seconds.

   The connection is closed whether BODY returns normally, exits via
   RETURN-FROM or THROW, or signals an error, provided the exit unwinds
   through this form.  If any step of the setup fails, any partially
   opened socket is closed before the condition propagates.

   Example:

       (with-x-connection (conn)
         (let ((screen (first (conn-roots conn))))
           (format t \"Connected to ~A (~D x ~D)~%\"
                   (conn-vendor conn)
                   (width-in-pixels  screen)
                   (height-in-pixels screen))))"
  `(call-with-x-connection
    (lambda (,conn-var)
      ,@body)
    :display ,display
    :timeout ,timeout))
