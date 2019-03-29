#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/humann2/log/humann2_%j.out
#SBATCH -c 8

accession=$1
reads_path=/home/hlberman/VMMG/reads/upload/
cat_path=/home/hlberman/VMMG/reads/paired_cat
out_path=/home/hlberman/VMMG/humann2/output

#concatenate paired reads
cat $reads_path/${accession}_1.fastq.gz $reads_path/${accession}_2.fastq.gz > $cat_path/${accession}.fastq.gz

#send to humann2
humann2 \
    --input $cat_path/${accession}.fastq.gz \
    --output $out_path \
    --output-format tsv \
    --input-format fastq.gz \
    --threads 8 \
    --metaphlan /home/hlberman/Applications/metaphlan2 \
    --bowtie2 /home/hlberman/Applications/bowtie2-2.3.5 \
    --usearch /home/hlberman/bin/usearch \
   --diamond /home/hlberman/Applications/diamond-0.8.38