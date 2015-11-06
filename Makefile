SHELL := /bin/bash
PDFS :=
NEXT := $(shell date +'%Y-%m-%d')

all: pdf/all index.org

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

.PHONY: index.org
index.org: pdf/all
	@find pdf | \
	sed \
	-e 'h' \
	-e 's/[^\/*]*\//*/g' \
	-e 's/\**/*&/' \
	-e 's/[^*][^*]*/ /' \
	-e 'x' \
	-e '/.pdf/ { x; s/.*//; x; s/.*/#+BEGIN_HTML\n<iframe src="&" width="100%" height="800px"><\/iframe>\n#+END_HTML\n/; }' \
	-e 'H' \
	-e 'x' \
	-e 's/\n//' > $@

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

PDFS += pdf/ece313/2015-08-26.pdf
pdf/ece313/2015-08-26.pdf: ece313/2015-08-26.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-08-28.pdf
pdf/cosc311/2015-08-28.pdf: cosc311/2015-08-28.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-08-28.pdf
pdf/ece313/2015-08-28.pdf: ece313/2015-08-28.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-2.pdf
pdf/ece313/Hobson_Homework-2.pdf: ece313/Hobson_Homework-2.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-08-31.pdf
pdf/cosc311/2015-08-31.pdf: cosc311/2015-08-31.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-08-31.pdf
pdf/ece313/2015-08-31.pdf: ece313/2015-08-31.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-02.pdf
pdf/cosc311/2015-09-02.pdf: cosc311/2015-09-02.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-02.pdf
pdf/ece313/2015-09-02.pdf: ece313/2015-09-02.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-04.pdf
pdf/cosc311/2015-09-04.pdf: cosc311/2015-09-04.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-09.pdf
pdf/cosc311/2015-09-09.pdf: cosc311/2015-09-09.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-09.pdf
pdf/ece313/2015-09-09.pdf: ece313/2015-09-09.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_3.pdf
pdf/cosc311/homework_3.pdf: cosc311/homework_3.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-11.pdf
pdf/cosc311/2015-09-11.pdf: cosc311/2015-09-11.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-11.pdf
pdf/ece313/2015-09-11.pdf: ece313/2015-09-11.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-14.pdf
pdf/cosc311/2015-09-14.pdf: cosc311/2015-09-14.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-14.pdf
pdf/ece313/2015-09-14.pdf: ece313/2015-09-14.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_4.pdf
pdf/cosc311/homework_4.pdf: cosc311/homework_4.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-16.pdf
pdf/ece313/2015-09-16.pdf: ece313/2015-09-16.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-21.pdf
pdf/cosc311/2015-09-21.pdf: cosc311/2015-09-21.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-21.pdf
pdf/ece313/2015-09-21.pdf: ece313/2015-09-21.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-23.pdf
pdf/ece313/2015-09-23.pdf: ece313/2015-09-23.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-25.pdf
pdf/ece313/2015-09-25.pdf: ece313/2015-09-25.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-3.pdf
pdf/ece313/Hobson_Homework-3.pdf: ece313/Hobson_Homework-3.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-28.pdf
pdf/ece313/2015-09-28.pdf: ece313/2015-09-28.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_5.pdf
pdf/cosc311/homework_5.pdf: cosc311/homework_5.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-09-30.pdf
pdf/cosc311/2015-09-30.pdf: cosc311/2015-09-30.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-09-30.pdf
pdf/ece313/2015-09-30.pdf: ece313/2015-09-30.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-02.pdf
pdf/ece313/2015-10-02.pdf: ece313/2015-10-02.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-10-05.pdf
pdf/cosc311/2015-10-05.pdf: cosc311/2015-10-05.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_6.pdf
pdf/cosc311/homework_6.pdf: cosc311/homework_6.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-09.pdf
pdf/ece313/2015-10-09.pdf: ece313/2015-10-09.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-10-14.pdf
pdf/cosc311/2015-10-14.pdf: cosc311/2015-10-14.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/2015-10-19.pdf
pdf/cosc311/2015-10-19.pdf: cosc311/2015-10-19.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-4.pdf
pdf/ece313/Hobson_Homework-4.pdf: ece313/Hobson_Homework-4.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-19.pdf
pdf/ece313/2015-10-19.pdf: ece313/2015-10-19.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-21.pdf
pdf/ece313/2015-10-21.pdf: ece313/2015-10-21.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_7.pdf
pdf/cosc311/homework_7.pdf: cosc311/homework_7.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-23.pdf
pdf/ece313/2015-10-23.pdf: ece313/2015-10-23.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-5.pdf
pdf/ece313/Hobson_Homework-5.pdf: ece313/Hobson_Homework-5.tex
	$(call pdf_rule)

PDFS += pdf/ece313/2015-10-26.pdf
pdf/ece313/2015-10-26.pdf: ece313/2015-10-26.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_8.pdf
pdf/cosc311/homework_8.pdf: cosc311/homework_8.tex
	$(call pdf_rule)

PDFS += pdf/ece313/Hobson_Homework-6.pdf
pdf/ece313/Hobson_Homework-6.pdf: ece313/Hobson_Homework-6.tex
	$(call pdf_rule)

PDFS += pdf/cosc311/homework_9.pdf
pdf/cosc311/homework_9.pdf: cosc311/homework_9.tex
	$(call pdf_rule)

.PHONY: pdf/all
pdf/all: $(PDFS)
