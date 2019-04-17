#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/bbmap_human/db_%j.out
#SBATCH -c 4

ref=/home/hlberman/VMMG/bbmap_human/GRCh38.fna
path=/home/hlberman/VMMG/bbmap_human/GRCh38/

#align with human reference db, save unmapped reads to gzipped fastq files
/home/hlberman/Applications/bbmap/bbmap.sh \
    ref=$ref \
    path=$path