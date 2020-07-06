#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/bbmap_human/log/bbmap_%j.out
#SBATCH -c 4

accession=$1
DB_path=/home/hlberman/VMMG/bbmap_human/GRCh38
reads_path=/home/hlberman/VMMG/reads/upload
out_path=/home/hlberman/VMMG/bbmap_human/filtered_fastq

#align paired reads with human reference db, save unmapped reads to sam file with BBmap version 38.44
/home/hlberman/Applications/bbmap/removehuman2.sh \
    in=$reads_path/${accession}_1.fastq.gz \
    in2=$reads_path/${accession}_2.fastq.gz \
    outu=$out_path/$accession.sam \
    path=$DB_path \
    build=1

#convert sam to bam file and create index samtools version 1.9
samtools1.9 view -b -o $out_path/${accession}.bam $out_path/${accession}.sam

#convert to fastq with samtools version 1.9
samtools1.9 sort \
    -n \
    -o $out_path/${accession}_s.bam \
    $out_path/${accession}.bam
samtools1.9 fastq \
    -1 $out_path/${accession}_1.fastq.gz \
    -2 $out_path/${accession}_2.fastq.gz \
    $out_path/${accession}_s.bam

#remove sam and bam files  
rm $out_path/${accession}.sam
rm $out_path/${accession}.bam
rm $out_path/${accession}_s.bam

###########################################################################################################

#align singletons to human reference db, save unmapped reads to sam file with BBmap version 38.44
 /home/hlberman/Applications/bbmap/removehuman2.sh \
    in=$reads_path/${accession}_S.fastq.gz \
    outu=$out_path/${accession}_S.sam \
    path=$DB_path \
    build=1

#convert sam to bam file and create index samtools version 1.9
samtools1.9 view -b -o $out_path/${accession}_S.bam $out_path/${accession}_S.sam

 #convert to fastq samtools version 1.9
samtools1.9 sort \
    -n \
    -o $out_path/${accession}_Ss.bam \
    $out_path/${accession}_S.bam

samtools1.9 fastq \
    -0 $out_path/${accession}_S.fastq.gz \
    $out_path/${accession}_Ss.bam

#remove sam and bam files  
rm $out_path/${accession}_S.sam
rm $out_path/${accession}_S.bam
rm $out_path/${accession}_Ss.bam     