#!/bin/bash

in_path="/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/RelativeAbundanceOutputs/upload_metaphlan2_pe_out/"
out_path="/Volumes/GoogleDrive/My Drive/Callahan Lab/vagMicrobiomeMetagenome/RelativeAbundanceOutputs/"

/Users/hlberman/Applications/metaphlan2/utils/merge_metaphlan_tables.py \
    "$in_path"/*.tsv > \
    "$out_path"/upload_metaphlan_merged_abundance_table_PE.tsv