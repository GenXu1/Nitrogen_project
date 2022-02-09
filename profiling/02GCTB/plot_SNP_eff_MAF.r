library("data.table")
library(Ropt)
f=list.files(path=".",patt="snpRes")
for(i in f)
{
  d=fread(i,header = T,data.table=F)
  d=d[d[,8]!=0,]
  out=qq("{i}.MAF.png")
  png(out,height = 140,width =210,units = "mm",res=600)
  par(mfrow=c(1,1),mar=c(4,5,1,1))
  plot(d[,7],d[,8],col=adjustcolor("blue",alpha.f = 0.1),pch=16,xlab="MAF",ylab="SNP effect",cex.axis=1.5,cex.lab=1.5)
  dev.off()
}

