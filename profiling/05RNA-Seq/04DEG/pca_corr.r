library(data.table)
library(Ropt)
library(PerformanceAnalytics)
d=fread("FPKM_Old_new_four_lines.csv", header=T,data.table=F)
d1=d[,-1]
X=apply(d1,1,sum)
d2=d1[X>1,]
d3=log2(d2+1)
tiff("RNA-seq_lib_corr3.tiff",height = 220,width =210,units = "mm",res=600)
par(mfrow=c(4,4),mar=c(4,4,1,1))
re=NULL
d3=d3[,c(1,2,5,6,9,10,13,14,3,4,7,8,11,12,15,16,17,18,21,22,25,26,29,30,19,20,23,24,27,28,31,32)]
id=seq(1,31,by=2)
for(i in seq(1,31,by=2))
{
  r=cor.test(d3[,i],d3[,i+1])$estimate
  r=signif(r,digits = 4)
  plot(d3[,i],d3[,i+1],xlab="",ylab="",main="",las=1,pch=16,col=adjustcolor("black",0.4),cex=.7)
 re=c(re,r)
   }
dev.off()

test.pr<-princomp(d1,cor=TRUE) 
re=summary(test.pr,loadings=TRUE)
pca=re$loadings
