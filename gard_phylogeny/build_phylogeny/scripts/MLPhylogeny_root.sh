#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_phylogeny/log/raxml_%j.out
#SBATCH -c 16

# Maximum likelihood core genome phylogeny of 85 Gardnerella whole genome assemblies with  RAxML v8.2.12
# RAxML"
# A. Stamatakis: "RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies". In Bioinformatics, 2014

inaln=/home/hlberman/VMMG/gard_phylogeny/outgroup_core_gene_alignment.aln
outdir=/home/hlberman/VMMG/gard_phylogeny/20201005_ml_phylogeny

# Use EPA algorithm to root phylogeny with B. longum 51A
raxmlHPC-PTHREADS-SSE3 -w $outdir -f v --epa-keep-placements=100 -t $outdir/RAxML_bipartitions.bootstrappedGardTree -m GTRGAMMA -s $inaln -n rootedGardTree