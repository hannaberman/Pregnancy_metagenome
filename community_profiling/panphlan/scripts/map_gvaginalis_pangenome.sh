#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/panphlan/log/mapgvpangenome_%j.out
#SBATCH -c 8

sample=$1
sample_path=/home/hlberman/VMMG/reads/paired_cat
out_path=/home/hlberman/VMMG/panphlan/map_outs/


panphlan_map.py \
-c gvaginalis72 \
-i $sample_path/$sample.fastq.gz \
-o $out_path/${sample}_gvaginalis72.csv \
--verbose \
-p 8
