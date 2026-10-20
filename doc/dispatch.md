## Server I/O and reader/writer dispatch table

X is a wire protocol, it communicates with its clients via binary packets sent
over the wire to a connection point (socket).

An "open connection" to the X server means we have a working socket and are
sitting in an event loop to read and write messages.

### I/O pipeline

Everything read/write lives in io.lisp, the connection classes and slots it
touches are in connection.lisp and the platform primitives (%socket-send-now,
%socket-receive-now, %wait-fd, the locks) in platform.lisp and depending on what
you load, platform-sbcl.lisp or platform-cffi.lisp.

I/O is bi-directional, with one I/O lock, one reader at a time and one writer at
a time. The threading model and synchronization are shamelessly stolen from
libxcb, see [threads](./threads.md).

Sending:

generated sender
  ├─ conn-send-buffer          get this thread's buffer
  ├─ buffer-write-*            encode the request body
  ├─ buffer-finish-request     pad to 4 bytes, patch 16-bit (or BIG-REQUESTS) length
  └─ flush-request conn        :has-reply t  (and :fds / :reply-fds if applicable)
       │
       ├─ copy octets out of the thread's buffer
       │    (needed because %ensure-big-requests reuses the same buffer)
       ├─ if length field is 0 -> %ensure-big-requests
       │
       └─ with conn-io-lock
            ├─ %number-request       assign serial, record error route, enqueue
            ├─ %flush-out conn serial
            │    ├─ ensure writer flag held (wait on conn-io-cv if not)
            │    └─ %write-queued
            │         ├─ %next-batch: gather queued requests up to 64 KiB
            │         │   (a request with FDs starts a new batch — FDs go on the first byte)
            │         └─ loop %socket-send-now (sendmsg, MSG_DONTWAIT)
            │              └─ on :AGAIN -> %wait-writable
            │                   (release lock, poll fd, if nobody's reading, read a bit)
            └─ return serial

*defer-writes*, which is off by default, lets flush-request return without
flushing unless the queue exceeds +write-batch-bytes+. The rule then is that any
thread about to block on the socket must flush first.

Receiving:

%wait-for conn ready
  │
  ├─ %flush-out (invariant 6: my request must reach the server)
  └─ loop, with conn-io-lock held
       ├─ %file-packets       parse what's already in the input buffer
       │    └─ %parse-packet  one complete packet at a time
       │         ├─ :reply -> conn-pending-replies[serial] = (octets . fds)
       │         ├─ :error -> conn-pending-replies[serial] = (:error . octets)
       │         │            plus an (:error . serial) marker on the event queue
       │         │            unless it was a checked or has-reply route
       │         └─ :event -> conn-event-queue as (":raw" . octets)
       │                      (decoded lazily when a thread takes it)
       │
       ├─ (funcall ready) -> return
       ├─ conn-closed?    -> signal connection-closed
       │
       ├─ another thread is the reader? -> %cv-wait on conn-io-cv
       │
       └─ become the reader
            ├─ release conn-io-lock
            ├─ %wait-fd fd :input        blocks in poll(2) with the lock NOT held
            ├─ reacquire conn-io-lock
            ├─ %read-available           one recvmsg(MSG_DONTWAIT) into conn-in-buffer
            │    └─ %file-packets
            └─ stop being the reader
               %cv-broadcast conn-io-cv   (invariant 5: wake everyone, they re-check)

poll-for-event is the same loop without waiting: %file-packets, then %read-now
(which does a non-blocking read only if nobody else is the reader), then
%take-event.

The X server can send partial packets, so we have to deal with them which is a
bit tricky due to multithreading. Partial packets are stored in their own
buffer, conn-in-buffer between reads. %parse-packet only removes a complete
packet; %in-buffer-room compacts and grows when needed. A reply larger than one
recvmsg is fine.

connection.lisp declares the slots the pipeline reads and writes — in-buffer,
in-start, in-end, out-queue, out-tail, reading, writing, request-read,
request-completed, pending-replies, event-queue, received-fds, fd-reply-serials,
and the three locks (io-lock, io-cv, plus xid-lock, extension-lock, atom-lock
for the caches). io.lisp is the pipeline itself. platform.lisp is the interface,
and the two platform files implement it.

### Dispatching

Writers and readers are generated at compile time by the generator, one per
opcode. Each is a small function that reads or writes fields at fixed offsets in
an octet vector; just the position arithmetic. Concretely, writers are ordinary
lisp functions called directly by name: create-window, map-window. Readers are
reached through a table indexed by opcode, because not everything can be baked
in at compile time: the server assigns an extension's first-event, first-error,
and major-opcode per connection, and those numbers are what we look up with an
opcode from the wire to find a reader which handles the stream.

Adding a new extension only touches the global tables via
register-extension-event-decoder at load time. The global tables are populated
at load time by register-extension-* in the extension's generated file. But that
connection needs to learn the extension's major opcode, first-event and
first-error, and the only way to get those is QueryExtension, triggered lazily
by ensure-extension on the first extension request. So the extension's decoders
are registered without per-connection work, but the wire opcodes for the lookup
have to be fetched per connection.

For example DAMAGE might get first-event 87 on one connection and 92 on
another. So given a wire event code, the library has to work out which extension
it belongs to on this connection before it can look up the decoder by (extension
. local-code).

That's what %extension-index on the connection is for:

```lisp
(defun conn-event-decoder (conn code)
  (or (lookup-event-decoder code)                  ; core: global table
      (%conn-extension-decoder (extension-index-event-bases (%extension-index conn))
                               code #'lookup-extension-event-decoder)))
```

The second argument is the connection's alist of (first-event . extension-name),
built from conn-extensions. The decoder it eventually returns is the same global
function any other connection would return, only the path to it is
per-connection.

Two connections from the same image share every decoder function. There is no
duplication.

conn-extension-index is a small per-connection structure, rebuilt when
conn-extensions grows. That's the only per-connection cost.

In short: the server tells the client what a packet is by byte 0 (with the event
code in the low 7 bits, and for XGE the extension in byte 1 and the type in
bytes 8-9), and the client tells the server what a request is by byte 0 (core
opcode) or bytes 0-1 (extension major and minor opcode). Everything else is
positional decoding by fixed offset.

Classes and slots involved:

*event-decoders* - a 256-element vector in dispatch.lisp, indexed by core wire
code. Populated at load time by register-event-decoder in xproto.lisp
((register-event-decoder 2 #'decode-key-press)).

*error-decoders* — same, for core errors.

*extension-event-decoders* — hash table keyed by (extension-name . local-code),
populated by register-extension-event-decoder in each extension's generated
file.

*extension-ge-event-decoders* — keyed by (extension-name . event-type).

*extension-error-decoders* — keyed by (extension-name . local-code).

*extension-xnames* — maps the internal key ("XCB-DAMAGE") to the wire name
("DAMAGE"), populated by register-extension-xname. Only used for QueryExtension.
