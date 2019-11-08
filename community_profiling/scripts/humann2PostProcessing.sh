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

# # 2) Renormalize to relative abundance
# humann2_renorm_table -i $out_path/VM_genefamilies.tsv -o $out_path/VM_genefamilies_cpm.tsv --units cpm
# humann2_renorm_table -i $out_path/VM_pathabundance.tsv -o $out_path/VM_pathabundance_cpm.tsv --units cpm

# 3) add uniref names back to tables
humann2_rename_table --input $out_path/VM_genefamilies.tsv --names uniref90 --output $out_path/VM_genefamilies_names.tsv

# 4) unpack pathways, add gene names to pathways
humann2_unpack_pathways --input-genes $out_path/VM_genefamilies_names.tsv --input-pathways $out_path//VM_pathabundance.tsv --output $out_path/VM_genefamilies_paths.tsv

# 5) Merge metaphlan outputs
/home/hlberman/Applications/metaphlan2/utils/merge_metaphlan_tables.py \
    /home/hlberman/VMMG/humann2/output/*_humann2_temp/*_metaphlan_bugs_list.tsv > \
    /home/hlberman/VMMG/humann2/merged_tables/mergedMetaphlanAbundance.tsv