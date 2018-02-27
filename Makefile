TEXFILE=ms-thesis
OUTPUT=out

all:
	pdflatex --interaction=nonstopmode --output-directory=$(OUTPUT)  $(TEXFILE).tex
	biber $(TEXFILE) --output-directory=$(OUTPUT)

clean:
	rm -f {,$(OUTPUT)/}{*.bbl,*.aux,*.blg,*.log,*.bcf,*.out,*.toc,*.run,*.xml,*.pdf,*.synctex.gz}

