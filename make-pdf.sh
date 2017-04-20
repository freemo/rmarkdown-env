#!/bin/sh
for file in *.Rmd
do
 Rscript -e "library(rmarkdown); rmarkdown::render('$file', 'pdf_document')" 
done

for file in *.tex
do
 pdflatex --shell-escape "$file" 
done

