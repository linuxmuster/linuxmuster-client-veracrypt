#!/usr/bin/make
# Created by Rüdiger Beck (jeffbeck-at-web.de)
DESTDIR=

SBIN=$(DESTDIR)/usr/sbin
ETC=$(DESTDIR)/etc/sudoers.d

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
	@install -d -m0440 -oroot -groot $(ETC)
	@install -oroot -groot --mode=0440 sudo/linuxmuster-client-veracrypt $(ETC)
	@echo '   * Adding Icon'
	@install -d -m0755 -oroot -groot $(SBIN)
	@install -oroot -groot --mode=0440 scripts/linuxmuster-client-veracrypt-installer $(SBIN)


# build a package
deb:
	### deb
	@echo 'Did you do a dch -i ?'
	#@sleep 8
	dpkg-buildpackage -tc -uc -us -sa -rfakeroot
	@echo ''
	@echo 'Do not forget to tag this version in git'
	@echo ''

