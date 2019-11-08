#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/log/bowtieAlign_%j.out

accession=$1
DB_path=/home/hlberman/VMMG/gard_map/bowtie_index/gard_ref
reads_path=/home/hlberman/VMMG/bbmap_human/filtered_fastq
sam_path=/home/hlberman/VMMG/gard_map/bowtie_out/sam
bam_path=/home/hlberman/VMMG/gard_map/bowtie_out/bam
f_bam_path=/home/hlberman/VMMG/gard_map/gard_bam
out_dir=/home/hlberman/VMMG/gard_map/gard_fastq

#align with reference db. Use bowtie2 v2.1.0
bowtie2 -x $DB_path \
    -q \
    -1 $reads_path/${accession}_1.fastq.gz \
    -2 $reads_path/${accession}_2.fastq.gz \
    -p 8 \
    --reorder \
    -S $sam_path/${accession}_gardRef.sam

#convert sam to bam file and create index use samtools 1.9
samtools1.9 view -b -o $bam_path/${accession}_gardRef.bam $sam_path/${accession}_gardRef.sam
samtools1.9 sort -o $bam_path/${accession}_gardRef_sorted.bam $bam_path/${accession}_gardRef.bam 
samtools1.9 index $bam_path/${accession}_gardRef_sorted.bam $bam_path/${accession}_gardRef_sorted.bam.bai

# filter based on mapq (mapq score of 20) use samtools 1.9
samtools1.9 view -b -q 20 -o $f_bam_path/${accession}_FgardRef.bam $bam_path/${accession}_gardRef.bam
samtools1.9 sort -o $f_bam_path/${accession}_FgardRef_s.bam $f_bam_path/${accession}_FgardRef.bam
samtools1.9 index $f_bam_path/${accession}_FgardRef_s.bam $f_bam_path/${accession}_FgardRef_s.bam.bai

# bam2fastq use samtools 1.9. _S is for reads whose mate pair did not map. 
samtools1.9 sort \
    -n \
    -o $f_bam_path/${accession}_FgardRef_n.bam \
    $f_bam_path/${accession}_FgardRef.bam
samtools1.9 fastq \
    -1 $out_dir/${accession}_FgardRef_1.fastq.gz \
    -2 $out_dir/${accession}_FgardRef_2.fastq.gz \
    -s $out_dir/${accession}_FgardRef_S.fastq.gz \
    $f_bam_path/${accession}_FgardRef_n.bam

