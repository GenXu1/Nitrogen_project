#https://guangchuangyu.github.io/cn/2017/07/clusterprofiler-maize/
#http://yulab-smu.top/clusterProfiler-book/chapter14.html#bitr
#https://ftp.ncbi.nlm.nih.gov/gene/DATA/
##TF  http://planttfdb.gao-lab.org/index.php?sp=Zma
library(rtracklayer) 
require(clusterProfiler)
library(data.table)
library(Ropt)
require(AnnotationHub)
d0=fread("Zea_mays.gene_info",head=T,data.table=F)[,2:5]
colnames(d0)[3]="Gene"
hub <- AnnotationHub()
query(hub, "zea")
maize <- hub[['AH85440']]
f=list.files(path=".",pattern = "sig.txt")[-11]
for(i in f)##DESeq2_DEG_HN_Leaf_NEW_Old_results2.q001.fd2sig.txt
{
  out=gsub("q001.fd2sig.","",i)
  d=fread(i,head=T,data.table=F,sep="\t")
  d1=merge(d,d0,by="Gene")
  write.table(d1,out,quote=F,sep="\t",col.names = T,row.names = F)
  g=d1[,8]
 res = enrichGO(g, OrgDb=maize,pvalueCutoff = 1, pAdjustMethod = "BH",qvalueCutoff=1,ont ="MF",readable=T)
  result=res@result
  res1=result[result[,5]<=0.05,]
  out1=gsub("q001.fd2sig.","sig.GO.",i)
 if(nrow(res1)>1){  
   write.table(res1,out1,quote=F,sep="\t",col.names = T,row.names = F)
}
  out2=gsub("q001.fd2sig.txt","sig.GO.png",i)
  png(out2,res=600,units = "mm",height = 110,width = 210)
  par(mfrow=c(1,1),mar=c(4,4,1,1))
  #barplot(res, showCategory = 10,drop=T)
  dotplot(res, showCategory = 10) 
  dev.off()
}

library(clusterProfiler)
library(dplyr)
diff <- read.csv("cache/rnaseq/SvsN_diffsig05log2FC1_count_raw.normalized_annot.csv")

kegg_enrich <- as.data.frame(enrichKEGG(gene = g,organism= "zma",keyType="ncbi-geneid",pvalueCutoff = 1,qvalueCutoff = 1))