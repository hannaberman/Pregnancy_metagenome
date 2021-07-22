# Filtering host reads from shotgun reads uploaded by DG. 
05/2019

## Attempt with Bowtie 2
Reads filtered with Bowtie2. v2.1.0
Database used: GCA_000001405.15_GRCh38: Indexed database of NCBI GRCh38 downloaded from `http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer` on 03/04/2019

Alignment called using the following:
bowtie2 \
    -x $DB_path \
    -1 $reads_path/${accession}_1.fastq.gz \
    -2 $reads_path/${accession}_2.fastq.gz \
    -U $reads_path/${accession}_S.fastq.gz \
    -p 8 \
    --very-sensitive \
    --un-conc-gz $out_path/${accession}_%.fastq.gz \
    --un-gz $out_path/${accession}_S.fastq.gz \

note: read counts in file `./fastq_counts.txt`

## Attempt with BBmap
1) Download BBmap version 38.44 at `https://sourceforge.net/projects/bbmap/`  unzip/untar file to install
1) Download GRCh38.p13 reference genome. `ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz` Save to `./GRCh38.fna`
2) Build BBmap index with `./scripts/bbmap_index_db.sh`
bbmap.sh \
ref=$ref \
path=$path

3) Filter reads:
    script `./scripts/bbmap_filter_human.sh`  run for each reads file which uses the BBmap shell script `./removehuman2.sh`. 
    used the following to perform alignment for paired reads and singletons and save to .sam format:

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
    
    note: script  `./scripts/bbmap_cmds.sh` was used to call the `bbmap_filter_human.sh` script for each accession
    note: read counts in fastq_counts_bbmap.txt, fastq_counts_bbmapX.txt is from a previous run, not used can delete.
    
    ## change sam to fastq.gz with samtools 1.9

## Assessment files:
1)  assessFiltering.Rmd : compare reads with upload, bbmap, and kraken2 outputs
2) uploadVbbmap.Rmd : 
