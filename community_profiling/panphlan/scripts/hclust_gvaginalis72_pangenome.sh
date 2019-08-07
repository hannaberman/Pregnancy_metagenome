#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/panphlan/log/hclustgvpangenome_%j.out
#SBATCH -c 8

profile_results=/home/hlberman/VMMG/panphlan/profile_outs/
out_path=/home/hlberman/VMMG/panphlan/hclust_outs/

/home/hlberman/Applications/panphlan/tools/hclust2/hclust2.py \
-i $profile_results/gvaginalis72_strain_presence_absence_md.txt \
-t data_matrix \
--fname_row 0 \
--sname_row 0 \
--metadata_rows 1,2,3,4 \
-o $out_path/heatmap.png \
--out_table $out_path/out_table.tsv \
--legend_file $out_path/legend_file.png \
--image_size 60 \
--cell_aspect_ratio 0.01 \
--metadata_height 0.10 \
-c Blues \
--no_flabels \
--slabel_size 20 \
--flabel_size 20 \
--nan_c black \
--f_dist_f jaccard \
--s_dist_f jaccard
#--title TITLE \
#--titel_fontsize TITLE_FONTSIZE 