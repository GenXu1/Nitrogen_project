library("data.table")
library(Ropt)
chr=5;s=47;e=49
pdf("GWAS_Signals_at_GLR2_GEMMA_V4.pdf",height = 3,width =4)
par(mfrow=c(1,1),mar=c(4,4,1,1))

 i="GLR.Zm00001d014456_L3Tip_FPKM.assoc.txt"
  na=gsub("_FPKM.assoc.txt","",i)
  g=unlist(strsplit(na,split = "_"))[1]
 d=fread(i,header = T,data.table=F)
d[,3]=d[,3]/1e6
d=d[d[1]==chr & d[,3]>=s & d[,3]<=e,]
if(nrow(d)==0){plot(3:50,xlim=c(s,e),xlab="",ylab="-log10(P)",axes=F,cex=0.5,ylim=c(3,35),col="white",main=na)
  axis(2,las=1)
  axis(1)
  ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
  ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
  rect(ann[,3],3,ann[,4],4,col="gray",border = "gray")
  glu=ann[c(8,10:11),]
  rect(glu[,3],3,glu[,4],4,col="red",border = "red")
  g1=ann[ann[,1]==g,]
  rect(g1[,3],3,g1[,4],4,col="blue",border = "blue")
  axis(1)
  next;
  }
plot(d[,3],-log10(d[,13]),col="black",pch=16,xlab="",ylab="-log10(P)",axes=F,cex=0.5,ylim=c(-3,max(-log10(d[,13]))),main=na,xlim=c(s,e))
axis(2,las=1)
axis(1)
ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
rect(ann[,3],-3,ann[,4],-1,col="gray",border = "gray")
glu=ann[c(8,10:11),]
rect(glu[,3],-3,glu[,4],-1,col="red",border = "red")
dev.off()
