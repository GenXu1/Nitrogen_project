library(data.table)
library(Ropt)
ch=fread("chrom.txt", header=T,data.table=F)
d=fread("Zm00001d014456_L3Tip_FPKM.assoc.txt", header=T,data.table=F)
pos=d$ps
d=cbind(d[,1],pos,d[,13])
dd=NULL
for (k in 1:10)
{
  sub=subset(d,d[,1]==k)
  sub[,2]=sub[,2]+ch[k,3]
  dd=rbind(dd,sub)
}
dd=as.data.frame(dd)
colnames(dd)=c("Chr","pos","P-value")
dd$pos=dd$pos/1e6
 # pdf("Zm00001d014456_L3Tip_eGWAS.pdf",height = 2.6,width =6)
 # par(mar=c(4,4,1,0),mfrow=c(1,1))
  png("Zm00001d014456_L3Tip_eGWAS.png",height = 65,width =210,units = "mm",res = 600)
  par(mar=c(4,4,1,0),mfrow=c(1,1))
   col=ifelse(dd[,1]%%2==1,"black","gray")
 plot(dd[,2],-log10(dd[,3]),col=col,pch=16,cex=0.4,bty="l",xlim=c(0,2100),axes=F,cex.lab=0.6,xlab="",ylab="-log10(P)")
 axis(2,las=2,tck=-.03,cex.axis=0.8)
 axis(1,at=c(153.5208585,429.262855,669.31791,910.6491295,1146.097552,1345.065257,1523.272613,1705.024703,1875.470912,2030.84696),labels=1:10,tck=-0.03,cex.axis=0.8)
 dev.off()
