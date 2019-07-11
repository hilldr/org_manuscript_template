## compiling bioRxiv suitable PDF
# PDF export
BIORXIV=manuscript
biorxiv: $(BIORXIV).pdf
$(BIORXIV).pdf : \
	$(BIORXIV).tex \
	header.tex \
	report.txt \
	nihunsrt.bst \
	bibliography.bib
	pdflatex $(BIORXIV)
	pdflatex $(BIORXIV)
	bibtex $(BIORXIV)
	pdflatex $(BIORXIV)
	pdflatex $(BIORXIV)
	pdftk $(BIORXIV).pdf update_info report.txt output $(BIORXIV)_copy.pdf
	mv $(BIORXIV)_copy.pdf $(BIORXIV).pdf
