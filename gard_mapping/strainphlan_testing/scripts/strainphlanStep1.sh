#!/bin/bash
#SBATCH -o strainphlanStep1_%j.out
#SBATCH -c 8

#Strainphlan Step 1: Send reads to metaphlan for sam file output

accession=$1
reads_path=/home/hlberman/VMMG/reads/upload/
out_path=/home/hlberman/VMMG/strainphlan/metaphlan/

/home/hlberman/Applications/metaphlan2/metaphlan2.py \
  --nproc 8 --input_type fastq \
  $reads_path/${accession}_1.fastq.gz,$reads_path/${accession}_2.fastq.gz \
  $out_path/${accession}_profiled_metagenome.tsv \
  --samout $out_path/${accession}.sam.bz2 \
  --bowtie2out $out_path/${accession}_bowtie2.bz2 