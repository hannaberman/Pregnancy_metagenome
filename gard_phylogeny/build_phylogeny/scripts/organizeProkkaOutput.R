#!/usr/bin/Rscript

library(tidyverse)

# Set path to directory with prokk outputs
prokkaPath <- "/Volumes/GoogleDrive/My\ Drive/Callahan\ Lab/metagenome_gardnerella/gardPhylogeny/prokka_annotated_genomes"

# Get list of outputs
strainDirs <- list.dirs(prokkaPath, full.names = TRUE, recursive = FALSE)

# Create a directory for each extension type
c("err", "faa", "ffn", "fna", "fsa", "gbk", "gff", "log", "sqn", "tbl", "tsv", "txt") %>%
    map(~dir.create(file.path(prokkaPath, .x)))

# rename files to organize by extension
strainDirs %>%
  map(~list.files(.x, full.names = FALSE, pattern = "\\.")) %>%
  map(~file.rename(file.path(prokkaPath, str_extract(.x, ".*(?=\\.err|\\.faa|\\.ffn|\\.fna|\\.fsa|\\.gbk|\\.gff|\\.log|\\.sqn|\\.tbl|\\.tsv|\\.txt)"), .x), 
                 file.path(prokkaPath, str_extract(.x, "err|faa|ffn|fna|fsa|gbk|gff|log|sqn|tbl|tsv|txt"), .x)))

# remove directories named for strains
strainDirs %>%
  map(~unlink(.x, recursive=TRUE))





