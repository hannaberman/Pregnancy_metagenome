# pregnancy_metagenome
Analysis of shotgun metagenomic data from vaginal swabs of 35 pregnant women 

## Metadata
    Reformat `./Metadata_4_Hanna.csv' (table from Daniela) and assess metadata
    Save as `./shotgunMetadata.tsv'

## Filter Host
Filter host data with BBmap

## Methods Comparisons
Compare microbiome profiles from 16S amplicon sequencing analyzed by DADA2 to profiles from shotgun metagenome sequencing analyzed by both Metaphlan2 and Kracken2+Bracken

## Community profiling
Functional profiling of vaginal microbiomes using Humann2

## Gard mapping
Assign shortreads to clades of *Gardnerella vaginalis* using a set of 72 core genes from 72 *G. vaginalis* reference genomes. (Also tested strainphlan)