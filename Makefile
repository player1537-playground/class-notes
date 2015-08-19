SHELL := /bin/bash
PDFS :=
NEXT := $(shell date +'%Y-%m-%d')

all: pdf/all

define pdf_rule
	@mkdir -p $(dir $@)
	pdflatex -output-directory=$(dir $@) $<
	@rm $(@:pdf=aux) $(@:pdf=log)
endef

.PHONY: pdf/cosc311/next cosc311/next
pdf/cosc311/next: cosc311/next
	@echo
	@echo PDFS += $(dir $<)$(NEXT).pdf
	@echo $(dir $@)$(NEXT).pdf: $(dir $<)$(NEXT).tex
	@echo '	$$(call pdf_rule)'
	@echo
	touch $(dir $<)$(NEXT).tex

.PHONY: pdf/phy231/next phy231/next
pdf/phy231/next: phy231/next
	@echo
	@echo PDFS += $(dir $<)$(NEXT).pdf
	@echo $(dir $@)$(NEXT).pdf: $(dir $<)$(NEXT).tex
	@echo '	$$(call pdf_rule)'
	@echo
	@if [ ! -e $(dir $<)$(NEXT).tex ]; \
	then cp base.tex $(dir $<)$(NEXT).tex; \
	echo 'Creating file from base'; \
	else touch $(dir $<)$(NEXT).tex; \
	echo 'Just touching file'; \
	fi

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
