;;; Generated from xprint.xml by clxcb-generator. Do not edit.
;;; SPDX-License-Identifier: MIT
;;; Derived from the xcb-proto XML descriptions; see LICENSE.

(defpackage #:XCB-XPRINT
  (:use #:cl)
  (:shadow #:LENGTH #:SEQUENCE)
  (:export
   #:all-events-mask
   #:attribut-notify
   #:attributes
   #:bad-context-error
   #:bad-sequence-error
   #:bad-value
   #:cancel
   #:context
   #:create-context
   #:create-context-request
   #:data
   #:data-len
   #:decode-attribut-notify
   #:decode-bad-context-error
   #:decode-bad-sequence-error
   #:decode-notify
   #:decode-print-get-attributes-reply
   #:decode-print-get-context-reply
   #:decode-print-get-document-data-reply
   #:decode-print-get-image-resolution-reply
   #:decode-print-get-one-attributes-reply
   #:decode-print-get-page-dimensions-reply
   #:decode-print-get-printer-list-reply
   #:decode-print-get-screen-of-context-reply
   #:decode-print-input-selected-reply
   #:decode-print-query-screens-reply
   #:decode-print-query-version-reply
   #:decode-print-set-image-resolution-reply
   #:decode-printer
   #:desc-len
   #:description
   #:detail
   #:encode-attribut-notify
   #:encode-notify
   #:encode-printer
   #:error-code
   #:event-mask
   #:finished-flag
   #:height
   #:image-resolution
   #:length
   #:list-count
   #:major-opcode
   #:major-version
   #:minor-opcode
   #:minor-version
   #:name
   #:name-len
   #:notify
   #:offset-x
   #:offset-y
   #:pcontext
   #:previous-resolutions
   #:print-destroy-context
   #:print-destroy-context-request
   #:print-end-doc
   #:print-end-doc-request
   #:print-end-job
   #:print-end-job-request
   #:print-end-page
   #:print-end-page-request
   #:print-get-attributes
   #:print-get-attributes-reply
   #:print-get-attributes-request
   #:print-get-context
   #:print-get-context-reply
   #:print-get-context-request
   #:print-get-document-data
   #:print-get-document-data-reply
   #:print-get-document-data-request
   #:print-get-image-resolution
   #:print-get-image-resolution-reply
   #:print-get-image-resolution-request
   #:print-get-one-attributes
   #:print-get-one-attributes-reply
   #:print-get-one-attributes-request
   #:print-get-page-dimensions
   #:print-get-page-dimensions-reply
   #:print-get-page-dimensions-request
   #:print-get-printer-list
   #:print-get-printer-list-reply
   #:print-get-printer-list-request
   #:print-get-screen-of-context
   #:print-get-screen-of-context-reply
   #:print-get-screen-of-context-request
   #:print-input-selected
   #:print-input-selected-reply
   #:print-input-selected-request
   #:print-put-document-data
   #:print-put-document-data-request
   #:print-query-screens
   #:print-query-screens-reply
   #:print-query-screens-request
   #:print-query-version
   #:print-query-version-reply
   #:print-query-version-request
   #:print-rehash-printer-list
   #:print-rehash-printer-list-request
   #:print-select-input
   #:print-select-input-request
   #:print-set-attributes
   #:print-set-attributes-request
   #:print-set-context
   #:print-set-context-request
   #:print-set-image-resolution
   #:print-set-image-resolution-reply
   #:print-set-image-resolution-request
   #:print-start-doc
   #:print-start-doc-request
   #:print-start-job
   #:print-start-job-request
   #:print-start-page
   #:print-start-page-request
   #:printer
   #:printers
   #:reproducible-height
   #:reproducible-width
   #:response-type
   #:root
   #:roots
   #:sequence
   #:status
   #:status-code
   #:string-len
   #:string8
   #:value
   #:value-len
   #:width))

(in-package #:XCB-XPRINT)

(xcb:register-extension-xname "XCB-XPRINT" "XpExtension")
(deftype string8 () '(unsigned-byte 8))

;;; xcb.XPrint.PRINTER
(defclass printer nil
          ((name-len :initarg :name-len :accessor name-len :type (unsigned-byte 32))
           (name :initarg :name :accessor name :type cl:sequence)
           (desc-len :initarg :desc-len :accessor desc-len :type (unsigned-byte 32))
           (description :initarg :description :accessor description :type cl:sequence)))
(defun encode-printer (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((name (slot-value %obj 'name))
         (description (slot-value %obj 'description))
         (name-len (cl:length name))
         (desc-len (cl:length description)))
    (declare (ignorable name description name-len desc-len))
    (xcb:buffer-write-card32 %buf name-len)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-card32 %buf desc-len)
    (xcb:buffer-write-string-octets %buf description desc-len)
    (xcb:buffer-pad-to-align %buf 4)))
(defun decode-printer (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) name-len name desc-len description)
    (declare (ignorable %p name-len name desc-len description))
    (setf name-len (xcb:read-card32-at %buf %p %order))
    (setf %p (+ %p 4))
    (setf name (xcb:read-string-at %buf %p name-len))
    (incf %p (cl:length name))
    (setf %p (xcb:align-position %p 4))
    (setf desc-len (xcb:read-card32-at %buf %p %order))
    (setf %p (+ %p 4))
    (setf description (xcb:read-string-at %buf %p desc-len))
    (incf %p (cl:length description))
    (setf %p (xcb:align-position %p 4))
    (values
     (make-instance 'printer :name-len name-len :name name :desc-len desc-len :description
                    description)
     %p)))
(deftype pcontext () '(unsigned-byte 32))

;;; Enum xcb.XPrint.GetDoc
(xcb:defenum x-print-get-doc
  (:finished 0)
  (:second-consumer 1))

;;; Enum xcb.XPrint.EvMask
(xcb:defenum x-print-ev-mask
  (:no-event-mask 0)
  (:print-mask 1)
  (:attribute-mask 2))

;;; Enum xcb.XPrint.Detail
(xcb:defenum x-print-detail
  (:start-job-notify 1)
  (:end-job-notify 2)
  (:start-doc-notify 3)
  (:end-doc-notify 4)
  (:start-page-notify 5)
  (:end-page-notify 6))

;;; Enum xcb.XPrint.Attr
(xcb:defenum x-print-attr
  (:job-attr 1)
  (:doc-attr 2)
  (:page-attr 3)
  (:printer-attr 4)
  (:server-attr 5)
  (:medium-attr 6)
  (:spooler-attr 7))

;;; Request xcb.XPrint.PrintQueryVersion
(defun print-query-version (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 0)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-query-version-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj print-query-version-request)) (print-query-version conn))
(defclass print-query-version-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (major-version :initarg :major-version :accessor major-version :type (unsigned-byte 16))
           (minor-version :initarg :minor-version :accessor minor-version :type
            (unsigned-byte 16))))
(defun decode-print-query-version-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length major-version minor-version)
    (declare (ignorable %p response-type sequence length major-version minor-version))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf major-version (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf minor-version (xcb:read-card16-at %buf (+ %p 10) %order))
    (values
     (make-instance 'print-query-version-reply :response-type response-type :sequence sequence
                    :length length :major-version major-version :minor-version minor-version)
     (+ %pos 32 (* 4 length)))))
(defun print-query-version-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-query-version-reply))

;;; Request xcb.XPrint.PrintGetPrinterList
(defun print-get-printer-list (conn printer-name locale)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT"))
         (%buf (xcb:conn-send-buffer conn))
         (printer-name-len (cl:length printer-name))
         (locale-len (cl:length locale)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 1)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf printer-name-len)
    (xcb:buffer-write-card32 %buf locale-len)
    (xcb:buffer-write-string-octets %buf printer-name printer-name-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-string-octets %buf locale locale-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-printer-list-request (xcb:request-with-reply)
          ((printer-name-len :initarg :printer-name-len :type (unsigned-byte 32))
           (locale-len :initarg :locale-len :type (unsigned-byte 32))
           (printer-name :initarg :printer-name :type cl:sequence)
           (locale :initarg :locale :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj print-get-printer-list-request))
  (print-get-printer-list conn (slot-value %obj 'printer-name) (slot-value %obj 'locale)))
(defclass print-get-printer-list-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (list-count :initarg :list-count :accessor list-count :type (unsigned-byte 32))
           (printers :initarg :printers :accessor printers :type cl:sequence)))
(defun decode-print-get-printer-list-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length list-count printers)
    (declare (ignorable %p response-type sequence length list-count printers))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf list-count (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (printers %p)
      (xcb:read-struct-vector-at %buf %p (min list-count (- (+ %pos 32 (* 4 length)) %p)) %order
       #'decode-printer))
    (values
     (make-instance 'print-get-printer-list-reply :response-type response-type :sequence sequence
                    :length length :list-count list-count :printers printers)
     (+ %pos 32 (* 4 length)))))
(defun print-get-printer-list-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-printer-list-reply))

;;; Request xcb.XPrint.PrintRehashPrinterList
(defun print-rehash-printer-list (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 20)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-rehash-printer-list-request (xcb:request) nil)
(defmethod xcb:send-request (conn (%obj print-rehash-printer-list-request))
  (print-rehash-printer-list conn))

;;; Request xcb.XPrint.CreateContext
(defun create-context (conn context-id printer-name locale)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT"))
         (%buf (xcb:conn-send-buffer conn))
         (printer-name-len (cl:length printer-name))
         (locale-len (cl:length locale)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 2)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context-id)
    (xcb:buffer-write-card32 %buf printer-name-len)
    (xcb:buffer-write-card32 %buf locale-len)
    (xcb:buffer-write-string-octets %buf printer-name printer-name-len)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-string-octets %buf locale locale-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass create-context-request (xcb:request)
          ((context-id :initarg :context-id :type (unsigned-byte 32))
           (printer-name-len :initarg :printer-name-len :type (unsigned-byte 32))
           (locale-len :initarg :locale-len :type (unsigned-byte 32))
           (printer-name :initarg :printer-name :type cl:sequence)
           (locale :initarg :locale :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj create-context-request))
  (create-context conn (slot-value %obj 'context-id) (slot-value %obj 'printer-name)
   (slot-value %obj 'locale)))

;;; Request xcb.XPrint.PrintSetContext
(defun print-set-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 3)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-set-context-request (xcb:request)
          ((context :initarg :context :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj print-set-context-request))
  (print-set-context conn (slot-value %obj 'context)))

;;; Request xcb.XPrint.PrintGetContext
(defun print-get-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 4)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj print-get-context-request)) (print-get-context conn))
(defclass print-get-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (context :initarg :context :accessor context :type (unsigned-byte 32))))
(defun decode-print-get-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length context)
    (declare (ignorable %p response-type sequence length context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf context (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'print-get-context-reply :response-type response-type :sequence sequence
                    :length length :context context)
     (+ %pos 32 (* 4 length)))))
(defun print-get-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-context-reply))

;;; Request xcb.XPrint.PrintDestroyContext
(defun print-destroy-context (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 5)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-destroy-context-request (xcb:request)
          ((context :initarg :context :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj print-destroy-context-request))
  (print-destroy-context conn (slot-value %obj 'context)))

;;; Request xcb.XPrint.PrintGetScreenOfContext
(defun print-get-screen-of-context (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 6)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-screen-of-context-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj print-get-screen-of-context-request))
  (print-get-screen-of-context conn))
(defclass print-get-screen-of-context-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (root :initarg :root :accessor root :type xcb:window)))
(defun decode-print-get-screen-of-context-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length root)
    (declare (ignorable %p response-type sequence length root))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf root (xcb:read-card32-at %buf (+ %p 8) %order))
    (values
     (make-instance 'print-get-screen-of-context-reply :response-type response-type :sequence
                    sequence :length length :root root)
     (+ %pos 32 (* 4 length)))))
(defun print-get-screen-of-context-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-screen-of-context-reply))

;;; Request xcb.XPrint.PrintStartJob
(defun print-start-job (conn output-mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 7)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf output-mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-start-job-request (xcb:request)
          ((output-mode :initarg :output-mode :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj print-start-job-request))
  (print-start-job conn (slot-value %obj 'output-mode)))

;;; Request xcb.XPrint.PrintEndJob
(defun print-end-job (conn cancel)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 8)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-bool %buf cancel)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-end-job-request (xcb:request)
          ((cancel :initarg :cancel :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj print-end-job-request))
  (print-end-job conn (slot-value %obj 'cancel)))

;;; Request xcb.XPrint.PrintStartDoc
(defun print-start-doc (conn driver-mode)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 9)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card8 %buf driver-mode)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-start-doc-request (xcb:request)
          ((driver-mode :initarg :driver-mode :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj print-start-doc-request))
  (print-start-doc conn (slot-value %obj 'driver-mode)))

;;; Request xcb.XPrint.PrintEndDoc
(defun print-end-doc (conn cancel)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 10)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-bool %buf cancel)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-end-doc-request (xcb:request)
          ((cancel :initarg :cancel :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj print-end-doc-request))
  (print-end-doc conn (slot-value %obj 'cancel)))

;;; Request xcb.XPrint.PrintPutDocumentData
(defun print-put-document-data (conn drawable data doc-format options)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT"))
         (%buf (xcb:conn-send-buffer conn))
         (len-data (cl:length data))
         (len-fmt (cl:length doc-format))
         (len-options (cl:length options)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 11)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf drawable)
    (xcb:buffer-write-card32 %buf len-data)
    (xcb:buffer-write-card16 %buf len-fmt)
    (xcb:buffer-write-card16 %buf len-options)
    (xcb:buffer-write-octets %buf data :end len-data)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-string-octets %buf doc-format len-fmt)
    (xcb:buffer-pad-to-align %buf 4)
    (xcb:buffer-write-string-octets %buf options len-options)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-put-document-data-request (xcb:request)
          ((drawable :initarg :drawable :type xcb:drawable)
           (len-data :initarg :len-data :type (unsigned-byte 32))
           (len-fmt :initarg :len-fmt :type (unsigned-byte 16))
           (len-options :initarg :len-options :type (unsigned-byte 16))
           (data :initarg :data :type cl:sequence)
           (doc-format :initarg :doc-format :type cl:sequence)
           (options :initarg :options :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj print-put-document-data-request))
  (print-put-document-data conn (slot-value %obj 'drawable) (slot-value %obj 'data)
   (slot-value %obj 'doc-format) (slot-value %obj 'options)))

;;; Request xcb.XPrint.PrintGetDocumentData
(defun print-get-document-data (conn context max-bytes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 12)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf max-bytes)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-document-data-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)
           (max-bytes :initarg :max-bytes :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj print-get-document-data-request))
  (print-get-document-data conn (slot-value %obj 'context) (slot-value %obj 'max-bytes)))
(defclass print-get-document-data-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (status-code :initarg :status-code :accessor status-code :type (unsigned-byte 32))
           (finished-flag :initarg :finished-flag :accessor finished-flag :type (unsigned-byte 32))
           (data-len :initarg :data-len :accessor data-len :type (unsigned-byte 32))
           (data :initarg :data :accessor data :type cl:sequence)))
(defun decode-print-get-document-data-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length status-code finished-flag data-len data)
    (declare (ignorable %p response-type sequence length status-code finished-flag data-len data))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf status-code (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf finished-flag (xcb:read-card32-at %buf (+ %p 12) %order))
    (setf data-len (xcb:read-card32-at %buf (+ %p 16) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (data %p)
      (xcb:read-vector-at %buf %p (min data-len (floor (- (+ %pos 32 (* 4 length)) %p) 1)) %order
       :card8))
    (values
     (make-instance 'print-get-document-data-reply :response-type response-type :sequence sequence
                    :length length :status-code status-code :finished-flag finished-flag :data-len
                    data-len :data data)
     (+ %pos 32 (* 4 length)))))
(defun print-get-document-data-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-document-data-reply))

;;; Request xcb.XPrint.PrintStartPage
(defun print-start-page (conn window)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 13)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf window)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-start-page-request (xcb:request) ((window :initarg :window :type xcb:window)))
(defmethod xcb:send-request (conn (%obj print-start-page-request))
  (print-start-page conn (slot-value %obj 'window)))

;;; Request xcb.XPrint.PrintEndPage
(defun print-end-page (conn cancel)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 14)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-bool %buf cancel)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-end-page-request (xcb:request)
          ((cancel :initarg :cancel :type (or boolean (unsigned-byte 8)))))
(defmethod xcb:send-request (conn (%obj print-end-page-request))
  (print-end-page conn (slot-value %obj 'cancel)))

;;; Request xcb.XPrint.PrintSelectInput
(defun print-select-input (conn context event-mask)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 15)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf event-mask)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-select-input-request (xcb:request)
          ((context :initarg :context :type pcontext)
           (event-mask :initarg :event-mask :type (unsigned-byte 32))))
(defmethod xcb:send-request (conn (%obj print-select-input-request))
  (print-select-input conn (slot-value %obj 'context) (slot-value %obj 'event-mask)))

;;; Request xcb.XPrint.PrintInputSelected
(defun print-input-selected (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 16)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-input-selected-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)))
(defmethod xcb:send-request (conn (%obj print-input-selected-request))
  (print-input-selected conn (slot-value %obj 'context)))
(defclass print-input-selected-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (event-mask :initarg :event-mask :accessor event-mask :type (unsigned-byte 32))
           (all-events-mask :initarg :all-events-mask :accessor all-events-mask :type
            (unsigned-byte 32))))
(defun decode-print-input-selected-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length event-mask all-events-mask)
    (declare (ignorable %p response-type sequence length event-mask all-events-mask))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf event-mask (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf all-events-mask (xcb:read-card32-at %buf (+ %p 12) %order))
    (values
     (make-instance 'print-input-selected-reply :response-type response-type :sequence sequence
                    :length length :event-mask event-mask :all-events-mask all-events-mask)
     (+ %pos 32 (* 4 length)))))
(defun print-input-selected-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-input-selected-reply))

;;; Request xcb.XPrint.PrintGetAttributes
(defun print-get-attributes (conn context pool)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 17)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card8 %buf pool)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-attributes-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)
           (pool :initarg :pool :type (unsigned-byte 8))))
(defmethod xcb:send-request (conn (%obj print-get-attributes-request))
  (print-get-attributes conn (slot-value %obj 'context) (slot-value %obj 'pool)))
(defclass print-get-attributes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (string-len :initarg :string-len :accessor string-len :type (unsigned-byte 32))
           (attributes :initarg :attributes :accessor attributes :type cl:sequence)))
(defun decode-print-get-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length string-len attributes)
    (declare (ignorable %p response-type sequence length string-len attributes))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf string-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf attributes
            (xcb:read-string-at %buf %p
             (min string-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length attributes))
    (values
     (make-instance 'print-get-attributes-reply :response-type response-type :sequence sequence
                    :length length :string-len string-len :attributes attributes)
     (+ %pos 32 (* 4 length)))))
(defun print-get-attributes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-attributes-reply))

;;; Request xcb.XPrint.PrintGetOneAttributes
(defun print-get-one-attributes (conn context pool name)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT"))
         (%buf (xcb:conn-send-buffer conn))
         (name-len (cl:length name)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 19)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf name-len)
    (xcb:buffer-write-card8 %buf pool)
    (xcb:buffer-write-padding %buf 3)
    (xcb:buffer-write-string-octets %buf name name-len)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-one-attributes-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)
           (name-len :initarg :name-len :type (unsigned-byte 32))
           (pool :initarg :pool :type (unsigned-byte 8)) (name :initarg :name :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj print-get-one-attributes-request))
  (print-get-one-attributes conn (slot-value %obj 'context) (slot-value %obj 'pool)
   (slot-value %obj 'name)))
(defclass print-get-one-attributes-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (value-len :initarg :value-len :accessor value-len :type (unsigned-byte 32))
           (value :initarg :value :accessor value :type cl:sequence)))
(defun decode-print-get-one-attributes-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length value-len value)
    (declare (ignorable %p response-type sequence length value-len value))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf value-len (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (setf value
            (xcb:read-string-at %buf %p (min value-len (floor (- (+ %pos 32 (* 4 length)) %p) 1))))
    (incf %p (cl:length value))
    (values
     (make-instance 'print-get-one-attributes-reply :response-type response-type :sequence sequence
                    :length length :value-len value-len :value value)
     (+ %pos 32 (* 4 length)))))
(defun print-get-one-attributes-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-one-attributes-reply))

;;; Request xcb.XPrint.PrintSetAttributes
(defun print-set-attributes (conn context string-len pool rule attributes)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 18)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card32 %buf string-len)
    (xcb:buffer-write-card8 %buf pool)
    (xcb:buffer-write-card8 %buf rule)
    (xcb:buffer-write-padding %buf 2)
    (xcb:buffer-write-string-octets %buf attributes nil)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn)))
(defclass print-set-attributes-request (xcb:request)
          ((context :initarg :context :type pcontext)
           (string-len :initarg :string-len :type (unsigned-byte 32))
           (pool :initarg :pool :type (unsigned-byte 8))
           (rule :initarg :rule :type (unsigned-byte 8))
           (attributes :initarg :attributes :type cl:sequence)))
(defmethod xcb:send-request (conn (%obj print-set-attributes-request))
  (print-set-attributes conn (slot-value %obj 'context) (slot-value %obj 'string-len)
   (slot-value %obj 'pool) (slot-value %obj 'rule) (slot-value %obj 'attributes)))

;;; Request xcb.XPrint.PrintGetPageDimensions
(defun print-get-page-dimensions (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 21)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-page-dimensions-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)))
(defmethod xcb:send-request (conn (%obj print-get-page-dimensions-request))
  (print-get-page-dimensions conn (slot-value %obj 'context)))
(defclass print-get-page-dimensions-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (width :initarg :width :accessor width :type (unsigned-byte 16))
           (height :initarg :height :accessor height :type (unsigned-byte 16))
           (offset-x :initarg :offset-x :accessor offset-x :type (unsigned-byte 16))
           (offset-y :initarg :offset-y :accessor offset-y :type (unsigned-byte 16))
           (reproducible-width :initarg :reproducible-width :accessor reproducible-width :type
            (unsigned-byte 16))
           (reproducible-height :initarg :reproducible-height :accessor reproducible-height :type
            (unsigned-byte 16))))
(defun decode-print-get-page-dimensions-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos)
        response-type
        sequence
        length
        width
        height
        offset-x
        offset-y
        reproducible-width
        reproducible-height)
    (declare
     (ignorable %p response-type sequence length width height offset-x offset-y reproducible-width
      reproducible-height))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf width (xcb:read-card16-at %buf (+ %p 8) %order))
    (setf height (xcb:read-card16-at %buf (+ %p 10) %order))
    (setf offset-x (xcb:read-card16-at %buf (+ %p 12) %order))
    (setf offset-y (xcb:read-card16-at %buf (+ %p 14) %order))
    (setf reproducible-width (xcb:read-card16-at %buf (+ %p 16) %order))
    (setf reproducible-height (xcb:read-card16-at %buf (+ %p 18) %order))
    (values
     (make-instance 'print-get-page-dimensions-reply :response-type response-type :sequence
                    sequence :length length :width width :height height :offset-x offset-x
                    :offset-y offset-y :reproducible-width reproducible-width :reproducible-height
                    reproducible-height)
     (+ %pos 32 (* 4 length)))))
(defun print-get-page-dimensions-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-page-dimensions-reply))

;;; Request xcb.XPrint.PrintQueryScreens
(defun print-query-screens (conn)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 22)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-query-screens-request (xcb:request-with-reply) nil)
(defmethod xcb:send-request (conn (%obj print-query-screens-request)) (print-query-screens conn))
(defclass print-query-screens-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (list-count :initarg :list-count :accessor list-count :type (unsigned-byte 32))
           (roots :initarg :roots :accessor roots :type cl:sequence)))
(defun decode-print-query-screens-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length list-count roots)
    (declare (ignorable %p response-type sequence length list-count roots))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf list-count (xcb:read-card32-at %buf (+ %p 8) %order))
    (setf %p (+ %p 32))
    (multiple-value-setq (roots %p)
      (xcb:read-vector-at %buf %p (min list-count (floor (- (+ %pos 32 (* 4 length)) %p) 4)) %order
       :card32))
    (values
     (make-instance 'print-query-screens-reply :response-type response-type :sequence sequence
                    :length length :list-count list-count :roots roots)
     (+ %pos 32 (* 4 length)))))
(defun print-query-screens-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-query-screens-reply))

;;; Request xcb.XPrint.PrintSetImageResolution
(defun print-set-image-resolution (conn context image-resolution)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 23)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-card16 %buf image-resolution)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-set-image-resolution-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)
           (image-resolution :initarg :image-resolution :type (unsigned-byte 16))))
(defmethod xcb:send-request (conn (%obj print-set-image-resolution-request))
  (print-set-image-resolution conn (slot-value %obj 'context) (slot-value %obj 'image-resolution)))
(defclass print-set-image-resolution-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (status :initarg :status :accessor status :type (or boolean (unsigned-byte 8)))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (previous-resolutions :initarg :previous-resolutions :accessor previous-resolutions
            :type (unsigned-byte 16))))
(defun decode-print-set-image-resolution-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type status sequence length previous-resolutions)
    (declare (ignorable %p response-type status sequence length previous-resolutions))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf status (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf previous-resolutions (xcb:read-card16-at %buf (+ %p 8) %order))
    (values
     (make-instance 'print-set-image-resolution-reply :response-type response-type :status status
                    :sequence sequence :length length :previous-resolutions previous-resolutions)
     (+ %pos 32 (* 4 length)))))
(defun print-set-image-resolution-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-set-image-resolution-reply))

;;; Request xcb.XPrint.PrintGetImageResolution
(defun print-get-image-resolution (conn context)
  (let* ((%major (xcb:extension-major-opcode conn "XCB-XPRINT")) (%buf (xcb:conn-send-buffer conn)))
    (xcb:buffer-reset %buf)
    (xcb:buffer-write-card8 %buf %major)
    (xcb:buffer-write-card8 %buf 24)
    (xcb:buffer-write-card16 %buf 0)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-finish-request %buf)
    (xcb:flush-request conn :has-reply t)))
(defclass print-get-image-resolution-request (xcb:request-with-reply)
          ((context :initarg :context :type pcontext)))
(defmethod xcb:send-request (conn (%obj print-get-image-resolution-request))
  (print-get-image-resolution conn (slot-value %obj 'context)))
(defclass print-get-image-resolution-reply (xcb:reply)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (length :initarg :length :accessor length :type (unsigned-byte 32))
           (image-resolution :initarg :image-resolution :accessor image-resolution :type
            (unsigned-byte 16))))
(defun decode-print-get-image-resolution-reply (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type sequence length image-resolution)
    (declare (ignorable %p response-type sequence length image-resolution))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf length (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf image-resolution (xcb:read-card16-at %buf (+ %p 8) %order))
    (values
     (make-instance 'print-get-image-resolution-reply :response-type response-type :sequence
                    sequence :length length :image-resolution image-resolution)
     (+ %pos 32 (* 4 length)))))
(defun print-get-image-resolution-reply (conn cookie)
  (xcb:read-reply conn cookie #'decode-print-get-image-resolution-reply))

;;; Event xcb.XPrint.Notify (0)
(defclass notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (context :initarg :context :accessor context :type pcontext)
           (cancel :initarg :cancel :accessor cancel :type (or boolean (unsigned-byte 8)))))
(defun decode-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type detail sequence context cancel)
    (declare (ignorable %p response-type detail sequence context cancel))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf detail (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf context (xcb:read-card32-at %buf (+ %p 4) %order))
    (setf cancel (xcb:read-card8-at %buf (+ %p 8)))
    (values
     (make-instance 'notify :response-type response-type :detail detail :sequence sequence :context
                    context :cancel cancel)
     (+ %pos 32))))
(defun encode-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (context (slot-value %obj 'context))
         (cancel (slot-value %obj 'cancel)))
    (declare (ignorable response-type detail sequence context cancel))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf detail)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-bool %buf cancel)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj notify)) (encode-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XPRINT" 0 #'decode-notify)

;;; Event xcb.XPrint.AttributNotify (1)
(defclass attribut-notify (xcb:event)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (detail :initarg :detail :accessor detail :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (context :initarg :context :accessor context :type pcontext)))
(defun decode-attribut-notify (%buf %pos %order)
  (declare (ignorable %buf %order))
  (let ((%p %pos) response-type detail sequence context)
    (declare (ignorable %p response-type detail sequence context))
    (setf response-type (xcb:read-card8-at %buf %p))
    (setf detail (xcb:read-card8-at %buf (+ %p 1)))
    (setf sequence (xcb:read-card16-at %buf (+ %p 2) %order))
    (setf context (xcb:read-card32-at %buf (+ %p 4) %order))
    (values
     (make-instance 'attribut-notify :response-type response-type :detail detail :sequence sequence
                    :context context)
     (+ %pos 32))))
(defun encode-attribut-notify (%buf %obj)
  (declare (ignorable %buf %obj))
  (let* ((%start (xcb:buffer-position %buf))
         (response-type (slot-value %obj 'response-type))
         (detail (slot-value %obj 'detail))
         (sequence (slot-value %obj 'sequence))
         (context (slot-value %obj 'context)))
    (declare (ignorable response-type detail sequence context))
    (xcb:buffer-write-card8 %buf response-type)
    (xcb:buffer-write-card8 %buf detail)
    (xcb:buffer-write-card16 %buf sequence)
    (xcb:buffer-write-card32 %buf context)
    (xcb:buffer-write-padding %buf (- 32 (- (xcb:buffer-position %buf) %start)))))
(defmethod xcb:encode-event (%buf (%obj attribut-notify)) (encode-attribut-notify %buf %obj))
(xcb:register-extension-event-decoder "XCB-XPRINT" 1 #'decode-attribut-notify)

;;; Error xcb.XPrint.BadContext (0)
(defclass bad-context-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-context-error (%buf %pos %order)
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
     (make-instance 'bad-context-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XPRINT" 0 #'decode-bad-context-error)

;;; Error xcb.XPrint.BadSequence (1)
(defclass bad-sequence-error (xcb:error)
          ((response-type :initarg :response-type :accessor response-type :type (unsigned-byte 8))
           (error-code :initarg :error-code :accessor error-code :type (unsigned-byte 8))
           (sequence :initarg :sequence :accessor sequence :type (unsigned-byte 16))
           (bad-value :initarg :bad-value :accessor bad-value :type (unsigned-byte 32))
           (minor-opcode :initarg :minor-opcode :accessor minor-opcode :type (unsigned-byte 16))
           (major-opcode :initarg :major-opcode :accessor major-opcode :type (unsigned-byte 8))))
(defun decode-bad-sequence-error (%buf %pos %order)
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
     (make-instance 'bad-sequence-error :response-type response-type :error-code error-code
                    :sequence sequence :bad-value bad-value :minor-opcode minor-opcode
                    :major-opcode major-opcode)
     (+ %pos 32))))
(xcb:register-extension-error-decoder "XCB-XPRINT" 1 #'decode-bad-sequence-error)
