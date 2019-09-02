TITLE=slides

GENERATED_EXTS= .aux .log .nav .out .snm .toc
SVG_DIR := svg-inkscape
SVGS := $(shell grep "^[^%]*{[^}]*.svg}" $(TITLE).tex | sed 's/[^{]*{\([^}]*svg\)}/\1/')

all: slides

$(SVG_DIR)/%_svg-tex.pdf: %.svg
	@# Dummy target to ensure that modified SVGs are cleaned/rebuilt
	rm -f $@ $@_tex

slides: $(TITLE).tex $(SVGS)
	pdflatex --shell-escape $(TITLE).tex

clean:
	rm -f $(foreach s,${GENERATED_EXTS},${TITLE}${s})
	rm -rf svg-inkscape

.PHONY: clean
