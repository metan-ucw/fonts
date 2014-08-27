SOURCES=$(wildcard *.bdf)
FONTS=$(SOURCES:.bdf=.pcf)

all: $(FONTS)

$(FONTS): %.pcf: %.bdf
	bdftopcf $< > $@

clean:
	rm -f $(FONTS)

install:
	install -d -m 775 $(DESTDIR)/usr/share/fonts/haxor/
	install -m 644 $(FONTS) fonts.dir $(DESTDIR)/usr/share/fonts/haxor/
