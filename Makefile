##
## Toplevel Makefile for all Makefiles
##

all: dev_$(DEV_ARCH)

list: dev_
help: dev_
dev_::
	@echo "You must specify one of the following or set the environment variable"
	@echo "[DEV_ARCH] to one of the following:"
	@echo "  linux -- x86 running Linux with correct libs installed"
	@echo "  osx -- Mac OSX 10.15+ with xcode"
	@echo "  solaris9 -- Solaris 9 with correct libs instatlled"
	@echo " "
	@echo "  clean -- Clean all files"

linux:
	cd libhtmlw && $(MAKE) DEV_ARCH=linux
	cd libwww && $(MAKE) DEV_ARCH=linux
	cd src && $(MAKE) DEV_ARCH=linux

osx:
	cd libwww && $(MAKE) DEV_ARCH=osx
	cd libhtmlw && $(MAKE) DEV_ARCH=osx
	cd src && $(MAKE) DEV_ARCH=osx

solaris9:
	cd libwww && $(MAKE) DEV_ARCH=solaris9
	cd libhtmlw && $(MAKE) DEV_ARCH=solaris9
	cd src && $(MAKE) DEV_ARCH=solaris9

clean:
	cd libhtmlw; $(MAKE) clean
	cd libwww; $(MAKE) clean
	cd src; $(MAKE) clean MOSAIC="Mosaic"
	@echo "Done cleaning..."
