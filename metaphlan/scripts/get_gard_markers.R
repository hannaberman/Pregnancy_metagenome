library(tidyverse)

allGenes <- read_lines("/Users/hlberman/Downloads/mpa_v20_m200_marker_info.txt")

allGenes[1]
#g__Gardnerella|s__vaginalis
allGardGenes <- keep(allGenes, ~str_detect(.x, "Gardnerella"))
allGardGenes
allGardGeneIDs <- str_extract(allGardGenes, "(?<=gi\\|[0-9]{9}\\|[a-z]{2,3}\\|).*(?=\\|\\:)")
allGardGeneIDs
#write_lines(allGardGeneIDs, "/Users/hlberman/mnt/cluster/home6/hlberman/Applications/metaphlan2/utils/gardnerella_vaginalis_marker_IDs.txt")

