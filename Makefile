OM20 = omstd20.tex
PDF = $(OM20:%.tex=%.pdf)
HTML = $(OM20:%.tex=%.html)
SRC = $(shell ls *.tex *.rnc *.rng *.bib)
BIB = omstd.bib

all: $(HTML) $(PDF) 

$(PDF): %.pdf: %.tex $(SRC) Makefile
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

$(BIB).xml: $(BIB)
	latexmlc $< --bibtex --destination=$@ --log=$<.ltxlog

$(HTML): %.html: %.tex $(SRC) $(BIB).xml Makefile
	latexmlc --destination=$@ --log=$<.ltxlog $<

# my latexml runs into a segfault and deletes the html, so 
.PRECIOUS: $(HTML)





