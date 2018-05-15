TEXFILE=ms-thesis
OUTPUT=build

all:
	rm -f {,$(OUTPUT)/}{*.bbl,*.aux,*.blg,*.log,*.bcf,*.out,*.toc,*.run,*.xml,*.pdf,*.synctex.gz}
	pdflatex --output-directory=$(OUTPUT) $(TEXFILE).tex 
	biber $(TEXFILE) --output-directory=$(OUTPUT) --quiet 
	pdflatex --synctex=1 --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

once:
	pdflatex --synctex=1 --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

clean:
	rm -f $(OUTPUT)/*

