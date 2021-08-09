# pregnancy_metagenome
Analysis of shotgun metagenomic data from vaginal swabs of pregnant women 

##  metadata_files

### Stanford and UAB metadata
`metadata.Rmd`:  Reformat and organize `./Tables_4_Ben.txt` (table from Daniela). Save as `./sumgsDF.tsv`.
Other metadata from manuscripts from `sampledata_VaginalSwabs_Pregnancy_DiGiulio2015.tsv` and `MAP_MANUSCRIPT_IL02-IL09_ToBen_20170404_fixed.txt`

### HMP2 Metadata
`moms_pi_samples.Rmd`: Metadata from dbGaP and gestational age data from Greg Buck. Save as `hmp2mgsDF.tsv`

## filter_host
Filter host data with BBmap

## gard_phylogeny
Create a core genome phylogeny from whole-genome sequences of *Gardnerella* isolates from GenBank

## clade assignments
Assign shortreads to clades of *Gardnerella vaginalis* using a set of core genes from *G. vaginalis* reference genomes.

## Community Analyses
`metagenome_gardnerella.Rmd` -- > analyses of Gardnerella variants on community signatures of the vaginal microbiome

## community_profiling
Functional profiling of vaginal microbiomes using Humann2
