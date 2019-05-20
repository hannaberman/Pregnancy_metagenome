# Profiling samples with Humann2 
Author: HLB
Date: 2019-05-07

1) Concatenate paired reads and send to Humann2 software `./scripts/humann2.sh`
2) Merge and normalize tables with `./scripts/humann2PostProcessing.sh`
3) Add names back to gene families  with `./scripts/humann2AddGfNames.sh`
4) Add pathways to gene families table with `./humann2unpackPathways.sh`
5) Merge metaphlan output tables with `./scripts/mergedMetaphlanAbundance.tsv`
6) Use output from Humann2 to assess the gene families, pathway abundance, and pathway coverage, assigned to *Gardnerella vaginalis* across samples with   `./gardnerellaGeneContent.Rmd`
