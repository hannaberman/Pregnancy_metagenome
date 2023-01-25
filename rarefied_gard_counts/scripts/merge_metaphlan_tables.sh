#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/rarefied_gard_counts/log/merge_metaphlan_tables_%j.out
#SBATCH -c 16

in_path=/home6/hlberman/VMMG/rarefied_gard_counts/metaphlan2_outs
out_path=/home6/hlberman/VMMG/rarefied_gard_counts/merged_metaphlan_tables

# 5) Merge metaphlan outputs
/home6/hlberman/Applications/metaphlan2/utils/merge_metaphlan_tables.py \
    $in_path/*.txt > \
    $out_path/rarefiedMergedMetaphlanAbundance.tsv