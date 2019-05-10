#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/humann2/humann2_%j.out
#SBATCH -c 8

accession=$1
in_path=/home/hlberman/VMMG/humann2/output
out_path=/home/hlberman/VMMG/humann2/merged_tables

# 1) Join files
humann2_join_tables -i $in_path -o $out_path/VM_genefamilies.tsv --file_name genefamilies
humann2_join_tables -i $in_path -o $out_path/VM_pathabundance.tsv --file_name pathabundance
humann2_join_tables -i $in_path -o $out_path/VM_pathcoverage.tsv --file_name pathcoverage

# 2) Renormalize to relative abundance
humann2_renorm_table -i $out_path/VM_genefamilies.tsv -o $out_path/VM_genefamilies_cpm.tsv --units cpm
humann2_renorm_table -i $out_path/VM_pathabundance.tsv -o $out_path/VM_pathabundance_cpm.tsv --units cpm