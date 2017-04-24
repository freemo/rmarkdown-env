all:
	./make-pdf.sh

clean:
	rm -f *.out
	rm -f *.aux
	rm -f *.toc
	rm -f *.log
	rm -f *.pdf
	rm -f *.tex
	rm -f *.dot
	rm -f *.mw
	rm -f *.bbl
	rm -f *.fls
	rm -f *.fdb_latexmk
