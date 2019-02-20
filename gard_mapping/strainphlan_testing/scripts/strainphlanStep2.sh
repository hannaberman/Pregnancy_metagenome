#!/bin/bash
#SBATCH -o strainphlanStep2_%j.out
#SBATCH -c 8

#Strainphlan Step 2: Get markers by running sample2markers. The marker files contain the consensus of unique marker genes for each species found in the sample, which will be used for SNP profiling

accession=$1
sam_path=/home/hlberman/VMMG/strainphlan/metaphlan
out_path=/home/hlberman/VMMG/strainphlan/markers

/home/hlberman/Applications/metaphlan2/strainphlan_src/sample2markers.py \
    --ifn_samples $sam_path/${accession}.sam.bz2 \
    --input_type sam \
    --output_dir $out_path \
    --samtools_exe /home/hlberman/bin/samtools \
    --bcftools_exe /home/hlberman/bin/bcftools