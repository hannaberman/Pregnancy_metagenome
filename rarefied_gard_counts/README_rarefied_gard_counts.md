# Rarefying reads to assess *Gardnerella* clade/genomospecies count with same bacterial library size
09/2022

Rarefying human-filtered reads to common read depth to deer

## Rarefy reads
### Download seqtk version 1.3

Download and install per instructions from: https://github.com/lh3/seqtk
`cd /home6/hlberman/Applications` #my file for applications on the cluster
`git clone https://github.com/lh3/seqtk.git;`
`cd seqtk; make`
`ln -s /home6/hlberman/Applications/seqtk/seqtk /home6/hlberman/bin` # copy command link to bin file that is in PATH

Instructions for subsampling from seqtk:
Subsample 10000 read pairs from two large paired FASTQ files (remember to use the same random seed to keep pairing):
`seqtk sample -s100 read1.fq 10000 > sub1.fq`
`seqtk sample -s100 read2.fq 10000 > sub2.fq`

### Subsample or rarefy to common sequencing depth of 100,000
Use `./scripts/rarefy_samples.sh`
Output rarefied files to: `./rarefied_samples`

### Count Reads with `./scripts/rarefiedCladeCounts.R`

## Map Gardnerella
### Align and filter with Bowtie2
Use `./scripts/bowtieAlign.sh`

### Align with USEARCH to map Gard variants
Use `./scripts/usearch.sh`

## Run Metaphlan2 to assess which samples have uncharacterized *Gardnerella*, when *Gardnerella* is detected by Metaphlan2 but not mapping method
Use `./scripts/metaphlan2.sh`
