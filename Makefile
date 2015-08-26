SHELL := /bin/bash
PDFS :=
NEXT := $(shell date +'%Y-%m-%d')

all: pdf/all

.PHONY: clean
clean:
	find . -name '*~' -print -exec rm {} \;
	rm -rf pdf

define pdf_rule
	@mkdir -p $(dir $@)
	pdflatex -output-directory=$(dir $@) $<
	@rm $(@:pdf=aux) $(@:pdf=log)
endef

define pdf_next_rule
	@echo
	@echo PDFS += $(dir $@)$(NEXT).pdf
	@echo $(dir $@)$(NEXT).pdf: $(dir $<)$(NEXT).tex
	@echo '	$$(call pdf_rule)'
	@echo
	@mkdir -p $(dir $<)
	@if [ ! -e $(dir $<)$(NEXT).tex ]; \
	then cp base.tex $(dir $<)$(NEXT).tex; \
	echo 'Creating file from base'; \
	else touch $(dir $<)$(NEXT).tex; \
	echo 'Just touching file'; \
	fi
endef

.PHONY: pdf/cosc311/next cosc311/next
pdf/cosc311/next: cosc311/next
	$(call pdf_next_rule)

.PHONY: pdf/phy231/next phy231/next
pdf/phy231/next: phy231/next
	$(call pdf_next_rule)

.PHONY: pdf/ece313/next ece313/next
pdf/ece313/next: ece313/next
	$(call pdf_next_rule)

.PHONY: pdf/cosc370/next cosc370/next
pdf/cosc370/next: cosc370/next
	$(call pdf_next_rule)

PDFS += pdf/math231/2014-11-17.pdf
pdf/math231/2014-11-17.pdf: math231/2014-11-17.tex
	$(call pdf_rule)

PDFS += pdf/math231/2014-11-19.pdf
pdf/math231/2014-11-19.pdf: math231/2014-11-19.tex
	$(call pdf_rule)

PDFS += pdf/math231/2014-11-24.pdf
pdf/math231/2014-11-24.pdf: math231/2014-11-24.tex
	$(call pdf_rule)

PDFS += pdf/math231/2014-12-01.pdf
pdf/math231/2014-12-01.pdf: math231/2014-12-01.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-08-19.pdf
pdf/cosc311/2015-08-19.pdf: cosc311/2015-08-19.tex
	$(call pdf_rule)

PDFS += pdf/phy231/2015-08-19.pdf
pdf/phy231/2015-08-19.pdf: phy231/2015-08-19.tex
	$(call pdf_rule)

PDFS += pdf/cosc370/2015-08-20.pdf
pdf/cosc370/2015-08-20.pdf: cosc370/2015-08-20.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-1.pdf
pdf/ece313/Hobson_Homework-1.pdf: ece313/Hobson_Homework-1.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-08-21.pdf
pdf/cosc311/2015-08-21.pdf: cosc311/2015-08-21.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-08-21.pdf
pdf/ece313/2015-08-21.pdf: ece313/2015-08-21.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-08-26.pdf
pdf/cosc311/2015-08-26.pdf: cosc311/2015-08-26.tex
	$(call pdf_rule)

.PHONY: pdf/all
pdf/all: $(PDFS)
