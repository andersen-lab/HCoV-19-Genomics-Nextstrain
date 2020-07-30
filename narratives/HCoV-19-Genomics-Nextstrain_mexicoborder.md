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

We analyzed 4295 publicly available SARS-CoV-2 genomes from around the world to understand the USA-Mexico border's effect on the pandemic. 621 of the sequences were sequenced by the SEARCH Alliance from samples collected from individuals in San Diego county (508), Imperial county (74), and Tijuana (39). In this report, we highlight the sequencing results and a few conclusions drawn from a maximum likelihood based phylodynamic analysis.
<br><br>
Get the most up-to-date information via our [project page on the Andersen Lab website](https://andersen-lab.com/secrets/data/hcov-19-genomics/).
<br><br>
**Table of Contents**:  
1. [Data Generation](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=2).
2. [Data Analysis](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=3).
3. [Tijuana outbreak arouse from domestic travel](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=4).
4. [Evidence of multiple introductions into Tijuana](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=5).
5. [Tijuana sequences clade with Souther California](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=6).
6. [Scientific Credit](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=7).

# [Data Generation](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=map&f_search=Baja%20California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas,Arizona&m=div&p=full&r=division&transmissions=hide&legend=open&onlyPanels&p=full&sidebar=closed)
Sequences prepared by the SEARCH Alliance were generated using an amplicon-based sequencing scheme using [PrimalSeq](https://www.nature.com/articles/nprot.2017.066) with the [ARTIC nCoV-2019 primer scheme](https://github.com/artic-network/artic-ncov2019/tree/master/primer_schemes/nCoV-2019).  
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


# [Tijuana outbreak arouse from European and North American clade](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&d=tree&f_search=Baja%20California&p=full&legend=closed&onlyPanels&sidebar=closed&c=search)
The 39 newly generated sequences from Tijuana, highlighted in orange on the tree to the right, are the first sequences from Baja California and more than double the available sequences from Mexico. All samples were collected from individuals in Tijuana between March 25th and April 29th, 2020. 
<br><br>
All of the newly generated sequences fall within clade A2 which is characterized by the Spike-D614G substitution. This clade arouse in Europe, but has since become endemic in the USA and Canada. Since most of the San Diego and Imperial county sequences also fall within this clade, this finding is consistent with the outbreak in Tijuana being linked to the outbreaks in Southern California. The two locations' close proximity, binational populations, and substantial crossborder movement also support this idea.
<br><br>
*Note: Clade labels Z1 and Z2 are not biologically relevent and are only included for visualization purposes.*


# [Evidence of multiple introductions into Tijuana](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&c=search&d=tree&f_search=Baja%20California&label=clade:Z2&m=div&onlyPanels&p=full&sidebar=closed)
Zooming in to the subclade within A2 that contains the most Tijuana sequences, we can see that the Tijuana samples are quite dispersed and rarely cluster together. Similar to what we've seen in [San Diego](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=4), the outbreak in Tijuana was likely seeded by a numerous seperate introductions. Most of these introductions come from polytomies, where an ancestral node has multiple branches coming out of it, and thus the source is difficult to identify. 
<br><br>
While we know that there is a growing number of coronavirus cases in Baja California, it is difficult to determine whether this is driven by reintroductions from outside the state or sustained transmission within the state based on the genetic information. Tijuana sequences failing to cluster together would imply the former, but the small number of sequences and limited collection date range make it difficult to say anything conclusively. We are hoping to sequence more isolates from Baja California and Mexico to explore this further.


# [Tijuana sequences are most similar to Southern California sequences](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=tree&f_search=Arizona,Baja%20California,California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas&label=clade:A2&p=full&onlyPanels&sidebar=closed)
In the tree, none of the Tijuana sequences (Baja California sequences are colored in red) cluster with the 28 sequences from other locations in Mexico (colored in dark red) indicating that the situtation there, and perhaps along the entire border, is distinct from the rest of Mexico. Instead, Tijuana sequences cluster with US border states. The vast majority specifically cluster with Southern California sequences (San Diego county sequences in blue, and Imperial county sequences in orange). The magnitude of northbound and southbound transmissions is difficult to assess, but movement across the US-Mexico border is evident and there is a clear similarity between the San Diego and Tijuana outbreaks.


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
**Infectolab, Tijuana**<br>
Samuel Navarro, Carlos Cota
<br><br>
**Analysis Partners**<br>
Marc Suchard, UCLA
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


