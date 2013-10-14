# Makefile
#
# Makefile para o modelo de fichamentografia em LaTeX da UECE
#
# Autor: Rudy Matela
# Data: 20081207


# Variables

filename=fichamento
FIGS=#fig/graph.pdf fig/watermark.pdf fig/diagram.pdf fig/euler.pdf


# Includes

include imagerules.mk


# Recipe!

all: $(filename).pdf

$(filename).pdf: $(filename).tex bib.bib $(FIGS)
	pdflatex $(filename).tex
	bibtex $(filename)
	pdflatex $(filename).tex
.PHONY: figs
figs: $(FIGS)

# Cleanup recipe!

.PHONY: clean cleanfigs
clean:
	rm -f *~ *.aux *.bbl *.blg *.log *.toc *.lof *.lot *.lsg *.lsb
	rm -f *.pdf
	${MAKE} -C fig clean

cleanfigs:
	rm -f $(FIGS)

