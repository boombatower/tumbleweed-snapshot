# Makefile for tumbleweed-snapshot

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

CONFIG = /etc
PREFIX = /usr

all:
	@ echo "Nothing to compile. Use: install"


install:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL_PROGRAM) tumbleweed-snapshot $(DESTDIR)$(PREFIX)/bin/

	$(INSTALL) -d $(DESTDIR)$(PREFIX)/lib/systemd/system/
	$(INSTALL) dist/tumbleweed-snapshot.service $(DESTDIR)$(PREFIX)/lib/systemd/system/

	$(INSTALL) -d $(DESTDIR)$(CONFIG)/
	$(INSTALL) dist/tumbleweed-snapshot.conf $(DESTDIR)$(CONFIG)/
