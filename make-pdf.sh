#!/bin/sh
for file in *.Rmd
do
 # do something on $file
 Rscript -e "library(rmarkdown); rmarkdown::render('$file', 'pdf_document')" 
done
