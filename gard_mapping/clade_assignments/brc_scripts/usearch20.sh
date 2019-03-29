#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/usearch_out/usearch_%j.out

accession=$1
reads_path=/home/hlberman/VMMG/gard_map/filtered_fastq_20
usearch_in=/home/hlberman/VMMG/gard_map/usearch_in20
db_path=/home/hlberman/VMMG/gard_map/ref_genes/refGenes.fasta
alns_path=/home/hlberman/VMMG/gard_map/usearch_alns20

# merge pairs 
usearch -fastq_mergepairs $reads_path/${accession}_FgardRef_1.fastq.gz -reverse $reads_path/${accession}_FgardRef_2.fastq.gz -fastqout $reads_path/${accession}_FgardRef_merged.fastq.gz 

# concatenate reads 
cat $reads_path/${accession}_FgardRef_merged.fastq.gz $reads_path/${accession}_FgardRef_S.fastq.gz > $usearch_in/${accession}_cat.fastq

# perform query search against database
usearch \
    -usearch_global $usearch_in/${accession}_cat.fastq \
    -db $db_path \
    -id 0.7 \
    -strand both \
    -threads 8 \
    -maxaccepts 0 \
    -blast6out $alns_path/$accession.txt \