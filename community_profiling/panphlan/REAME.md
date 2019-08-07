README: PanPhlAn Install and use
Author: HLB
Date: 7/23/2019

# PanPhlAn Install and Use

## I: Install
`cd /home/hlberman/Applications
 wget https://bitbucket.org/cibiocm/panphlan/get/default.zip 
 unzip default.zip
 mkdir panphlan
 mv CibioCM-panphlan-*/panphlan_* panphlan/
 rm -r default.zip
 rm -r CibioCM-panphlan-5b76e973a045`
 Version 1.2.2.3
 
 Make sym links of PanPhlAn commands to `/bin` folder that is in PATH
 
 `ln -s /home/hlberman/Applications/panphlan/panphlan_map.py /home/hlberman/bin/
ln -s /home/hlberman/Applications/panphlan/panphlan_profile.py /home/hlberman/bin/
ln -s /home/hlberman/Applications/panphlan/panphlan_pangenome_generation.py /home/hlberman/bin/`

## II: Run
### A) Database
Pangenome database of a bacterial species
#### 1) Premade
PanPhlan has 400 premade pangenome databases. A premade database *Gargnerella vaginalis* is available. 
To download:
`cd /home/hlberman/Applications/panphlan
mkdir databases
cd ./databases
wget https://www.dropbox.com/sh/rfwb4i9m8s40iba/AABlV45MFRrpDG5E_XEcJ88ta/panphlan_gvaginalis16.zip
unzip panphlan_gvaginalis16.zip`

#### 2) Made with our 72 strains. 
a) First, need the `.fna` fasta genome files and `.gff` annotations. Place these into the following respective folders:
`/home/hlberman/Applications/panphlan/databases/gvaginalis_72/fna`
`/home/hlberman/Applications/panphlan/databases/gvaginalis_72/gff`
b) Run PanPhlAn to generate pangenome database
Commands in shell script:
`~/VMMG/panphlan/scripts/make_gvaginalis72_pangenome.sh`
NOTE: run on mac. Error running on cluster in Linux: ran  with following:
`/Users/hlberman/Desktop/panphlan_pangenome_generation.py -c gvaginalis72 --i_gff /Users/hlberman/Desktop/gvaginalis_72/gff -o /Users/hlberman/Desktop/databases/ --verbose --roary_dir /Users/hlberman/Desktop/gvaginalis_72/roary_dir/`  
See: `/home/hlberman/VMMG/panphlan/20180725_gvaginalis_pangenome_log` for log. 
Save in  `/home/hlberman/Applications/panphlan/databases`

### B) Map  
Screen metagenomic samplkes for species-related genes by mapping against the species database.
a) Map each sample with `~/VMMG/panphlan/scripts/map_gvaginalis_pangenome.sh` and send output to `~/VMMG/panphlan/scripts/map_outs/`
b) Call each sample with `~/VMMG/panphlan/scripts/map_commands.sh`

### C) Profile
Merge and process the mapping results to get the final gene-family presence/absence profiles of all detected strains.
a) Profile with `~/VMMG/panphlan/scripts/profile_gvaginalis_pangenome.sh`
b) Notes: 
i) panphlan only profiles the dominant strain. Strains that panphlan determinted may contain multiple strains: 1001301158, 1001301248, 1001301318, 1002701138, 1002701158, 1061635208, 1061635368, 1062901138, 1062901218, 1062901318, 1900401198, 1902401118, 1902401308, 2050501168, 4002101198, 4002135018, 4003235288, 4003235368, 4004735328, 4004735368, 4005935278, 4005935328, 4007135148, 4007135288, 4007435258,  4008434348, 4008435158, 4009035268
ii) The following gene presence/absence information may come from multiple strains within the sample (number of gene families were 10% higher than expected (average; 1257): 1001301248, 1001301318, 1002701158, 1061635368, 1062901218, 2050501168, 4002135018, 4003235368, 4004735328, 4007135148, 4009035268

### D) Add metadata
Add metadata in R with script: `/scripts/add_metadata.Rmd`

### E) Visualization and heirarchical clustering
Clustering is based on Jaccard distance between presence/absence profiles can be created by any heirarchical clustering software, including hclust, Matlab, or R.
Above install did not provide tools folder. Download folder with tools with `hg clone https://bitbucket.org/CibioCM/panphlan` (also 1.2.2.3)
Perform heirarchical clustering with script `/scripts/hclust_gvaginalis72_pangenome.sh`

