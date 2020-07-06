#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/log/usearch_%j.out

accession=$1
reads_path=/home/hlberman/VMMG/gard_map/gard_fastq
usearch_in=/home/hlberman/VMMG/gard_map/usearch_in
db_path=/home/hlberman/VMMG/gard_map/ref_genes/refGenes.fasta
alns_path=/home/hlberman/VMMG/gard_map/usearch_alns

# decompress files
gunzip $reads_path/${accession}_FgardRef_1.fastq.gz
gunzip $reads_path/${accession}_FgardRef_2.fastq.gz
gunzip $reads_path/${accession}_FgardRef_S.fastq.gz

# merge pairs 
usearch -fastq_mergepairs $reads_path/${accession}_FgardRef_1.fastq -reverse $reads_path/${accession}_FgardRef_2.fastq -fastqout $reads_path/${accession}_FgardRef_merged.fastq 

# concatenate merged and singleton reads 
cat $reads_path/${accession}_FgardRef_merged.fastq $reads_path/${accession}_FgardRef_S.fastq > $usearch_in/${accession}_cat.fastq

# perform query search against database
usearch \
    -usearch_global $usearch_in/${accession}_cat.fastq \
    -db $db_path \
    -id 0.7 \
    -strand both \
    -threads 8 \
    -maxaccepts 0 \
    -blast6out $alns_path/$accession.txt \

# Compress everything
gzip $reads_path/${accession}_FgardRef_1.fastq
gzip $reads_path/${accession}_FgardRef_2.fastq
gzip $reads_path/${accession}_FgardRef_S.fastq
gzip $reads_path/${accession}_FgardRef_merged.fastq
gzip $usearch_in/${accession}_cat.fastq