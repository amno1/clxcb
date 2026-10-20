;;; platform-sbcl.lisp — the platform layer on SBCL's own interfaces.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:
;;;
;;; The platform layer is the set of functions declared in
;;; platform.lisp: locks and condition variables, per-thread tables,
;;; waiting on and closing a descriptor, the socket's descriptor,
;;; float bits, and the sendmsg/recvmsg primitives.
;;; Everything else in CLXCB calls only these, so it compiles the same
;;; whichever layer is loaded.
;;;
;;; This file implements them on SBCL alone: sb-thread, sb-sys,
;;; sb-alien, sb-kernel, and the sb-posix and sb-bsd-sockets contribs.  It is loaded by CLXCB/SBCL;
;;; platform-cffi.lisp, loaded by CLXCB/CFFI (the default), implements
;;; the same functions through usocket, CFFI, bordeaux-threads and
;;; trivial-garbage.  One image holds one layer: its locks, tables and
;;; sockets are what connections are made of, so the layer cannot
;;; change under open connections.

(in-package "XCB")

(when (eq *platform* :cffi)
  (cl:error "CLXCB's CFFI platform layer is already loaded in this ~
             image; CLXCB/SBCL cannot replace it.  Load CLXCB/SBCL in a ~
             fresh image, before anything that loads CLXCB or CLXCB/CFFI."))

(setf *platform* :sbcl)
(pushnew :clxcb-sbcl *features*)


;;; Threads

(defun %make-lock (name) (sb-thread:make-mutex :name name))
(defun %make-cv (name) (sb-thread:make-waitqueue :name name))

(defun %call-with-lock (lock thunk)
  (declare (cl:function thunk))
  (sb-thread:with-mutex (lock) (funcall thunk)))

(defun %grab-lock (lock) (sb-thread:grab-mutex lock))
(defun %release-lock (lock) (sb-thread:release-mutex lock))

(defun %cv-wait (cv lock &optional timeout)
  (if timeout
      (sb-thread:condition-wait cv lock :timeout timeout)
      (sb-thread:condition-wait cv lock)))

(defun %cv-broadcast (cv) (sb-thread:condition-broadcast cv))

(defun %make-thread-table ()
  (make-hash-table :test 'eq :weakness :key :synchronized t))

(defun %thread-table-ensure (table make)
  (declare (cl:function make))
  (let ((thread sb-thread:*current-thread*))
    (or (gethash thread table)
        (setf (gethash thread table) (funcall make)))))


;;; Descriptors and sockets

(defun %wait-fd (fd direction &optional timeout)
  (if timeout
      (sb-sys:wait-until-fd-usable fd direction timeout)
      (sb-sys:wait-until-fd-usable fd direction)))

(defun %close-fd (fd) (sb-posix:close fd))
(defun %getpid () (sb-posix:getpid))

(defun %connect-tcp (host port)
  "An INET or INET6 stream socket connected to HOST:PORT: every address
   HOST resolves to is tried in turn, as libxcb's _xcb_open_tcp does."
  (let ((last-error nil))
    (dolist (address (sb-bsd-sockets:host-ent-addresses
                      (sb-bsd-sockets:get-host-by-name host))
                     (cl:error last-error))
      (let ((socket (make-instance (if (= (cl:length address) 16)
                                       'sb-bsd-sockets:inet6-socket
                                       'sb-bsd-sockets:inet-socket)
                                   :type :stream :protocol :tcp)))
        (handler-case
            (progn (sb-bsd-sockets:socket-connect socket address port)
                   (setf (sb-bsd-sockets:sockopt-tcp-nodelay socket) t)
                   (return socket))
          (sb-bsd-sockets:socket-error (e)
            (sb-bsd-sockets:socket-close socket)
            (setf last-error e)))))))

(defun %open-socket (path host port timeout)
  "A (SOCKET . STREAM) pair.  sb-bsd-sockets cannot time a connect out,
   so TIMEOUT bounds only the stream's reads and writes."
  (let ((socket (if host
                    (%connect-tcp host port)
                    (let ((socket (make-instance 'sb-bsd-sockets:local-socket :type :stream)))
                      (handler-bind ((cl:error (lambda (e)
                                                 (declare (ignore e))
                                                 (sb-bsd-sockets:socket-close socket))))
                        (sb-bsd-sockets:socket-connect socket (namestring path)))
                      socket))))
    (cons socket
          (sb-bsd-sockets:socket-make-stream socket :input t :output t
                                                    :element-type '(unsigned-byte 8)
                                                    :buffering :full
                                                    :timeout timeout))))

(defun %socket-stream (socket) (cdr socket))

(defun %socket-fd (socket)
  (sb-bsd-sockets:socket-file-descriptor (car socket)))

(defun %shutdown-socket (socket)
  (sb-bsd-sockets:socket-shutdown (car socket) :direction :io))

(defun %close-socket (socket)
  ;; Closes the stream, and with it the descriptor.
  (sb-bsd-sockets:socket-close (car socket)))

(defun %socket-peer-address (socket)
  (cl:values (sb-bsd-sockets:socket-peername (car socket))))


;;; Floats

(defun %single-float-bits (x) (sb-kernel:single-float-bits x))
(defun %make-single-float (bits) (sb-kernel:make-single-float bits))
(defun %double-float-bits (x)
  (cl:values (sb-kernel:double-float-high-bits x) (sb-kernel:double-float-low-bits x)))
(defun %make-double-float (hi lo) (sb-kernel:make-double-float hi lo))


;;; sendmsg and recvmsg (see platform.lisp)
;;;
;;; The structure layouts are declared to sb-alien, which lays them out
;;; as the C compiler does; the CMSG_* macros are recomputed from the
;;; size of size_t, which is the whole of their platform dependence on
;;; Linux.

(setf *fd-passing-supported* #+linux t #-linux nil)

#+linux
(progn
  (sb-alien:define-alien-type nil
      (sb-alien:struct iovec
        (iov-base sb-sys:system-area-pointer)
        (iov-len  sb-alien:unsigned-long)))

  (sb-alien:define-alien-type nil
      (sb-alien:struct msghdr
        (msg-name       sb-sys:system-area-pointer)
        (msg-namelen    sb-alien:unsigned-int)
        (msg-iov        (* (sb-alien:struct iovec)))
        (msg-iovlen     sb-alien:unsigned-long)
        (msg-control    sb-sys:system-area-pointer)
        (msg-controllen sb-alien:unsigned-long)
        (msg-flags      sb-alien:int)))

  (sb-alien:define-alien-routine ("sendmsg" %sendmsg) sb-alien:long
    (fd sb-alien:int) (msg (* (sb-alien:struct msghdr))) (flags sb-alien:int))

  (sb-alien:define-alien-routine ("recvmsg" %recvmsg) sb-alien:long
    (fd sb-alien:int) (msg (* (sb-alien:struct msghdr))) (flags sb-alien:int))

  (defconstant +sol-socket+ 1)
  (defconstant +scm-rights+ 1)
  (defconstant +msg-ctrunc+ #x8)
  (defconstant +msg-dontwait+ #x40)
  (defconstant +msg-nosignal+ #x4000)
  (defconstant +msg-cmsg-cloexec+ #x40000000)
  (defconstant +eintr+ 4)
  (defconstant +eagain+ 11)

  ;; struct cmsghdr { size_t cmsg_len; int cmsg_level; int cmsg_type; }
  ;; and CMSG_ALIGN rounds up to sizeof (size_t).
  (defconstant +size-t+ (sb-alien:alien-size sb-alien:unsigned-long :bytes))
  (defconstant +cmsg-header+ (* +size-t+ (ceiling (+ +size-t+ 8) +size-t+)))

  (defun %cmsg-space (payload)
    "CMSG_SPACE: the room a control message with PAYLOAD bytes takes."
    (+ +cmsg-header+ (* +size-t+ (ceiling payload +size-t+))))

  (defconstant +max-fds+ 64
    "The most descriptors one sendmsg or recvmsg carries.  The kernel
     caps a single SCM_RIGHTS message at 253; X requests pass at most a
     handful.")

  ;; The control buffer's size, a literal because alien array types need
  ;; one: room for +MAX-FDS+ descriptors, CMSG_SPACE (4 * 64) = 272 bytes
  ;; with an 8-byte size_t.
  (defconstant +control-size+ 512)

  (defun %cmsg-len-ref (sap)
    (if (= +size-t+ 8) (sb-sys:sap-ref-64 sap 0) (sb-sys:sap-ref-32 sap 0)))

  (defun (setf %cmsg-len-ref) (value sap)
    (if (= +size-t+ 8)
        (setf (sb-sys:sap-ref-64 sap 0) value)
        (setf (sb-sys:sap-ref-32 sap 0) value)))

  (defun %fill-msghdr (msg iov data-sap count control-sap control-len)
    "Point the msghdr MSG at one iovec IOV (both alien pointers) that
     covers COUNT bytes at DATA-SAP, with CONTROL-LEN bytes of control
     buffer at CONTROL-SAP."
    (declare (cl:type (sb-alien:alien (* (sb-alien:struct msghdr))) msg)
             (cl:type (sb-alien:alien (* (sb-alien:struct iovec))) iov))
    (setf (sb-alien:slot (sb-alien:deref iov) 'iov-base) data-sap
          (sb-alien:slot (sb-alien:deref iov) 'iov-len) count
          (sb-alien:slot (sb-alien:deref msg) 'msg-name) (sb-sys:int-sap 0)
          (sb-alien:slot (sb-alien:deref msg) 'msg-namelen) 0
          (sb-alien:slot (sb-alien:deref msg) 'msg-iov) iov
          (sb-alien:slot (sb-alien:deref msg) 'msg-iovlen) 1
          (sb-alien:slot (sb-alien:deref msg) 'msg-control) control-sap
          (sb-alien:slot (sb-alien:deref msg) 'msg-controllen) control-len
          (sb-alien:slot (sb-alien:deref msg) 'msg-flags) 0))

  (defun %socket-error (call fd)
    (cl:error "~A on file descriptor ~D failed: ~A"
              call fd (sb-int:strerror (sb-alien:get-errno))))

  (defun %socket-send (fd octets start end fds)
    "Write OCTETS (a vector of octets) from START to END to socket FD,
     attaching the descriptors in the list FDS to the first byte as
     SCM_RIGHTS.  Loops until everything is written."
    (let ((vector (sb-ext:array-storage-vector octets)))
      (declare (cl:type (simple-array octet (*)) vector))
      (sb-alien:with-alien ((msg (sb-alien:struct msghdr))
                            (iov (sb-alien:struct iovec))
                            (control (array (sb-alien:unsigned 8) 512)))
        (when (> (cl:length fds) +max-fds+)
          (cl:error "Cannot send ~D file descriptors at once" (cl:length fds)))
        (loop with control-sap = (sb-alien:alien-sap control)
              while (< start end)
              do (sb-sys:with-pinned-objects (vector)
                   (let ((control-len (if fds (%cmsg-space (* 4 (cl:length fds))) 0)))
                     (when fds
                       (dotimes (i control-len)
                         (setf (sb-sys:sap-ref-8 control-sap i) 0))
                       (setf (%cmsg-len-ref control-sap) (+ +cmsg-header+ (* 4 (cl:length fds)))
                             (sb-sys:signed-sap-ref-32 control-sap +size-t+) +sol-socket+
                             (sb-sys:signed-sap-ref-32 control-sap (+ +size-t+ 4)) +scm-rights+)
                       (loop for fd-to-send in fds
                             for offset from +cmsg-header+ by 4
                             do (setf (sb-sys:signed-sap-ref-32 control-sap offset) fd-to-send)))
                     (%fill-msghdr (sb-alien:addr msg) (sb-alien:addr iov)
                                   (sb-sys:sap+ (sb-sys:vector-sap vector) start)
                                   (- end start)
                                   (if fds control-sap (sb-sys:int-sap 0)) control-len)
                     (let ((n (%sendmsg fd (sb-alien:addr msg) +msg-nosignal+)))
                       (cond ((>= n 0)
                              (incf start n)
                              ;; The descriptors went with the first byte.
                              (setf fds nil))
                             ((= (sb-alien:get-errno) +eintr+))
                             ((= (sb-alien:get-errno) +eagain+)
                              (sb-sys:wait-until-fd-usable fd :output))
                             (t (%socket-error "sendmsg" fd)))))))))
    (cl:values))

  (defun %socket-receive (fd buffer start end)
    "Read at least one and at most END - START bytes from socket FD into
     BUFFER (a (SIMPLE-ARRAY OCTET (*))) at START, blocking until some
     are available.  Returns (VALUES COUNT FDS): COUNT is 0 at end of
     file, and FDS lists the descriptors that arrived with the bytes."
    (declare (cl:type (simple-array octet (*)) buffer))
    (sb-alien:with-alien ((msg (sb-alien:struct msghdr))
                          (iov (sb-alien:struct iovec))
                          (control (array (sb-alien:unsigned 8) 512)))
      (loop
        ;; Wait in Lisp, so the thread stays interruptible and serves
        ;; events, instead of blocking inside the foreign call.
        (sb-sys:wait-until-fd-usable fd :input)
        (let ((control-sap (sb-alien:alien-sap control)))
          (sb-sys:with-pinned-objects (buffer)
            (%fill-msghdr (sb-alien:addr msg) (sb-alien:addr iov)
                          (sb-sys:sap+ (sb-sys:vector-sap buffer) start)
                          (- end start) control-sap +control-size+)
            ;; MSG_DONTWAIT: if the readiness just reported has gone by
            ;; the time we read (another reader of the descriptor, a
            ;; spurious wakeup), fail with EAGAIN and wait again rather
            ;; than block inside the foreign call.
            (let ((n (%recvmsg fd (sb-alien:addr msg)
                               (logior +msg-cmsg-cloexec+ +msg-dontwait+))))
              (cond
                ((>= n 0)
                 (when (logtest (sb-alien:slot msg 'msg-flags) +msg-ctrunc+)
                   (cl:error "recvmsg on file descriptor ~D: more descriptors ~
                              arrived than fit, and the kernel discarded some" fd))
                 (return (cl:values n (%received-fds control-sap
                                                     (sb-alien:slot msg 'msg-controllen)))))
                ((member (sb-alien:get-errno) (list +eintr+ +eagain+)))
                (t (%socket-error "recvmsg" fd)))))))))

  (defun %socket-send-now (fd octets start end fds)
    "One non-blocking sendmsg of OCTETS from START to END to socket FD,
     with FDS attached to the first byte.  Returns the number of bytes
     written, or :AGAIN if none could be written now.  Never waits: for
     use with the connection's I/O lock held."
    (let ((vector (sb-ext:array-storage-vector octets)))
      (declare (cl:type (simple-array octet (*)) vector))
      (when (> (cl:length fds) +max-fds+)
        (cl:error "Cannot send ~D file descriptors at once" (cl:length fds)))
      (sb-alien:with-alien ((msg (sb-alien:struct msghdr))
                            (iov (sb-alien:struct iovec))
                            (control (array (sb-alien:unsigned 8) 512)))
        (loop
          (sb-sys:with-pinned-objects (vector)
            (let ((control-sap (sb-alien:alien-sap control))
                  (control-len (if fds (%cmsg-space (* 4 (cl:length fds))) 0)))
              (when fds
                (dotimes (i control-len)
                  (setf (sb-sys:sap-ref-8 control-sap i) 0))
                (setf (%cmsg-len-ref control-sap) (+ +cmsg-header+ (* 4 (cl:length fds)))
                      (sb-sys:signed-sap-ref-32 control-sap +size-t+) +sol-socket+
                      (sb-sys:signed-sap-ref-32 control-sap (+ +size-t+ 4)) +scm-rights+)
                (loop for fd-to-send in fds
                      for offset from +cmsg-header+ by 4
                      do (setf (sb-sys:signed-sap-ref-32 control-sap offset) fd-to-send)))
              (%fill-msghdr (sb-alien:addr msg) (sb-alien:addr iov)
                            (sb-sys:sap+ (sb-sys:vector-sap vector) start)
                            (- end start)
                            (if fds control-sap (sb-sys:int-sap 0)) control-len)
              (let ((n (%sendmsg fd (sb-alien:addr msg)
                                 (logior +msg-nosignal+ +msg-dontwait+))))
                (cond ((>= n 0) (return n))
                      ((= (sb-alien:get-errno) +eintr+))
                      ((= (sb-alien:get-errno) +eagain+) (return :again))
                      (t (%socket-error "sendmsg" fd))))))))))

  (defun %socket-receive-now (fd buffer start end)
    "One non-blocking recvmsg from socket FD into BUFFER from START, at
     most END - START bytes.  Returns (VALUES COUNT FDS), COUNT 0 at end
     of file, or :AGAIN if nothing can be read now.  Never waits: for use
     with the connection's I/O lock held."
    (declare (cl:type (simple-array octet (*)) buffer))
    (sb-alien:with-alien ((msg (sb-alien:struct msghdr))
                          (iov (sb-alien:struct iovec))
                          (control (array (sb-alien:unsigned 8) 512)))
      (loop
        (let ((control-sap (sb-alien:alien-sap control)))
          (sb-sys:with-pinned-objects (buffer)
            (%fill-msghdr (sb-alien:addr msg) (sb-alien:addr iov)
                          (sb-sys:sap+ (sb-sys:vector-sap buffer) start)
                          (- end start) control-sap +control-size+)
            (let ((n (%recvmsg fd (sb-alien:addr msg)
                               (logior +msg-cmsg-cloexec+ +msg-dontwait+))))
              (cond
                ((>= n 0)
                 (when (logtest (sb-alien:slot msg 'msg-flags) +msg-ctrunc+)
                   (cl:error "recvmsg on file descriptor ~D: more descriptors ~
                              arrived than fit, and the kernel discarded some" fd))
                 (return (cl:values n (%received-fds control-sap
                                                     (sb-alien:slot msg 'msg-controllen)))))
                ((= (sb-alien:get-errno) +eintr+))
                ((= (sb-alien:get-errno) +eagain+) (return :again))
                (t (%socket-error "recvmsg" fd)))))))))

  (defun %received-fds (control-sap control-len)
    "The descriptors in every SCM_RIGHTS message of the control buffer
     at CONTROL-SAP, in order."
    (let ((fds '()) (offset 0))
      (loop while (<= (+ offset +cmsg-header+) control-len)
            do (let* ((sap (sb-sys:sap+ control-sap offset))
                      (len (%cmsg-len-ref sap)))
                 (when (< len +cmsg-header+) (return))
                 (when (and (= (sb-sys:signed-sap-ref-32 sap +size-t+) +sol-socket+)
                            (= (sb-sys:signed-sap-ref-32 sap (+ +size-t+ 4)) +scm-rights+))
                   (loop for p from +cmsg-header+ below len by 4
                         do (push (sb-sys:signed-sap-ref-32 sap p) fds)))
                 (incf offset (* +size-t+ (ceiling len +size-t+)))))
      (nreverse fds))))

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

;;; platform-sbcl.lisp ends here
