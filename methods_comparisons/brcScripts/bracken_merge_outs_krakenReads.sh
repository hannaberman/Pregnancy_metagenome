#!/bin/bash
#SBATCH -o brackenMergeKraken_pe_%j.out

in_path=/home/hlberman/VMMG/upload_bracken_out/
out_path=/home/hlberman/VMMG/upload_bracken_out/

/home/hlberman/Applications/Bracken-master/analysis_scripts/combine_bracken_outputs_originalReadCount.py \
    --files $in_path/*_pe_bracken.tsv \
    --output $out_path/merged_braken_KrakenReads_pe.tsv