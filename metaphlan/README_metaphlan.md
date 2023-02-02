# Profiling samples with MetaPhlAn2/HUManN2 


## Taxon presence and abundance with MetaPhlan2, run through Humann2
HUManN2 calls MetaPhlAn2 v2.7.7  
`./scripts`
	a) `./scripts/humann2.sh` : main script to run humann2
	b) `./scripts/humann2Commands.sh` : send 1)a commands to cluster
	c) `./scripts/humann2PostProcessing` :  merge tables
    d) `./scripts/get_gard_markers.R`: get list of *Gardnerella* marker gene reads    in database
    e) `./scripts/metaphlan_map_counts.sh`: get counts of marker genes aligned in samples
    f) `./`scripts/clean_metaphlan_marker_counts.R`: make table of marker gene counts
    g) `./scripts/hmp2mgs_scripts/`: scripts for MOMS-PI cohort samples



