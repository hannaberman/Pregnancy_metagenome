#!/bin/bash
#SBATCH -o bam2fastq_%j.out

accession=$1
f_bam_path_20=/home/hlberman/VMMG/gard_map/filtered_out
f_bam_path_42=/home/hlberman/VMMG/gard_map/filtered_out_42
out_dir_20=/home/hlberman/VMMG/gard_map/filtered_fastq_20
out_dir_42=/home/hlberman/VMMG/gard_map/filtered_fastq_42

#files with mapq 20
samtools sort \
    -n \
    -o $f_bam_path_20/${accession}_FgardRef_n.bam \
    $f_bam_path_20/${accession}_FgardRef.bam
samtools fastq \
    -1 $out_dir_20/${accession}_FgardRef_1.fastq.gz \
    -2 $out_dir_20/${accession}_FgardRef_2.fastq.gz \
    -s $out_dir_20/${accession}_FgardRef_S.fastq.gz \
    $f_bam_path_20/${accession}_FgardRef_n.bam


#files with mapq 42 (max)
samtools sort \
    -n \
    -o $f_bam_path_42/${accession}_FgardRef_n.bam \
    $f_bam_path_42/${accession}_FgardRef.bam
samtools fastq \
    -1 $out_dir_42/${accession}_FgardRef_1.fastq.gz \
    -2 $out_dir_42/${accession}_FgardRef_2.fastq.gz \
    -s $out_dir_42/${accession}_FgardRef_S.fastq.gz \
    $f_bam_path_42/${accession}_FgardRef_s.bam