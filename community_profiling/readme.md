# Profiling samples with Humann2 
Author: HLB
updated: 2019-10-23


I) HUMANN2
Contents: 
1) `./scripts`
	a) scripts > humann2.sh : main script to run humann2
	b) scripts > humann2Commands.sh : send 1)a) commands to cluster
	c) scripts > humann2PostProcessing :  merge tables

Steps:
1) Concatenate paired reads and send to Humann2 software `./scripts/humann2.sh` (send commands with `./scripts/humann2_commands.sh`)
2) Merge and add information with `./scripts/humann2PostProcessing.sh`
3) Use output from Humann2 to assess the gene families, pathway abundance, and pathway coverage, assigned to *Gardnerella vaginalis* across samples with:
   `./gardnerellaGeneContent.Rmd`
   `./gardnerellaCladeGeneContent.Rmd` testing methods to test genes associated with specific clades
   `./gardnerellaGeneDeconvolution/.Rmd` - `./gardnerellaGeneDeconSim.Rmd` testing this method from Carr et al., 2013
   `./vagitypeAnalyses.Rmd` - testing use of vagitypes (dominant taxon over 30%)
   `./gardnerellaGeneContentPTB.Rmd` - genes associated with PTB
   `./metadataAndDescriptives.Rmd` - general assessment of Humann2 outputs

Notes: 
Humann2 was run in April 2019 with paired output of uploaded reads and re-run in October 2019 with paired output of bbmap filtered reads (reads have been filtered with both bowtie2 and bbmap).



