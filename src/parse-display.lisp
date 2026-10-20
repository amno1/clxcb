;;; parse-display.lisp — parse X11 DISPLAY strings.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.
;;;
;;; This is a fresh Common Lisp implementation of the DISPLAY grammar
;;; documented in X(7).  The exact set of forms accepted, and the
;;; resolution of paths against the filesystem, follows libxcb's
;;; _xcb_parse_display and _xcb_parse_display_path_to_socket in
;;; xcb_util.c:
;;;
;;;   Copyright (C) 2001-2004 Bart Massey and Jamey Sharp
;;;   https://gitlab.freedesktop.org/xorg/lib/libxcb
;;;
;;; No C code was copied; the grammar and the two special socket-path
;;; forms are documented behaviours, re-derived here.

(in-package #:xcb)

(defun %display-syntax-error (display)
  (cl:error "Malformed DISPLAY value ~S: expected \
[protocol/][host]:display[.screen] or a socket path."
         display))


;;; Socket path forms
;;;
;;; Two DISPLAY forms name a Unix socket directly:
;;;
;;;     /path/to/socket[.N]
;;;     unix:/path/to/socket[.N]
;;;
;;; The .N suffix, when present, is the screen number and the path
;;; without the suffix is the socket.  libxcb disambiguates by stat-ing
;;; the path: if it exists as a file, the whole string is the socket
;;; name; if it does not exist, and it has a trailing .N with a numeric
;;; tail, the base path (before the dot) is retried.  We use PROBE-FILE
;;; for the same purpose, so a socket path that legitimately contains a
;;; dot survives.

(defun %parse-display-socket-path (path)
  "PATH is a socket path form from DISPLAY.  Return
   (VALUES PATH 0 SCREEN :LOCAL NIL), where SCREEN is the parsed screen
   number if a .N suffix was stripped, otherwise 0."
  (cond
    ((probe-file path)
     (cl:values path 0 0 :local nil))
    (t
     (let* ((dot (position #\. path :from-end t)))
       (if (and dot
                (plusp (- (cl:length path) (1+ dot)))
                (every #'digit-char-p (subseq path (1+ dot)))
                (let ((base (subseq path 0 dot)))
                  (probe-file base)))
           (cl:values (subseq path 0 dot)
                   0
                   (parse-integer path :start (1+ dot))
                   :local
                   nil)
           ;; Not found on disk: still return the path as-is.  The
           ;; connection attempt will fail with a clear error.
           (cl:values path 0 0 :local nil))))))


;;; Host[:display[.screen]] form
;;;
;;; libxcb's grammar, in the order the parse recognises it:
;;;
;;;     [protocol/]host:display[.screen]
;;;     [protocol/]host::display[.screen]     (DECnet, doubled colon)
;;;     [protocol/][display[.screen]]          (empty host = local)

(defun %parse-display-host-form (display)
  "Parse the [protocol/]host:display[.screen] form.  Returns
   (VALUES HOST DISPLAY-NUMBER SCREEN PROTOCOL NIL).  The fifth value
   is always NIL, for a uniform return shape with the path form."
  (let* ((slash (position #\/ display))
         (colon (position #\: display :start (if slash (1+ slash) 0))))
    (unless colon
      (%display-syntax-error display))
    (let* ((decnetp (and (< (1+ colon) (cl:length display))
                         (char= (char display (1+ colon)) #\:)))
           ;; COLON is the first colon, so the host ends there in both
           ;; forms; DECnet's doubled colon is reported as the protocol.
           (host (subseq display (if slash (1+ slash) 0) colon))
           (rest (subseq display (if decnetp (+ 2 colon) (1+ colon)))))
      (when (zerop (cl:length rest))
        (%display-syntax-error display))
      (let* ((dot (position #\. rest))
             (display-number (handler-case
                                 (parse-integer rest :end dot)
                               (cl:error () (%display-syntax-error display))))
             (screen (if dot
                         (handler-case
                             (parse-integer rest :start (1+ dot))
                           (cl:error () (%display-syntax-error display)))
                         0)))
        (cl:values
         host
         display-number
         screen
         (cond
           ((string= host "")     :local)
           ((string= host "unix") :local)
           (decnetp               :decnet)
           (slash (intern (string-upcase (subseq display 0 slash)) :keyword))
           (t                     :internet))
         nil)))))


;;; Public entry point

(defun parse-display (&optional (display (uiop:getenv "DISPLAY")))
  "Parse an X11 DISPLAY string (see X(7)) and return five values:

     HOST             hostname (\"\" for a local socket-path-less
                      connection, which uses the default Unix socket
                      path), or an absolute socket path when DISPLAY
                      named one directly
     DISPLAY-NUMBER   integer
     SCREEN           integer, 0 if absent
     PROTOCOL         :LOCAL, :INTERNET, or :DECNET
     SOCKET-PATH      the socket path when DISPLAY named one directly,
                      otherwise NIL

   Forms understood, matching libxcb's xcb_parse_display():

     :0                     local, display 0
     :0.1                   local, display 0, screen 1
     host:0                 Internet, display 0 on host
     host:0.1               Internet, display 0, screen 1
     proto/host:0           force an explicit protocol name
     host::0                DECnet, display 0
     host::0.1              DECnet, display 0, screen 1
     /tmp/.X11-unix/X0      direct socket path
     /tmp/.X11-unix/X0.1    direct socket path with screen 1
     unix:/tmp/.X11-unix/X0 direct socket path
     unix:/tmp/.X11-unix/X0.1
                            direct socket path with screen 1

   DISPLAY defaults to the value of $DISPLAY.  Signals an error for
   any other form, including a string without a colon."
  (when (or (null display) (string= "" display))
    (cl:error "DISPLAY is unset and no display string was supplied."))
  (cond
    ((char= (char display 0) #\/)
     (%parse-display-socket-path display))
    ((and (>= (cl:length display) 5)
          (string= "unix:" display :end1 5 :end2 5))
     (%parse-display-socket-path (subseq display 5)))
    (t
     (%parse-display-host-form display))))

