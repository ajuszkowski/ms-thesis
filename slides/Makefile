.PHONY: all clean

TEXFILE=slides
OUTPUT=out

all:
	rm -f $(OUTPUT)/*
	pdflatex --output-directory=$(OUTPUT) $(TEXFILE).tex 
	# OK

clean:
	rm -f $(OUTPUT)/*

