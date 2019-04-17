Filtering host reads from shotgun reads uploaded by DG. 
03/2019

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

###
Try to filter reads with BBmap v38.44 with the removehuman2.sh shell script from bbmap and  GRCh38 reference database. (fasta downloaded from NCBI and indexed with BBmap:
/home/hlberman/Applications/bbmap/bbmap.sh \
    ref=$ref \
    path=$path

Filter paired reads and unpaired reads separately:
 
/home/hlberman/Applications/bbmap/removehuman2.sh \
    in=$reads_path/${accession}_1.fastq.gz \
    in2=$reads_path/${accession}_2.fastq.gz \
    outu=$out_path/$accession.sam \
    path=$DB_path \
    build=1

 /home/hlberman/Applications/bbmap/removehuman2.sh \
    in=$reads_path/${accession}_S.fastq.gz \
    outu=$out_path/${accession}_S.sam \
    path=$DB_path \
    build=1