all:
	cd gmake/src && $(MAKE)
	cd gmake/test && $(MAKE)
	cd gmake/tools && $(MAKE)

clean:
	if [ -d gmake/src ]; then (cd gmake/src && $(MAKE) clean); fi
	if [ -d gmake/test ]; then (cd gmake/test && $(MAKE) clean); fi
	if [ -d gmake/tools ]; then (cd gmake/tools && $(MAKE) clean); fi
	rm -f *~

install: all
	cd gmake/src && $(MAKE) install
