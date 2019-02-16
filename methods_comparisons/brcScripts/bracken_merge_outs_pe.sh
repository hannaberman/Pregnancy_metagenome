#!/bin/bash
#SBATCH -o brackenMerge_pe_%j.out

in_path=/home/hlberman/VMMG/upload_bracken_out/
out_path=/home/hlberman/VMMG/upload_bracken_out/
names_path=/home/hlberman/VMMG/scripts/bracken_merge_names.csv/

/home/hlberman/Applications/Bracken-master/analysis_scripts/combine_bracken_outputs.py \
    --files $in_path/*_pe_bracken.tsv \
    --output $out_path/merged_braken_pe.tsv