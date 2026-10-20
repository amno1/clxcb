;;; dispatch.lisp — runtime tables for event and error decoders.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:

;;; Decoding is function-driven: the generated code defines one decoder
;;; function per event and error type, of the form
;;;
;;;     (decode-<name> BUFFER POSITION ORDER) => (VALUES OBJECT NEW-POSITION)
;;;
;;; and registers it at load time under the wire code it answers to.
;;; The reader looks the function up and calls it.
;;;
;;;   - Core events and errors live in two 256-element vectors indexed by
;;;     the wire code: one memory load and one indirect call per packet.
;;;   - Extension events and errors are keyed by (EXTENSION . LOCAL-CODE),
;;;     where EXTENSION is the extension's package name and LOCAL-CODE is
;;;     the number declared in its XML.  The wire code is only known once
;;;     the server has told us the extension's first-event/first-error, so
;;;     these are resolved per connection.
;;;   - XGE (GenericEvent) events are keyed by (EXTENSION . EVENT-TYPE) in
;;;     a table of their own, because an extension may declare an ordinary
;;;     event and an XGE event with the same number (XInput does).

(in-package "XCB")

(defvar *event-decoders* (make-array 256 :initial-element nil)
  "Decoder functions for core events, indexed by wire event code.")

(defvar *error-decoders* (make-array 256 :initial-element nil)
  "Decoder functions for core errors, indexed by wire error code.")

(defvar *extension-event-decoders* (make-hash-table :test 'equal)
  "Maps (extension-name . local-code) to an event decoder function.")

(defvar *extension-ge-event-decoders* (make-hash-table :test 'equal)
  "Maps (extension-name . event-type) to an XGE event decoder function.")

(defvar *extension-error-decoders* (make-hash-table :test 'equal)
  "Maps (extension-name . local-code) to an error decoder function.")

(defvar *extension-xnames* (make-hash-table :test 'equal)
  "Maps an extension's internal key (its CL package name, e.g.
   \"XCB-XKB\") to the wire name the server expects in a QueryExtension
   request (e.g. \"XKEYBOARD\").")

(defun register-extension-xname (extension xname)
  "Associate EXTENSION (the internal key, i.e. its package name) with
   XNAME, the name the server knows it by over the wire."
  (setf (gethash extension *extension-xnames*) xname))

(defun lookup-extension-xname (extension)
  (gethash extension *extension-xnames*))

(defun register-event-decoder (code decoder)
  "Install DECODER for core wire event CODE.  DECODER is a decoder
   function, or the name of a generated core event class, whose decoder
   is then used.  An extension's events are registered with
   REGISTER-EXTENSION-EVENT-DECODER, by their code within the extension."
  (setf (svref *event-decoders* code) (%as-decoder decoder)))

(defun register-error-decoder (code decoder)
  "Like REGISTER-EVENT-DECODER, for errors."
  (setf (svref *error-decoders* code) (%as-decoder decoder)))

(defun register-extension-event-decoder (extension local-code decoder)
  "Install DECODER for event LOCAL-CODE of EXTENSION: the event's code
   less the extension's first event code, which the server assigns.
   Keyed by (EXTENSION . LOCAL-CODE)."
  (setf (gethash (cons (string-upcase extension) local-code)
                 *extension-event-decoders*)
        (%as-decoder decoder)))

(defun register-extension-ge-event-decoder (extension event-type decoder)
  "Install DECODER for XGE event EVENT-TYPE of EXTENSION: a Generic
   Event (code 35) whose extension byte is EXTENSION's major opcode, and
   whose event type, not a code, tells it apart.  Keyed by (EXTENSION .
   EVENT-TYPE), in a table of its own, so an extension may have ordinary
   events and Generic Events with the same numbers -- as XInput does, its
   XI 1.x events ordinary and its XI2 events Generic."
  (setf (gethash (cons (string-upcase extension) event-type)
                 *extension-ge-event-decoders*)
        (%as-decoder decoder)))

(defun register-extension-error-decoder (extension local-code decoder)
  "Install DECODER for error LOCAL-CODE of EXTENSION."
  (setf (gethash (cons (string-upcase extension) local-code)
                 *extension-error-decoders*)
        (%as-decoder decoder)))

(defun lookup-event-decoder (code)
  (svref *event-decoders* code))

(defun lookup-error-decoder (code)
  (svref *error-decoders* code))

(defun lookup-extension-event-decoder (extension local-code)
  "EXTENSION is the internal key (its package name); LOCAL-CODE is the
   event number as declared in the extension's XML, i.e. relative to
   the extension's first-event."
  (gethash (cons extension local-code) *extension-event-decoders*))

(defun lookup-extension-ge-event-decoder (extension event-type)
  (gethash (cons extension event-type) *extension-ge-event-decoders*))

(defun lookup-extension-error-decoder (extension local-code)
  (gethash (cons extension local-code) *extension-error-decoders*))

;;; The extension index
;;;
;;; Decoding an extension event needs the extension it belongs to: by
;;; major opcode for a GenericEvent, by first-event base for any other.
;;; Rather than search CONN-EXTENSIONS for every event, the connection
;;; keeps an index of it, rebuilt whenever the table's size changes --
;;; that is, whenever ENSURE-EXTENSION learns of another extension.

(defstruct (extension-index (:constructor %make-extension-index))
  (count 0)
  (by-major-opcode (make-hash-table))
  (event-bases '())     ; ((first-event . extension) ...), highest first
  (error-bases '()))    ; ((first-error . extension) ...), highest first

(defun %extension-index (conn)
  "CONN's extension index, rebuilt when CONN-EXTENSIONS has grown.  The
   index itself is never modified once built, so a caller may keep using
   the one it got; building and installing it happen under the extension
   lock.

   Lock order: the extension lock may be taken while the I/O lock is
   held -- event decoding does so, through CONN-EXTENSION-BY-MAJOR-OPCODE
   and the event decoders -- but never the reverse.  A new caller that
   holds the extension lock must not make a request or wait on CONN."
  (with-lock ((conn-extension-lock conn))
    (%extension-index-locked conn)))

(defun %extension-index-locked (conn)
  (let ((index (conn-extension-index conn))
        (table (conn-extensions conn)))
    (if (and index (= (extension-index-count index) (hash-table-count table)))
        index
        (let ((new (%make-extension-index :count (hash-table-count table))))
          (maphash (lambda (extension info)
                     (let ((major (getf info :major-opcode))
                           (first-event (getf info :first-event))
                           (first-error (getf info :first-error)))
                       (when (and major (plusp major))
                         (setf (gethash major (extension-index-by-major-opcode new))
                               extension))
                       (when (and first-event (plusp first-event))
                         (push (cons first-event extension) (extension-index-event-bases new)))
                       (when (and first-error (plusp first-error))
                         (push (cons first-error extension) (extension-index-error-bases new)))))
                   table)
          (setf (extension-index-event-bases new)
                (sort (extension-index-event-bases new) #'> :key #'car)
                (extension-index-error-bases new)
                (sort (extension-index-error-bases new) #'> :key #'car)
                (conn-extension-index conn) new)))))

(defun conn-extension-by-major-opcode (conn major-opcode)
  "Return the internal key of the extension registered on CONN whose
   major opcode is MAJOR-OPCODE, or NIL."
  (cl:values (gethash major-opcode
                      (extension-index-by-major-opcode (%extension-index conn)))))

(defun %conn-extension-decoder (bases code lookup)
  "Find a decoder for wire CODE among the extensions in BASES, an alist
   of (BASE . EXTENSION) sorted highest base first, rebasing CODE by
   the extension's base before calling LOOKUP.  The highest base not
   above CODE wins, since extension code ranges are contiguous and
   allocated in increasing order."
  (loop for (base . extension) in bases
        when (<= base code)
          do (let ((decoder (funcall lookup extension (- code base))))
               (when decoder (return decoder)))))

(defun conn-event-decoder (conn code)
  "Return the decoder for wire event CODE on CONN: the core table
   first, then every extension CONN knows about (via ENSURE-EXTENSION).
   NIL if none matches."
  (or (lookup-event-decoder code)
      (%conn-extension-decoder (extension-index-event-bases (%extension-index conn))
                               code #'lookup-extension-event-decoder)))

(defun conn-error-decoder (conn code)
  "Like CONN-EVENT-DECODER, for errors."
  (or (lookup-error-decoder code)
      (%conn-extension-decoder (extension-index-error-bases (%extension-index conn))
                               code #'lookup-extension-error-decoder)))
