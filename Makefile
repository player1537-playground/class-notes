SHELL := /bin/bash

PDFS :=

all: pdf/all

define pdf_rule
	@mkdir -p $(dir $@)
	pdflatex -output-directory=$(dir $@) $<
	@rm $(@:pdf=aux) $(@:pdf=log)
endef

PDFS += pdf/cosc311/2015-08-19.pdf
pdf/cosc311/2015-08-19.pdf: cosc311/2015-08-19.tex
	$(call pdf_rule)

PDFS += pdf/phy231/2015-08-19.pdf
pdf/phy231/2015-08-19.pdf: phy231/2015-08-19.tex
	$(call pdf_rule)

.PHONY: pdf/all
pdf/all: $(PDFS)

.PHONY: clean
clean:
	find . -name '*~' -print -exec rm {} \;
