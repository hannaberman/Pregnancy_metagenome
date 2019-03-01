#!/bin/bash
#SBATCH -o bowtieAlign_%j.out

accession=$1
DB_path=/home/hlberman/VMMG/gard_map/bowtie_index/gard_ref
reads_path=/home/hlberman/VMMG/reads/upload
sam_path=/home/hlberman/VMMG/gard_map/bowtie_out/sam
bam_path=/home/hlberman/VMMG/gard_map/bowtie_out/bam
fastq_path=/home/hlberman/VMMG/gard_map/fastq_out

#align with reference db
bowtie2 -x $DB_path \
    -q \
    -1 $reads_path/${accession}_1.fastq.gz \
    -2 $reads_path/${accession}_2.fastq.gz \
    -p 8 \
    --reorder \
    -S $sam_path/${accession}_gardRef.sam

#convert sam to bam file and create index
samtools view -b -o $bam_path/${accession}_gardRef.bam $sam_path/${accession}_gardRef.sam
samtools sort -o $bam_path/${accession}_gardRef_sorted.bam $bam_path/${accession}_gardRef.bam 
samtools index $bam_path/${accession}_gardRef_sorted.bam $bam_path/${accession}_gardRef_sorted.bam.bai