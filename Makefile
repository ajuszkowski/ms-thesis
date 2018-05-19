.PHONY: all once slides clean

TEXFILE=ms-thesis
OUTPUT=out

all:
	rm -f $(OUTPUT)/*
	pdflatex --output-directory=$(OUTPUT) $(TEXFILE).tex 
	biber $(TEXFILE) --output-directory=$(OUTPUT) --quiet 
	pdflatex --synctex=1 --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

once:
	pdflatex --synctex=1 --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

slides:
	rm -f slides/out/*
	pdflatex --output-directory=slides/out slides/slides.tex

clean:
	rm -f $(OUTPUT)/*

