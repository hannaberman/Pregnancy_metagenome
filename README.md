# pregnancy_metagenome
Analysis of shotgun metagenomic data from vaginal swabs of pregnant women 

##  metadata_files
Reformat `./Tables_4_Ben.txt` (table from Daniela) and assess metadata
Save as `./shotgunMetadata.tsv`
Other metadata from manuscripts from `sampledata_VaginalSwabs_Pregnancy_DiGiulio2015.tsv` and `MAP_MANUSCRIPT_IL02-IL09_ToBen_20170404_fixed.txt`

## filter_host
Filter host data with BBmap

## methods_comparisons
Compare microbiome profiles from 16S amplicon sequencing analyzed by DADA2 to profiles from shotgun metagenome sequencing analyzed by both Metaphlan2 and Kracken2+Bracken

## community_profiling
Functional profiling of vaginal microbiomes using Humann2

## gard_phylogeny
Create a core genome phylogeny from whole-genome sequences of *Gardnerella* isolates from GenBank

## clade assignments
Assign shortreads to clades of *Gardnerella vaginalis* using a set of core genes from *G. vaginalis* reference genomes.


metagenome_gardnerella.Rmd -- > analyses of Gardnerella variants on community signatures of the vaginal microbiome
