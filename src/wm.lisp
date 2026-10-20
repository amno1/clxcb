;;; wm.lisp — ICCCM and EWMH window properties, in one place.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Commentary:
;;;
;;; An X11 client's top-level windows are made well-behaved not by the
;;; X11 protocol itself, but by two layers of convention that sit on
;;; top of it:
;;;
;;;     ICCCM  -- Inter-Client Communication Conventions Manual.
;;;              Defines WM_NAME, WM_CLASS, WM_PROTOCOLS,
;;;              WM_NORMAL_HINTS, and the types and byte layouts those
;;;              properties use.
;;;
;;;     EWMH   -- Extended Window Manager Hints.  Adds _NET_WM_NAME,
;;;              _NET_WM_PID, _NET_WM_WINDOW_TYPE, and the convention
;;;              that a title is UTF-8 in _NET_WM_NAME even when
;;;              WM_NAME itself is a STRING.
;;;
;;; Every one of those conventions is a small dance that is easy to
;;; get wrong in a way only some WMs complain about:
;;;
;;;   * WM_NAME must be written as STRING AND _NET_WM_NAME as
;;;     UTF8_STRING, or the title looks right on some WMs and wrong
;;;     on others.
;;;
;;;   * WM_CLASS is a NUL-separated, NUL-terminated pair of strings,
;;;     "instance\0class\0", not two separate properties.  This mirrors
;;;     Xlib's XSetClassHint layout, and it is what a WM's .desktop
;;;     file matching actually looks at.
;;;
;;;   * WM_NORMAL_HINTS is not a sequence of named fields on the wire:
;;;     it is an 18-CARD32 block whose contents are selected by a
;;;     10-bit flag word.  Any field the flag word doesn't select is
;;;     ignored by the WM, so a hint set without setting its flag has
;;;     no effect and no error.  This is a very easy bug to write.
;;;
;;;   * _MOTIF_WM_HINTS is the same idea in a five-word block, still
;;;     honored by essentially every WM despite being "legacy", and
;;;     the only portable way to ask for a window with no decorations.
;;;
;;; These helpers encode each convention once, so application code just
;;; calls them and never has to remember which property name goes with
;;; which atom type, or which CARD32 comes first.
;;;
;;; State is not held here.  Atom IDs are cached by INTERN-ATOM-ID on
;;; the connection itself (see CONNECTION-SETUP.LISP), so calling these
;;; helpers repeatedly costs one hash lookup per atom per call, not one
;;; round trip to the server.  Helpers that need two or more atoms
;;; (SET-WM-NAME writes both WM_NAME and _NET_WM_NAME) do not do any
;;; extra I/O on the second call either.
;;;
;;; What is deliberately NOT here: session management (WM_COMMAND,
;;; WM_CLIENT_LEADER), WM_ICON / _NET_WM_ICON (a per-pixel CARD32
;;; array, not a scalar property), and desktop-specific hints (KDE,
;;; GNOME, Unity).  If you need one of those, write it as a one-off
;;; in your application; the primitives this file uses are exported
;;; by CLXCB and work fine on their own.

(in-package #:xcb)


;;; ChangeProperty modes
;;;
;;; The numbers are what XCB's CHANGE-PROPERTY request takes.  Named here
;;; so a reader of these helpers does not have to remember which is which.

(defconstant +prop-mode-replace+ 0)
(defconstant +prop-mode-prepend+ 1)
(defconstant +prop-mode-append+  2)


;;; UTF-8 encoding
;;;
;;; A Lisp string is a sequence of characters, each of which may have a
;;; char-code greater than 255.  A UTF8_STRING property is a sequence of
;;; UTF-8 *bytes*.  These are not the same thing, and CHAR-CODE alone is
;;; only correct for ASCII.  ENCODE-UTF8 produces the byte vector the
;;; server actually wants.

(defun encode-utf8 (string)
  "Return STRING encoded as UTF-8 in a (SIMPLE-ARRAY (UNSIGNED-BYTE 8) (*))."
  (flet ((size (code)
           (cond ((< code #x80) 1) ((< code #x800) 2) ((< code #x10000) 3) (t 4))))
    ;; Sized in a first pass, so the result is made once, at its length.
    (let ((out (make-array (loop for ch across string sum (size (char-code ch)))
                           :element-type '(unsigned-byte 8)))
          (i 0))
      (flet ((put (byte) (setf (aref out i) byte) (incf i)))
        (loop for ch across string
              for code = (char-code ch)
              do (ecase (size code)
                   (1 (put code))
                   (2 (put (logior #xC0 (ash code -6)))
                      (put (logior #x80 (logand code #x3F))))
                   (3 (put (logior #xE0 (ash code -12)))
                      (put (logior #x80 (logand (ash code -6) #x3F)))
                      (put (logior #x80 (logand code #x3F))))
                   (4 (put (logior #xF0 (ash code -18)))
                      (put (logior #x80 (logand (ash code -12) #x3F)))
                      (put (logior #x80 (logand (ash code -6) #x3F)))
                      (put (logior #x80 (logand code #x3F)))))))
      out)))


;;; WM_NAME, WM_ICON_NAME, WM_CLASS, WM_CLIENT_MACHINE

(defun set-wm-name (conn window title)
  "Set the window's title to TITLE.

   Writes both WM_NAME (as STRING) and _NET_WM_NAME (as UTF8_STRING).
   Both are required: WM_NAME is what legacy clients and some WMs read,
   _NET_WM_NAME is what modern ones prefer, and ICCCM says a
   well-behaved client sets both.  Both properties are written with the
   same UTF-8 bytes -- X's STRING type is nominally ISO 8859-1, but every
   modern toolchain writes UTF-8 into both and every modern WM reads it
   back that way, because there is no other way to get a non-Latin-1
   title through the classic property.

   Returns TITLE."
  (let* ((wm-name     (intern-atom-id conn "WM_NAME"))
         (net-wm-name (intern-atom-id conn "_NET_WM_NAME"))
         (string-atom (intern-atom-id conn "STRING"))
         (utf8-atom   (intern-atom-id conn "UTF8_STRING"))
         (bytes       (encode-utf8 title)))
    (send-change-property conn +prop-mode-replace+
                          window wm-name string-atom 8 bytes)
    (send-change-property conn +prop-mode-replace+
                          window net-wm-name utf8-atom 8 bytes))
  title)

(defun set-wm-icon-name (conn window title)
  "Set the window's icon title to TITLE.

   Same pair-of-properties convention as SET-WM-NAME, with WM_ICON_NAME
   and _NET_WM_ICON_NAME.  Returns TITLE."
  (let* ((wm-icon-name     (intern-atom-id conn "WM_ICON_NAME"))
         (net-wm-icon-name (intern-atom-id conn "_NET_WM_ICON_NAME"))
         (ascii            (intern-atom-id conn "STRING"))
         (utf8             (intern-atom-id conn "UTF8_STRING"))
         (bytes            (encode-utf8 title)))
    (send-change-property conn +prop-mode-replace+
                          window wm-icon-name ascii 8 bytes)
    (send-change-property conn +prop-mode-replace+
                          window net-wm-icon-name utf8 8 bytes))
  title)

(defun set-wm-class (conn window instance-name class-name)
  "Set the window's WM_CLASS to the pair (INSTANCE-NAME, CLASS-NAME).

   Both strings are written into a single NUL-separated, NUL-terminated
   byte string, \"instance\\0class\\0\" -- that is the layout Xlib's
   XSetClassHint writes and what every window manager parses.  The class
   name is what a WM matches against the StartupWMClass= field of a
   .desktop file, so it should be the same capitalised identifier (for
   example \"Firefox\", \"Gimp\") the .desktop file uses.  The instance
   name is conventionally the lower-case form (\"firefox\", \"gimp\").

   Returns CLASS-NAME."
  (let* ((wm-class    (intern-atom-id conn "WM_CLASS"))
         (string-atom (intern-atom-id conn "STRING"))
         (inst-bytes  (encode-utf8 instance-name))
         (class-bytes (encode-utf8 class-name))
         (payload     (make-array (+ (cl:length inst-bytes)
                                     (cl:length class-bytes)
                                     2)
                                  :element-type '(unsigned-byte 8)
                                  :initial-element 0)))
    (replace payload inst-bytes  :start1 0)
    (replace payload class-bytes :start1 (1+ (cl:length inst-bytes)))
    (send-change-property conn +prop-mode-replace+
                          window wm-class string-atom 8 payload))
  class-name)

(defun set-wm-client-machine (conn window &optional hostname)
  "Set WM_CLIENT_MACHINE to HOSTNAME.

   HOSTNAME defaults to $HOSTNAME, or to UIOP:HOSTNAME's best guess if
   that is not set.  The value is the name of the machine the client is
   running on; a network-transparent WM uses it to decide whether a
   window belongs to this host or a remote one.  Not required to be set,
   but harmless and sometimes helpful.  Returns the hostname used."
  (let* ((prop        (intern-atom-id conn "WM_CLIENT_MACHINE"))
         (string-atom (intern-atom-id conn "STRING"))
         (name        (or hostname
                          (uiop:getenv "HOSTNAME")
                          (handler-case (uiop:hostname)
                            (cl:error () "localhost")))))
    (send-change-property conn +prop-mode-replace+
                          window prop string-atom 8 (encode-utf8 name))
    name))


;;; EWMH identity hints

(defun set-net-wm-pid (conn window &optional pid)
  "Set _NET_WM_PID to PID, or to this process's PID if omitted.

   A WM uses this to correlate a window with the process that owns it,
   which is what makes \"kill the process that owns this window\" work
   in a task manager.  Returns the PID that was written."
  (let* ((prop     (intern-atom-id conn "_NET_WM_PID"))
         (cardinal (intern-atom-id conn "CARDINAL"))
         (value    (logand (or pid (%getpid)) #xFFFFFFFF)))
    (send-change-property conn +prop-mode-replace+
                          window prop cardinal 32 (list value)))
  (logand (or pid (%getpid)) #xFFFFFFFF))

(defun set-net-wm-window-type (conn window &optional (type :normal))
  "Set _NET_WM_WINDOW_TYPE.

   TYPE is a keyword naming one of the EWMH window types:

     :normal       Ordinary application window (default).
     :dialog       Transient dialog; also set WM_TRANSIENT_FOR.
     :menu         Menu or other popup.
     :toolbar
     :splash
     :utility      Small persistent utility window.
     :dock         A dock or panel.
     :desktop      The desktop background window.
     :dropdown-menu
     :popup-menu
     :tooltip
     :notification
     :combo
     :dnd          Drag-and-drop icon.

   The corresponding _NET_WM_WINDOW_TYPE_<NAME> atom is written as the
   single ATOM value of the property.  Returns TYPE."
  (let* ((prop  (intern-atom-id conn "_NET_WM_WINDOW_TYPE"))
         (atom  (intern-atom-id conn "ATOM"))
         (value (intern-atom-id
                 conn
                 (cl:format nil "_NET_WM_WINDOW_TYPE_~A"
                            (string-upcase (symbol-name type))))))
    (send-change-property conn +prop-mode-replace+
                          window prop atom 32 (list value)))
  type)


;;; WM_PROTOCOLS / WM_DELETE_WINDOW

(defun set-wm-delete-protocol (conn window)
  "Advertise WM_DELETE_WINDOW as a supported WM protocol on WINDOW.

   After this call, a well-behaved WM will, when the user clicks the
   window's close button, send a ClientMessage of type WM_PROTOCOLS
   whose first data word is WM_DELETE_WINDOW, instead of destroying
   the window outright.  The client is then expected to close itself
   cleanly.  Use WM-DELETE-WINDOW-MESSAGE-P to recognise that message.

   The protocol list is *replaced*, not appended to.  Call this once,
   after creating the window.  Returns T."
  (let ((wm-protocols (intern-atom-id conn "WM_PROTOCOLS"))
        (atom         (intern-atom-id conn "ATOM"))
        (wm-delete    (intern-atom-id conn "WM_DELETE_WINDOW")))
    (send-change-property conn +prop-mode-replace+
                          window wm-protocols atom 32
                          (list wm-delete)))
  t)

(defun %client-message-data32 (event)
  "Return EVENT's DATA32 vector, or NIL if not available.

   A CLIENT-MESSAGE event carries its payload in a union; only the
   branch matching its FORMAT field is meaningful.  This accessor
   returns the DATA32 branch safely, without signalling if the branch
   was never populated."
  (let ((data (slot-value event 'data)))
    (and data
         (slot-boundp data 'data32)
         (slot-value data 'data32))))

(defun wm-delete-window-message-p (conn event)
  "True if EVENT is a ClientMessage asking CONN's client to close the
   window it was sent for -- that is, a WM_PROTOCOLS message whose first
   data word is WM_DELETE_WINDOW.

   EVENT is a decoded CLIENT-MESSAGE event object, as returned by
   WAIT-FOR-EVENT.  The two atom IDs this predicate needs are looked up
   on CONN and cached there by INTERN-ATOM-ID, so the caller does not
   have to remember them from SET-WM-DELETE-PROTOCOL."
  (and (typep event 'client-message)
       (eql (slot-value event 'format) 32)
       (eql (slot-value event 'type) (intern-atom-id conn "WM_PROTOCOLS"))
       (let ((words (%client-message-data32 event)))
         (and words
              (plusp (cl:length words))
              (eql (elt words 0)
                   (intern-atom-id conn "WM_DELETE_WINDOW"))))))


;;; WM_NORMAL_HINTS (WM_SIZE_HINTS)
;;;
;;; The hint block is eighteen CARD32s whose contents are chosen by a
;;; ten-bit flag word.  The mapping (from ICCCM §4.1.2.3) is:
;;;
;;;     offset  field(s)                                  flag bit
;;;     ------  ----------------------------------------  --------
;;;       0     flags                                     --
;;;       1-4   x, y, width, height                        PPosition / PSize
;;;       5-6   min_width, min_height                      PMinSize
;;;       7-8   max_width, max_height                      PMaxSize
;;;       9-10  width_inc, height_inc                      PResizeInc
;;;      11-14  min_aspect_{num,den}, max_aspect_{num,den} PAspect
;;;      15-16  base_width, base_height                    PBaseSize
;;;       17    win_gravity                                PWinGravity
;;;
;;; The USPosition / USSize variants exist for callers who want to say
;;; "the user asked for this position", as distinct from "the program is
;;; choosing".  This file defaults to the program-supplied P* form; that
;;; is what a fresh application almost always means.

(defconstant +us-position+   #x001)
(defconstant +us-size+       #x002)
(defconstant +p-position+    #x004)
(defconstant +p-size+        #x008)
(defconstant +p-min-size+    #x010)
(defconstant +p-max-size+    #x020)
(defconstant +p-resize-inc+  #x040)
(defconstant +p-aspect+      #x080)
(defconstant +p-base-size+   #x100)
(defconstant +p-win-gravity+ #x200)

(defparameter +win-gravity-values+
  '((:forget      .  0)
    (:north-west  .  1)
    (:north       .  2)
    (:north-east  .  3)
    (:west        .  4)
    (:center      .  5)
    (:east        .  6)
    (:south-west  .  7)
    (:south       .  8)
    (:south-east  .  9)
    (:static      . 10)))

(defun %gravity-value (g)
  (cond ((integerp g) g)
        ((keywordp g)
         (or (cdr (assoc g +win-gravity-values+))
             (cl:error "Unknown window-gravity keyword: ~S" g)))
        (t (cl:error "Bad window gravity: ~S" g))))

(defun set-wm-normal-hints (conn window
                            &key
                              (x nil xp)
                              (y nil yp)
                              (width nil widthp)
                              (height nil heightp)
                              (min-width nil min-width-p)
                              (min-height nil min-height-p)
                              (max-width nil max-width-p)
                              (max-height nil max-height-p)
                              (width-inc nil width-inc-p)
                              (height-inc nil height-inc-p)
                              (base-width nil base-width-p)
                              (base-height nil base-height-p)
                              (min-aspect nil min-aspect-p)
                              (max-aspect nil max-aspect-p)
                              (gravity nil gravityp))
  "Set WM_NORMAL_HINTS on WINDOW from a set of named fields.

   Every keyword that is supplied contributes its flag bit to the
   WM_SIZE_HINTS block; every keyword that is not supplied is left out
   entirely.  This matches the ICCCM semantics: a hint takes effect
   only if its flag is set, so a keyword that was not given is not a
   zero-valued hint, it is *no* hint, and the WM has no opinion about
   that dimension.

   X, Y - preferred position.  Sets PPosition.
   WIDTH, HEIGHT - preferred size.  Sets PSize.
   MIN-WIDTH, MIN-HEIGHT - lower bound on user resize.  Sets PMinSize.
   MAX-WIDTH, MAX-HEIGHT - upper bound on user resize.  Sets PMaxSize.
   WIDTH-INC, HEIGHT-INC - resize granularity in pixels.  Sets
       PResizeInc.  A terminal, for example, uses this to force its
       size to a multiple of the character cell.
   BASE-WIDTH, BASE-HEIGHT - size of the window's ornamentation
       outside the content area, used together with WIDTH-INC.
       Sets PBaseSize.
   MIN-ASPECT, MAX-ASPECT - aspect ratio bounds, each as a
       (NUMERATOR . DENOMINATOR) pair of integers.  Sets PAspect.
   GRAVITY - a keyword naming the win_gravity to use:
       :north-west, :north, :north-east, :west, :center, :east,
       :south-west, :south, :south-east, :static, :forget.
       Sets PWinGravity.

   Returns T."
  (let ((flags 0)
        (x-val 0) (y-val 0) (width-val 0) (height-val 0)
        (min-w 0) (min-h 0) (max-w 0) (max-h 0)
        (w-inc 0) (h-inc 0)
        (base-w 0) (base-h 0)
        (min-an 0) (min-ad 1) (max-an 0) (max-ad 1)
        (grav 0))

    (when (or xp yp)             (setf flags (logior flags +p-position+)))
    (when (or widthp heightp)    (setf flags (logior flags +p-size+)))
    (when (or min-width-p min-height-p)
      (setf flags (logior flags +p-min-size+)))
    (when (or max-width-p max-height-p)
      (setf flags (logior flags +p-max-size+)))
    (when (or width-inc-p height-inc-p)
      (setf flags (logior flags +p-resize-inc+)))
    (when (or base-width-p base-height-p)
      (setf flags (logior flags +p-base-size+)))
    (when (or min-aspect-p max-aspect-p)
      (setf flags (logior flags +p-aspect+)))
    (when gravityp
      (setf flags (logior flags +p-win-gravity+)))

    (when xp            (setf x-val      (or x 0)))
    (when yp            (setf y-val      (or y 0)))
    (when widthp        (setf width-val  (or width 0)))
    (when heightp       (setf height-val (or height 0)))
    (when min-width-p   (setf min-w (or min-width 0)))
    (when min-height-p  (setf min-h (or min-height 0)))
    (when max-width-p   (setf max-w (or max-width 0)))
    (when max-height-p  (setf max-h (or max-height 0)))
    (when width-inc-p   (setf w-inc (or width-inc 0)))
    (when height-inc-p  (setf h-inc (or height-inc 0)))
    (when base-width-p  (setf base-w (or base-width 0)))
    (when base-height-p (setf base-h (or base-height 0)))
    (when min-aspect-p
      (setf min-an (car min-aspect) min-ad (cdr min-aspect)))
    (when max-aspect-p
      (setf max-an (car max-aspect) max-ad (cdr max-aspect)))
    (when gravityp (setf grav (%gravity-value gravity)))

    (let ((prop        (intern-atom-id conn "WM_NORMAL_HINTS"))
          (size-hints  (intern-atom-id conn "WM_SIZE_HINTS")))
      (send-change-property conn +prop-mode-replace+
                            window prop size-hints 32
                            (list flags
                                  x-val y-val width-val height-val
                                  min-w min-h
                                  max-w max-h
                                  w-inc h-inc
                                  min-an min-ad max-an max-ad
                                  base-w base-h
                                  grav))))
  t)

;;; _MOTIF_WM_HINTS
;;;
;;; Five CARD32s: flags, functions, decorations, input_mode, status.
;;; The flags word says which of the others the WM should consider.
;;;
;;; FUNCTIONS and DECORATIONS use the same convention: if the ALL bit is
;;; set, the other bits name things to *remove* from "all"; if the ALL
;;; bit is not set, the other bits name the only things *present*.  The
;;; keyword API below exposes the second form, which is the one a caller
;;; writing a fresh window actually wants.

(defconstant +mwm-hints-functions+   #x1)
(defconstant +mwm-hints-decorations+ #x2)
(defconstant +mwm-hints-input-mode+  #x4)
(defconstant +mwm-hints-status+      #x8)

(defconstant +mwm-func-all+      #x1)
(defconstant +mwm-func-resize+   #x2)
(defconstant +mwm-func-move+     #x4)
(defconstant +mwm-func-minimize+ #x8)
(defconstant +mwm-func-maximize+ #x10)
(defconstant +mwm-func-close+    #x20)

(defconstant +mwm-decor-all+      #x1)
(defconstant +mwm-decor-border+   #x2)
(defconstant +mwm-decor-resizeh+  #x4)
(defconstant +mwm-decor-title+    #x8)
(defconstant +mwm-decor-menu+     #x10)
(defconstant +mwm-decor-minimize+ #x20)
(defconstant +mwm-decor-maximize+ #x40)

(defparameter +mwm-function-bits+
  '((:resize   . #x2)
    (:move     . #x4)
    (:minimize . #x8)
    (:maximize . #x10)
    (:close    . #x20)))

(defparameter +mwm-decoration-bits+
  '((:border   . #x2)
    (:resizeh  . #x4)
    (:title    . #x8)
    (:menu     . #x10)
    (:minimize . #x20)
    (:maximize . #x40)))

(defun %mwm-bitmask (value alist all-bit what)
  "VALUE is T, NIL, or a list of keywords to look up in ALIST.
   T means ALL-BIT, NIL means 0, a list means OR of the corresponding bits."
  (cond
    ((eq value t)   all-bit)
    ((null value)   0)
    ((listp value)
     (reduce (lambda (acc k)
               (let ((bit (cdr (assoc k alist))))
                 (unless bit
                   (cl:error "Unknown Motif ~A: ~S" what k))
                 (logior acc bit)))
             value
             :initial-value 0))
    (t (cl:error "Bad Motif ~A value: ~S" what value))))

(defun set-motif-wm-hints (conn window
                           &key
                             (decorations :unset)
                             (functions   :unset)
                             (input-mode  :unset))
  "Set _MOTIF_WM_HINTS on WINDOW.

   This is the only portable way to ask a window manager for a window
   with no decorations, or with a restricted set of title-bar buttons.
   The property is named after Motif but is honored by essentially every
   modern WM on X11, because there is no EWMH equivalent.

   DECORATIONS
       T          All decorations present (the default).
       NIL        No decorations at all: no title bar, no border, no
                  buttons.  This is what \"undecorated\" usually means.
       list       Only the listed decorations present, from :border,
                  :resizeh, :title, :menu, :minimize, :maximize.
       :unset     Leave the field alone; the WM uses its own default.

   FUNCTIONS
       T          All title-bar functions enabled.
       NIL        None: a window with no title-bar controls at all.
       list       Only the listed functions enabled, from :resize,
                  :move, :minimize, :maximize, :close.
       :unset     Leave the field alone.

   INPUT-MODE
       :modeless, :primary-application-modal, :system-modal,
       :full-application-modal, or :unset.

   Fields left :unset do not have their MWM_HINTS_* bit set in the flag
   word, so the WM does not consider them at all and uses its own
   default.  Returns T."
  (let ((flags 0)
        (func-bits 0)
        (decor-bits 0)
        (input-val 0))

    (unless (eq decorations :unset)
      (setf flags (logior flags +mwm-hints-decorations+))
      (setf decor-bits (%mwm-bitmask decorations
                                     +mwm-decoration-bits+
                                     +mwm-decor-all+
                                     "decoration")))

    (unless (eq functions :unset)
      (setf flags (logior flags +mwm-hints-functions+))
      (setf func-bits (%mwm-bitmask functions
                                    +mwm-function-bits+
                                    +mwm-func-all+
                                    "function")))

    (unless (eq input-mode :unset)
      (setf flags (logior flags +mwm-hints-input-mode+))
      (setf input-val
            (case input-mode
              (:modeless                   0)
              (:primary-application-modal  1)
              (:system-modal               2)
              (:full-application-modal     3)
              (t (cl:error "Bad Motif input mode: ~S" input-mode)))))

    (let ((prop (intern-atom-id conn "_MOTIF_WM_HINTS"))
          (ty   (intern-atom-id conn "_MOTIF_WM_HINTS")))
      (send-change-property conn +prop-mode-replace+
                            window prop ty 32
                            (list flags func-bits decor-bits
                                  input-val 0))))
  t)


;;; _NET_WM_STATE (EWMH)
;;;
;;; A window's EWMH state is a set of atoms the WM maintains as a
;;; property on the window, plus a convention for the client to request
;;; changes to that set.  The convention is not "write the property":
;;; the client sends a ClientMessage to the root window, and the WM
;;; updates the property itself.  Writing the property directly is
;;; ignored by every WM, because the WM owns that property.
;;;
;;; The message carries:
;;;
;;;     type    = _NET_WM_STATE
;;;     format  = 32
;;;     data[0] = action, 0 remove / 1 add / 2 toggle
;;;     data[1] = first state atom
;;;     data[2] = second state atom, or 0
;;;     data[3] = source indication, 1 for an ordinary application
;;;     data[4] = unused, 0
;;;
;;; Two state atoms per message because a dialog that wants to be both
;;; modal and skip-taskbar sets both in one go, and the spec allows it.
;;; A client that wants three states sends two messages; there is no
;;; six-argument form because the wire has no room for one.

(defconstant +net-wm-state-remove+ 0)
(defconstant +net-wm-state-add+    1)
(defconstant +net-wm-state-toggle+ 2)

(defparameter +net-wm-state-names+
  '((:modal              . "_NET_WM_STATE_MODAL")
    (:sticky             . "_NET_WM_STATE_STICKY")
    (:maximized-vert     . "_NET_WM_STATE_MAXIMIZED_VERT")
    (:maximized-horz     . "_NET_WM_STATE_MAXIMIZED_HORZ")
    (:shaded             . "_NET_WM_STATE_SHADED")
    (:skip-taskbar       . "_NET_WM_STATE_SKIP_TASKBAR")
    (:skip-pager         . "_NET_WM_STATE_SKIP_PAGER")
    (:hidden             . "_NET_WM_STATE_HIDDEN")
    (:fullscreen         . "_NET_WM_STATE_FULLSCREEN")
    (:above              . "_NET_WM_STATE_ABOVE")
    (:below              . "_NET_WM_STATE_BELOW")
    (:demands-attention  . "_NET_WM_STATE_DEMANDS_ATTENTION")
    (:focused            . "_NET_WM_STATE_FOCUSED")))

(defun %net-wm-state-atom (conn keyword)
  (let ((name (cdr (assoc keyword +net-wm-state-names+))))
    (unless name
      (cl:error "Unknown EWMH state keyword: ~S" keyword))
    (intern-atom-id conn name)))

(defun set-net-wm-state (conn window action &rest states)
  "Request a change to WINDOW's EWMH state.

   ACTION is :ADD, :REMOVE, or :TOGGLE.  STATES is one or two keywords
   naming the states to change, from :MODAL, :STICKY, :MAXIMIZED-VERT,
   :MAXIMIZED-HORZ, :SHADED, :SKIP-TASKBAR, :SKIP-PAGER, :HIDDEN,
   :FULLSCREEN, :ABOVE, :BELOW, :DEMANDS-ATTENTION, :FOCUSED.

   The message is sent to the root window and addressed to whichever
   client owns the WM selection; a WM that does not implement EWMH
   ignores it silently, which is the desired failure mode.  Use
   NET-WM-STATE-P to find out whether the WM is actually honoring the
   request.

   Returns ACTION."
  (cl:assert (<= 1 (cl:length states) 2) ()
             "EWMH allows one or two state atoms per message, got ~D"
             (cl:length states))
  (let* ((root      (root-window conn))
         (substr-rd #x100000)     ; SubstructureRedirectMask
         (substr-nt #x80000)      ; SubstructureNotifyMask
         (wm-state  (intern-atom-id conn "_NET_WM_STATE"))
         (action-n  (ecase action
                      (:remove +net-wm-state-remove+)
                      (:add    +net-wm-state-add+)
                      (:toggle +net-wm-state-toggle+)))
         (a1        (%net-wm-state-atom conn (first states)))
         (a2        (if (second states)
                        (%net-wm-state-atom conn (second states))
                        0)))
    (send-client-message conn root (logior substr-rd substr-nt)
                         window wm-state
                         (list action-n a1 a2 1 0)))
  action)

(defun net-wm-state-p (conn window state)
  "Return T if WINDOW is currently in the named EWMH STATE, NIL if it
   is not, or :UNKNOWN if _NET_WM_STATE is not present on the window.

   The three-way answer matters because NIL and :UNKNOWN are not the
   same: a window that is not fullscreen still has a _NET_WM_STATE
   property (possibly empty) on an EWMH-capable WM, whereas :UNKNOWN
   means the WM does not implement EWMH at all and the caller should
   fall back to some other policy -- a resize-and-ConfigureWindow dance,
   or just leaving the window as it is."
  (let* ((prop     (intern-atom-id conn "_NET_WM_STATE"))
         (atom-ty  (intern-atom-id conn "ATOM"))
         (cookie   (get-property conn 0 window prop atom-ty 0 1024))
         (reply    (get-property-reply conn cookie)))
    ;; A missing property comes back with type None (0); a present but
    ;; empty one has type ATOM and no values, and means NIL.
    (if (zerop (slot-value reply 'type))
        :unknown
        (let* ((raw   (slot-value reply 'value))
               (bytes (if (vectorp raw) raw
                          (coerce raw '(simple-array (unsigned-byte 8) (*)))))
               (order (conn-byte-order conn))
               (n     (floor (cl:length bytes) 4))
               (want  (%net-wm-state-atom conn state)))
          (loop for i from 0 below n
                for o = (* i 4)
                for b0 = (elt bytes o)
                for b1 = (elt bytes (+ o 1))
                for b2 = (elt bytes (+ o 2))
                for b3 = (elt bytes (+ o 3))
                for id = (if (= order +MSB+)
                             (+ (ash b0 24) (ash b1 16) (ash b2 8) b3)
                             (+ (ash b3 24) (ash b2 16) (ash b1 8) b0))
                thereis (= id want))))))

;;; Convenience wrappers for the states that actually get toggled in
;;; practice.  Each is one line and saves the caller from having to
;;; remember which of :ADD/:REMOVE goes with what.

(defun set-fullscreen (conn window on)
  "Request or release the EWMH fullscreen state on WINDOW."
  (set-net-wm-state conn window (if on :add :remove) :fullscreen))

(defun toggle-fullscreen (conn window)
  "Ask the WM to toggle WINDOW's fullscreen state."
  (set-net-wm-state conn window :toggle :fullscreen))

;;; wm.lisp ends here
