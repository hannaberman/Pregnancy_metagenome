Comparing Relative Abundance Assignment Methods:
	1)16S
	2)shot gun metagenome --> metaphlan2
	3)shot gun metagenome --> Kraken2/Bracken


Steps for analyzing shotgun metagenome data uploaded by DGoltsman

1) Copy from DGoltsman folder to hlberman folder in BRC cluster:
	Current path: /home/hlberman/VMMG/reads/upload

2) Change filenames for easier metaphlan2 input using script:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/20181208_prepUploadReads_Metaphlan.R

3)16S Data: Compile phyloseq objects from DiGiulio et al., 2015 and Callahan et al., 2017 
	a) create PS objects in:
	Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/phyloseqObjectScripts/16S_phyloseqObjects.Rmd
	b) save to:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/PS_RData/	

4) Metaphlan2 analysis with shot gun metagenome data (paired end reads only)

	a) Run in metaphlan2 on cluster using scripts:
	/home/hlberman/VMMG/scripts/metaphlanCommands_pe.sh
	to call:
	/home/hlberman/VMMG/scripts/metaphlan2_pe.sh

	b) Use /metaphlan2/utils/merge_metaphlan_tables.py helper script to make metaphlan output tables into one merged script
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/20180109_mergeMetaphlanpeTables.sh

	c)make phyloseq object with:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/phyloseqObjectScripts/Metaphlan_phyloseqObjects.Rmd
	save PS objects to:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/PS_RData/metaphlan_PS.RData

5) Kraken2 --> Bracken analysis with shot gun metagenome data
	a) Run Kraken2 on BRC cluster:
	/home/hlberman/VMMG/scripts/kraken2Commands_pe.sh
	to call:
	/home/hlberman/VMMG/scripts/kraken2_pe.sh
	b)pass to bracken
	/home/hlberman/VMMG/scripts/brackenCommands_pe.sh
	/home/hlberman/VMMG/scripts/bracken_pe.sh 
	merge:
	bracken_merge_outs_pe.sh
	c)make PS object:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/phyloseqObjectScripts/Bracken_phyloseqObjects.Rmd
	save PS objects to:
	/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/PS_RData/bracken_PS.RData
	

6) Compare abundance methods:
	

7) ASSESS KRAKEN READS
	a) merge bracken outs to give read assignments made by Kraken2
	/home/hlberman/VMMG/scripts/bracken_merge_outs_krakenReads.sh
	b) Assess results with:
	Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/abundanceMethodsComparisons/assessKraken/assessKrakenReads.Rmd	
		
