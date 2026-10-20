;;; platform.lisp — the platform interface: threads, descriptors, floats.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; Acknowledgements
;;;
;;; SCM_RIGHTS is documented in unix(7), sendmsg(2), recvmsg(2) and
;;; cmsg(3).  How an X client pairs received descriptors with replies --
;;; one FIFO per connection, from which a reply to a request known to
;;; return descriptors takes as many as its NFD byte says -- follows
;;; libxcb (xcb_in.c, read_fds and read_packet), Copyright (C) 2001-2004
;;; Bart Massey and Jamey Sharp, MIT/X11 licensed.  No libxcb code is
;;; copied.

;;; Commentary:
;;;
;;; A few requests (DRI3, MIT-SHM's AttachFd and CreateSegment, RandR's
;;; CreateLease) send or receive file descriptors.  A descriptor travels
;;; as ancillary data on a sendmsg(2) and arrives only through
;;; recvmsg(2): a plain read(2) of the same bytes discards it.  Since a
;;; client cannot know which read will carry one, every read on a
;;; connection that may receive descriptors has to be a recvmsg.
;;;
;;; The platform layers provide the primitives, %SOCKET-SEND,
;;; %SOCKET-RECEIVE and their non-blocking -NOW forms, on Linux.  A connection over a real
;;; socket then does all its I/O through them (see io.lisp); a
;;; connection over any other stream, or in an image where
;;; *FD-PASSING-SUPPORTED* is NIL, keeps using its Lisp stream, and a
;;; request that must send a descriptor signals.
;;;
;;; Which requests need this.  In the current XML:
;;;
;;;   sends a descriptor      DRI3 PixmapFromBuffer, FenceFromFD,
;;;                           PixmapFromBuffers; MIT-SHM AttachFd
;;;   reply carries some      DRI3 Open, BufferFromPixmap, FDFromFence,
;;;                           BuffersFromPixmap; MIT-SHM CreateSegment;
;;;                           RandR CreateLease
;;;
;;; MIT-SHM has two modes, and only the second needs descriptors.  The
;;; classic Attach names a System V segment the client made itself with
;;; shmget/shmat; it involves no descriptor and works whether or not
;;; this file's machinery is available.  AttachFd and CreateSegment
;;; (MIT-SHM 1.2) pass the segment's descriptor instead.
;;;
;;; Threading.  The byte stream and the descriptor queue move together:
;;; CONN-RECEIVED-FDS, CONN-FD-REPLY-SERIALS and the claiming of
;;; descriptors are under the I/O lock with the read itself (see
;;; doc/threads.md), so no descriptor can be appended or claimed
;;; between a packet's bytes and its NFD.

;;; Commentary (the interface):
;;;
;;; Everything CLXCB needs from the Lisp implementation and the OS goes
;;; through the functions declared below.  Two layers implement them:
;;;
;;;   platform-cffi.lisp   usocket, CFFI, bordeaux-threads and
;;;                        trivial-garbage; loaded by clxcb/cffi, which
;;;                        clxcb is.
;;;   platform-sbcl.lisp   SBCL alone: sb-thread, sb-alien, and the
;;;                        sb-bsd-sockets and sb-posix contribs; loaded
;;;                        by clxcb/sbcl.
;;;
;;; The rest of CLXCB compiles against the declarations only -- locks
;;; are taken with WITH-LOCK, a function call, not an implementation's
;;; macro, and sockets are objects only the layer looks into -- so its
;;; compiled files are the same under either layer.  Nothing calls the
;;; interface at load time, so the layer loads after them.  An image
;;; holds one layer.

(in-package "XCB")

(defvar *platform* nil
  "The platform layer loaded in this image: :CFFI, :SBCL, or NIL before
   either is.")

(defvar *fd-passing-supported* nil
  "True when this image can pass file descriptors over a Unix-domain
   socket (currently: Linux, under either platform layer).")

(defun require-fd-passing (who)
  (unless *fd-passing-supported*
    (cl:error "~A needs file-descriptor passing, which this Lisp image ~
               does not support." who)))

(defmacro with-lock ((lock) &body body)
  "Run BODY holding LOCK, which is not recursive."
  (let ((thunk (gensym "BODY")))
    `(flet ((,thunk () ,@body))
       (declare (dynamic-extent #',thunk))
       (%call-with-lock ,lock #',thunk))))

(declaim
 ;; Threads.  %CV-WAIT releases LOCK while it waits, for at most TIMEOUT
 ;; seconds when one is given, and may return early.
 (ftype (cl:function (t) t) %make-lock %make-cv %grab-lock %release-lock %cv-broadcast)
 (ftype (cl:function (t cl:function) t) %call-with-lock)
 (ftype (cl:function (t t &optional t) t) %cv-wait)
 ;; A table of one value per thread, which does not keep a finished
 ;; thread alive; %THREAD-TABLE-ENSURE returns the calling thread's,
 ;; calling MAKE to create it the first time.
 (ftype (cl:function () t) %make-thread-table)
 (ftype (cl:function (t cl:function) t) %thread-table-ensure)
 ;; Descriptors.  %WAIT-FD waits until FD is ready for DIRECTION (:INPUT
 ;; or :OUTPUT), for at most TIMEOUT seconds when one is given: T if it
 ;; is, NIL on timeout.
 (ftype (cl:function (t t &optional t) t) %wait-fd)
 (ftype (cl:function (t) t) %close-fd)
 ;; Sockets, as an object of the layer's own.  %OPEN-SOCKET connects to
 ;; the Unix-domain socket PATH, or when HOST is given to HOST:PORT over
 ;; TCP with TCP_NODELAY set; TIMEOUT, when not NIL, is in seconds.
 ;; %SOCKET-STREAM is its bidirectional octet stream.  %SOCKET-FD is its
 ;; descriptor, or NIL when the implementation does not expose it (the
 ;; connection then talks through the stream).  %SOCKET-PEER-ADDRESS is
 ;; a TCP peer's address as octets.
 (ftype (cl:function (t t t t) t) %open-socket)
 (ftype (cl:function (t) t) %socket-stream %socket-fd %shutdown-socket
        %close-socket %socket-peer-address)
 (ftype (cl:function () t) %getpid)
 ;; IEEE 754 bits: single as a signed 32-bit integer; double as a signed
 ;; high word and an unsigned low word.
 (ftype (cl:function (t) t) %single-float-bits %make-single-float %double-float-bits)
 (ftype (cl:function (t t) t) %make-double-float)
 ;; sendmsg/recvmsg on socket FD, OCTETS and BUFFER being
 ;; (SIMPLE-ARRAY OCTET (*)).  %SOCKET-SEND writes START to END,
 ;; waiting as needed, with the descriptors FDS on the first byte.
 ;; %SOCKET-RECEIVE waits for and reads at least one byte, returning
 ;; (VALUES COUNT FDS), COUNT 0 at end of file.  The -NOW forms never
 ;; wait and return :AGAIN when they would.
 (ftype (cl:function (t t t t t) t) %socket-send %socket-send-now)
 (ftype (cl:function (t t t t) t) %socket-receive %socket-receive-now))

;;; platform.lisp ends here
