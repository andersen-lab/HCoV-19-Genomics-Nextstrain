---
title: "Genomic Analysis of SARS-CoV-2 across the US-Mexico Border"
authors: "SEARCH-Alliance"
authorLinks: "https://searchcovid.info/"
affilitations: "Scripps Research, Rady Children's Hospital, UC San Diego"
updated: "July 2020"
dataset: "https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?lang=es"
abstract: "To gain insights into the the emergence, spread, and transmission of COVID-19 in our community, the SEARCH Alliance is working with a large number of partners to sequence SARS-CoV-2 samples from infected patients."
---

# [Summary](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=tree&legend=open&onlyPanels&p=full&sidebar=closed)

We analyzed 4295 publicly available SARS-CoV-2 genomes from around the world, with a focus on genomes from Mexico and southern US border states, to understand the dynamics of cross border transmission of the virus. 621 of the sequences were sequenced by the SEARCH Alliance from samples collected from individuals in San Diego county (508), Imperial county (74), and Tijuana (39). In this report, we highlight the sequencing results and a few conclusions drawn from a maximum likelihood based phylodynamic analysis.
<br><br>
Get the most up-to-date information via our [project page on the Andersen Lab website](https://andersen-lab.com/secrets/data/hcov-19-genomics/).
<br><br>
**Table of Contents**:  
1. [Data Generation](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=2).
2. [Data Analysis](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=3).
3. [Tijuana outbreak linked with European and North American lineages](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=4).
4. [Evidence of multiple introductions into Tijuana](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=5).
5. [Tijuana sequences cluster with Southern California](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=6).
6. [Scientific Credit](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31?n=7).

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
Briefly, sequences and metadata were collected from both our repository and [GISAID](https://gisaid.org/). Genomes which were short, incomplete, too divergent, and/or had incomplete metadata were removed from the dataset. We aligned the remaining genomes to reference genome MN908947, and masked problematic sites from the alignment, based on the following [post](https://virological.org/t/issues-with-sars-cov-2-sequencing-data/473), from the alignment. The alignment was then subsampled to provide context for sequences collected in Mexico and in border states (Arizona, California, New Mexico, and Texas) and to reduce the computational burden of the analysis. We then generated a phylogenetic tree from the alignment using [IQ-TREE](http://www.iqtree.org/) and a time-resolved phylogeny using [TreeTime](https://github.com/neherlab/treetime). Certain geographic traits and nucleotide substitutions were then reconstructed using [Augur](https://github.com/nextstrain/augur).  


# [Tijuana outbreak linked with European and North American lineages](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&d=tree&f_search=Baja%20California,Mexico&p=full&legend=closed&onlyPanels&sidebar=closed&c=search)
The 39 newly generated sequences from Tijuana, highlighted in yellow on the tree to the right, are the first sequences from Baja California and more than double the available sequences from Mexico (colored in orange). All samples were collected from individuals in Tijuana between March 25th and April 29th, 2020. 
<br><br>
All of the newly generated sequences fall within clade 20A (using the [Nextstrain clade naming scheme](https://virological.org/t/year-letter-genetic-clade-naming-for-sars-cov-2-on-nextstrain-org/498)) which is characterized by the Spike-D614G substitution. This clade originated in Europe, but has since become endemic in the USA and Canada. 
<br><br>
*Note: Clade labels Z1 and Z2 are not biologically relevent and are only included for visualization purposes.*


# [Evidence of multiple introductions into Tijuana](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&c=search&d=tree&f_search=Baja%20California&label=clade:Z2&m=div&onlyPanels&p=full&sidebar=closed)
Zooming into the subclade within 20A that contains the most Tijuana sequences, we can see that the samples are quite dispersed and rarely cluster together. The outbreak in Tijuana was likely seeded by a number of  separate introductions which is similar to what we observe in the outbreak in [San Diego](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=4). However, given the large number of polytomies in the maximum likelihood tree, with a number of branches often descending from a single ancestral node, it is hard to determine the exact source of these introductions.
<br><br>
While we know that there is an ongoing outbreak of Covid-19 in Baja California, it is difficult to determine whether the outbreak is mainly driven by introductions from outside the state or sustained transmission within the state, based on the current analysis. The small number of sequences and limited collection date range, with most sequences sampled in late April, make it difficult to determine the primary driver of the Tijuana outbreak. We will be sequencing more isolates from Baja California and Mexico to explore this further.


# [Tijuana sequences are most similar to Southern California sequences](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=tree&f_search=Arizona,Baja%20California,California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas&legend=open&label=clade:20A&p=full&onlyPanels&sidebar=closed)
In the tree, none of the Tijuana sequences (colored in yellow) cluster with the 28 sequences from other locations in Mexico (colored in orange) indicating that the outbreak in Tijuana is distinct from the rest of Mexico. However, the Tijuana sequences cluster with sequences from US border states, specifically the Southern California sequences (San Diego county sequences in blue, and Imperial county sequences in purple). The magnitude of cross border transmission and directionality cannot be determined based on the current analysis. However, it is clear that there is movement across the US-Mexico border given that the Tijuana sequences and the Southern California sequences cluster together in the phylogenetic tree.


# [Scientific Credit](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=map&label=clade:Z1&legend=closed&onlyPanels&p=full&sidebar=closed)

We would like to acknowledge the amazing and timely work done by all of our collaborators:
<br><br>
**San Diego Partners**<br>
[SEARCH Alliance, San Diego](https://searchcovid.info/).
<br><br>
**San Diego County Public Health Laboratory**<br>
Tracy Basler, Jovan Shephard, Brett Austin, Raymond Chinn, Nikos Gurfield, Eric McDonald
<br><br>
**Imperial County Public Health Department**<br>
Holly Maag, Stephen Munday, Paula Kriner
<br><br>
**California Department of Public Health**<br>
Debra Wadford, Phacharee Arunleung, Kathleen Jacobson, Cindy Wong, Dominick Morales, John Bell, Sharon Messenger, Alice Chen
<br><br>
**UCSD – Center for Advanced Laboratory Medicine**<br>
Jenny Shin, David Pride
<br><br>
**UCSD – Division of Infectious Diseases and Global Public Health**<br>
Sara Browne
<br><br>
**Rady Children Hospital, San Diego**<br>
Christina Clarke, Michelle Vanderpool, Teresa Mueller, Denise Malicki
<br><br>
**Scripps Health, San Diego**<br>
Michael Quigley, Ellen Stefanski, Ian McHardy
<br><br>
**New Orleans**<br>
Allison Smither, Gilberto Sabino-Santos, Patricia Snarski, Lilia Melnik, Antoinette Bell, Kaylynn Genemaras, Arnaud Drouin, Dahlene Fusco, Robert Garry
<br><br>
**Louisiana**<br>
Jeremy Kamil, Vaughn Cooper
<br><br>
**Infectolab, Tijuana**<br>
Samuel Navarro Alvarez, Carlos A. Cota Haros, Octavio Renteria Pacheco
<br><br>
**Biolab, Jordan**<br>
Issa Abu-Dayyeh, Ahmad Tibi, Lama Hussein, Lina Mohammad, Zein Naber, Amid Abdelnour
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
