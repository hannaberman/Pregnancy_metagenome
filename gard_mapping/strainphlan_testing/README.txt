TESTING STRAINPHLAN
Author: HLB
Date: 2/16/2019

Testing strainphlan for mapping Gardnerella vaginalis strains from shotgun metagenome reads from vaginal swab samples onto a tree of whole genome sequences Gardnerella isolates. 

REFERENCE GENOMES: fast files of the 72 reference genomes used can be found in the `ref_genomes` directory. 

STRAINPHLAN: run strainphlan using strainphlan step 1-5 scripts to make tree. Output files can be found in `strainphlan_out` directory. (First step was running metaphlan for sam output. These metaphlan outputs can be found in the `metaphlan` directory.

POST PROCESSING: visualize with ggtree in R. `gardTreeMetadata.Rmd`


In addition to running the full strainphlan pipeline for a tree, strainphlan was run again (strainphlanStep5-2.sh) with relaxed parameters (output in strainphlan_out_2) to avoid any samples or WGS sequences from being excluded. The resulting alignment  was passed to the EPA algorithm in RAxML. (Output in epa directory). 