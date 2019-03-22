
Blast6 format table from usearch alignment of sample 1000801248 reads against the 72 G. vaginalis reference genes from 72 G. vaginalis strains.

This table contains all alignments to reference sequences >= 70% identity.

Input for this usearch alignment was output from bowtie alignment against G. vaginalis reference sequences with mapq scores >= 20


Read table into R:

foo <- read_delim("./1000801248.txt", delim="\t", col_names=c("query", "reference", "pcntid", "length", "mismatch", "gap_open", "qstart", "qend", #"rstart", "rend", "evalue", "bitscore") 