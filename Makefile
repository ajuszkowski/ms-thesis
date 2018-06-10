.PHONY: all once clean

TEXFILE=ms-thesis
OUTPUT_ITMO=out/itmo
OUTPUT_AALTO=out/aalto

aalto: aalto-clean aalto-once aalto-biber aalto-once-2 aalto-once-3 #aalto-convert aalto-check
	# aalto: OK

aalto-clean:
	#rmdir --ignore-fail-on-non-empty $(OUTPUT_AALTO)
	rm -rvf $(OUTPUT_AALTO)/*
	mkdir -p $(OUTPUT_AALTO)
	# aalto-clean: OK

aalto-once aalto-once-2 aalto-once-3:
	pdflatex --output-directory=$(OUTPUT_AALTO) "\def\IsAalto{1} \input{$(TEXFILE)}"
	# aalto-once: OK

aalto-biber:
	biber $(TEXFILE) --output-directory=$(OUTPUT_AALTO) #--quiet
	# aalto-biber: OK

aalto-convert:
	gs -dPDFA=1 -dBATCH -dNOPAUSE -sProcessColorModel=DeviceRGB -sDEVICE=pdfwrite -sPDFACompatibilityPolicy=1 -sOutputFile=$(OUTPUT_AALTO)/$(TEXFILE)-converted.pdf $(OUTPUT_AALTO)/$(TEXFILE).pdf
	# aalto-convert: OK

aalto-check:
	pdfinfo $(OUTPUT_AALTO)/$(TEXFILE)-converted.pdf	
	# aalto-check: OK


itmo: itmo-clean itmo-once itmo-biber itmo-once-2 itmo-once-3
	# itmo: OK

itmo-clean:
	#rmdir --ignore-fail-on-non-empty $(OUTPUT_ITMO)
	rm -rvf $(OUTPUT_ITMO)/*
	mkdir -p $(OUTPUT_ITMO)
	# itmo-clean: OK

itmo-once itmo-once-2 itmo-once-3:
	pdflatex --output-directory=$(OUTPUT_ITMO) "\input{$(TEXFILE)}"
	# itmo-once: OK

itmo-biber:
	biber $(TEXFILE) --output-directory=$(OUTPUT_ITMO) #--quiet
	# itmo-biber: OK

