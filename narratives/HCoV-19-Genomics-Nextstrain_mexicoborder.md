---
title: "Genomic Analysis of SARS-CoV-2 in San Diego"
authors: "SEARCH-Alliance"
authorLinks: "https://searchcovid.info/"
affilitations: "Scripps Research, Rady Children's Hospital, UC San Diego"
date: "June 2020"
dataset: "https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder"
abstract: "To gain insights into the the emergence, spread, and transmission of COVID-19 in our community, the SEARCH Alliance is working with a large number of partners to sequence SARS-CoV-2 samples from infected patients."
---

# [Summary](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=tree&legend=open&onlyPanels&p=full&sidebar=closed)

We analyzed 4295 publicly available SARS-CoV-2 genomes from around the world to understand the USA-Mexico border's effect on the pandemic. 621 of the sequences were sequenced by the SEARCH Alliance from samples collected from individuals in San Diego county (508), Imperial county (74), and Baja California (39). In this report, we highlight the sequencing results and a few conclusions drawn from a maximum likelihood based phylodynamic analysis.

Get the most up-to-date information via our [project page on the Andersen Lab website](https://andersen-lab.com/secrets/data/hcov-19-genomics/).
<br><br>
**Table of Contents**:  
1. [Data Generation](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=2).
2. [Data Analysis](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=3).


# [Data Generation](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=map&f_search=Baja%20California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas,Arizona&m=div&p=full&r=division&transmissions=hide&legend=open&onlyPanels&p=full&sidebar=closed)
Sequences prepared by the SEARCH Alliance, highlighted to the right, were generated using an amplicon-based sequencing scheme using [PrimalSeq](https://www.nature.com/articles/nprot.2017.066) with the [ARTIC nCoV-2019 primer scheme](https://github.com/artic-network/artic-ncov2019/tree/master/primer_schemes/nCoV-2019).  
<br><br>
Nanopore data was processed using the [ARTIC-nCoV2019 pipeline](https://github.com/artic-network/artic-ncov2019) with [minimap2](https://github.com/lh3/minimap2) and [medaka](https://github.com/nanoporetech/medaka).  
<br><br>
Illumina data was processed using [iVar](https://github.com/andersen-lab/ivar) ([Grubaugh et al. Genome Biology 2019](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1618-7)) with [bwa](https://github.com/lh3/bwa).  
<br><br>
All consensus sequences have been deposited on GISAID and on NCBI under BioProject ID [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578). Raw read files for both Illumina and Oxford Nanopore data are available on:  
* [Google Cloud](https://console.cloud.google.com/storage/browser/andersen-lab_hcov-19-genomics).  
* SRA under BioProject ID: [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578).  


# [Data Analysis](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=map&f_search=Baja%20California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas,Arizona&m=div&p=full&r=division&transmissions=hide&legend=open&onlyPanels&p=full&sidebar=closed)
The pipeline used to generate this build is based on the [ncov pipeline](https://github.com/nextstrain/ncov) developed by the Bedford lab.  
<br><br>
Briefly, sequences and metadata were collected from both our repository and [GISAID](https://gisaid.org/). Genomes which were short, incomplete, too divergent, and/or had incomplete metadata were removed from the dataset. We aligned the remaining genomes to reference genome MN908947, and masked problematic sites, based on the following [post](https://virological.org/t/issues-with-sars-cov-2-sequencing-data/473), from the alignment. The alignment was then subsampled to provide context for sequences collected in Mexico and in border states (Arizona, California, New Mexico, and Texas) and to reduce the computational burden of the analysis. We then generated a phylogenetic tree from the alignment using [IQ-TREE](http://www.iqtree.org/) and a time-resolved phylogeny using [TreeTime](https://github.com/neherlab/treetime). Certain geographic traits and nucleotide substitutions were then reconstructed using [Augur](https://github.com/nextstrain/augur).  




# [Scientific Credit](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=map&label=clade:Z1&legend=closed&onlyPanels&p=full&sidebar=closed)

We would like to acknowledge the amazing and timely work done by all of our collaborators:
<br><br>
**San Diego Partners**<br>
[SEARCH Alliance, San Diego](https://searchcovid.info/).
<br><br>
**San Diego County Public Health Laboratory**<br>
Tracy Basler, Jovan Shephard, Brett Austin
<br><br>
**UCSD – Center for Advanced Laboratory Medicine**<br>
Jenny Shin, David Pride
<br><br>
**Rady Children Hospital, San Diego**<br>
Christina Clarke, Michelle Vanderpool, Teresa Mueller, Denise Malicki
<br><br>
**Scripps Health, San Diego**<br>
Michael Quigley, Ellen Stefanski, Ian McHardy
<br><br>
**Analysis Partners**<br>
Marc Suchard, UCLA<br>
<br>
Lauren Gardner, Johns Hopkins
<br>
Philippe Lemey, KU Leuven
<br>
Alexander Watts & Kamran Khan, BlueDot
<br>
Emma Hodcroft, Nextstrain

<br><br>
**Disclaimer**. Please note that this data is still based on work in progress and should be considered preliminary. If you intend to include any of these data in publications, please let us know – otherwise please feel free to download and use without restrictions. We have shared this data with the hope that people will download and use it, as well as scrutinize it so we can improve our methods and analyses. Please contact us if you have any questions or comments – we’ll buy beers for #ResearchParasites that spot flaws and faults in the data and come up with improvements!

---
**Andersen Lab**  
The Scripps Research Institute  
La Jolla, CA, USA  
[data@andersen-lab.com](mailto:data@andersen-lab.com).


