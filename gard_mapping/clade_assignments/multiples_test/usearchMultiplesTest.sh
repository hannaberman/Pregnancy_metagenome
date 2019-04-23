#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/usearch_out/usearch_%j.out

accession=1000801248
usearch_in=/home/hlberman/VMMG/gard_map/usearch_in20
db_path=/home/hlberman/VMMG/gard_map/multiples_test/refGenesTest.fasta
alns_path=/home/hlberman/VMMG/gard_map/multiples_test/

# perform query search against database
usearch \
    -usearch_global $usearch_in/${accession}_cat.fastq \
    -db $db_path \
    -id 0.7 \
    -strand both \
    -threads 8 \
    -maxaccepts 0 \
    -blast6out $alns_path/${accession}_test.txt \