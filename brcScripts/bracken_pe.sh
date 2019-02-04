#!/bin/bash
#SBATCH -o bracken_pe_%j.out

accession=$1
kraken_db_path=/home/hlberman/Applications/kraken2-master/kraken2/standardDB/
in_path=/home/hlberman/VMMG/upload_kraken2_out/
out_path=/home/hlberman/VMMG/upload_bracken_out/

/home/hlberman/Applications/Bracken-master/bracken -d $kraken_db_path -i $in_path/${accession}_kraken2_report_pe.tsv -o $out_path/${accession}_pe_bracken.tsv -r 100 -l 'S' -t 10

