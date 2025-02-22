# *Gardnerella* Diversity and Ecology in Pregnancy and Preterm Birth
Analysis of *Gardnerella* clades and species using shotgun metagenomic sequencing data from vaginal swabs of pregnant women in three distinct cohorts: 
1) Stanford Enriched
2) University of Alabama at Birmingham (UAB) Enriched 
3) Multi-Omic Microbiome Study: Pregnancy Initiative (MOMS-PI) 
The two "Enriched" cohorts were selected for high abundance of *Gardnerella* based on previously conducted 16S amplicon sequencing in these subjects
A fourth cohort was created by subsetting from the MOMS-PI cohort to create a cohort also enriched for *Gardnerella*:
4) MOMS-PI Enriched
More details on analyses of each of the following steps can be found in the directories described below. Knit html markdowns can be found in the directory [./knit_html_markdowns](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns)

  Note: participant metadata are not provided in this GitHub repository.

## Build reference *Gardnerella* phylogeny
Create a core genome phylogeny from whole-genome sequences of *Gardnerella* isolates from GenBank  
Code and analyses in [./gard_phylogeny](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/gard_phylogeny)  directory
Knit html markdown of phylogeny information: [./knit_html_markdowns/coreGenomeAndPhylogeny.html](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/coreGenomeAndPhylogeny.html)
  
## Filter host DNA from shotgun metagenome sequencing data
Filter host data with BBmap by aliging against reference human genome.  
Code in [./filter_host](https://github.com/hannalberman/pregnancy_metagenome/tree/master//filter_host) directory
  
## Measure vaginal microbiome species abundance
Measure presence and abundance of vaginal microbiome taxa.  
Code and analyses in the directory [./metaphlan4](https://github.com/hannalberman/pregnancy_metagenome/tree/master/metaphlan4)
  
## Measure *Gardnerella* clades and species in shotgun metagenomic sequencing data
Assign shortreads to clades of *Gardnerella * using a curated reference database made from a set of core genes from *Gardnerella* reference genomes and validate against *Gardnerella* measurements from 16S amplicon sequencing data and MetaPhlAn4.  
All code and analyses in [./clade_assignments](https://github.com/hannalberman/pregnancy_metagenome/tree/master/clade_assignments) directory  
Knit html of comparison to clade and species assignements 16S amplicon sequencing data in a subset of the samples: [./knit_html_markdowns/shotgunVs16SVariants.html](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/shotgunVs16SVariants.html)  
Knit html of comparison between *Gardnerella* marker gene reads found by aligning against our custom database to *Gardnerella* reads found by MetaPhlan4 aligning to its own marker gene database:[./knit_html_markdowns/compareMetaphlanMapping.html](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/compareMetaphlanMapping.html)
  
## Assessment of *Gardnerella* clades and species and community signatures of the vaginal microbiome and preterm birth
Analyses performed include assessment of prevalence and abundance of *Gardnerella* variants, number of clades vs. microbial load, taxon presence-absence vs. microbial load, taxon co-occurrence, and associations of *Gardnerella* clades and preterm birth.  
All code and analyses in [metagenome_gardnerella.Rmd](https://github.com/hannalberman/pregnancy_metagenome/tree/master/metagenome_gardnerella.Rmd)  
Knit html markdown of these community analyses: [./knit_html_markdowns/metagenome_gardnerella.html](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/metagenome_gardnerella.html)
  
## rarefied_gard_counts
Rarefy to common read depth of 100,000 microbial reads and then measure *Gardnerella* clades and genomospecies in order to avoid impacts of read depth when testing associations between *Gardnerella* clade count and microbial load or preterm birth.  
All code and measurements of *Gardnerella* clades, species, and other taxa in [./rarefied_gard_counts](https://github.com/hannalberman/pregnancy_metagenome/tree/master/rarefied_gard_counts) directory  

## *Gardnerella* 16S rRNA ASVs in previously collected cohorts
Survey V4 16s rRNA gene amplicon sequencing data from previous studies of the vaginal microbiome and preterm birth for *Gardnerella* ASVs.  
All code and analyses in [./gardnerella_asv_studies](https://github.com/hannalberman/pregnancy_metagenome/tree/master/gardnerella_asv_studies) directory  
Knit html markdown of 16S studies: [./knit_html_markdowns/gardnerella_diversity.html](https://github.com/hannalberman/pregnancy_metagenome/tree/master/knit_html_markdowns/gardnerella_diversity.html)
  
## Other files
* [gardCladeRelativeAbundance.tsv](https://github.com/hannalberman/pregnancy_metagenome/tree/master/gardCladeRelativeAbundance.tsv): Relative abundance of *Gardnerella* clades in Stanford Enriched and UAB Enriched Cohorts
* [gardGenomospeciesRelativeAbundance.tsv](https://github.com/hannalberman/pregnancy_metagenome/tree/master/gardGenomospeciesRelativeAbundance.tsv): Relative abundance of *Gardnerella* species in Stanford Enriched and UAB Enriched Cohorts
* [hmp2gardCladeRelativeAbundance.tsv](https://github.com/hannalberman/pregnancy_metagenome/tree/master/hmp2gardCladeRelativeAbundance.tsv): Relative abundance of *Gardnerella* clades in MOMS-PI Cohort
* [hmp2gardGenomospeciesRelativeAbundance.tsv](https://github.com/hannalberman/pregnancy_metagenome/tree/master/hmp2gardGenomospeciesRelativeAbundance.tsv): Relative abundance of *Gardnerella* species in MOMS-PI Cohort
* [HMP2highGardSubjects.txt](https://github.com/hannalberman/pregnancy_metagenome/tree/master/HMP2highGardSubjects.txt): Subset of subjects from MOMS-PI cohort in MOMS-PI Enriched Cohort
* [refGardnerellaCladesGenomos.csv](https://github.com/hannalberman/pregnancy_metagenome/tree/master/refGardnerellaCladesGenomos.csv): Clade and species identities of reference *Gardnerella* assemblies


