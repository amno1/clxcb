# Makefile for clxcb (core runtime + generated bindings).
# Copyright (C) 2026  Arthur Miller <arthur.miller@live.com>
# SPDX-License-Identifier: MIT
# See the LICENSE file for the full license text.
#
#   make load          load clxcb/all: every extension (sanity check)
#   make core          load clxcb only, without extensions
#   make regenerate    regenerate src/generated/ with ../clxcb-generator
#   make clean         remove fasls
#   make distclean     clean + remove src/generated/

LISP       := sbcl
LISPFLAGS  := --noinform --no-userinit --non-interactive

# Only used by `make regenerate`; override on the command line if your
# checkouts live elsewhere.
XCBGEN_DIR    ?= ../clxcb-generator
# clXau, which clxcb uses for Xauthority lookup.
CLXAU_DIR     ?= ../clXau
GENERATED_DIR := src/generated

LISP_BOOT := \
    --eval '(require :asdf)' \
    --eval '(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))' \
    --eval '(asdf:load-asd (truename "$(CLXAU_DIR)/clxau.asd"))' \
    --eval '(asdf:load-asd (merge-pathnames "clxcb.asd" (uiop:getcwd)))'

.PHONY: all load core regenerate clean distclean help

all: load

load:
	$(LISP) $(LISPFLAGS) $(LISP_BOOT) \
	    --eval '(handler-case (asdf:load-system "clxcb/all") (error (e) (format *error-output* "~&ERROR: ~A~%" e) (sb-ext:exit :code 1)))'

core:
	$(LISP) $(LISPFLAGS) $(LISP_BOOT) \
	    --eval '(asdf:load-system "clxcb")'

# Developer-only: needs ../clxcb-generator to be checked out.
regenerate:
	@test -d "$(XCBGEN_DIR)"  || (echo "missing $(XCBGEN_DIR)";  exit 1)
	$(MAKE) -C $(XCBGEN_DIR) generate-all \
	    OUTPUT_DIR=$(CURDIR)/$(GENERATED_DIR)

clean:
	rm -f src/*.fasl $(GENERATED_DIR)/*.fasl

distclean: clean
	rm -rf $(GENERATED_DIR)

help:
	@echo "clxcb"
	@echo ""
	@echo "  make load         load clxcb/all, every extension"
	@echo "  make core         load clxcb only, without extensions"
	@echo "  make regenerate   regenerate src/generated/ (needs ../clxcb-generator)"
	@echo "  make clean        remove fasls"
	@echo "  make distclean    clean + remove src/generated/"
