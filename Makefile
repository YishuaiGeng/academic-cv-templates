.PHONY: all pdf zh en examples preview clean distclean

all: examples

pdf zh en examples preview clean distclean:
	$(MAKE) -C latex $@
