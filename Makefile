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

clean:
	rm -f $(OUTPUT)/*

itmo:
	pdflatex --output-directory=out "\input{ms-thesis}"

aalto:
	pdflatex --output-directory=out "\def\IsAalto{1} \input{ms-thesis}"


final:
	rm -f $(OUTPUT)/*
	pdflatex --output-directory=$(OUTPUT) $(TEXFILE).tex 
	biber $(TEXFILE) --output-directory=$(OUTPUT) --quiet 
	pdflatex --synctex=1 --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
	pdflatex --synctex=1 --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
	pdflatex --synctex=1 --interaction=batchmode --output-directory=$(OUTPUT) $(TEXFILE).tex 
