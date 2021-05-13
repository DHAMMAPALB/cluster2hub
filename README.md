# cluster2hub: for the identification of hubs in the gene co-expression cluster network
This pipeline identifies transcription factors, kinases and other proteins as hubs in the networks of gene co-expression clusters. I present an integrative approach to construct protein interactions networks of transcription factors, kinases and proteins of optimal gene co-expression clusters and identify functional annotations and pathways and drug chemical interactions of hubs.

# Requirements
- Python: clust
- R: igraph, enrichR
- PERL
- Live connection
 
# Installation

```
sudo chmod +x -R cluster2hub/Scripts/*
echo 'export PATH="your-dir/cluster2hub/Scripts/:$PATH"' >> ~/.bashrc
source ~/.bashrc

```
# Usage

```
Usage: cluster2hub [-h] [-f <file>] [-r <replicates>] [-p <ppis>] [-t <hubs>] [-i <interactions>] [-d <directory>]
positional arguments:
	-f <file>			: Input expression file
	-p <ppis>			: Protein-proteins interactions file
optional arguments:
	-h, --help			: Shows this help message and exit
	-r <replicates>			: Replicates structure file
	-t <hubs>			: Percent of top degree nodes, default = 5
	-i <interactions>		: Drug gene interactions file
	-d <directory>			: Output directory
Others: Tfs.R <directory>
	Tfs_all.pl <directory>
	Kinases.R <directory>
	Kinases_all.pl <directory>
	Tfs_all_ppis.pl <directory> <ppis>
	Kinases_all_ppis.pl <directory> <ppis>
	Networks.R <directory> <hubs>
	Go_kegg.R <directory>
	Dgi.pl <directory> <interactions>
```

# Example

```
cluster2hub -f Test.txt -r Test_replicates.txt -p PPIs.txt -t 2 -i dgi.tsv -d Cluster2hub_out

```

#### The example figures:

![Clusters plot](Example/Cluster2hub_out/Clusters_profiles.pdf "Cluster profiles")

*Figure 1: Clusters plot.

![PPIs network](Example/Cluster2hub_out/Cluster_0_Network.pdf "Cluster 0 protein interactions network")

*Figure 2: Clusters 0 protein interactions network. Pink nodes are transcription factors, blue are kinases and green nodes are the proteins in the Cluster 0.

![PPIs network](Example/Cluster2hub_out/Cluster_1_Network.pdf "Cluster 1 protein interactions network")

*Figure 3: Clusters 1 protein interactions network. Pink nodes are transcription factors, blue are kinases and green nodes are the proteins in the Cluster 1.

# References

- Basel Abu-Jamous and Steven Kelly (2018) Clust: automatic extraction of optimal co-expressed gene clusters from gene expression data. Genome Biology 19:172; doi: https://doi.org/10.1186/s13059-018-1536-8.
- Wajid Jawaid (2021). enrichR: Provides an R Interface to 'Enrichr'. R package version 3.0. https://CRAN.R-project.org/package=enrichR
- Csardi G, Nepusz T: The igraph software package for complex network research, InterJournal, Complex Systems 1695. 2006. https://igraph.org


