Clade Assignments Read Me
10/03/2019, updated 04/30/2020

Purpose: Determine clades of Gardnerella reads using a two step alingment process to filter and align reads. Input reads are bbmap filtered to remove human sequences. Input is paired bbmap filtered reads only. 

Contents:
1) `./ref_genes` directory of Gardnerella reference genes determined by `./getRefGenes.Rmd`
2) `./scripts` : 
	a) scripts > buildBowtieDB.sh : for building Bowtie2 indexed database of Gardnerella reference genes
	b) scripts > bowtieAlign.sh : align short reads to Gardnerella databse with Bowtie2
	c) scripts > bowtieCmds.sh : script to call bowtieAlign.sh for each sample
	d) scripts > filterAlns.sh : for filtering alignments with mapq score less than  and convert bam files to fastq
	e) scripts > filterCmds.sh : for calling filterAlns.sh script for each sample
	f) scripts > usearch.sh : align Gardnerella reads from Bowtie2 output to Gardnerella database to bin reads to clades
	g) scripts > usearchCmds.sh : for calling usearch.sh script for each sample

Steps CLADE ASSIGNMENTS/READ BINNING:
FIRST PASS: pre-bbmap-filtered reads (Ran in February/March 2019)
1) Get reference genes `getRefGenes.Rmd` and save to `./ref_genes` directory
2)Perform alignments in bowtie scripts in `./scripts` directory
	1) Build Bowtie2 database `./scripts/buildBowtieDB.sh`
	2) Align short reads to reference gene database `./scripts/bowtieAlign.sh`
	3) Filter out alignments with a mapq score <20 ./scripts/filterAlns.sh`
	4) Filter out alignments with a mapq score <42 ./scripts/filterAlns42.sh`
	5) Convert bam files to fastq with `./scripts/bam2fastq`	
3) Perform second mapping with search `./brc_scripts/usearch20.sh` on mapq 20 filtered fastq reads
	merge pairs and then concatenate singles from bowtie filtering. 

SECOND PASS: bbmap-filtered reads (Ran in October 2019)
1) Align shotgun metagenomic reads to Gardnerella reference databse for the purpose of filtering out non-Gardnerella reads with Bowtie2 v 2.1.0 `./scripts/bowtieAlign.sh`. Use `./scripts/bowtieCmds.sh` to send command for each sample to the cluster and filter out reads with mapq score less than 20 (Samtools v1.9)
2) Perform global alignments with USEARCH v11.0.667_i86linux32

Contents: Analysis
1) `./compareFiltering.Rmd`: for comparing mapq 20 vs mapq 40 filtering results. (not used in second pass)
2) `./cladeAssignments.Rmd` : to assign reads to clades. Outputs: `./aglingmentsFinal.tsv` and `gardRelativeAbundance.tsv`
3) `./shotgunVs16Svariants.Rmd`: compare shotgun G. vaginalis classification with 16S amplicon. Also assess mismatches with MetaPhlan2 analyses
4) `./explotatoryAnalyses.Rmd`: explore proportions of G. vaginalis and other key taxa. Output: `./metaphlanAbundances.Rdata` with dataframes of abundances of all taxa and G. vaginalis (including clades)
5) `./rebaccaAnalyses.Rmd` : testing the use of REBACCA for co-occurrence analyses. Functions in `./REBACCA_FUNCTIONS.R`
6) `./cooccurAnalyses.Rmd` : testing cooccur method which uses a hypergeometric distribution to assess the probability of taxon-taxon co-occurrence (Veech 2013 and Griffith et al., 2016)
7) `./cooccurAnalyses_threshold.Rmd`: test adding a threshold to the co-occurrence analyses.
8) `./absoluteAbundanceTesting.Rmd`: Look at using absolute abundances (normalize 


Other files: 
`cladeAssignmentsBBmapUsearch.Rmd`: test results substituting BBmap for Bowtie2 (stick with Bowtie2). 
``
Notes:
May 2020: 
-Add labels and items on figures for samples with Gardnerella that is uncharacterized
-Coefficients of correlation measureas
