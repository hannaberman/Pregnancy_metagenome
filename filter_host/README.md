# Filtering host reads from shotgun reads 

Read counts in file `./fastq_counts.txt`

## Filter with BBmap
1) Download BBmap version 38.44 at `https://sourceforge.net/projects/bbmap/`  unzip/untar file to install
2) Download GRCh38.p13 reference genome. `ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz` Save to `./GRCh38.fna`
3) Build BBmap index with `./scripts/bbmap_index_db.sh`  
```
bbmap.sh \
ref=$ref \
path=$path
```
  
4) Filter reads:
script `./scripts/bbmap_filter_human.sh`:  run for each reads file which uses the BBmap shell script `./removehuman2.sh`:   
```
   #align paired reads with human reference db, save unmapped reads to sam file  
    removehuman2.sh \
    in=$reads_path/${accession}_1.fastq.gz \
    in2=$reads_path/${accession}_2.fastq.gz \
    outu=$out_path/$accession.sam \
    path=$DB_path \
    build=1
    
    #align singletons to human reference db, save unmapped reads to sam file
    removehuman2.sh \
    in=$reads_path/${accession}_S.fastq.gz \
    outu=$out_path/${accession}_S.sam \
    path=$DB_path \
    build=1
```
note: script  `./scripts/bbmap_cmds.sh` was used to call the `bbmap_filter_human.sh` script for each accession  
Changed sam to fastq.gz with samtools 1.9 

## Assessment files:
`uploadVbbmap.Rmd`: Assess number of reads filtered.
