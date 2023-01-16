########################################
### Count Reads in Rarefied Samples  ###
### Hanna Berman                     ###
### 10/13/2021                       ###
########################################

library(tidyverse)
library(Biostrings)
options(scipen=10000)
`%!in%` <- negate(`%in%`)

rarefiedFiles <- "/Users/hlberman/mnt/cluster/home6/hlberman/VMMG/rarefied_gard_counts/rarefied_samples" %>%
  list.files(pattern="_1.fastq.gz", full.names = TRUE)

accessionNames <- "/Users/hlberman/mnt/cluster/home6/hlberman/VMMG/rarefied_gard_counts/rarefied_samples" %>%
  list.files(pattern="_1.fastq.gz") %>%
  str_extract(pattern="(?<=sub_).+(?=_1.fastq.gz)") %>%
  str_extract(pattern="[0-9]+")

rarefiedReadCounts0 <- list()

for (i in rarefiedFiles) {
  a <- readDNAStringSet(i, format="fastq")
  b <- length(a)
  rarefiedReadCounts0 <- append(rarefiedReadCounts0, b)
}

rarefiedReadCounts1 <- unlist(rarefiedReadCounts0)

rarefiedReadCounts <- tibble(SampleID=as.character(accessionNames),
                             rarefiedReads=as.numeric(rarefiedReadCounts1))

write_csv(rarefiedReadCounts, "/Volumes/GoogleDrive-103667279570938865306/My Drive/Callahan Lab/metagenome_gardnerella/pregnancy_metagenome/rarefied_gard_counts/rarefiedReadCounts.csv")
