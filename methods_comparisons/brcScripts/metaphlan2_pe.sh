#!/bin/bash
#SBATCH -o metaphlan2_pe_%j.out
#SBATCH -c 8

accession=$1
reads_path=/home/hlberman/VMMG/reads/upload/
out_path=/home/hlberman/VMMG/upload_metaphlan2_pe_out/


/home/hlberman/Applications/metaphlan2/metaphlan2.py \
    --bowtie2out $out_path/${accession}_bowtie2.bz2 \
    --nproc 8 --input_type fastq \
    $reads_path/${accession}_1.fastq.gz,$reads_path/${accession}_2.fastq.gz \
    $out_path/${accession}_profiled_metagenome.tsv