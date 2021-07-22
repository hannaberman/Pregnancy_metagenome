#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/bbmap_human/db_%j.out
#SBATCH -c 4

ref=/home/hlberman/VMMG/bbmap_human/GRCh38.fna
path=/home/hlberman/VMMG/bbmap_human/GRCh38/

#create index of human genome for alignment
/home/hlberman/Applications/bbmap/bbmap.sh \
    ref=$ref \
    path=$path