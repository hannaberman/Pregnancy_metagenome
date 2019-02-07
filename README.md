# Pregnancy Metagenomics
Analysis of shotgun metagenomic data from vaginal swabs of 35 pregnant women 
Comparing Relative Abundance Assignment Methods:

**1)** 16S Amplicon --> DADA2
 **2)** shot gun metagenome --> metaphlan2
 **3)** shot gun metagenome --> Kraken2/Bracken


Steps for analyzing shotgun metagenome data uploaded by DGoltsman
1) Change filenames for easier  input using script: `./20181208_prepUploadReads_Metaphlan.R`

3)16S Data: Compile phyloseq objects from DiGiulio et al., 2015 and Callahan et al., 2017 
	a) Subset to only samples with shotgun data and create phyloseq objects: `./phyloseqObjects/16S_phyloseqObjects.Rmd`

4) Metaphlan2 analysis with shot gun metagenome data (paired end reads only)

	a) Run in metaphlan2 on cluster using scripts: `./brcScripts/metaphlanCommands_pe.sh`
	to call: `./brcScripts/metaphlan2_pe.sh`

	b) Use `merge_metaphlan_tables.py` helper script to make metaphlan output tables into one merged script

	c)make phyloseq object with: `./phyloseqObjecs/Metaphlan_phyloseqObjects.Rmd`

5) Kraken2 --> Bracken analysis with shot gun metagenome data
	a) Run Kraken2 on BRC cluster: `./brcScripts/kraken2Commands_pe.sh`
	to call: `./brcScripts/kraken2_pe.sh`
	b)pass to bracken `./brcScripts/brackenCommands_pe.sh` `./brcScripts/bracken_pe.sh`
	merge: `./brcScripts/bracken_merge_outs_pe.sh
	c)make PS object: `./phyloseqObjects/Bracken_phyloseqObjects.Rmd
 
 **Find phyloseq objects and tables for post processing in ./PS_RData**
 
6) Compare abundance methods: `./abundanceMethodsComparisons.Rmd`

7) ASSESS KRAKEN READS
	a) merge bracken outs to give read assignments made by Kraken2 `./brcScripts/bracken_merge_outs_krakenReads.sh`
	b) Assess results with: `./assessKraken/assessKrakenReads.Rmd`	
		
