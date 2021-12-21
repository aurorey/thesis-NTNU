
all: thesis.pdf

.PHONY: clean

LATEX_FLAGS=-shell-escape -synctex=1
BIBER_FLAGS=

thesis.pdf:
	pdflatex $(LATEX_FLAGS) thesis
	biber $(BIBER_FLAGS) thesis
	makeglossaries thesis
	pdflatex $(LATEX_FLAGS) thesis
	pdflatex $(LATEX_FLAGS) thesis

clean:
	-@$(RM) \
		$(wildcard thesis-gnuplottex*) \
		$(addprefix thesis,.gnuploterrors .aux .bbl .bcf .blg .lof .log .lol .lot .out .pdf .run.xml .toc .acn .glo .ist .acr .alg .glg .gls .synctex.gz)