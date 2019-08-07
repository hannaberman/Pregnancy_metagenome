#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/panphlan/log/makegvpangenome_%j.out
#SBATCH -c 8

GFF_IN=/home/hlberman/Applications/panphlan/databases/gvaginalis_72/gff/
pangenome_out=/home/hlberman/Applications/panphlan/databases/
roary_output=/home/hlberman/Applications/panphlan/databases/gvaginalis_72/roary_dir/

panphlan_pangenome_generation.py \
-c gvaginalis72 \
--i_gff $GFF_IN \
-o  $pangenome_out \
--verbose \
--roary_dir $roary_output