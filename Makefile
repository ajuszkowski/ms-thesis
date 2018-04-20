TEXFILE=ms-thesis
OUTPUT=build

all:
	pdflatex --output-directory=$(OUTPUT) $(TEXFILE).tex 
	biber $(TEXFILE) --output-directory=$(OUTPUT) --quiet 
	pdflatex --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

clean:
	rm -f {,$(OUTPUT)/}{*.bbl,*.aux,*.blg,*.log,*.bcf,*.out,*.toc,*.run,*.xml,*.pdf,*.synctex.gz}

