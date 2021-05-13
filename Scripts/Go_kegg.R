#!/usr/local/bin/Rscript
args=commandArgs(trailingOnly=TRUE)
bag<-args[1]
file<-paste(bag,"Clusters_Objects.tsv",sep="/")
x<-read.table(file,sep="\t")
nclust<-length(colnames(x))
setwd(paste(bag,"Go_kegg",sep="/"))
library(enrichR)
for(i in 1:nclust)
{
	websiteLive <- TRUE

	file_r<-paste("..",paste("Cluster",i-1,"Network_Hubs.txt",sep="_"),sep="/")
	y<-read.table(file_r,header=TRUE,sep="\t")

	dbs <- c("GO_Molecular_Function_2018")
	if(websiteLive){enriched<-enrichr(as.vector(y$Node),dbs)}
	filea1<-paste(paste("Cluster",i-1,sep="_"),"_GO_MF_Genes.png",sep="")
	png(filename=filea1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	gksa<-enriched[["GO_Molecular_Function_2018"]][which(enriched[["GO_Molecular_Function_2018"]]$P.value<=0.01),]
	filea2<-paste(paste("Cluster",i-1,sep="_"),"_GO_MF_Genes.txt",sep="")
	write.table(gksa,file=filea2,sep="\t",quote=F,col.names=NA)

	dbs <- c("GO_Cellular_Component_2018")
	if(websiteLive){enriched<-enrichr(as.vector(y$Node),dbs)}
	fileb1<-paste(paste("Cluster",i-1,sep="_"),"_GO_CC_Genes.png",sep="")
	png(filename=fileb1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	gksb<-enriched[["GO_Cellular_Component_2018"]][which(enriched[["GO_Cellular_Component_2018"]]$P.value<=0.01),]
	fileb2<-paste(paste("Cluster",i-1,sep="_"),"_GO_CC_Genes.txt",sep="")
	write.table(gksb,file=fileb2,sep="\t",quote=F,col.names=NA)

	dbs <- c("GO_Biological_Process_2018")
	if(websiteLive){enriched<-enrichr(as.vector(y$Node),dbs)}
	filec1<-paste(paste("Cluster",i-1,sep="_"),"_GO_BP_Genes.png",sep="")
	png(filename=filec1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	gksc<-enriched[["GO_Biological_Process_2018"]][which(enriched[["GO_Biological_Process_2018"]]$P.value<=0.01),]
	filec2<-paste(paste("Cluster",i-1,sep="_"),"_GO_BP_Genes.txt",sep="")
	write.table(gksc,file=filec2,sep="\t",quote=F,col.names=NA)
	
	dbs <- c("KEGG_2019_Human")
	if(websiteLive){enriched<-enrichr(as.vector(y$Node),dbs)}
	filed1<-paste(paste("Cluster",i-1,sep="_"),"_KEGG_Genes.png",sep="")
	png(filename=filed1,height=600,width=1000)
	if(websiteLive)plot(plotEnrich(enriched[[1]],showTerms=20,numChar=200,y="Count",orderBy="P.value"))
	dev.off()
	gksd<-enriched[["KEGG_2019_Human"]][which(enriched[["KEGG_2019_Human"]]$P.value<=0.01),]
	filed2<-paste(paste("Cluster",i-1,sep="_"),"_KEGG_Genes.txt",sep="")
	write.table(gksd,file=filed2,sep="\t",quote=F,col.names=NA)
	
	gks<-rbind(gksc,gksa,gksb,gksd)
	filee2<-paste(paste("Cluster",i-1,sep="_"),"_GO_KEGG_Genes.txt",sep="")
	write.table(gks,file=filee2,sep="\t",quote=F,col.names=NA)
	file.copy(filee2,"../",overwrite=TRUE)
	file.remove(filee2)
}
