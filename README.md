# pregnancy_metagenome
Analysis of shotgun metagenomic data from vaginal swabs of 35 pregnant women 

## Metadata
Reformat `./Tables_4_Ben.txt` (table from Daniela) and assess metadata
Save as `./shotgunMetadata.tsv`
Other metadata from manuscripts from `sampledata_VaginalSwabs_Pregnancy_DiGiulio2015.tsv` and `MAP_MANUSCRIPT_IL02-IL09_ToBen_20170404_fixed.txt`

## Filter Host
Filter host data with BBmap

## Methods Comparisons
Compare microbiome profiles from 16S amplicon sequencing analyzed by DADA2 to profiles from shotgun metagenome sequencing analyzed by both Metaphlan2 and Kracken2+Bracken

## Community profiling
Functional profiling of vaginal microbiomes using Humann2

## Gard mapping
Assign shortreads to clades of *Gardnerella vaginalis* using a set of 72 core genes from 72 *G. vaginalis* reference genomes. (Also tested strainphlan)
