;;; tests/threads.lisp — one connection used from several threads.
;;; Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
;;; SPDX-License-Identifier: MIT
;;; See the LICENSE file for the full license text.

;;; Functional tests of what libxcb guarantees and clxcb must too: that
;;; one connection may be used by several threads at once.  They use
;;; only the public API, so they stay valid when the internals change.
;;;
;;; They talk to the X server named by $DISPLAY and are skipped (they
;;; pass without doing anything) when there is none.  A test that hangs
;;; is a failure: every thread is joined with a timeout, and one still
;;; running then is reported and terminated.
;;;
;;; Races are found by repetition, not by one run.  CLXCB_THREAD_TEST_REPEAT
;;; (default 1) repeats every test; the round-trip test sends enough
;;; requests on its own for the 16-bit sequence number to wrap.
;;;
;;; (asdf:test-system "clxcb/thread-tests") runs them.

(defpackage #:clxcb/thread-tests
  (:use #:cl #+sbcl #:sb-rt #-sbcl #:rt)
  (:shadow #:deftest)
  (:export #:run-tests))

(in-package #:clxcb/thread-tests)

;;; Test definition on top of RT

(defvar *failures* '())

(defmacro is (form &optional description)
  `(unless ,form
     (push (list :failed ,(or description `',form)) *failures*)))

(defmacro deftest (name lambda-list &body body)
  "An RT test that passes if no IS in BODY failed, and that is skipped
   when there is no X server."
  (assert (null lambda-list))
  `(#+sbcl sb-rt:deftest #-sbcl rt:deftest ,name
     (let ((*failures* '()))
       (when (display-available-p)
         (dotimes (i (repeat-count))
           ,@body))
       (or (null *failures*) (reverse *failures*)))
     t))

(defun display-available-p ()
  (let ((d (uiop:getenv "DISPLAY"))) (and d (plusp (length d)))))

(defun threads (n)
  "N, or the thread count in CLXCB_THREAD_TEST_THREADS.  With 1, every
   test runs single-threaded: a check of the tests themselves, which
   must then pass whatever clxcb's thread safety."
  (or (ignore-errors (parse-integer (uiop:getenv "CLXCB_THREAD_TEST_THREADS"))) n))

(defun repeat-count ()
  (or (ignore-errors (parse-integer (uiop:getenv "CLXCB_THREAD_TEST_REPEAT"))) 1))

;;; Threads

(defparameter *timeout* 120
  "Seconds a test's threads may run before the test counts as hung.")

(defun run-threads (n function &key (timeout *timeout*))
  "Run FUNCTION, of one argument (the thread's index), in N threads at
   once and wait for them all.  Returns (VALUES RESULTS ERRORS HUNG):
   the values the threads returned, in order; the errors that ended
   any; and how many were still running after TIMEOUT seconds (those
   are terminated).  Errors are the conditions themselves, so a test
   can print them."
  (let* ((start (sb-thread:make-waitqueue))
         (lock (sb-thread:make-mutex))
         (go nil)
         (threads
           (loop for i below n
                 collect (let ((i i))
                           (sb-thread:make-thread
                            (lambda ()
                              ;; Start together, to make the race likely.
                              (sb-thread:with-mutex (lock)
                                (loop until go do (sb-thread:condition-wait start lock)))
                              (handler-case (list :ok (funcall function i))
                                (error (e) (list :error e))))
                            :name (format nil "clxcb-test-~D" i)))))
         (deadline (+ (get-internal-real-time)
                      (* timeout internal-time-units-per-second)))
         (results '()) (errors '()) (hung 0))
    (sb-thread:with-mutex (lock)
      (setf go t)
      (sb-thread:condition-broadcast start))
    (dolist (th threads)
      ;; Past the deadline, a thread still running is hung: join it with
      ;; the least timeout SBCL accepts, which must be positive.
      (let* ((left (max 1/1000 (/ (- deadline (get-internal-real-time))
                                  internal-time-units-per-second)))
             (r (sb-thread:join-thread th :default :hung :timeout left)))
        (cond ((eq r :hung)
               (incf hung)
               (ignore-errors (sb-thread:terminate-thread th)))
              ((eq (first r) :ok) (push (second r) results))
              (t (push (second r) errors)))))
    (values (nreverse results) (nreverse errors) hung)))

(defun sequential-p ()
  "True when CLXCB_THREAD_TEST_THREADS is 1: then even a test's extra
   waiter or reader thread does not run concurrently (see SPAWN), so
   every test is single-threaded."
  (eql (threads 2) 1))

(defun spawn (function name)
  "Start FUNCTION in a thread named NAME; with SEQUENTIAL-P, only note
   it, to be run by FINISH."
  (if (sequential-p)
      (list :deferred function)
      (sb-thread:make-thread function :name name)))

(defun finish (task &key (timeout 20))
  "The value of TASK (from SPAWN), or :HUNG if its thread is still
   running after TIMEOUT seconds; the thread is then terminated."
  (if (and (consp task) (eq (first task) :deferred))
      (funcall (second task))
      (let ((r (sb-thread:join-thread task :default :hung :timeout timeout)))
        (when (eq r :hung) (ignore-errors (sb-thread:terminate-thread task)))
        r)))

(defun describe-error (e)
  "E's class and message on one line: enough to tell a corrupted
   connection from a mistake in a test."
  (format nil "~S: ~A" (type-of e)
          (substitute #\Space #\Newline (princ-to-string e))))

(defmacro expect-threads ((results n function &key (timeout '*timeout*)) &body body)
  "Run FUNCTION in N threads, fail the test for any error or hang, and
   run BODY with RESULTS bound to the threads' values."
  (let ((errors (gensym "ERRORS")) (hung (gensym "HUNG")))
    `(multiple-value-bind (,results ,errors ,hung)
         (run-threads (threads ,n) ,function :timeout ,timeout)
       (is (zerop ,hung) (format nil "~D thread(s) hung" ,hung))
       (is (null ,errors)
           (format nil "~D thread error(s): ~{~A~^; ~}" (length ,errors)
                   (mapcar #'describe-error (subseq ,errors 0 (min 3 (length ,errors))))))
       ,@body)))

(defmacro with-test-connection ((conn) &body body)
  "Run BODY with CONN, a fresh connection, with decoder errors signalled
   rather than hidden, so a corrupted connection fails loudly."
  `(let ((xcb:*debug-decoders* t))
     (xcb:with-x-connection (,conn)
       ,@body)))

(defun root (conn) (xcb:root (first (xcb:conn-roots conn))))

(defun make-test-window (conn)
  "An unmapped window on CONN.  ClientMessages sent to it with an empty
   event mask go to CONN, which created it."
  (let ((wid (xcb:generate-id conn)))
    (xcb:create-window conn 0 wid (root conn) 0 0 10 10 0 1 0 0)
    (sync conn)
    wid))

(defun sync (conn)
  "A round trip: everything CONN sent before has been processed."
  (xcb:get-input-focus-reply conn (xcb:get-input-focus conn)))

;;; 1. Round trips from many threads

(defparameter *round-trip-threads* 8)
(defparameter *round-trips-per-thread* 9000
  "8 threads x 9000 is 72,000 requests: the 16-bit sequence number wraps.")

(defconstant +last-predefined-atom+ 68
  "Atoms 1 (PRIMARY) to 68 (WM_TRANSIENT_FOR) exist on every server.")

(defun atom-name-string (conn atom)
  (coerce (xcb:name (xcb:get-atom-name-reply conn (xcb:get-atom-name conn atom)))
          'string))

(deftest round-trips-from-many-threads ()
  ;; Each request asks for a different predefined atom's name, so a reply
  ;; handed to the wrong thread is the wrong name, not just a lost reply.
  ;; (A lost reply shows up as a hung thread.)  Enough requests for the
  ;; 16-bit sequence number to wrap.
  (with-test-connection (conn)
    (let ((expected (make-array (1+ +last-predefined-atom+))))
      (loop for a from 1 to +last-predefined-atom+
            do (setf (aref expected a) (atom-name-string conn a)))
      (expect-threads (results *round-trip-threads*
                       (lambda (i)
                         (let ((wrong 0))
                           (dotimes (k *round-trips-per-thread*)
                             (let ((a (1+ (mod (+ i k) +last-predefined-atom+))))
                               (unless (string= (atom-name-string conn a) (aref expected a))
                                 (incf wrong))))
                           wrong)))
        (is (every #'zerop results) "a reply went to the wrong request")))))

(deftest atom-round-trips-from-many-threads ()
  ;; Each thread interns its own names and reads them back: a reply
  ;; handed to the wrong thread shows up as the wrong name.
  (with-test-connection (conn)
    (expect-threads (results 6
                     (lambda (i)
                       (let ((wrong 0))
                         (dotimes (k 300)
                           (let* ((name (format nil "CLXCB_THREAD_TEST_~D_~D" i k))
                                  (atom (xcb:atom (xcb:intern-atom-reply
                                                   conn (xcb:intern-atom conn 0 name))))
                                  (back (xcb:name (xcb:get-atom-name-reply
                                                   conn (xcb:get-atom-name conn atom)))))
                             (unless (string= (coerce back 'string) name)
                               (incf wrong))))
                         wrong)))
      (is (every #'zerop results) "an atom's name came back wrong"))))

;;; 2. A thread waiting for events while others send

(deftest event-waiter-does-not-block-senders ()
  ;; The timer case: one thread blocks in WAIT-FOR-EVENT while others do
  ;; round trips; then one of them sends it the ClientMessage it waits
  ;; for.  Nothing may hang, and the event must arrive.
  (with-test-connection (conn)
    (let* ((window (make-test-window conn))
           (type (xcb:intern-atom-id conn "CLXCB_THREAD_TEST_WAKE"))
           (lock (sb-thread:make-mutex))
           (received nil)
           (waiter (spawn
                    (lambda ()
                      (handler-case
                          (loop for ev = (xcb:wait-for-event conn)
                                when (and (typep ev 'xcb:client-message)
                                          (= (xcb:type ev) type))
                                  do (sb-thread:with-mutex (lock) (setf received t))
                                     (return :woken))
                        (error (e) e)))
                    "clxcb-test-waiter")))
      (sleep 0.2)                       ; let it block
      (expect-threads (results 4 (lambda (i)
                                   (declare (ignore i))
                                   (dotimes (k 2000) (sync conn))
                                   t)
                       :timeout 60)
        (is (every #'identity results)))
      (xcb:send-client-message conn window 0 window type (list 1 2 3))
      (sync conn)
      (let ((r (finish waiter :timeout 10)))
        (is (eq r :woken) (format nil "event waiter ended with ~A" r))
        (is (sb-thread:with-mutex (lock) received))))))

(deftest events-and-replies-from-many-threads ()
  ;; Several threads send themselves ClientMessages and do round trips
  ;; while one thread takes events: every event must arrive exactly once
  ;; and every reply must reach its thread.
  (with-test-connection (conn)
    (let* ((window (make-test-window conn))
           (type (xcb:intern-atom-id conn "CLXCB_THREAD_TEST_EVENT"))
           (senders (threads 4)) (per-sender 500)
           (seen (make-hash-table :test 'equal))
           (seen-lock (sb-thread:make-mutex))
           (reader (spawn
                    (lambda ()
                      (handler-case
                          (loop with want = (* senders per-sender)
                                for ev = (xcb:wait-for-event conn)
                                when (and (typep ev 'xcb:client-message)
                                          (= (xcb:type ev) type))
                                  do (let ((key (subseq (xcb:data32 (xcb:data ev)) 0 2)))
                                       (sb-thread:with-mutex (seen-lock)
                                         (incf (gethash (coerce key 'list) seen 0))
                                         (when (= (hash-table-count seen) want)
                                           (return :done)))))
                        (error (e) e)))
                    "clxcb-test-reader")))
      (expect-threads (results senders
                       (lambda (i)
                         (dotimes (k per-sender)
                           (xcb:send-client-message conn window 0 window type (list i k))
                           (when (zerop (mod k 10)) (sync conn)))
                         (sync conn)
                         t)
                       :timeout 60)
        (is (every #'identity results)))
      (let ((r (finish reader :timeout 20)))
        (is (eq r :done) (format nil "event reader ended with ~A" r))
        (sb-thread:with-mutex (seen-lock)
          (is (= (hash-table-count seen) (* senders per-sender)) "events were lost")
          (is (loop for v being the hash-values of seen always (= v 1))
              "an event arrived more than once"))))))

;;; 3. The caches

(deftest racing-intern-atom-id ()
  ;; Every thread interns the same names; all must agree, with each
  ;; other and with the server.
  (with-test-connection (conn)
    (let ((names (loop for k below 200 collect (format nil "CLXCB_RACE_~D_~D" (random 1000000) k))))
      (expect-threads (results 8 (lambda (i)
                                   (declare (ignore i))
                                   (mapcar (lambda (n) (xcb:intern-atom-id conn n)) names)))
        (is (every (lambda (r) (equal r (first results))) results)
            "threads got different atoms for the same name")
        (is (equal (first results)
                   (mapcar (lambda (n)
                             (xcb:atom (xcb:intern-atom-reply conn (xcb:intern-atom conn 1 n))))
                           names))
            "the cached atoms differ from the server's")))))

(deftest racing-generate-id ()
  ;; XIDs handed out concurrently must all be distinct.
  (with-test-connection (conn)
    (expect-threads (results 8 (lambda (i)
                                 (declare (ignore i))
                                 (loop repeat 2000 collect (xcb:generate-id conn))))
      (let ((all (apply #'append results)))
        (is (= (length all) (length (remove-duplicates all))) "an XID was handed out twice")))))

;;; 4. File descriptors

(deftest file-descriptors-from-many-threads ()
  ;; MIT-SHM CreateSegment replies carry a descriptor each: every thread
  ;; must get its own, open, and none may be left unclaimed.
  (with-test-connection (conn)
    (when (and xcb:*fd-passing-supported*
               (eq (xcb:conn-transport conn) :local)  ; TCP carries none
               (xcb:extension-present-p conn "XCB-SHM"))
      (expect-threads (results 6
                       (lambda (i)
                         (declare (ignore i))
                         (loop repeat 20
                               collect (let* ((seg (xcb:generate-id conn))
                                              (fd (xcb-shm:shm-fd
                                                   (xcb-shm:create-segment-reply
                                                    conn (xcb-shm:create-segment conn seg 4096 0)))))
                                         (prog1 fd
                                           (xcb-shm:detach conn seg))))))
        (let ((fds (apply #'append results)))
          (is (= (length fds) (length (remove-duplicates fds))) "two replies got the same descriptor")
          (is (every (lambda (fd) (ignore-errors (sb-posix:fcntl fd sb-posix:f-getfd) t)) fds)
              "a descriptor was not open")
          (mapc (lambda (fd) (ignore-errors (sb-posix:close fd))) fds)
          (sync conn)
          (is (null (xcb:conn-received-fds conn)) "descriptors left unclaimed"))))))

;;; 5. Closing

(deftest close-wakes-a-blocked-reader ()
  ;; Closing the connection while a thread waits for an event must end
  ;; that wait, by returning or signalling, not leave it hanging.
  ;; CLOSE-CONNECTION is idempotent, so WITH-TEST-CONNECTION's own close
  ;; afterwards does nothing.  There is no single-threaded form of this
  ;; test, so SEQUENTIAL-P skips it.
  (unless (sequential-p)
   (with-test-connection (conn)
    (let ((waiter (sb-thread:make-thread
                   (lambda () (handler-case (progn (xcb:wait-for-event conn) :returned)
                                (error () :signalled)))
                   :name "clxcb-test-blocked")))
      (sleep 0.3)
      (xcb:close-connection conn)
      (let ((r (sb-thread:join-thread waiter :default :hung :timeout 5)))
        (when (eq r :hung) (ignore-errors (sb-thread:terminate-thread waiter)))
        (is (member r '(:returned :signalled))
            "a reader blocked in WAIT-FOR-EVENT hung after close"))))))

;;; 6. Bounded waits (doc/threads.md, invariant 8), enforced by the code
;;; rather than by the test's join timeout.

(defun signals-within (seconds function)
  "Run FUNCTION in a thread and return the condition it signals, the
   value it returns if it returns normally, or :HUNG if it does neither
   within SECONDS."
  (let ((th (sb-thread:make-thread
             (lambda () (handler-case (funcall function)
                          (error (e) e)))
             :name "clxcb-test-bounded")))
    (let ((r (sb-thread:join-thread th :default :hung :timeout seconds)))
      (when (eq r :hung) (ignore-errors (sb-thread:terminate-thread th)))
      r)))

(deftest server-hang-up-ends-a-wait ()
  ;; KillClient on one of our own windows makes the server drop the
  ;; connection: a thread blocked in WAIT-FOR-EVENT must then signal.
  (unless (sequential-p)
    (with-test-connection (conn)
      (let* ((window (make-test-window conn))
             (waiter (spawn (lambda ()
                              (handler-case (progn (xcb:wait-for-event conn) :returned)
                                (xcb:connection-closed () :closed)
                                (error (e) e)))
                            "clxcb-test-hang-up")))
        (sleep 0.2)
        (xcb:kill-client conn window)
        (is (eq (finish waiter :timeout 5) :closed)
            "a wait did not end with CONNECTION-CLOSED when the server hung up")
        (is (typep (signals-within 5 (lambda () (sync conn))) 'xcb:connection-closed)
            "a request on a connection the server dropped did not signal")))))

(deftest reply-that-cannot-arrive-signals ()
  ;; CreateWindow has no reply: once the server has answered past it,
  ;; READ-REPLY for its cookie must signal, not wait forever.
  (with-test-connection (conn)
    (let ((cookie (xcb:create-window conn 0 (xcb:generate-id conn) (root conn)
                                     0 0 10 10 0 1 0 0)))
      (sync conn)
      (is (typep (signals-within 5 (lambda ()
                                     (xcb:get-input-focus-reply conn cookie)))
                 'xcb:no-reply)
          "READ-REPLY for a request without a reply did not signal NO-REPLY"))
    ;; An error for a request with a reply goes only to its READ-REPLY
    ;; (doc/threads.md, section 5), even when an event function asks
    ;; first.  GetGeometry on a window never created fails: BadDrawable.
    (let ((cookie (xcb:get-geometry conn (xcb:generate-id conn))))
      (sync conn)
      (is (null (signals-within 5 (lambda () (xcb:poll-for-event conn))))
          "POLL-FOR-EVENT took the error of a request with a reply")
      (is (typep (signals-within 5 (lambda () (xcb:get-geometry-reply conn cookie)))
                 'xcb:protocol-error)
          "READ-REPLY did not signal its request's error"))))

(deftest unchecked-void-error-goes-to-events ()
  ;; An unchecked void request's error: nobody checks it, so the event
  ;; functions report it, as before.
  (with-test-connection (conn)
    (xcb:map-window conn (xcb:generate-id conn))
    (sync conn)
    (is (typep (signals-within 5 (lambda () (xcb:poll-for-event conn)))
               'xcb:protocol-error)
        "POLL-FOR-EVENT did not report an unchecked void request's error")))

(deftest checked-void-error-goes-only-to-request-check ()
  ;; Inside WITH-CHECKED-REQUESTS a void request's error is kept for
  ;; REQUEST-CHECK and never reaches the event functions.
  (with-test-connection (conn)
    (let ((cookie (xcb:with-checked-requests ()
                    (xcb:map-window conn (xcb:generate-id conn)))))
      (sync conn)
      (is (null (signals-within 5 (lambda () (xcb:poll-for-event conn))))
          "POLL-FOR-EVENT took a checked request's error")
      (let ((r (xcb:request-check conn cookie)))
        (is (and (typep r 'xcb:protocol-error)
                 (= (xcb:protocol-error-code r) +bad-window+))
            (format nil "REQUEST-CHECK of a checked request gave ~S" r))))))

(deftest checked-routes-do-not-pile-up ()
  ;; Checked requests that succeed get no answer; their routes must be
  ;; dropped once the server has answered past them.  The one test that
  ;; looks at internal state, because a leak shows in no public result:
  ;; if the tables' layout changes, update this test, do not drop it.
  (with-test-connection (conn)
    (xcb:with-checked-requests ()
      (dotimes (k 100)
        (xcb:create-window conn 0 (xcb:generate-id conn) (root conn) 0 0 10 10 0 1 0 0)))
    (sync conn)
    (is (zerop (hash-table-count (xcb::%conn-checked-serials conn)))
        (format nil "~D checked routes left after the server answered past them"
                (hash-table-count (xcb::%conn-checked-serials conn))))
    (is (zerop (hash-table-count (xcb::%conn-reply-serials conn)))
        "reply routes left after every reply was filed")))

;;; 7. REQUEST-CHECK

(defconstant +bad-window+ 3 "The X error code BadWindow.")

(deftest request-check-success-returns-nil ()
  (with-test-connection (conn)
    (let ((cookie (xcb:create-window conn 0 (xcb:generate-id conn) (root conn)
                                     0 0 10 10 0 1 0 0)))
      (is (null (signals-within 5 (lambda () (xcb:request-check conn cookie))))
          "REQUEST-CHECK of a request that succeeded did not return NIL"))))

(deftest request-check-failure-returns-the-error ()
  ;; MapWindow of a window that was never created fails with BadWindow;
  ;; REQUEST-CHECK returns that error, it does not signal it.
  (with-test-connection (conn)
    (let* ((cookie (xcb:map-window conn (xcb:generate-id conn)))
           (r (signals-within 5 (lambda () (xcb:request-check conn cookie)))))
      (is (typep r 'xcb:protocol-error)
          (format nil "REQUEST-CHECK returned ~S, not the error" r))
      (is (and (typep r 'xcb:protocol-error)
               (= (xcb:protocol-error-code r) +bad-window+))
          "the returned error is not BadWindow"))))

(deftest request-check-twice-returns-nil ()
  ;; The first check takes the error; the second returns NIL, and the
  ;; event functions do not see the error either.
  (with-test-connection (conn)
    (let ((cookie (xcb:map-window conn (xcb:generate-id conn))))
      (is (typep (xcb:request-check conn cookie) 'xcb:protocol-error))
      (is (null (xcb:request-check conn cookie))
          "a second REQUEST-CHECK of the same cookie did not return NIL")
      (is (null (signals-within 5 (lambda () (xcb:poll-for-event conn))))
          "an error REQUEST-CHECK took was reported again by POLL-FOR-EVENT"))))

(deftest request-check-on-a-reply-signals ()
  ;; Misuse: the request has a reply, which must not be lost silently.
  (with-test-connection (conn)
    (let ((cookie (xcb:get-input-focus conn)))
      (sync conn)
      (let ((r (signals-within 5 (lambda () (xcb:request-check conn cookie)))))
        (is (and (typep r 'error) (not (typep r 'xcb:protocol-error)))
            (format nil "REQUEST-CHECK on a reply request gave ~S, not an error" r))))))

(deftest request-check-on-a-closed-connection-signals ()
  (with-test-connection (conn)
    (let ((cookie (xcb:create-window conn 0 (xcb:generate-id conn) (root conn)
                                     0 0 10 10 0 1 0 0)))
      (xcb:close-connection conn)
      (is (typep (signals-within 5 (lambda () (xcb:request-check conn cookie)))
                 'xcb:connection-closed)
          "REQUEST-CHECK on a closed connection did not signal CONNECTION-CLOSED"))))

(deftest discard-reply-drops-reply-and-error ()
  ;; A discarded reply, and a discarded request's error, never reach
  ;; anyone; the connection goes on as before.
  (with-test-connection (conn)
    (let ((ok (xcb:get-input-focus conn))
          (bad (xcb:get-geometry conn (xcb:generate-id conn))))
      (xcb:discard-reply conn ok)
      (xcb:discard-reply conn bad)
      (sync conn)
      (is (null (signals-within 5 (lambda () (xcb:poll-for-event conn))))
          "a discarded request's error reached POLL-FOR-EVENT")
      (is (zerop (hash-table-count (xcb::conn-pending-replies conn)))
          "a discarded reply was kept")
      (is (plusp (xcb:intern-atom-id conn "WM_NAME"))))))

(deftest poll-for-queued-event-does-not-read ()
  ;; POLL-FOR-QUEUED-EVENT takes what is queued, never reads the socket.
  (with-test-connection (conn)
    (let* ((window (make-test-window conn))
           (type (xcb:intern-atom-id conn "CLXCB_QUEUED_TEST")))
      (xcb:send-client-message conn window 0 window type (list 1))
      (sleep 0.2)                       ; it is on the socket, not queued
      (is (null (xcb:poll-for-queued-event conn))
          "POLL-FOR-QUEUED-EVENT read the socket")
      (sync conn)                       ; reading the reply queues the event
      (is (typep (xcb:poll-for-queued-event conn) 'xcb:client-message)))))

(deftest two-threads-sending-at-once ()
  ;; The smoke test: before the I/O lock, two threads' requests
  ;; interleaved in the shared send buffer on the very first try.
  (with-test-connection (conn)
    (expect-threads (results 2 (lambda (i)
                                 (declare (ignore i))
                                 (make-test-window conn)))
      (is (= (length (remove-duplicates results)) (threads 2))))))

(defun run-tests ()
  "Run the thread tests.  Returns T if all passed."
  (do-tests))
