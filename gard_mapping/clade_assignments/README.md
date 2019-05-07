ASSIGN GARDNERELLA SHORT READS TO CLADES

1) Get reference genes `getRefGenes.Rmd` and save to `./ref_genes` directory
2)Perform alignments in bowtie scripts in `./brc_scripts` directory
	1) Build Bowtie2 database `./brc_scripts/buildBowtieDB.sh`
	2) Align short reads to reference gene database `./brc_scripts/bowtieAlign.sh`
	3) Filter out alignments with a mapq score <20 `./brc_scripts/filterAlns.sh`
	4) Filter out alignments with a mapq score <42 `./brc_scripts/filterAlns42.sh`
	5) Convert bam files to fastq with `./brc_scripts/bam2fastq`	
3) Make Rdata file with bam format alignments `./getRefGenes.Rmd` > `./gardRefBamAlns.RData` **as of now not used**
4) Evaluate with `./compareFiltering.Rmd`
5) Perform second mapping with search `./brc_scripts/usearch20.sh` on mapq 20 filtered fastq reads
	merge pairs and then concatenate singles from bowtie filtering. 
6) assess with `./cladeAssignments.Rmd`
7) compare these assignments to 16S amplicon variants in `./16S_variants.Rmd`
8) Preliminary assessments with `./exploratoryAnalyses.Rmd`
