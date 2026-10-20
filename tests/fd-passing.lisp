;;; tests/fd-passing.lisp — file descriptors over a live connection.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; These talk to the X server named by $DISPLAY, and are skipped when
;;; there is none, when this image cannot pass file descriptors, or when
;;; the server lacks the extension.  Every descriptor they receive or
;;; create is closed before they return.

(in-package #:xcb/tests)

(defun fd-target (fd)
  "What the descriptor FD is open on, per /proc, or NIL."
  (ignore-errors (sb-posix:readlink (format nil "/proc/self/fd/~D" fd))))

(defmacro with-fd-test-connection ((conn &rest extensions) &body body)
  "Run BODY with CONN, a live connection doing raw socket I/O that has
   every extension in EXTENSIONS, or skip the test."
  `(if (not (and (uiop:getenv "DISPLAY") *fd-passing-supported*))
       (skip)
       (with-x-connection (,conn)
         (if (or (eq (conn-transport ,conn) :tcp)   ; TCP carries no descriptors
                 (notevery (lambda (key) (extension-present-p ,conn key)) ',extensions))
             (skip)
             (progn
               (is (conn-raw-fd ,conn))
               ,@body
               ;; Every descriptor that arrived was claimed by its reply.
               (is (null (conn-received-fds ,conn))))))))

(deftest dri3-open-receives-device-fds ()
  ;; Two requests in flight, the second read first: the first reply is
  ;; retained with the descriptor it claimed on arrival.
  (with-fd-test-connection (conn "XCB-DRI3")
    (xcb-dri3::query-version-reply conn (xcb-dri3::query-version conn 1 2))
    (let* ((root (root-window conn))
           (c1 (xcb-dri3::open conn root 0))
           (c2 (xcb-dri3::open conn root 0))
           (fd2 (xcb-dri3::device-fd (xcb-dri3::open-reply conn c2)))
           (fd1 (xcb-dri3::device-fd (xcb-dri3::open-reply conn c1))))
      (unwind-protect
           (progn
             (is (integerp fd1))
             (is (integerp fd2))
             (is (/= fd1 fd2))
             (is (search "/dev/dri/" (fd-target fd1)))
             (is (search "/dev/dri/" (fd-target fd2))))
        (when (integerp fd1) (sb-posix:close fd1))
        (when (integerp fd2) (sb-posix:close fd2))))))

(deftest shm-create-segment-receives-an-fd ()
  ;; MIT-SHM 1.2: the server creates the segment and hands back its fd.
  (with-fd-test-connection (conn "XCB-SHM")
    (let* ((seg (generate-id conn))
           (fd (xcb-shm::shm-fd (xcb-shm::create-segment-reply
                                 conn (xcb-shm::create-segment conn seg 4096 0)))))
      (unwind-protect
           (progn
             (is (integerp fd))
             (is (>= (sb-posix:stat-size (sb-posix:fstat fd)) 4096)))
        (when (integerp fd) (sb-posix:close fd))
        (xcb-shm::detach conn seg)))))

(deftest shm-attach-fd-sends-an-fd ()
  ;; MIT-SHM 1.2: send a file of our own with AttachFd, have the server
  ;; write a filled pixmap into it with ShmGetImage, and read the pixels
  ;; back through our own mapping of the file.
  (with-fd-test-connection (conn "XCB-SHM")
    (multiple-value-bind (fd path) (sb-posix:mkstemp "/dev/shm/clxcb-test-XXXXXX")
      (sb-posix:unlink path)
      (let ((seg (generate-id conn))
            (pixmap (generate-id conn))
            (gc (generate-id conn))
            (screen (first (conn-roots conn))))
        (unwind-protect
             (progn
               (sb-posix:ftruncate fd 4096)
               (xcb-shm::attach-fd conn seg fd 0)
               (xcb::create-pixmap conn (root-depth screen) pixmap (root screen) 8 8)
               (xcb::create-gc conn gc pixmap xcb-const:+gc-foreground+ :foreground #x123456)
               (xcb::poly-fill-rectangle
                conn pixmap gc
                (list (make-instance 'xcb::rectangle :x 0 :y 0 :width 8 :height 8)))
               (let ((reply (xcb-shm::get-image-reply
                             conn (xcb-shm::get-image conn pixmap 0 0 8 8 #xFFFFFFFF
                                                      xcb-const:+image-format-z-pixmap+
                                                      seg 0)))
                     (sap (sb-posix:mmap nil 4096 sb-posix:prot-read sb-posix:map-shared fd 0)))
                 (unwind-protect
                      (progn
                        (is (plusp (xcb-shm::size reply)))
                        (is (= #x123456 (logand #xFFFFFF (sb-sys:sap-ref-32 sap 0)))))
                   (sb-posix:munmap sap 4096))))
          (xcb::free-gc conn gc)
          (xcb::free-pixmap conn pixmap)
          (xcb-shm::detach conn seg)
          (sb-posix:close fd))))))

(deftest descriptors-over-tcp-signal ()
  ;; TCP cannot carry file descriptors: a request that sends or expects
  ;; them signals, before anything is sent, instead of failing obscurely.
  (if (not (uiop:getenv "DISPLAY"))
      (skip)
      (with-x-connection (conn)
        (if (not (eq (conn-transport conn) :tcp))
            (skip)
            (progn
              (signals cl:error (xcb-shm::create-segment conn (generate-id conn) 4096 0))
              ;; And the connection is still usable afterwards.
              (is (plusp (intern-atom-id conn "WM_NAME"))))))))
