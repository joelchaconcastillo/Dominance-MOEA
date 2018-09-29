all:
	latex chacon-ieeetec-17.tex
	bibtex chacon-ieeetec-17
	latex chacon-ieeetec-17.tex
	latex chacon-ieeetec-17.tex
	dvips -o chacon-ieeetec-17.ps chacon-ieeetec-17.dvi
	ps2pdf -sPAPERSIZE=letter -DMaxSubsetPct=100 -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true chacon-ieeetec-17.ps chacon-ieeetec-17.pdf
clean:
	rm -f *.log *.dvi *.aux *.bbl *.blg *~
	
cleanall:
	rm -f *.log *.dvi *.aux *.bbl *.blg *~ chacon-ieeetec-17.pdf *.ps 
