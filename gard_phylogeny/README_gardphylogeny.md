# NCBI Gardnerella Genome Assemblies Phylogeny

## Genomes
Download 124 Gardnerella genomes from GenBank October 1 2020 and extract metadata using script in `./referenceGenomeMetadata.Rmd`

## Quality control
Choose which assemblies to use in *Gardnerella* reference phylogeny
### Blast against NCBI databases with script `./assembly_quality_control/gardBlastTest.Rmd` to verify identity as *Gardnerella*.
Use blast version 2.10.1+
1) 16S_ribosomal_RNA blast database from ftp://ftp.ncbi.nlm.nih.gov/blast/db/16S_ribosomal_RNA.tar.gz 
2) Blastn genome assemblies against the nr/nt database that did not align to any reference 16S sequence (5), did not align to one of the two reference Gardnerella 16S sequences (1),  the best alignment was not to a Gardnerella reference sequence (1), or was a an environmental sample whose alignment identity was an outlier (1). Use the following:
`blastn -db nt -query <in> -out <out> -outfmt 7 -remote`

### Completeness, quality, and dereplication
Perform the following in `./assembly_quality_control/completenessQualityDereplication.Rmd`
1) Blastn (again version 2.10.1+) against 40 single copy core genes from Mende et al. 2013: Accurate and universal delineation of prokaryotic species to assess completeness. Use sequences from ATCC 14019 Gardnerella assembly
    + ID List found in `./assembly_quality_control/Mende40_COGs_GeneIDs.csv`
    + Fastas of reference sequences found in `./assembly_quality_control/Mende40ATCC14019.fasta`
2) Assess quality using length, number of sequences per assembly, L50 and N50 values

3) Run Mash v 2.2 to assess genomic distances between genome assemblies in 
Assemblies with Mash distance < 0.005 deemed replicates. Choose one of replicates with the best
4) Final filtering criteria for selecting *Gardnerella* genome assemblies to reconstruct phylogeny
+  Remove the following:
+ non-*Gardnerella*
+ partial assemblies
+ meta-assemblies
+ replicates with less than Mash distance of 0.005 (choose representative with best number of single-copy core genes or highest contig N50)
+ 50+ Mende et al. single-copy core genes
+ Contig N50 < 5000
    

    
## Reconstruct Phylogeny
### Annotate assemblies
1) Annotate chosen assemblies with Prokka v 1.14.6  `./build_phylogeny/scripts/prokkaAnnotate.sh`
Then reorganize files into directories `./build_phylogeny/scripts/organizeProkkaOutput.R`

### Determine core genome
Determine core genome with Roary version 3.13.0, perform the below in `./build_phylogeny/scripts/roaryCoreGenome.sh`
    1) Run Roary with a 60% blasp threshold to see range of blastp hits across 60% to 100%
    copy to repository with the following commands:
    `docker container ls -a` to determine container name
    2) Run Roary with a 95% blastp threshold to determine core genome 
    `docker container ls -a` to determine container names with output directories
    `docker cp 923300ac2d35:/20201002_Roary_60 Volumes/GoogleDrive/My\ Drive/Callahan\ Lab/metagenome_gardnerella/pregnancy_metagenome/gard_phylogeny/build_phylogeny`  and 
    `docker cp aaa2f96d6956:/20201002_Roary95 /Volumes/GoogleDrive/My\ Drive/Callahan\ Lab/metagenome_gardnerella/pregnancy_metagenome/gard_phylogeny/build_phylogeny` to copy output directories to repository\

### Reconstruct phylogeny
RAxML v8.2.12 A. Stamatakis: "RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies". In Bioinformatics, 2014
1) Construct maximum likelihood core genome phylogeny with GTR+Gamma model. Use frequency criterion for bootstrap and run "autoFC" algorithm to determine the number of bootstraps. (Pattengale et al., 2009 "How Many Bootstrap Replicates are Necessary?") `./build_phylogeny/scripts/MLPhylogeny.sh`
2) Root phylogeny with *Bifidobacterium longum* 51A (GCA_004936435.1) as outgroup
+ annotate with prokka `./scripts/prokkaAnnotateOutgroup.sh`
+ run roary for outgroup `./scripts/roaryCoreGenome.sh` but with *B. longum* genome added to input, retrieve with `docker container ls -a` to determine container name and `docker cp 360c40c750e5:/20201005_Roary_outgroup Volumes/GoogleDrive/My\ Drive/Callahan\ Lab/metagenome_gardnerella/pregnancy_metagenome/gard_phylogeny/build_phylogeny`
+ Outgroup root the phylogeny with `./scripts/MLPhylogeny_root.sh` to run epa algorithm to root with *Bifidobacterium longum* 51A (NZ_CP026999.1)

