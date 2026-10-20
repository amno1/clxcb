;;; platform-cffi.lisp — the platform layer on CFFI and bordeaux-threads.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; Acknowledgements
;;;
;;; The C structures and constants are those of the Linux headers
;;; (sys/socket.h, sys/uio.h, poll.h, errno.h), as documented in
;;; sendmsg(2), recvmsg(2), cmsg(3), poll(2) and errno(3).

;;; Commentary:
;;;
;;; The default platform layer (see platform.lisp for the interface):
;;; usocket for sockets, bordeaux-threads' APIv2 for locks and
;;; condition variables, trivial-garbage for the weak per-thread
;;; table, and CFFI for poll,
;;; close, shutdown, getpid, errno and sendmsg/recvmsg.  The constants
;;; and layouts are written in for Linux, rather than groveled, so that
;;; loading CLXCB needs no C compiler; on another OS descriptor passing
;;; is off, and a connection talks through its usocket stream.
;;;
;;; What stays per implementation is how to get a usocket's descriptor,
;;; which no portability library offers, and how to point C at a Lisp
;;; octet vector: directly where CFFI can pin it (SBCL, ECL), through a
;;; foreign copy elsewhere.

(in-package "XCB")

(when (eq *platform* :sbcl)
  (cl:error "CLXCB's SBCL platform layer is already loaded in this image."))

(setf *platform* :cffi)


;;; Threads

(defun %make-lock (name) (bt2:make-lock :name name))
(defun %make-cv (name) (bt2:make-condition-variable :name name))

(defun %call-with-lock (lock thunk)
  (declare (cl:function thunk))
  (bt2:with-lock-held (lock) (funcall thunk)))

(defun %grab-lock (lock) (bt2:acquire-lock lock))
(defun %release-lock (lock) (bt2:release-lock lock))

(defun %cv-wait (cv lock &optional timeout)
  (bt2:condition-wait cv lock :timeout timeout))

(defun %cv-broadcast (cv) (bt2:condition-broadcast cv))

(defun %make-thread-table ()
  (cons (bt2:make-lock :name "clxcb thread table")
        (tg:make-weak-hash-table :test 'eq :weakness :key)))

(defun %thread-table-ensure (table make)
  (declare (cl:function make))
  (let ((thread (bt2:current-thread)))
    (bt2:with-lock-held ((car table))
      (or (gethash thread (cdr table))
          (setf (gethash thread (cdr table)) (funcall make))))))


;;; errno

#+linux (cffi:defcfun ("__errno_location" %errno-location) :pointer)
#+(or darwin freebsd) (cffi:defcfun ("__error" %errno-location) :pointer)

(defun %errno () (cffi:mem-ref (%errno-location) :int))

(cffi:defcfun ("strerror" %strerror) :string (errnum :int))

(defconstant +eintr+ 4)
(defconstant +eagain+ #+linux 11 #-linux 35)

(defun %socket-error (call fd &optional (errno (%errno)))
  (cl:error "~A on file descriptor ~D failed: ~A" call fd (%strerror errno)))


;;; Descriptors and sockets

(cffi:defcstruct pollfd (fd :int) (events :short) (revents :short))
(cffi:defcfun ("poll" %poll) :int (fds :pointer) (nfds :unsigned-long) (timeout :int))
(cffi:defcfun ("close" %c-close) :int (fd :int))
(cffi:defcfun ("shutdown" %c-shutdown) :int (fd :int) (how :int))
(cffi:defcfun ("getpid" %c-getpid) :int)

(defconstant +pollin+ 1)
(defconstant +pollout+ 4)
(defconstant +shut-rdwr+ 2)

(defun %wait-fd (fd direction &optional timeout)
  (let ((deadline (and timeout
                       (+ (get-internal-real-time)
                          (* timeout internal-time-units-per-second)))))
    (cffi:with-foreign-object (p '(:struct pollfd))
      (loop
        (setf (cffi:foreign-slot-value p '(:struct pollfd) 'fd) fd
              (cffi:foreign-slot-value p '(:struct pollfd) 'events)
              (ecase direction (:input +pollin+) (:output +pollout+))
              (cffi:foreign-slot-value p '(:struct pollfd) 'revents) 0)
        (let* ((ms (if deadline
                       (min #x7FFFFFFF
                            (max 0 (ceiling (* 1000 (- deadline (get-internal-real-time)))
                                            internal-time-units-per-second)))
                       -1))
               (n (%poll p 1 ms)))
          (cond ((plusp n) (return t))
                ((zerop n) (return nil))
                (t (let ((errno (%errno)))
                     (unless (= errno +eintr+)
                       (%socket-error "poll" fd errno))))))))))

(defun %close-fd (fd)
  (when (minusp (%c-close fd))
    (%socket-error "close" fd))
  (cl:values))

(defun %getpid () (%c-getpid))

(defun %open-socket (path host port timeout)
  (if host
      (usocket:socket-connect host port :protocol :stream
                                        :element-type '(unsigned-byte 8)
                                        :nodelay t :timeout timeout)
      (usocket:socket-connect (pathname path) nil :protocol :stream
                                                  :element-type '(unsigned-byte 8)
                                                  :timeout timeout)))

(defun %socket-stream (socket) (usocket:socket-stream socket))

(defun %socket-fd (socket)
  (let ((s (usocket:socket socket)))
    #+(or sbcl ecl) (sb-bsd-sockets:socket-file-descriptor s)
    #+ccl (ccl:socket-os-fd s)
    #-(or sbcl ecl ccl) (and (integerp s) s)))

(defun %shutdown-socket (socket)
  (let ((fd (%socket-fd socket)))
    (if fd
        (%c-shutdown fd +shut-rdwr+)
        (usocket:socket-shutdown socket :io))))

(defun %close-socket (socket) (usocket:socket-close socket))

(defun %socket-peer-address (socket)
  (cl:values (usocket:get-peer-address socket)))


;;; Floats

(defun %single-float-bits (x)
  (cffi:with-foreign-object (p :uint32)
    (setf (cffi:mem-ref p :float) x)
    (cffi:mem-ref p :int32)))

(defun %make-single-float (bits)
  (cffi:with-foreign-object (p :uint32)
    (setf (cffi:mem-ref p :int32) bits)
    (cffi:mem-ref p :float)))

(defun %double-float-bits (x)
  (cffi:with-foreign-object (p :uint64)
    (setf (cffi:mem-ref p :double) x)
    (let* ((bits (cffi:mem-ref p :uint64))
           (hi (ldb (byte 32 32) bits)))
      (cl:values (if (logbitp 31 hi) (- hi (ash 1 32)) hi)
                 (ldb (byte 32 0) bits)))))

(defun %make-double-float (hi lo)
  (cffi:with-foreign-object (p :uint64)
    (setf (cffi:mem-ref p :uint64) (logior (ash (ldb (byte 32 0) hi) 32) lo))
    (cffi:mem-ref p :double)))


;;; Octet vectors as C buffers

(defun %call-with-octets-pointer (vector start end copy-in thunk)
  "Call THUNK with a pointer to the bytes START to END of VECTOR, a
   (SIMPLE-ARRAY OCTET (*)), and return its values.  On SBCL and ECL
   the vector is pinned and the pointer is into it.  Elsewhere the
   pointer is to a foreign copy: filled from VECTOR
   when COPY-IN, and copied back, as many bytes as THUNK's first value
   when that is an integer, when not."
  (declare (cl:type (simple-array octet (*)) vector)
           (cl:function thunk))
  #+(or sbcl ecl)
  (progn
    copy-in end                         ; a pinned vector needs neither
    (cffi:with-pointer-to-vector-data (base vector)
      (funcall thunk (cffi:inc-pointer base start))))
  #-(or sbcl ecl)
  (let ((n (- end start)))
    (cffi:with-foreign-pointer (p (max n 1))
      (when copy-in
        (dotimes (i n) (setf (cffi:mem-aref p :uint8 i) (aref vector (+ start i)))))
      (let ((values (multiple-value-list (funcall thunk p))))
        (when (and (not copy-in) (integerp (first values)))
          (dotimes (i (min n (first values)))
            (setf (aref vector (+ start i)) (cffi:mem-aref p :uint8 i))))
        (cl:values-list values)))))


;;; sendmsg and recvmsg (see platform.lisp)

#+linux
(progn
  (cffi:defcstruct iovec (base :pointer) (len :size))

  (cffi:defcstruct msghdr
    (name :pointer) (namelen :uint32)
    (iov :pointer) (iovlen :size)
    (control :pointer) (controllen :size)
    (flags :int))

  (cffi:defcfun ("sendmsg" %sendmsg) :long (fd :int) (msg :pointer) (flags :int))
  (cffi:defcfun ("recvmsg" %recvmsg) :long (fd :int) (msg :pointer) (flags :int))

  (defconstant +sol-socket+ 1)
  (defconstant +scm-rights+ 1)
  (defconstant +msg-ctrunc+ #x8)
  (defconstant +msg-dontwait+ #x40)
  (defconstant +msg-nosignal+ #x4000)
  (defconstant +msg-cmsg-cloexec+ #x40000000)

  ;; struct cmsghdr { size_t cmsg_len; int cmsg_level; int cmsg_type; }
  ;; and CMSG_ALIGN rounds up to sizeof (size_t).
  (defconstant +size-t+ (cffi:foreign-type-size :size))
  (defconstant +cmsg-header+ (* +size-t+ (ceiling (+ +size-t+ 8) +size-t+)))

  (defun %cmsg-space (payload)
    "CMSG_SPACE: the room a control message with PAYLOAD bytes takes."
    (+ +cmsg-header+ (* +size-t+ (ceiling payload +size-t+))))

  (defconstant +max-fds+ 64
    "The most descriptors one sendmsg or recvmsg carries.  The kernel
     caps a single SCM_RIGHTS message at 253; X requests pass at most a
     handful.")

  ;; Room for +MAX-FDS+ descriptors: CMSG_SPACE (4 * 64) = 272 bytes
  ;; with an 8-byte size_t.
  (defconstant +control-size+ 512)

  (defun %fill-msghdr (msg iov data count control control-len)
    (setf (cffi:foreign-slot-value iov '(:struct iovec) 'base) data
          (cffi:foreign-slot-value iov '(:struct iovec) 'len) count)
    (macrolet ((slot (name) `(cffi:foreign-slot-value msg '(:struct msghdr) ',name)))
      (setf (slot name) (cffi:null-pointer) (slot namelen) 0
            (slot iov) iov (slot iovlen) 1
            (slot control) control (slot controllen) control-len
            (slot flags) 0)))

  (defun %fill-rights (control fds)
    "Write one SCM_RIGHTS message carrying FDS at CONTROL; return its
     CMSG_SPACE."
    (let ((space (%cmsg-space (* 4 (cl:length fds)))))
      (dotimes (i space) (setf (cffi:mem-aref control :uint8 i) 0))
      (setf (cffi:mem-ref control :size 0) (+ +cmsg-header+ (* 4 (cl:length fds)))
            (cffi:mem-ref control :int +size-t+) +sol-socket+
            (cffi:mem-ref control :int (+ +size-t+ 4)) +scm-rights+)
      (loop for fd in fds
            for offset from +cmsg-header+ by 4
            do (setf (cffi:mem-ref control :int offset) fd))
      space))

  (defun %received-fds (control control-len)
    "The descriptors in every SCM_RIGHTS message of the control buffer
     at CONTROL, in order."
    (let ((fds '()) (offset 0))
      (loop while (<= (+ offset +cmsg-header+) control-len)
            do (let* ((p (cffi:inc-pointer control offset))
                      (len (cffi:mem-ref p :size 0)))
                 (when (< len +cmsg-header+) (return))
                 (when (and (= (cffi:mem-ref p :int +size-t+) +sol-socket+)
                            (= (cffi:mem-ref p :int (+ +size-t+ 4)) +scm-rights+))
                   (loop for q from +cmsg-header+ below len by 4
                         do (push (cffi:mem-ref p :int q) fds)))
                 (incf offset (* +size-t+ (ceiling len +size-t+)))))
      (nreverse fds)))

  (defun %socket-send-now (fd octets start end fds)
    "One non-blocking sendmsg: the number of bytes written, or :AGAIN."
    (when (> (cl:length fds) +max-fds+)
      (cl:error "Cannot send ~D file descriptors at once" (cl:length fds)))
    (cffi:with-foreign-objects ((msg '(:struct msghdr))
                                (iov '(:struct iovec))
                                (control :uint8 +control-size+))
      (%call-with-octets-pointer
       octets start end t
       (lambda (data)
         (let ((control-len (if fds (%fill-rights control fds) 0)))
           (%fill-msghdr msg iov data (- end start)
                         (if fds control (cffi:null-pointer)) control-len)
           (loop
             (let ((n (%sendmsg fd msg (logior +msg-nosignal+ +msg-dontwait+))))
               (if (>= n 0)
                   (return n)
                   (let ((errno (%errno)))
                     (cond ((= errno +eintr+))
                           ((= errno +eagain+) (return :again))
                           (t (%socket-error "sendmsg" fd errno))))))))))))

  (defun %socket-send (fd octets start end fds)
    (loop while (< start end)
          do (let ((n (%socket-send-now fd octets start end fds)))
               (if (eq n :again)
                   (%wait-fd fd :output)
                   (progn (incf start n)
                          ;; The descriptors went with the first byte.
                          (setf fds nil)))))
    (cl:values))

  (defun %socket-receive-now (fd buffer start end)
    "One non-blocking recvmsg: (VALUES COUNT FDS), or :AGAIN."
    (cffi:with-foreign-objects ((msg '(:struct msghdr))
                                (iov '(:struct iovec))
                                (control :uint8 +control-size+))
      (let ((received '()))
        (let ((n (%call-with-octets-pointer
                  buffer start end nil
                  (lambda (data)
                    (%fill-msghdr msg iov data (- end start) control +control-size+)
                    (loop
                      (let ((n (%recvmsg fd msg (logior +msg-cmsg-cloexec+ +msg-dontwait+))))
                        (if (>= n 0)
                            (progn
                              (when (logtest (cffi:foreign-slot-value msg '(:struct msghdr) 'flags)
                                             +msg-ctrunc+)
                                (cl:error "recvmsg on file descriptor ~D: more descriptors ~
                                           arrived than fit, and the kernel discarded some" fd))
                              (setf received
                                    (%received-fds control
                                                   (cffi:foreign-slot-value
                                                    msg '(:struct msghdr) 'controllen)))
                              (return n))
                            (let ((errno (%errno)))
                              (cond ((= errno +eintr+))
                                    ((= errno +eagain+) (return :again))
                                    (t (%socket-error "recvmsg" fd errno)))))))))))
          (if (eq n :again) :again (cl:values n received))))))

  (defun %socket-receive (fd buffer start end)
    (loop
      (%wait-fd fd :input)
      (multiple-value-bind (n fds) (%socket-receive-now fd buffer start end)
        (unless (eq n :again)
          (return (cl:values n fds))))))

  (setf *fd-passing-supported* t))

#-linux
(progn
  (defun %socket-send (fd octets start end fds)
    (declare (ignore fd octets start end fds))
    (require-fd-passing '%socket-send))
  (defun %socket-receive (fd buffer start end)
    (declare (ignore fd buffer start end))
    (require-fd-passing '%socket-receive))
  (defun %socket-send-now (fd octets start end fds)
    (declare (ignore fd octets start end fds))
    (require-fd-passing '%socket-send-now))
  (defun %socket-receive-now (fd buffer start end)
    (declare (ignore fd buffer start end))
    (require-fd-passing '%socket-receive-now)))

;;; platform-cffi.lisp ends here
