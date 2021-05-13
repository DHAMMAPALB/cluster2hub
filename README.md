# cluster2hub: for the identification of hubs in the gene co-expression cluster network
This pipeline identifies transcription factors, kinases and other proteins as hubs in the networks of gene co-expression clusters. I present an integrative approach to construct protein interactions networks of transcription factors, kinases and proteins of optimal gene co-expression clusters and identify functional annotations and pathways and drug chemical interactions of hubs.

# Requirements
Python: clust
R: igraph, enrichR
PERL
 
# Installation

```
sudo chmod +x -R cluster2hub/Scripts/*
echo 'export PATH="your-dir/cluster2hub/Scripts/:$PATH"' >> ~/.bashrc
source ~/.bashrc

```
# Usage
Usage: cluster2hub [-h] [-f <file>] [-r <replicates>] [-p <ppis>] [-t <hubs>] [-i <interactions>] [-d <directory>]
positional arguments:
	-f <file>			Input expression file
	-p <ppis>			Protein-proteins interactions file
optional arguments:
	-h, --help			Shows this help message and exit
	-r <replicates>			Replicates structure file
	-t <hubs>			Percent of top degree nodes
	-i <interactions>		Drug gene interactions file
	-d <directory>			Output directory
Others: Tfs.R <directory>
	Tfs_all.pl <directory>
	Kinases.R <directory>
	Kinases_all.pl <directory>
	Tfs_all_ppis.pl <directory> <ppis>
	Kinases_all_ppis.pl <directory> <ppis>
	Networks.R <directory> <hubs>
	Go_kegg.R <directory>
	Dgi.pl <directory> <interactions>

# Example

```
cluster2hub -f Test.txt -r Test_replicates.txt -p PPIs.txt -d Cluster2hub_out -i dgi.tsv

```

![Clusters plot] (Examples/Cluster2hub_out/Clusters_profiles.pdf)

*Figure 1: Clusters plot

![Clusters plot] (Examples/Cluster2hub_out/Cluster_0_Network.pdf)

*Figure 2: Protein interactions network of a Cluster

