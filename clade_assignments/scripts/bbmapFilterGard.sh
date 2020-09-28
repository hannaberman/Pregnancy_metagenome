#!/bin/bash
#SBATCH -o /home/hlberman/VMMG/gard_map/log/bbmap_%j.out
#SBATCH -c 4

accession=$1
DB_path=/home/hlberman/VMMG/gard_map/bbmap_index
reads_path=/home/hlberman/VMMG/bbmap_human/filtered_fastq
out_path=/home/hlberman/VMMG/gard_map/bbmap_out

#align paired reads with human reference db, save unmapped reads to sam file with BBmap version 38.44
/home/hlberman/Applications/bbmap/bbmap.sh \
    in=$reads_path/${accession}_1.fastq.gz \
    in2=$reads_path/${accession}_2.fastq.gz \
    outm=$out_path/$accession.fastq.gz \
    path=$DB_path \
    build=1 \
    t=4 \
    minid=0.70  