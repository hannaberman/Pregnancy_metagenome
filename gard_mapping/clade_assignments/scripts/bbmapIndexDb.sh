#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/log/db_%j.out
#SBATCH -c 4

ref=/home/hlberman/VMMG/gard_map/ref_genes/refGenes.fasta
path=/home/hlberman/VMMG/gard_map/bbmap_index/

#create index of Gardnerella core genes 
/home/hlberman/Applications/bbmap/bbmap.sh \
    ref=$ref \
    path=$path