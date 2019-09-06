#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/humann2/humann2addNames_%j.out
#SBATCH -c 8

in_path=/home/hlberman/VMMG/humann2/merged_tables/VM_genefamilies.tsv
out_path=/home/hlberman/VMMG/humann2/merged_tables/VM_genefamilies_names.tsv

#add uniref names back to tables
humann2_rename_table --input $in_path --names uniref90 --output $out_path