#!/bin/sh
for file in *.Rmd
do
 Rscript -e "library(rmarkdown); rmarkdown::render('$file', 'pdf_document')" 
done

pdflatex --shell-escape syncleus-white-example.tex

#for file in *.tex
#do
# pdflatex --shell-escape "$file" 
#done

