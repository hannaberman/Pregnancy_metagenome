#!/bin/bash
#SBATCH -o count_fastq_%j.out

#get count of lines in fastq files. (to subsequently /4 to get read counts in each file.)

accession=$1
upload_dir=/home/hlberman/VMMG/reads/upload
filtered_dir=/home/hlberman/VMMG/bowtie_human/filtered_fastq
out_dir=/home/hlberman/VMMG/bowtie_human

uploadCount1=$(zcat $upload_dir/${accession}_1.fastq.gz|wc -l)
uploadcount2=$(zcat $upload_dir/${accession}_2.fastq.gz|wc -l)
uploadcountS=$(zcat $upload_dir/${accession}_S.fastq.gz|wc -l)
filteredCount1=$(zcat $filtered_dir/${accession}_1.fastq.gz|wc -l)
filteredCount2=$(zcat $filtered_dir/${accession}_2.fastq.gz|wc -l)
filteredCountS=$(zcat $filtered_dir/${accession}_S.fastq.gz|wc -l)

echo $accession ${uploadCount1} ${uploadcount2} ${uploadcountS} ${filteredCount1} ${filteredCount2} ${filteredCountS} >> $out_dir/fastq_counts.txt

cat $out_dir/fastq_counts.tsvsqueue