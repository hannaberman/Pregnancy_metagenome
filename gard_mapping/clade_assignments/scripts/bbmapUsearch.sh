#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/log/usearch_%j.out

accession=$1
reads_path=/home/hlberman/VMMG/gard_map/bbmap_out
db_path=/home/hlberman/VMMG/gard_map/ref_genes/refGenes.fasta
alns_path=/home/hlberman/VMMG/gard_map/usearch_alns_bbmap

# decompress files
gunzip $reads_path/${accession}.fastq.gz

# perform query search against database
usearch \
    -usearch_global $reads_path/${accession}.fastq \
    -db $db_path \
    -id 0.7 \
    -strand both \
    -threads 8 \
    -maxaccepts 0 \
    -blast6out $alns_path/$accession.txt \

# Compress 
gzip $reads_path/${accession}.fastq