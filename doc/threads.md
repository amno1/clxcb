# Using one connection from several threads

Status: implemented (`src/io.lisp`, the locks in `src/connection.lisp`),
following libxcb.

The tests are `tests/threads.lisp` (`clxcb/thread-tests`). If you test, test
multiple times, repeated at least 10 times each.

## Goal

A connection may be used by several threads at once, as a libxcb connection may:
any thread may send requests, wait for replies, and wait for or poll events, and
each gets what it asked for.  The model is libxcb's (`xcb_conn.c`, `xcb_out.c`,
`xcb_in.c`), translated, more or less, into Common Lisp.

## Invariants

These must hold under every interleaving of threads.  The algorithms below are
derived from them; a change that breaks one is wrong even if the tests pass.

1. At most one thread reads from the socket at a time (the *reader*).
2. Bytes are removed from the socket only into the connection's input
   buffer, under the I/O lock; packets are parsed only from that buffer.
3. A request is given its sequence number and put in the output buffer
   in one critical section.  So the order of sequence numbers is the
   order of the bytes on the wire, which is how the server numbers them.
4. A reply, error or event is filed (reply or error under its request's
   sequence number, event on the queue) before any waiting thread is
   woken.
5. After filing packets, the reader wakes every waiting thread.
6. A thread waiting for a reply first makes sure its request has been
   written, then waits only on the pending-reply table.  So the reply it
   waits for can always arrive.
7. No thread holds the I/O lock while blocked in the kernel.  Waiting
   for the socket, and waiting for another thread's work, happen with it
   released.
8. On a closed connection, or one whose server has gone, every wait ends:
   `wait-for-event`, `read-reply` for a reply that can no longer arrive,
   and a thread blocked in either, signal instead of hanging.
9. The descriptors that arrive with a reply are claimed by that reply, in
   the same critical section as the read that received them.
10. The socket's descriptor is closed only when no thread can be using
    it.  Otherwise the kernel may give its number to another file while
    a reader is still in `recvmsg` on it.

## 1. The input buffer

This is what makes "one reader, lock held briefly" possible at all.

The connection gets an input buffer (`in-queue`: octets, plus the file
descriptors that arrived with them, in order) living under the I/O lock.
Partial packets are kept there between reads.

- `%read-available` (internal, lock held): one non-blocking `recvmsg`
  (`MSG_DONTWAIT`) into the buffer's free space, growing it if needed.  Returns
  the count; 0 means end of file, EAGAIN means no data now.  It never waits: a
  sibling of `%socket-receive`, which waits in `wait-until-fd-usable` and so may
  only be called with the lock released.
- `%parse-packet` (internal, lock held): if the buffer holds a complete packet
  (32 bytes, plus 4 × length for replies and GenericEvents), remove and return
  it, claiming its descriptors (invariant 9); otherwise return NIL.  This
  replaces today's `read-packet`, which reads exact sizes from the socket and so
  blocks mid-packet.
- `%file-packets` (internal, lock held): parse and file every complete packet,
  then broadcast (invariant 5).

The reader checks the buffer for complete packets before waiting on the socket;
a packet may already be there, read by another thread.

## 2. Sending

Each thread encodes into its own send buffer.  `conn-send-buffer` returns the
calling thread's buffer (created on first use, under the lock); the 120
generated senders are unchanged.

`flush-request` (public) takes the I/O lock, then: assigns the next sequence
number, records whether a reply is expected and whether it carries descriptors,
and appends the request's octets and descriptors to the connection's output
buffer (invariant 3).  It returns the cookie without necessarily having written.

The output queue holds requests in number order: a request is queued when it is
numbered, not when it is written, so that a thread which waits for another
writer cannot be overtaken by a later request.  Whichever thread is the writer
(libxcb's `out.writing`) writes the whole queue, oldest first.  When the socket
is full it reads what the server sends, if no thread is reading, so that the two
cannot block each other; otherwise it waits for the socket with the lock
released.

Batching: the writer joins consecutive queued requests into one `sendmsg`, up to
64 KiB, starting a new batch at a request that carries descriptors (they attach
to a write's first byte).  With one thread writing immediately there is one
request queued and nothing changes; with several threads sending at once, the
writer takes the others' requests in the same call.  It is the safe half of the
change: it helps the concurrent case whatever the policy below.

Policy: `flush-request` returns only once its request is written, as before, so
callers that never flush see no change.  Writes are also made before any thread
waits for a reply or an event (invariant 6), and `flush` writes everything
queued.

Deferred writes, as libxcb does them, are behind the experimental
`*defer-writes*` switch and off by default.  Measured on a real X server
(`tests/benchmark-write-batching.lisp`: PolyFillRectangle into a pixmap, then
one round trip, one thread):

  | Rects per request | Bytes | Immediate | Deferred | `sendmsg` calls |
  |---|---|---|---|---|
  | 1   | 20    | 240 ms (200,000 requests) | 215 ms (−10 %) | 200,000 → 136 |
  | 16  | 140   | 580 ms (200,000 requests) | 320 ms (−45 %) | 200,000 → 855 |
  | 128 | 1,036 | 545 ms (50,000 requests)  | 440 ms (−20 %) | 50,000 → 1,564 |

The gain is largest in the middle: tiny requests are dominated by encoding them
in Lisp, large ones by the server's drawing, neither of which batching saves;
the system call's setup is what it amortizes.  So deferral is worth considering
for code sending bursts of medium-sized requests, and little else.

What it costs is a caller-visible rule: any thread that sends a request and
relies on the server having received it, including by another thread blocking on
the socket, must `flush` first; the blocked thread flushed when it started
waiting and will not again.  With the switch on, `server-hang-up-ends-a-wait`
hangs for exactly that reason.  Making deferral the default would need a flush
audit of every caller (Garnet's backend first); until a workload justifies it,
it stays off.

## 3. Reading

Every thread that waits — `read-reply`, `wait-for-event`,
`wait-for-x-event-or-timeout` — runs the same loop, differing only in what it
waits for:

```
wait-for (conn, ready-p):            ; ready-p: e.g. "reply for serial S filed"
  with I/O lock:
    flush the output buffer          ; invariant 6
    loop
      if connection closed:  signal  ; invariant 8
      file complete packets already in the input buffer
      if ready-p: return its result
      if another thread is the reader:
        condition-wait               ; releases the lock (invariant 7)
      else
        become the reader
        release the lock; wait until the socket is readable; retake it
        %read-available              ; EAGAIN: fine, loop; 0: mark closed
        stop being the reader
        file packets and broadcast   ; invariants 4, 5
```

`poll-for-event` is the same without waiting: file what is in the buffer, read
once non-blockingly if nobody else is reading, return an event or NIL.

## 4. The wake rule

After filing packets, the reader broadcasts the connection's condition variable,
unconditionally.  Every waiter re-checks what it waits for.  This is a
thundering herd of a handful of threads; targeted wakeups (libxcb's per-waiter
`reader_list`) are a later optimization, if ever, because getting them wrong
hangs a client, which is the bug being fixed.

The same broadcast happens when a reader stops being the reader without filing
anything (end of file, an error), so another waiter takes over.

## 5. Closing and errors

`close-connection` takes the lock, marks the connection closed, `shutdown(2)`s
the socket (which wakes a reader blocked in the kernel: its wait returns and
`recvmsg` returns 0), broadcasts, waits until no thread is the reader, and only
then closes the descriptor (invariant 10).

End of file on the socket marks the connection closed, as if `close-connection`
had been called, with the server hang-up as reason.

A waiter that finds the connection closed signals.  `read-reply` for a reply
already filed returns it; for one not filed, it signals.

An X error is filed under its request's sequence number, and where it goes then
depends on the request, which `flush-request` records when it numbers it:

  - a request with a reply (the generated senders pass `:has-reply`,
    libxcb's `isvoid`): only to its `read-reply`;
  - a void request sent inside `with-checked-requests` (libxcb's
    `_checked` senders): only to `request-check`;
  - any other void request: also marked on the event queue, and reported
    once, by whichever comes first, `request-check` or the next
    `poll-for-event` / `wait-for-event`.

A route goes when its request's answer is filed; a checked request that
succeeded has no answer, so its route goes when `request-completed` passes it.

## 6. Sequence numbers

Sequence numbers are 64-bit inside clxcb; the wire carries the low 16 bits.  The
cookie `flush-request` returns is the 64-bit number.

Widening: packets arrive in order, so a packet's 16-bit number is widened to the
smallest 64-bit number not below the last packet read whose low 16 bits match
(libxcb's `read_packet`).  KeymapNotify has no sequence number and does not move
it.

The pending-reply table is keyed by the 64-bit number, so a reply from 65,536
requests ago can never be mistaken for a new one.

`request-completed` (libxcb's `request_completed`): every packet filed advances
it to that packet's sequence number minus one, or to the number itself for a
reply or error.  The server answers requests in order, so every request up to it
has been answered or never will be.  A `read-reply` waiting for a number not
above it, whose reply is not filed, can never be answered: it is woken by the
broadcast, finds that, and signals.  There is no age counter and no timer.

Replies are removed when their `read-reply` takes them.  One nobody asks for
stays until the connection closes, as in libxcb, where it is the caller's job to
take or discard every reply it asked for.

The window: a 16-bit number widens unambiguously only while fewer than 65,536
requests are unanswered.  A request without a reply gets no answer, so after
65,534 of them in a row the server's progress could no longer be told.  As
libxcb's `send_sync` does, a `GetInputFocus` is sent then, and its reply
advances `request-completed`.

Any code that compares a cookie with a reply's `sequence` slot must now compare
the low 16 bits.

## 7. Locks and the public/private split

One non-recursive lock per purpose:

I/O lock (with its condition variable) => 
    output and input buffers,
    sequence numbers, pending replies,
    received descriptors and their serials,
    the event queue, reader/writer flags, closed flag 

XID lock => `resource-id-next`,
    `resource-id-max` (so two threads cannot both see exhaustion and both refill)

extension lock => `conn-extensions` and the lazily rebuilt extension index

atom lock => `conn-atoms`

Public functions take the locks they need; internal (`%`) functions assume their
caller holds them.  A function never holds a lock while calling something that
may wait on the I/O lock's condition variable, except the I/O lock itself inside
`wait-for`: `ensure-extension` and `intern-atom-id` check their cache under
their lock, make the round trip with it released, and take it again to insert.
Two threads doing the same lookup at once both get the same answer, so losing
that race is harmless; that is why the racing-intern-atom-id test passes once
sending and reading are correct, not because the cache is atomic.  `generate-id`
holds the XID lock across a refill.

Public: `flush-request`, `flush`, `read-reply`, `wait-for-event`,
`poll-for-event`, `wait-for-x-event-or-timeout`, `generate-id`,
`ensure-extension`, `intern-atom-id`, `close-connection`, and a new
`clear-event-queue`.  `decode-event` and the other functions exported only for
the read path become internal, or are documented as callable only from it.

## Differences from libxcb

**Where an X error goes** is as in libxcb (section 5) for requests with a reply,
whose errors go only to `read-reply`, and for checked void requests, whose
errors go only to `request-check`.  The one difference is an unchecked void
request: libxcb sends its error only to the event functions, and
`xcb_request_check` on it finds nothing; clxcb lets `request-check` take it too,
whichever comes first, so that `request-check` works on any void request,
checked or not.  Checked requests are a dynamic scope (`with-checked-requests`),
not a second generated sender per request as in libxcb.
    
**`request-check`** is libxcb's `xcb_request_check`.  Every error is filed under
its request's number, so it finds a void request's error there, taking it (an
event-queue marker for it is then skipped).  It returns NIL once the server has
answered past the request without an error, sending a sync first if nothing else
would make it.  Like libxcb it returns the error, a `protocol-error` condition,
rather than signalling it; called on a request with a reply, it signals.

**`isvoid`** is `flush-request`'s `:has-reply`, passed by every generated sender
that has a reply (the generator emits it from `<reply>` in the XML).  Alone it
would break `request-check`, which needs a void request's error filed under its
number; hence the *checked* route, the same coupling libxcb has between its
`_checked` senders and `xcb_request_check`.

**One wake-up for everyone.**  libxcb wakes only the thread whose reply arrived
(`reader_list`); clxcb broadcasts.  Correct, and cheap at the thread counts X
clients use; not worth changing unless profiling says otherwise.

**Writes are immediate.**  libxcb queues requests until a flush, a reply wait,
or a full buffer; clxcb, for now, writes each request before `flush-request`
returns.  See section 2.

## 8. One change, not two

Sending and reading are implemented in that order, but they are one change: they
take the same I/O lock, and sending writes the table only reading reads.
Neither can be tested without the other.

## Portability

On SBCL on Linux every connection to a socket does raw `sendmsg`/`recvmsg`.  A
connection over a plain stream, the tests' in-memory connections, or a platform
without raw descriptors, goes through the same output queue, input buffer and
filing, but its reader blocks on the stream, reading one byte and then whatever
`listen` says is ready.  It is meant for one thread; the design does not make it
safe for several.  A comment in `io.lisp` says so, so nobody "fixes" the socket
path by branching on the platform.

## Events are decoded when taken

The reader files an event's raw bytes; it is decoded when a thread takes it
(`poll-for-event`, `wait-for-event`, `pop-queued-events-while`), and the decoded
event then replaces the bytes in the queue.  So a decoder registered after an
event was read, but before it is taken, is still used (the reader may read
several events at once), and the reader, which holds the I/O lock, does less
work.  libxcb's queue likewise holds raw events.

## Tests

`tests/threads.lisp`, all against the public API, each thread joined with a
timeout:

| Test                                                      | Invariants    |
|-----------------------------------------------------------|---------------|
| round trips from many threads (wraps the sequence number) | 1–4, 6        |
| atom round trips from many threads                        | 3, 4, 6       |
| event waiter does not block senders                       | 7             |
| events and replies from many threads                      | 4, 5          |
| racing intern-atom-id                                     | the atom lock |
| racing generate-id                                        | the XID lock  |
| file descriptors from many threads                        | 9             |
| close wakes a blocked reader                              | 8             |
| server hang-up ends a wait (KillClient on ourselves)      | 8             |
| a reply that cannot arrive signals                        | 8             |
| two threads sending at once (the smoke test)              | 3             |
| request-check: success, failure, twice, on a reply request, on a closed connection | 4, 8 |
| error routes: reply request, unchecked void, checked void, no leaked routes | section 5 |

`CLXCB_THREAD_TEST_THREADS=1` runs every test single-threaded, the extra waiter
or reader threads included, as a check of the tests themselves; the tests that
need a second thread by nature are skipped then.  `CLXCB_THREAD_TEST_REPEAT`
repeats every test.
