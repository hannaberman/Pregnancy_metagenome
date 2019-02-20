#!/bin/bash
#SBATCH -o EPA_%j.out
#SBATCH -c 8

#EPA: Generate trees from alignments

refTree_path=/home/hlberman/VMMG/strainphlan/epa/RAxML_bipartitions.CoreGenomeTree_2 #orginal tree to add new reads to
out_path=/home/hlberman/VMMG/strainphlan/epa #directory for output trees
tree_name=20190217_strainphaln_epaTree.tree #name of output trees
aln_path=/home/hlberman/VMMG/strainphlan/strainphlan_out_2/g__Gardnerella.fasta #file path for input alingment with ref genomes and shotgun genomes. 

/home/hlberman/bin/raxmlHPC-PTHREADS-SSE3 \
    -w $out_path \
    -f v --epa-keep-placements=100 \
    -t $refTree_path \
    -m GTRGAMMA -s $aln_path \
    -n $tree_name