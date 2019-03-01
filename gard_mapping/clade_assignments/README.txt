Clade Assignments Read Me

1) Get reference genes `getRefGenes.Rmd` and save to `./ref_genes` directory
2)Perform alignments in bowtie scripts in `./brc_scripts` directory
	1) Build Bowtie2 database `./brc_scripts/buildBowtieDB.sh`
	2) Align short reads to reference gene database `./brc_scripts/bowtieAlign.sh`
	3) Filter out alignments with a mapq score <20 ./brc_scripts/filterAlns.sh`
3) Make Rdata file with bam format alignments `./getRefGenes.Rmd` > `./gardRefBamAlns.RData`
4)Assign and evaluate `./cladeAssignments.Rmd`