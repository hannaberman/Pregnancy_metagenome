#!/bin/bash
#SBATCH -o kraken2_pe_%j.out


accession=$1
reads_path=/home/hlberman/VMMG/reads/upload/
out_path=/home/hlberman/VMMG/upload_kraken2_out/
classified_reads_path=/home/hlberman/VMMG/upload_kraken2_classifiedReads_out/
DB_NAME=/home/hlberman/Applications/kraken2-master/kraken2/standardDB/

/home/hlberman/Applications/kraken2-master/kraken2/kraken2 --db $DB_NAME --use-names --classified-out $classified_reads_path/c_$accession#.fastq --unclassified-out $classified_reads_path/u_$accession#.fast --output $out_path/${accession}_krakenOut_pe.txt --report $out_path/${accession}_kraken2_report_pe.tsv --gzip-compressed --paired $reads_path/${accession}_1.fastq.gz $reads_path/${accession}_2.fastq.gz
