OM20 = omstd20.tex
PDF = $(OM20:%.tex=%.pdf)
HTML = $(OM20:%.tex=%.html)
SRC = $(shell ls *.tex *.rnc *.rng)

all: $(PDF) $(HTML) 

$(PDF): %.pdf: %.tex $(SRC)
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $

$(HTML): %.html: %.tex $(SRC)
	latexmlc --format=html5 --destination=%@ $<

