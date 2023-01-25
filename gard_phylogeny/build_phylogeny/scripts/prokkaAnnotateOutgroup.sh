#!/bin/bash

#commands to annotate outgorup genome Bifidobacterium longum 51A with prokka v1.14.6

prokka --outdir '/Volumes/GoogleDrive/My Drive/Callahan Lab/metagenome_gardnerella/gardPhylogeny/prokka_annotated_genomes/B_longum_51A' --prefix B_longum_51A --locustag B_longum_51A --prefix B_longum_51A --genus Bifidobacterium --species longum --strain B_longum_51A --addgenes --addmrna --usegenus --cpu 2 '/Volumes/GoogleDrive/My Drive/Callahan Lab/metagenome_gardnerella/gardPhylogeny/_ncbi_downloads/GCA_004936435.1_ASM493643v1_genomic.fna'