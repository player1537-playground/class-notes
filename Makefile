.phony: PDF
PDF: pdf/17-11-2014.pdf

pdf/%.pdf: %.tex
	@mkdir -p $(dir $@)
	pdflatex -output-directory=$(dir $@) $<
	@rm $(dir $@)/$(<:tex=aux)
	@rm $(dir $@)/$(<:tex=log)
