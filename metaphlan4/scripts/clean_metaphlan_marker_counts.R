#!/opt/R/4.1.0/bin/Rscript
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/clean_gard_marker_counts_%j.out
#SBATCH -c 16

library(tidyverse)

# STANFORD UAB

# filter files
metaphlanMarkerCountFiles <- "/home6/hlberman/VMMG/metaphlan4/outputs/stuab_marker_counts" %>%
  list.files(pattern = ".tsv", full.names = TRUE) 

gardIDs <- read_lines("/home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/utils/gardnerella_marker_IDs.txt") %>%
    str_extract(., "UniRef90_[^\\|]+") %>%
    paste(collapse="|")

for (i in metaphlanMarkerCountFiles){
    j <- str_extract(i, "[0-9]{10}(?=_marker_reads.tsv)")
    read_tsv(file=i, comment="#", col_names=c("GeneID", "ReadCount")) %>%
    dplyr::filter(str_detect(`GeneID`, gardIDs),
                  ReadCount>0) %>%
    write_tsv(., paste0("/home6/hlberman/VMMG/metaphlan4/outputs/stuab_gard_marker_counts/", j, "_gard_marker_reads.tsv"))     
}

# get gard count dataframe 
gardMarkerCountFiles <- "/home6/hlberman/VMMG/metaphlan4/outputs/stuab_gard_marker_counts/" %>%
  list.files(pattern = ".tsv", full.names = TRUE) 

sampleIDs <- str_extract(gardMarkerCountFiles, "[0-9]{10}(?=_gard_marker_reads.tsv)")

markerSums <- gardMarkerCountFiles %>%
    map(read_tsv) %>%
    map(., ~mutate(.x, ReadCount=as.numeric(ReadCount))) %>%
    map2(., sampleIDs, ~mutate(.x, SampleID=.y)) %>%
    purrr::reduce(full_join) %>%
    group_by(SampleID) %>%
    summarize(gardReads=sum(ReadCount))

write_csv(markerSums, "/home6/hlberman/VMMG/metaphlan4/outputs/stuab_gardMarkerCounts.csv") 