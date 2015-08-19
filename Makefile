pdf/%.pdf: %.tex
	@mkdir -p $(dir $@)
	pdflatex -output-directory=$(dir $@) $<
	@rm $(@:pdf=aux)
	@rm $(@:pdf=log)
