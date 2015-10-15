#!/usr/bin/make
# Created by Rüdiger Beck (jeffbeck-at-web.de)
DESTDIR=

SBIN=$(DESTDIR)/usr/sbin
BIN=$(DESTDIR)/usr/bin
SUDOERS=$(DESTDIR)/etc/sudoers.d
ETC=$(DESTDIR)/etc/linuxmuster-client-veracrypt


help:
	@echo ' '
	@echo 'Most common options of this Makefile:'
	@echo '-------------------------------------'
	@echo ' '
	@echo '   make help'
	@echo '      show this help'
	@echo ' '
	@echo '   make install'
	@echo '      install all stuff'
	@echo ' '
	@echo '   make deb'
	@echo '      create a debian package'
	@echo ' '


install:
	@echo '   * Installing sudoers stuff'
	@install -d -m0440 -oroot -groot $(SUDOERS)
	@install -oroot -groot --mode=0440 sudo/linuxmuster-client-veracrypt $(SUDOERS)
	@echo '   * Adding Scripts'
	@install -d -m0755 -oroot -groot $(SBIN)
	@install -oroot -groot --mode=0440 scripts/linuxmuster-client-veracrypt-installer $(SBIN)
	@install -d -m0755 -oroot -groot $(BIN)
	@install -m755 -oroot -groot scripts/linuxmuster-autoveracrypt $(BIN)
	@echo '   * Adding Config for host'
	@install -d -m0755 -oroot -groot $(ETC)
	@install -oroot -groot --mode=755 config/linuxmuster-client-veracrypt.conf  $(ETC)

# build a package
deb:
	### deb
	@echo 'Did you do a dch -i ?'
	#@sleep 8
	dpkg-buildpackage -tc -uc -us -sa -rfakeroot
	@echo ''
	@echo 'Do not forget to tag this version in git'
	@echo ''

clean:
	@echo ''
	@echo 'Cleaning up'
	@echo ''
