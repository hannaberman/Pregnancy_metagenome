#!/usr/bin/env Rscript
#SBATCH -o /home6/hlberman/VMMG/humann2/log/filterGardMatches_%j.out

library(tidyverse)

# shorten files
metaphlanMarkerCountFiles <- "/home6/hlberman/VMMG/humann2/stanUAB_marker_counts" %>%
  list.files(pattern = ".tsv", full.names = TRUE) 

gardIDs <- read_lines("/home6/hlberman/Applications/metaphlan2/utils/gardnerella_vaginalis_marker_IDs.txt") %>%
    paste(collapse="|")

for (i in metaphlanMarkerCountFiles){
    j <- str_extract(i, "[0-9]{10}(?=_marker_reads.tsv)")
    read_tsv(file=i) %>%
    dplyr::filter(str_detect(`#SampleID`, gardIDs),
                  Metaphlan2_Analysis>0) %>%
    write_tsv(., paste0("/home6/hlberman/VMMG/humann2/stanUAB_gard_marker_counts/", j, "_gard_marker_reads.tsv"))     
}

# get gard count dataframe 
gardMarkerCountFiles <- "/home6/hlberman/VMMG/humann2/stanUAB_gard_marker_counts" %>%
  list.files(pattern = ".tsv", full.names = TRUE) 

sampleIDs <- str_extract(gardMarkerCountFiles, "[0-9]{10}(?=_gard_marker_reads.tsv)")

markerSums <- gardMarkerCountFiles %>%
    map(read_tsv) %>%
    map(., ~mutate(.x, Metaphlan2_Analysis=as.numeric(Metaphlan2_Analysis))) %>%
    map2(., sampleIDs, ~mutate(.x, SampleID=.y)) %>%
    purrr::reduce(full_join) %>%
    group_by(SampleID) %>%
    summarize(metaphlanReads=sum(Metaphlan2_Analysis))

write_csv(markerSums, "/home6/hlberman/VMMG/humann2/merged_tables/stanUAB_gardMarkerCounts.csv")