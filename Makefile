TITLE=lpc19-scale-policy
PAPER=$(TITLE).pdf
SLIDES=$(TITLE)-slides.pdf
XDG_OPEN ?= xdg-open

all: $(PAPER) $(SLIDES)

$(PAPER):
	rm -f $(PAPER)
	$(MAKE) -C paper/
	mv paper/paper.pdf $(PAPER)

paper: $(PAPER)

$(SLIDES):
	rm -f $(SLIDES)
	$(MAKE) -C slides
	cp slides/slides.pdf $(SLIDES)

slides: $(SLIDES)

open-paper: $(PAPER)
	$(XDG_OPEN) $(PAPER)

open-slides: $(SLIDES)
	$(XDG_OPEN) $(SLIDES)

open: open-paper open-slides

clean:
	$(MAKE) -C paper clean
	$(MAKE) -C slides clean

.PHONY: all $(PAPER) paper $(SLIDES) slides open open-paper open-slides clean
