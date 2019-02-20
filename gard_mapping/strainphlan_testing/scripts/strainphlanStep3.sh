#!/bin/bash
#SBATCH -o strainphlanStep3_%j.out
#SBATCH -c 8

#Strainphlan Step 3: Identify clades detected in the samples and build reference databases


marker_dir=/home/hlberman/VMMG/strainphlan/markers
output_dir=/home/hlberman/VMMG/strainphlan/clades
clades_dir=/home/hlberman/VMMG/strainphlan/

/home/hlberman/Applications/metaphlan2/strainphlan.py --ifn_samples $marker_dir/*.markers --output_dir $output_dir --print_clades_only > $clades_dir/clades.txt
