#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/panphlan/log/profilegvpangenome_%j.out
#SBATCH -c 8

map_results=/home/hlberman/VMMG/panphlan/map_outs/
database_in=/home/hlberman/Applications/panphlan/databases/
out_path=/home/hlberman/VMMG/panphlan/profile_outs/

panphlan_profile.py \
-c gvaginalis72 \
--i_bowtie2_indexes $database_in \
-i $map_results \
--o_dna $out_path/gvaginalis72_strain_presence_absence.csv \
--o_covplot $out_path/gvaginalis72_covplot.png \
--o_covplot_normed $out_path/gvaginalis72_covplot_normed.png \
--o_cov $out_path/gvaginalis72_raw_gene_cov.tsv \
--strain_hit_genes_perc $out_path/result_genes_per_strain.csv \
--add_strains \
--verbose