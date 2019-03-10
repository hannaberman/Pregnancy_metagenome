Filtering host reads from shotgun reads uploaded by DG. 
03/2019

Reads filtered with Bowtie2.
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

 
