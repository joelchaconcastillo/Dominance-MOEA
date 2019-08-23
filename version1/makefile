all:
	pdflatex chacon-ieeetec-19.tex
	bibtex chacon-ieeetec-19
	pdflatex chacon-ieeetec-19.tex
	pdflatex chacon-ieeetec-19.tex
#	dvips -o chacon-ieeetec-19.ps chacon-ieeetec-19.dvi
#	ps2pdf -sPAPERSIZE=letter -DMaxSubsetPct=100 -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true chacon-ieeetec-19.ps chacon-ieeetec-19.pdf
clean:
	rm -f *.log *.dvi *.aux *.bbl *.blg *~
	
cleanall:
	rm -f *.log *.dvi *.aux *.bbl *.blg *~ chacon-ieeetec-19.pdf *.ps 
