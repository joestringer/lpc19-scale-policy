TITLE=lpc19-scale-policy
PAPER=$(TITLE).pdf
SLIDES=$(TITLE)-slides.pdf

all: $(PAPER) $(SLIDES)

$(PAPER):
	$(MAKE) -C paper/
	mv paper/paper.pdf $(PAPER)

paper: $(PAPER)

$(SLIDES):
	$(MAKE) -C slides/
	rm -f $(SLIDES)
	mv slides/slides.pdf $(SLIDES)

slides:
	$(MAKE) $(SLIDES)

open-paper: $(PAPER)
	xdg-open $(PAPER)

open-slides: $(SLIDES)
	xdg-open $(SLIDES)

open: open-paper open-slides

clean:
	$(MAKE) -C paper clean
	$(MAKE) -C slides clean

.PHONY: all $(PAPER) paper $(SLIDES) slides open open-paper open-slides clean
