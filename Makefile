# Makefile for tumbleweed-snapshot

INSTALL = install
COPY = cp

CONFIG = /etc
PREFIX = /usr
DIR = /share/tumbleweed-snapshot

all:
	@ echo "Nothing to compile. Use: install"


install:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)$(DIR)/
	$(INSTALL) .htaccess $(DESTDIR)$(PREFIX)$(DIR)/
	$(INSTALL) tumbleweed-snapshot $(DESTDIR)$(PREFIX)$(DIR)/

	$(INSTALL) -d $(DESTDIR)$(PREFIX)$(DIR)/rsync/
	$(COPY) -r rsync/ $(DESTDIR)$(PREFIX)$(DIR)/

	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin/
	ln -s $(PREFIX)$(DIR)/tumbleweed-snapshot $(DESTDIR)$(PREFIX)/bin/tumbleweed-snapshot

	$(INSTALL) -d $(DESTDIR)$(PREFIX)/lib/systemd/system/
	$(INSTALL) dist/tumbleweed-snapshot.service $(DESTDIR)$(PREFIX)/lib/systemd/system/
	$(INSTALL) dist/tumbleweed-snapshot.timer $(DESTDIR)$(PREFIX)/lib/systemd/system/

	$(INSTALL) -d $(DESTDIR)$(CONFIG)/
	$(INSTALL) dist/tumbleweed-snapshot.conf $(DESTDIR)$(CONFIG)/
