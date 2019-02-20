#!/bin/bash
#SBATCH -o strainphlanStep5_%j.out
#SBATCH -c 8

#Strainphlan Step 5: Generate trees from alignments

samp_path=/home/hlberman/VMMG/strainphlan/markers
ref_gen_path=/home/hlberman/VMMG/strainphlan/ref_genomes
marker_db_path=/home/hlberman/VMMG/strainphlan/db_markers
out_path=/home/hlberman/VMMG/strainphlan/strainphlan_out

/home/hlberman/Applications/metaphlan2/strainphlan.py \
    --ifn_samples $samp_path/*.markers \
    --ifn_markers $marker_db_path/Gardnerella.markers.fasta \
    --ifn_ref_genomes $ref_gen_path/*.fna \
    --output_dir $out_path \
    --clades g__Gardnerella