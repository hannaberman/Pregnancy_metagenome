# pregnancy_metagenome
"*Gardnerella* Diversity and Ecology in Pregnancy and Preterm Birth"
Analysis of *Gardnerella* clades and species using shotgun metagenomic sequencing data from vaginal swabs of pregnant women 

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

## clade_assignments
Assign shortreads to clades of *Gardnerella * using a set of core genes from *Gardnerella* reference genomes.

## metaphlan
Measure presence and abundance of vaginal microbiome taxa

## community and preterm birth analyses
`metagenome_gardnerella.Rmd`: analyses of Gardnerella clades and genomospecies on community signatures of the vaginal microbiome and preterm birth

## rarefied_gard_counts
Rarefy to common read depth of 100,000 microbial reads and then classify *Gardnerella* clades and genomospecies
  
## gardnerella_asv_studies
Survey V4 16s rRNA gene amplicon sequencing data from previous studies of the vaginal microbiome and preterm birth for *Gardnerella* ASVs.

## knit_html_markdowns
Knit markdowns with all analyses producing figures.
