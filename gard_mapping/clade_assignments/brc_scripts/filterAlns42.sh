#!/bin/bash
#SBATCH -o filterAln_%j.out

accession=$1
bam_path=/home/hlberman/VMMG/gard_map/bowtie_out/bam
f_bam_path=/home/hlberman/VMMG/gard_map/filtered_out42/


#filter based on mapq
samtools view -b -q 42 -o $f_bam_path/${accession}_FgardRef.bam $bam_path/${accession}_gardRef.bam
samtools sort -o $f_bam_path/${accession}_FgardRef_s.bam $f_bam_path/${accession}_FgardRef.bam
samtools index $f_bam_path/${accession}_FgardRef_s.bam $f_bam_path/${accession}_FgardRef_s.bam.bai