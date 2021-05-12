#!/usr/local/bin/Rscript
args=commandArgs(trailingOnly=TRUE)
bag<-args[1]
file<-paste(bag,"Clusters_Objects.tsv",sep="/")
x<-read.table(file,sep="\t")
nclust<-length(colnames(x))
setwd(paste(bag,"Kinases",sep="/"))
library(enrichR)
for(i in 1:nclust)
{
	websiteLive <- TRUE

	file_r<-paste("..",paste("Cluster",i-1,"Tfs_all.txt",sep="_"),sep="/")
	y<-read.table(file_r,header=TRUE,sep="\t")
	
	dbs <- c("ARCHS4_Kinases_Coexp")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	filea1<-paste(paste("Cluster",i-1,sep="_"),"_ARCHS4_Kinases.png",sep="")
	png(filename=filea1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	ksa<-enriched[["ARCHS4_Kinases_Coexp"]][which(enriched[["ARCHS4_Kinases_Coexp"]]$P.value<=0.01),]
	filea2<-paste(paste("Cluster",i-1,sep="_"),"_ARCHS4_Kinases.txt",sep="")
	write.table(ksa,file=filea2,sep="\t",quote=F,col.names=NA)

	dbs <- c("HMS_LINCS_KinomeScan")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	fileb1<-paste(paste("Cluster",i-1,sep="_"),"_KinomeScan_Kinases.png",sep="")
	png(filename=fileb1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	ksb<-enriched[["HMS_LINCS_KinomeScan"]][which(enriched[["HMS_LINCS_KinomeScan"]]$P.value<=0.01),]
	fileb2<-paste(paste("Cluster",i-1,sep="_"),"_KinomeScan_Kinases.txt",sep="")
	write.table(ksb,file=fileb2,sep="\t",quote=F,col.names=NA)

	dbs <- c("Kinase_Perturbations_from_GEO_down")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	filec1<-paste(paste("Cluster",i-1,sep="_"),"_GEO_down_Kinases.png",sep="")
	png(filename=filec1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	ksc<-enriched[["Kinase_Perturbations_from_GEO_down"]][which(enriched[["Kinase_Perturbations_from_GEO_down"]]$P.value<=0.01),]
	filec2<-paste(paste("Cluster",i-1,sep="_"),"_GEO_down_Kinases.txt",sep="")
	write.table(ksc,file=filec2,sep="\t",quote=F,col.names=NA)

	dbs <- c("Kinase_Perturbations_from_GEO_up")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	filed1<-paste(paste("Cluster",i-1,sep="_"),"_GEO_up_Kinases.png",sep="")
	png(filename=filed1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	ksd<-enriched[["Kinase_Perturbations_from_GEO_up"]][which(enriched[["Kinase_Perturbations_from_GEO_up"]]$P.value<=0.01),]
	filed2<-paste(paste("Cluster",i-1,sep="_"),"_GEO_up_Kinases.txt",sep="")
	write.table(ksd,file=filed2,sep="\t",quote=F,col.names=NA)

	dbs <- c("L1000_Kinase_and_GPCR_Perturbations_down")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	filee1<-paste(paste("Cluster",i-1,sep="_"),"_L1000_down_Kinases.png",sep="")
	png(filename=filee1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	kse<-enriched[["L1000_Kinase_and_GPCR_Perturbations_down"]][which(enriched[["L1000_Kinase_and_GPCR_Perturbations_down"]]$P.value<=0.01),]
	filee2<-paste(paste("Cluster",i-1,sep="_"),"_L1000_down_Kinases.txt",sep="")
	write.table(kse,file=filee2,sep="\t",quote=F,col.names=NA)

	dbs <- c("L1000_Kinase_and_GPCR_Perturbations_up")
	if(websiteLive){enriched<-enrichr(as.vector(y$Term),dbs)}
	filef1<-paste(paste("Cluster",i-1,sep="_"),"_L1000_up_Kinases.png",sep="")
	png(filename=filef1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	ksf<-enriched[["L1000_Kinase_and_GPCR_Perturbations_up"]][which(enriched[["L1000_Kinase_and_GPCR_Perturbations_up"]]$P.value<=0.01),]
	filef2<-paste(paste("Cluster",i-1,sep="_"),"_L1000_up_Kinases.txt",sep="")
	write.table(ksf,file=filef2,sep="\t",quote=F,col.names=NA)
}
