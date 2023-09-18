library(tidyverse)

allGenes <- read_lines("/Users/hlberman/Downloads/mpa_vOct22_CHOCOPhlAnSGB_202212_marker_info.txt")

allGenes[1]
allGardGenes <- keep(allGenes, ~str_detect(.x, "Gardnerella"))
allGardGenes[1]
allGardGeneIDs <- str_extract(allGardGenes, ".*(?=\\t)")
allGardGeneIDs
#write_lines(allGardGeneIDs, "/Users/hlberman/mnt/cluster/home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/utils/gardnerella_marker_IDs.txt")
