#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/humann2/humann2unpackpath%j.out
#SBATCH -c 8

input_genes=/home/hlberman/VMMG/humann2/merged_tables/VM_genefamilies_names.tsv
input_pathways=/home/hlberman/VMMG/humann2/merged_tables/VM_pathabundance.tsv
out_path=/home/hlberman/VMMG/humann2/merged_tables/VM_genefamilies_paths.tsv

#add gene information to pathways
humann2_unpack_pathways --input-genes $input_genes --input-pathways $input_pathways --output $out_path