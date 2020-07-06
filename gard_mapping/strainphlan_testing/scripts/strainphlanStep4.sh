#!/bin/bash
#SBATCH -o strainphlanStep4_%j.out
#SBATCH -c 8

#Strainphlan Step 4: extract reference markers

out_dir=/home/hlberman/VMMG/strainphlan
metaphlan_dir=/home/hlberman/Applications/metaphlan2

mkdir -p $out_dir/db_markers
bowtie2-inspect $metaphlan_dir/metaphlan_databases/mpa_v20_m200 > $out_dir/db_markers/all_markers.fasta #make fasta 
bowtie2-inspect $metaphlan_dir/metaphlan_databases/mpa_v20_m200 -n > $out_dir/db_markers/marker_names.txt

/home/hlberman/Applications/metaphlan2/strainphlan_src/extract_markers.py \
    --mpa_pkl $metaphlan_dir/metaphlan_databases/mpa_v20_m200.pkl  \
    --ifn_markers $out_dir/db_markers/all_markers.fasta \
    --clade  g__Gardnerella \
    --ofn_markers $out_dir/db_markers/Gardnerella.markers.fasta  