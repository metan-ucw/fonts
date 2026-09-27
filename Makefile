SOURCES=$(wildcard *.bdf)
FONTS=$(SOURCES:.bdf=.pcf)

all: $(FONTS)

$(FONTS): %.pcf: %.bdf
	bdftopcf $< > $@

gfxprim.bdf: gfxprim/*
	gpforge-cli bdf gfxprim/ regular > gfxprim.bdf

clean:
	rm -f $(FONTS)

install: $(FONTS)
	install -d -m 775 $(DESTDIR)/usr/share/fonts/haxor/
	install -m 644 $(FONTS) fonts.dir $(DESTDIR)/usr/share/fonts/haxor/
