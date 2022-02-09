library(data.table)
library(Ropt)
ch=fread("chr_length_v4.txt", header=T,data.table=F)
d=fread("282panel.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
d=d[,c(1,2,4)]
thr1=quantile(d[,3],0.99)
thr2=quantile(d[,3],0.95)
sig=d[d[,3]>=thr1,]
sig2=d[d[,3]>=thr2,]
write.table(sig,file="Sig99.282panel.AGPV4.B0_MAF.stat.txt",col.names = T,row.names =F,quote=F,sep="\t")
write.table(sig2,file="Sig95.282panel.AGPV4.B0_MAF.stat.txt",col.names = T,row.names =F,quote=F,sep="\t")

d=d[order(d[,1],d[,2]),]
dd=NULL
for (k in 1:10)
{
  sub=subset(d,d[,1]==k)
  sub[,2]=sub[,2]+ch[k,3]
  dd=rbind(dd,sub)
}
dd$physPos=dd$physPos/1e6

  #outf="Old_New_XPCLR.tiff"
  #tiff(outf,res=600,units = "mm",height = 60,width = 143)
  png("282panel.AGPV4.B0_MAF.png",height = 150,width =210,res=600,units = "mm")
  par(mar=c(4,4,1,0),mfrow=c(1,1))
  col=ifelse(dd[,1]%%2==1,"black","gray")
 plot(dd[,2],dd[,3],col=col,pch=16,cex=0.4,bty="l",xlim=c(0,2100),axes=F,cex.lab=0.6,xlab="",ylab="B0")
 #abline(h=c(38.32117,15.47451),col=c("red","green"),lty=2)
 axis(2,las=2,tck=-.03,cex.axis=0.8)
 axis(1,at=c(153.5208585,429.262855,669.31791,910.6491295,1146.097552,1345.065257,1523.272613,1705.024703,1875.470912,2030.84696),labels=1:10,tck=-0.03,cex.axis=0.8)
 abline(h=thr1,col="red",lty=2)
 abline(h=thr2,col="green",lty=2)
 ######highlight
 #d2=d[d[,2]==5 & d[,3]>=47e6 & d[,3]<=49e6,]
 #d3=dd[dd[,1]%in%d2[,1],]
 #points(d3[,3],d3[,4],col="red",cex=0.6,pch=16)
 #box()  
 dev.off()
###

###thr   282panel
##99%: 229.2615; 95%: 82.27545

