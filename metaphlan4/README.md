# Profiling communities with MetaPhlAn4

Measuring prevalence and relative abundance of vaginal microbiome taxa by processing shotgun metagenomic sequencing data with MetaPhlAn4

## Get relative abundances with MetaPhlan4
1) Concatenate paired reads and send to metaphlan4 software  
All scripts in `./scripts/abundance_scripts` perform these actions  
 `./scripts/abundance_scripts/metaphlan4_staub_.sh`  for samples from Stanford Enriched and UAB Enriched cohorts
`./scripts/abundance_scripts/metaphlan4_hmp2mgs_*.sh` for samples from MOMS-PI cohort
2) Merge and tables  with `./scripts/metaphlan4PostProcessing.sh`
3) Output relative abundance tables:  
* `stuab_mergedMetaphlanAbundance.tsv`: Species relative abundance table with all Stanford Enriched and UAB Enriched samples
* `hmp2mgs_mergedMetaphlanAbundance.tsv`: Species relative abundance table with all MOMS-PI samples

## Count *Gardnerella* marker genes from MetaPhlAn4 database found in each sample
1) Use `./scripts/get_gard_markers.R` to get the *Gardnerella* marker gene IDs from the MetaPhlAn4 database
2) Get and clean marker gene counts from all samples:  
Run  
* `./scripts/clean_metaphlan_marker_counts.R`: for Stanford Enriched and UAB Enriched samples  
* `./scripts/clean_metaphlan_marker_counts_hmp2mgs.R`: for MOMS-PI samples
Outputs
* `stuab_gardMarkerCounts.csv`: Stanford Enriched and UAB Enriched samples MetaPhlAn4 *Gardnerella* marker counts
* `hmp2mgs_gardMarkerCounts.csv`: MOMS-PI samples MetaPhlAn4 *Gardnerella* marker counts

