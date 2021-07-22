#!/bin/bash
#SBATCH -o bowtieDbBuild_%j.out
#SBATCH -c 8

reference_in=/home/hlberman/VMMG/gard_map/ref_genes/refGenes.fasta
bt2_base=/home/hlberman/VMMG/gard_map/bowtie_index/gard_ref

bowtie2-build \
    -f \
    $reference_in \
    $bt2_base