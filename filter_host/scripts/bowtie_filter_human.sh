#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/bowtie_human/out/bowtie_filter_human_%j.out

accession=$1
DB_path=/home/hlberman/VMMG/bowtie_human/DB/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index
reads_path=/home/hlberman/VMMG/reads/upload
out_path=/home/hlberman/VMMG/bowtie_human/filtered_fastq

#align with human reference db, save unmapped reads to gzipped fastq files
bowtie2 \
    -x $DB_path \
    -1 $reads_path/${accession}_1.fastq.gz \
    -2 $reads_path/${accession}_2.fastq.gz \
    -U $reads_path/${accession}_S.fastq.gz \
    -p 8 \
    --very-sensitive \
    --un-conc-gz $out_path/${accession}_%.fastq.gz \
    --un-gz $out_path/${accession}_S.fastq.gz 