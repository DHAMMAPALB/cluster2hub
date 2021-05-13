#!/usr/local/bin/Rscript
args=commandArgs(trailingOnly=TRUE)
bag<-args[1]
file<-paste(bag,"Clusters_Objects.tsv",sep="/")
x<-read.table(file,sep="\t")
nclust<-length(colnames(x))
setwd(paste(bag,"Tfs",sep="/"))
library(enrichR)
for(i in 1:nclust)
{
	websiteLive <- TRUE

	dbs <- c("ARCHS4_TFs_Coexp")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	filea1<-paste(paste("Cluster",i-1,sep="_"),"_ARCHS4_TFs.png",sep="")
	png(filename=filea1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsa<-enriched[["ARCHS4_TFs_Coexp"]][which(enriched[["ARCHS4_TFs_Coexp"]]$P.value<=0.01),]
	filea2<-paste(paste("Cluster",i-1,sep="_"),"_ARCHS4_TFs.txt",sep="")
	write.table(tfsa,file=filea2,sep="\t",quote=F,col.names=NA)

	dbs <- c("ENCODE_and_ChEA_Consensus_TFs_from_ChIP-X")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	fileb1<-paste(paste("Cluster",i-1,sep="_"),"_ENCODE_ChEA_Tfs.png",sep="")
	png(fileb1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsb<-enriched[["ENCODE_and_ChEA_Consensus_TFs_from_ChIP-X"]][which(enriched[["ENCODE_and_ChEA_Consensus_TFs_from_ChIP-X"]]$P.value<=0.01),]
	fileb2<-paste(paste("Cluster",i-1,sep="_"),"_ENCODE_ChEA_Tfs.txt",sep="")
	write.table(tfsb,file=fileb2,sep="\t",quote=F,col.names=NA)

	dbs <- c("ENCODE_TF_ChIP-seq_2015")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	filec1<-paste(paste("Cluster",i-1,sep="_"),"_ENCODE_ChIP_seq_Tfs.png",sep="")
	png(filec1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsc<-enriched[["ENCODE_TF_ChIP-seq_2015"]][which(enriched[["ENCODE_TF_ChIP-seq_2015"]]$P.value<=0.01),]
	filec2<-paste(paste("Cluster",i-1,sep="_"),"_ENCODE_ChIP_seq_Tfs.txt",sep="")
	write.table(tfsc,file=filec2,sep="\t",quote=F,col.names=NA)

	dbs <- c("Enrichr_Submissions_TF-Gene_Coocurrence")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	filed1<-paste(paste("Cluster",i-1,sep="_"),"_Gene_Coocurrence_Tfs.png",sep="")
	png(filed1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsd<-enriched[["Enrichr_Submissions_TF-Gene_Coocurrence"]][which(enriched[["Enrichr_Submissions_TF-Gene_Coocurrence"]]$P.value<=0.01),]
	filed2<-paste(paste("Cluster",i-1,sep="_"),"_Gene_Coocurrence_Tfs.txt",sep="")
	write.table(tfsd,file=filed2,sep="\t",quote=F,col.names=NA)

	dbs <- c("TF-LOF_Expression_from_GEO")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	filee1<-paste(paste("Cluster",i-1,sep="_"),"_LOF_GEO_Tfs.png",sep="")
	png(filee1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfse<-enriched[["TF-LOF_Expression_from_GEO"]][which(enriched[["TF-LOF_Expression_from_GEO"]]$P.value<=0.01),]
	filee2<-paste(paste("Cluster",i-1,sep="_"),"_LOF_GEO_Tfs.txt",sep="")
	write.table(tfse,file=filee2,sep="\t",quote=F,col.names=NA)

	dbs <- c("TF_Perturbations_Followed_by_Expression")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	filef1<-paste(paste("Cluster",i-1,sep="_"),"_Perturbations_Expressions_Tfs.png",sep="")
	png(filef1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsf<-enriched[["TF_Perturbations_Followed_by_Expression"]][which(enriched[["TF_Perturbations_Followed_by_Expression"]]$P.value<=0.01),]
	filef2<-paste(paste("Cluster",i-1,sep="_"),"_Perturbations_Expressions_Tfs.txt",sep="")
	write.table(tfsf,file=filef2,sep="\t",quote=F,col.names=NA)

	dbs <- c("TRRUST_Transcription_Factors_2019")
	if(websiteLive){enriched<-enrichr(as.vector(x[,i]),dbs)}
	fileg1<-paste(paste("Cluster",i-1,sep="_"),"_TRRUST_Tfs.png",sep="")
	png(fileg1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	tfsg<-enriched[["TRRUST_Transcription_Factors_2019"]][which(enriched[["TRRUST_Transcription_Factors_2019"]]$P.value<=0.01),]
	fileg2<-paste(paste("Cluster",i-1,sep="_"),"_TRRUST_Tfs.txt",sep="")
	write.table(tfsg,file=fileg2,sep="\t",quote=F,col.names=NA)
}
