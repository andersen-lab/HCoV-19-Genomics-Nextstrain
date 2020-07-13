---
title: "Genomic Analysis of SARS-CoV-2 in San Diego"
authors: "SEARCH-Alliance"
authorLinks: "https://searchcovid.info/"
affilitations: "Scripps Research, Rady Children's Hospital, UC San Diego"
date: "June 2020"
dataset: "https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18"
abstract: "To gain insights into the the emergence, spread, and transmission of COVID-19 in our community, the SEARCH Alliance is working with a large number of partners to sequence SARS-CoV-2 samples from infected patients."
---

# [Summary](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=region&d=tree&legend=open&onlyPanels&p=full&sidebar=closed)

We analyzed 3615 publicly available SARS-CoV-2 genomes from around the world. 185 of the sequences were sequenced by the SEARCH Alliance from samples collected from individuals in San Diego county between March 3rd and May 19th. In this report, we highlight the sequencing results and a few conclusions drawn from a maximum likelihood based phylodynamic analysis.

Get the most up-to-date information via our [project page on the Andersen Lab website](https://andersen-lab.com/secrets/data/hcov-19-genomics/).
<br><br>
**Table of Contents**:  
1. [Data Generation](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=2).
2. [Data Analysis](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=3).
3. [Extensive introductions into San Diego County](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=4).
3. [Persistent transmission chains are rare](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=5).
4. [Majority of introductions are linked to European clades](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=6).
5. [Introductions peaked in early March](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=7).
6. [Scientific Credit](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=8).


# [Data Generation](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=region&d=tree&f_location=San%20Diego&legend=open&onlyPanels&p=full&sidebar=closed)
Sequences from San Diego and the rest of the sequences prepared by the SEARCH Alliance, highlighted to the right, were generated using an amplicon-based sequencing scheme using [PrimalSeq](https://www.nature.com/articles/nprot.2017.066) with the [ARTIC nCoV-2019 primer scheme](https://github.com/artic-network/artic-ncov2019/tree/master/primer_schemes/nCoV-2019).  
<br><br>
Nanopore data was processed using the [ARTIC-nCoV2019 pipeline](https://github.com/artic-network/artic-ncov2019) with [minimap2](https://github.com/lh3/minimap2) and [medaka](https://github.com/nanoporetech/medaka).  
<br><br>
Illumina data was processed using [iVar](https://github.com/andersen-lab/ivar) ([Grubaugh et al. Genome Biology 2019](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1618-7)) with [bwa](https://github.com/lh3/bwa).  
<br><br>
All consensus sequences have been deposited on GISAID and on NCBI under BioProject ID [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578). Raw read files for both Illumina and Oxford Nanopore data are available on:  
* [Google Cloud](https://console.cloud.google.com/storage/browser/andersen-lab_hcov-19-genomics).  
* SRA under BioProject ID: [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578).  


# [Data Analysis](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=region&d=tree&f_location=San%20Diego&legend=open&onlyPanels&p=full&sidebar=closed)
The pipeline used to generate this build is based on the [ncov pipeline](https://github.com/nextstrain/ncov) developed by the Bedford lab.  
<br><br>
Briefly, sequences and metadata were collected from both our repository and [GISAID](https://gisaid.org/). Genomes which were short, incomplete, too divergent, and/or had incomplete metadata were removed from the dataset. We aligned the remaining genomes to reference genome MN908947, and masked problematic sites, based on the following [post](https://virological.org/t/issues-with-sars-cov-2-sequencing-data/473), from the alignment. The alignment was then subsampled to provide context for San Diego county sequences and to reduce the computational burden of the analysis. We then generated a phylogenetic tree from the alignment using [IQ-TREE](http://www.iqtree.org/) and a time-resolved phylogeny using [TreeTime](https://github.com/neherlab/treetime). Certain geographic traits and nucleotide substitutions were then reconstructed using [Augur](https://github.com/nextstrain/augur).  


# [Extensive introductions into San Diego County](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=focal&d=tree&f_location=San%20Diego&p=full&sidebar=closed&legend=closed)
We infered the value of a two-state character (San Diego vs. non-San Diego) for each node in the phylogenetic tree to estimate  SARS-CoV-2 introductions. We then count the number of times a transmission lineage changes from non-San Diego to San Diego as the number of introductions present in the tree. Polytomies containing both San Diego and non-San Diego genomes were conservatively set as non-San Diego and any San Diego genomes which fell on the node were labeled as independent introductions. 
<br><br>
Looking broadly at the tree, San Diego colored as blue and everything else colored as orange, we can see the San Diego outbreak comprises a very larger number of introductions spread across the tree. This finding also suggests that many introductions into San Diego do not necessarily end up "taking off". This is quite different from what we have observed in certain other places, including [New Orleans](https://nextstrain.org/community/emmahodcroft/south-usa-sarscov2/louisiana?f_division=Louisiana&p=grid).  


# [Persistent transmission chains are rare](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=focal&d=tree&f_location=San%20Diego&label=clade:Z1&legend=closed&m=div&onlyPanels&p=full&sidebar=closed)
If we zoom in on one of the larger clades we can see just how numerous the introductions are. Many of these introductions are likely singletons; we have no evidence they persisted to cause further transmission. This is consistent with what we know about SARS-CoV-2, that only a small proportion of introductions progress to large transmission lineages. However, an alternative and equally likely explaination is that we have just failed to adequately sample these transmission chains again. We are, at the moment, sequencing more samples from San Diego to investigate this further.  


# [Majority of introductions are linked to European clades](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=region&d=tree&p=full&sidebar=closed&legend=closed&onlyPanels&label=clade:Z2)
We can also estimate where introductions into San Diego likely came from. Due to the lack of diversity in the tree, however, it is impossible to determine exact source locations for the vast majority of introductions. However, we can more broadly estimate the introduction sources. 
<br><br>
We find that the clade on the right and in a majority of introductions across the entire tree, San Diego sequences appear to originate from a variety of locations linking back to European introductions, and not to those directly linked to China. Since most of the introductions into the United States were sourced from Europe, this finding is consistent with the majority of introductions into San Diego coming from domestic spread within the United States, and does not necessarily mean SARS-CoV-2 spread directly from Europe to San Diego. The fact that domestic travel into San Diego far outweights international travel into San Diego also supports this idea. Finally, in certain cases we also see more direct links between the outbreak in San Diego and introductions from elsewhere in the United States - primarily from other California and West Coast locations
<br><br>
Combined, these early findings suggest that the ongoing epidemic in San Diego is the result of multiple independent introductions into the region, primarily sourced from other places in the United States.
<br><br>
As we continue to obtain more genomic information from San Diego and across the country, we will be able to gain more fine-grained information about source locations. Note, a current major limitation if the data is a lack of SARS-CoV-2 sequences from Mexico and more specifically from Baja. It is therefore impossible to see how the epidemic in San Diego may be linked to ongoing outbreaks further South.


# [Introductions peaked in early March](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18)
Lastly, we can estimate with the time-resolved phylogeny that the vast majority of introductions occured between late February and early March (Figure 1 to the right). On the graph, we can see that introductions start to occur around early February and consistently occured throughout March and into April. We can also see that while introductions did not stop, they do seem to have peaked in early March, coinciding with the state-wide stay-at-home order by Governor Newsom on March 19th, and the barring of entry to foreigh nationals on March 20th. Our sequences are also biased towards earlier samples, so we are likely missing later introductions into the region entirely. 

```auspiceMainDisplayMarkdown
<img src="https://raw.githubusercontent.com/andersen-lab/HCoV-19-Genomics-Nextstrain/master/img/introductions_filterd.png" alt="Introductions into San Diego">
<br clear="all">  

<p style="width: 500px;">
Figure 1. Plot showing the estimated number of SARS-CoV-2 introductions into San Diego over the course of the pandemic. Date of introduction is defined as the point estimate of the time of the most recent common ancestor of each detected San Diego transmission lineage. The number of datapoints in the figure is less than the number of introductions into the county because the date of introuduction was estimated from transmission lineages which excludes singletons.
</p>
```  

# [Scientific Credit](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/usa/sandiego/2020-06-18?c=region&d=map&label=clade:Z1&legend=closed&onlyPanels&p=full&sidebar=closed)

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


