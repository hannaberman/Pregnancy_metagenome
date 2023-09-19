# Clade and Genomospecies Assignments

## Purpose
Determine clades and genomospecies of Gardnerella reads using a two step alingment process to filter and align reads. Input reads are bbmap filtered to remove human sequences. Input is paired bbmap filtered reads only. 

## Perform alignments
`./ref_genes` : directory of Gardnerella reference genes determined by `coreGenomeAndPhylogeny.Rmd`
Perform alignments for mapping using the following in `./scripts`:  
* `buildBowtieDB.sh` : for building Bowtie2 indexed database of Gardnerella reference genes
* `bowtieAlign.sh` : align short reads to Gardnerella databse with Bowtie2 v 2.1.0 and filter out reads with mapq score less than 20 (Samtools v1.9)
* `bowtieCmds.sh` : script to call bowtieAlign.sh for each sample
* `usearch.sh` : Use USEARCH v11.0.667_i86linux32 to perform global alignments of Gardnerella reads from Bowtie2 output to Gardnerella database with  to bin reads to clades 
* `usearchCmds.sh` : for calling usearch.sh script for each sample

## Analysis
1) `cladeAssignments.Rmd` create clade assignments in Stanford and UAB cohorts based on alignment results
2) `hmp2mgsCladeAssignments.Rmd` create clade assignments in MOMS-PI cohort based on alignment results
3) `compareMetaphlanMapping.html` compare core genome Gardnerella mapping method to MetaPhlAn2 results

## Additional Files
* `alns.Rdata` Usearch alignments for Stanford and UAB cohorts
* `hmp2mgsAlns.Rdata` Usearch alignments for MOMS-PI cohort
* `cladeAlignmentsFinal.tsv` clade abundances in Stanford and UAB cohorts
* `genomospeciesAlignmentsFinal.tsv` genomospecies abundances in Stanford and UAB cohorts
* `hmp2cladeAlignmentsFinal.tsv` clade abundances in MOMS-PI cohort
* `hmp2genomospeciesAlignmentsFinal.tsv` genomospecies abundances in MOMS-PI cohort
