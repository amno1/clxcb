# Hacking on CLXCB

How CLXCB is put together, if you would like to hack it.

---

## Repository layout

```
  src/           hand-written code: the runtime, the platform layers, helpers
  src/generated/ protocol code written by clxcb-generator; never edit by hand
  tests/         RT test suites and benchmarks
  doc/           design notes (this and threads.md)
```

---

## Design

Every protocol type, structure, request, reply, event, error, is an ordinary
`defclass`, and the generator writes an encoder (`encode-<type>`) and a decoder
(`decode-<type>`) function for it. The wire format of each type lives in the
code of those functions; there is no schema interpreted at run time. Each
request's sender encodes its arguments directly into the calling thread's send
buffer and hands it to `flush-request`. Core events and errors are decoded
through two 256-entry global tables indexed by wire code. Extension events and
errors are decoded through global tables keyed by (extension . local-code), but
the wire code to extension mapping is per connection, because the server assigns
each extension's first-event, first-error, and major-opcode per connection; the
connection's extension index resolves the wire code to a decoder. For more
detailed description see [dispatch](./dispatch.md).

---

## Systems and loading order

At the user level, there are two public systems, which differ only in their
"platform file":

- `clxcb/cffi` (and `clxcb`, which is the same): `platform-cffi.lisp`
- `clxcb/sbcl`: `platform-sbcl.lisp`

The idea is to provide a "portable" implementation and one for SBCL only. Since
I am not familiar with other implementations but SBCL, I can only do one
"native" for SBCL, and for the rest use CFFI, usockets and other portable
libraries I needed. To implement the protocol we need sockets, threads, locks
and some system calls.

Internally, we have to ensure the code loads in the correct order, so I use a
few more systems:

**Base** is what the generated code is written against: the per-thread send
 buffer and its `buffer-write-*` writers, the positional `read-*-at` readers,
 `defenum`, the decoder tables, sequence tracking, reply and event queues, and
 the connection. It loads strictly before the generated code, so the macros and
 functions a generated `defun` uses are defined when it is compiled.

**Generated** is the core protocol, `src/generated/xproto.lisp`. BIG-REQUESTS
 and XC-MISC are part of it, as in libxcb's core library, because the connection
 uses them itself: for requests longer than 256 KiB, and for new XIDs when the
 first range runs out.

**Runtime** is the hand-written code that uses generated code directly:
 `connect` and the handshake, Xauthority lookup through clXau, properties,
 ICCCM/EWMH, images. It loads after the generated code.

The platform file loads last: nothing calls the platform interface at load time.

Either is `clxcb/base` followed by its platform file. `clxcb/base` is everything
that does not depend on the platform, in three layers (ASDF modules), loaded in
strict order:

Those are not, and should not be, exposed to the end-user. If they leak, it is a
bug. The loading order is:

```
  clxcb/base
   base    Packages, the platform interface, send buffer & writers,
    │      positional readers, enums, decoder dispatch tables, I/O,
    │      connection
    ▼
   generated  The core protocol, with BIG-REQUESTS and XC-MISC
    │
    ▼
   runtime Handshake, auth, display parsing, properties,
    │      ICCCM/EWMH, images
    ▼
  platform-cffi.lisp (clxcb/cffi) or platform-sbcl.lisp (clxcb/sbcl)
```

### Extensions

Each extension is in a package of its own, `XCB-<NAME>`, with its generated code
in `src/generated/<name>.lisp`. A program loads one when it needs it:

```lisp
(require :clxcb/xinput)
```

which loads it with the extensions its XML `<import>`s, as libxcb's libraries
do: `xinput` imports `xfixes`, which imports `render` and `shape`. The
hand-written helpers for an extension load with it: `render-util.lisp` with
`render`, `xinput-util.lisp` with `xinput`.

Each extension is an ASDF system, `clxcb/<name>`, on top of `clxcb/base`, and
`require` loads it through ASDF. A library whose source names an extension's
symbols (`xcb-render:composite`) needs the package when it is compiled, so it
lists the extension among its dependencies, next to `clxcb`:

```lisp
:depends-on ("clxcb" "clxcb/render")
```

An extension does not depend on a platform path; `clxcb` provides one, and when
`clxcb/sbcl` is already loaded it keeps that one.

When xcbproto gains an extension, or an extension's imports change, update the
`define-clxcb-extension` forms and the list in `clxcb/all`.

---

## Platform paths

Everything CLXCB needs from the implementation and the OS: sockets, locks and
condition variables, a per-thread table, waiting on a descriptor,
`sendmsg`/`recvmsg` for descriptor passing, IEEE float bits, goes through a
small interface declared in `src/platform.lisp`. The rest of the code calls only
that. Locks are taken with `with-lock`, which expands into a function call
rather than an implementation's macro, and sockets are objects only the platform
file looks into, so every other file compiles the same on either path.

|              | `clxcb/cffi`        | `clxcb/sbcl`     |
|----------------------------|----------------------------|----------------------|
| Sockets          | usocket          | sb-bsd-sockets    |
| Threads          | bordeaux-threads (APIv2)  | sb-thread      |
| Per-thread send buffers  | trivial-garbage weak table | SBCL weak hash table |
| poll, close, getpid, errno | CFFI            | sb-sys, sb-posix   |
| sendmsg / recvmsg     | CFFI            | sb-alien       |
| Float bits         | CFFI            | sb-kernel      |

On `clxcb/cffi` the C constants and layouts are written in for Linux, not
groveled, so no C compiler is needed. On other systems descriptor passing is
off, and a connection talks through its usocket stream
(single-threaded). Getting a usocket's descriptor is still per implementation:
SBCL, ECL and CCL are handled.

On `clxcb/sbcl`, sb-bsd-sockets cannot time out a connect, so `:timeout` bounds
only reads and writes.

An image holds only one path. Loading `clxcb/cffi` after `clxcb/sbcl` keeps the
SBCL path (the CFFI file is skipped), so libraries that depend on `clxcb` work
with it; loading `clxcb/sbcl` after `clxcb/cffi` signals an error.

---

## Threads

A connection is safe to use from several threads, following libxcb's design:
per-thread send buffers, one output queue written in serial order, one reader at
a time, 64-bit sequence numbers, and errors routed to the request that caused
them. The locks, their order and the invariants the I/O code keeps are described
in [threads.md](threads.md).

---

## Generated code

The files in `src/generated/` are written by
[clxcb-generator](../clxcb-generator) from the `xcbproto` XML
descriptions. Never edit them by hand: if something there is wrong, change the
generator and regenerate.

1. Clone the generator alongside this repository:
  ```bash
  git clone https://github.com/amno1/clxcb-generator.git ../clxcb-generator
  ```
2. Regenerate:
  ```bash
  make regenerate
  ```
  Set `XCBGEN_DIR` if the generator lives elsewhere.

Names follow the XML exactly, its spelling mistakes included:
`do-not-propogate-mask`, in CreateWindow, ChangeWindowAttributes and the
screensaver's SetAttributes, is [spelled as `do_not_propogate_mask` in
`xproto.xml`](https://github.com/ch11ng/xcb-proto/blob/master/src/xproto.xml#L1354-L1356).

A request with a value list (CreateWindow, ChangeGC, CreatePicture, ...) takes
the mask and the values it selects as keyword arguments, and checks that the two
agree before it writes anything: a bit set without its value, or a value given
without its bit, signals `value-mask-error`.

Each slot of a generated class is declared with the type of the values it holds:
an XID or typedef by its own type (`window`, `timestamp`, `keysym`), other
primitives by their range, a list as any sequence.  This documents the field,
and an implementation that checks slot types (CCL always, SBCL at `(safety 3)`)
refuses a wrong value when the object is made.

A list of a structure of 16-bit integers only (`point`, `rectangle`, `segment`,
`arc`) that has no count of its own -- `poly-line`, `poly-fill-rectangle`,
`poly-segment`, `poly-arc` and others -- may be given as one vector of integers,
the fields one after another (`#(x y width height x y ...)`). It is then written
with one tight loop, without making a structure per element, as libxcb takes a
plain array. `put-image` already writes an octet vector with one copy.

---

## Tests

The tests use SBCL's RT (`sb-rt`), Gray streams and sb-posix, so they run on
SBCL only for now. They run on whichever platform path is already loaded, and
load `clxcb/cffi` if none is:

```lisp
(asdf:test-system :clxcb/tests)     ; codecs, I/O, fd passing, XInput
(asdf:test-system :clxcb/thread-tests)  ; one connection, several threads

(ql:quickload :clxcb/sbcl)        ; first, to test the SBCL path
```

Tests that need an X server use `$DISPLAY` and skip themselves without one, as
do tests that need an extension the server lacks. A scratch Xephyr is
convenient, and with `-listen tcp` also tests TCP:

```bash
Xephyr :7 -screen 1024x768 -listen tcp &
DISPLAY=localhost:7 sbcl --eval '(asdf:test-system :clxcb/tests)'
```

Descriptor passing (DRI3, MIT-SHM's fd requests) needs a server with those
extensions; Xephyr has no DRI3.

`tests/benchmark-*.lisp` are standalone benchmarks, not part of any
test system.
