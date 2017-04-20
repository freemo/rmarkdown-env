#!/bin/sh
Rscript -e 'library(rmarkdown); rmarkdown::render("./probabilities.Rmd", "pdf_document")' 
