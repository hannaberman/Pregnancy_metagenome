# Phylogeny of NCBI *Gardnerella* Genome Assemblies

Create reference *Gardnerella* phylogeny from whole genome assemblies

## Genomes
Download 124 *Gardnerella* genomes from GenBank October 1 2020 and extract metadata using script in `./referenceGenomeMetadata.Rmd`

## Quality control
Choose which assemblies to use in *Gardnerella* reference phylogeny

### Blast against NCBI databases with script `./assembly_quality_control/gardBlastTest.Rmd` to verify identity as *Gardnerella*.
Use blast version 2.10.1+
1) 16S_ribosomal_RNA blast database from ftp://ftp.ncbi.nlm.nih.gov/blast/db/16S_ribosomal_RNA.tar.gz 
2) Blastn genome assemblies against the nr/nt database that did not align to any reference 16S sequence (5), did not align to one of the two reference Gardnerella 16S sequences (1),  the best alignment was not to a Gardnerella reference sequence (1), or was a an environmental sample whose alignment identity was an outlier (1). Use the following:  
`blastn -db nt -query <in> -out <out> -outfmt 7 -remote`

### L. vaginalis genomes assessment
Note: this analysis was done in response to a request from reviewer 3, and is not described in the manuscript

  Two isolates (GCA_002871555.1; GCA_902362445.1) were found to potentially be *Lactobacillus vaginalis* when blasted against nr/nt . To further assess their identities, these genomes were aligned against the following pre-sketched mash databases:
  
1. `refseq.genomes.k21s1000.msh`: Sketched database of RefSeq assemblies from Mash developers. Downloaded at [https://mash.readthedocs.io/en/latest/tutorials.html#querying-read-sets-against-an-existing-refseq-sketch](https://mash.readthedocs.io/en/latest/tutorials.html#querying-read-sets-against-an-existing-refseq-sketch)
2. `Bacteria_Archaea_type_assembly_set.msh`: Sketched database of type strain Bacteria and Archea assemblies from NCBI. Curation described in:
  Sánchez-Reyes, A. & Fernández-López, M. G. Sketched reference databases for genome-based taxonomy and comparative genomics. Braz. J. Biol. 84, e256673 (2022)
  Downloaded at [https://figshare.com/articles/online_resource/Mash_Sketched_databases_for_Accessible_Reference_Data_for_Genome-Based_Taxonomy_and_Comparative_Genomics/14408801?file=30851626](https://figshare.com/articles/online_resource/Mash_Sketched_databases_for_Accessible_Reference_Data_for_Genome-Based_Taxonomy_and_Comparative_Genomics/14408801?file=3085162). 

Analysis performed in `./lvaginalis_mash/LvaginalisMash.Rmd`

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
`docker cp 923300ac2d35:/20201002_Roary_60 <file destination>` to copy output directories to repository  
3) Run Roary with a 95% blastp threshold to determine core genome  
copy to repository with the following commands:  
`docker container ls -a` to determine container names  
`docker cp aaa2f96d6956:/20201002_Roary95 <file destination>` to copy output directories to repository  

### Reconstruct phylogeny
RAxML v8.2.12 A. Stamatakis: "RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies". In Bioinformatics, 2014  
1) Construct maximum likelihood core genome phylogeny with GTR+Gamma model. Use frequency criterion for bootstrap and run "autoFC" algorithm to determine the number of bootstraps. (Pattengale et al., 2009 "How Many Bootstrap Replicates are Necessary?") in `./build_phylogeny/scripts/MLPhylogeny.sh`  
2) Root phylogeny with *Bifidobacterium longum* 51A (GCA_004936435.1) as outgroup  
* annotate with prokka `./scripts/prokkaAnnotateOutgroup.sh`
* run roary for outgroup `./scripts/roaryCoreGenome.sh` but with *B. longum* genome added to input  
+ retrieve with `docker container ls -a` to determine container name  
+ `docker cp 360c40c750e5:/20201005_Roary_outgroup <file destination>` to copy output directories to repository
+ Outgroup root the phylogeny with `./scripts/MLPhylogeny_root.sh` to run epa algorithm to root with *Bifidobacterium longum* 51A (NZ_CP026999.1)

