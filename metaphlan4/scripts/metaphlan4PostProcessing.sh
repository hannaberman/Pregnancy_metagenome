#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/mergemetaphlan_%j.out
#SBATCH -c 16

outputs_path=/home6/hlberman/VMMG/metaphlan4/outputs

# Merge stanford and UAB metaphlan outputs
/home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/utils/merge_metaphlan_tables.py \
    $outputs_path/stuab_metaphlan/*_metaphlan_bugs_list.tsv > \
    $outputs_path/stuab_mergedMetaphlanAbundance.tsv

# Merge hmp2 metaphlan outputs
/home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/utils/merge_metaphlan_tables.py \
    $outputs_path/hmp2mgs_metaphlan/*_metaphlan_bugs_list.tsv > \
    $outputs_path/hmp2mgs_mergedMetaphlanAbundance.tsv