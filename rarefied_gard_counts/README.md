# Rarefying reads to assess *Gardnerella* clade/genomospecies count with same bacterial library size

Rarefy human-filtered reads to common read depth to ensure that associations of *Gardnerella* clade counts are not due to read depth.

## Download seqtk version 1.3
Download and install per instructions from: [https://github.com/lh3/seqtk](https://github.com/lh3/seqtk)
```
cd /home6/hlberman/Applications #destination of install
git clone https://github.com/lh3/seqtk.git;
cd seqtk; make`
ln -s /home6/hlberman/Applications/seqtk/seqtk /home6/hlberman/bin` # copy command link to bin file that is in PATH
```

Instructions for subsampling from seqtk:
Subsample 100000 read pairs from two large paired FASTQ files (remember to use the same random seed to keep pairing):  
```
seqtk sample -s100 read1.fq 100000 > sub1.fq
seqtk sample -s100 read2.fq 100000 > sub2.fq
```

## Rarefy reads
1) Subsample or rarefy to common sequencing depth of 100,000  
Use `./scripts/rarefy_samples.sh`  
Output rarefied files to: `./rarefied_samples`  

2) Count subsampled reads  
Use `./scripts/count_rarefied_reads.sh` to count lines in each file  
Use the following R code to edit `./rarefiedReadCounts.csv`

```
readCountDF1 <- read_csv(file.path(inDir, "rarefiedReadCounts.csv"), comment = "#") %>%
  mutate_if(is.numeric, ~.x/4) %>%
  mutate(SampleID=case_when(!str_detect(SampleID, "SRR")~SampleID,
                            str_detect(SampleID, "SRR")~str_extract(SampleID, "(?<=SRR)[0-9]*")),
         rarefiedReads=fwdLines) %>%
  select(SampleID, rarefiedReads)
write_csv(readCountDF1, file = file.path(outDir, "rarefiedReadCounts.csv"))
```

## Map Gardnerella
1) Align and filter with Bowtie2 with `./scripts/bowtieAlign.sh`
2) Align with USEARCH to map Gard variants with `./scripts/usearch.sh`

## Count aligned reads  
Use `./scripts/rarefiedCladeCounts.Rmd`  

## Run Metaphlan4 to assess which samples have uncharacterized *Gardnerella*, when *Gardnerella* is detected by Metaphlan4 but not mapping method  
Use `./scripts/metaphlan4_stuab.sh`, `./scripts/metaphlan4_hmp2_2.sh`, and `./scripts/metaphlan4_hmp2_1.sh`    
Merge metaphlan4 tables with: `./scripts/merge_metaphlan_tables.sh`  
