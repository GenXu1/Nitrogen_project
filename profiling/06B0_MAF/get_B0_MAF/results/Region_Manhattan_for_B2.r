library(data.table)
library(Ropt)
s=47;e=49
ch=fread("chr_length_v4.txt", header=T,data.table=F)
i="282panel.AGPV4.B0_MAF.stat.txt"
thr1= 229.2615;  thr2=82.27545
na=gsub(".B0_MAF.stat.txt","",i) 
  png(qq("{na}.GLR.png"),height = 110,width =210,res=600,units = "mm")
  par(mar=c(4,4,1,2),mfrow=c(2,1))
  d=fread(i, header=T,data.table=F)
  d=d[d[,7]>0,]
  d=d[d[,1]==5,2:4]
  d[,1]=d[,1]/1e6
  plot(d[,1],d[,3],xlab="Chr5(Mb)",ylab="B0",pch=16,cex=0.5,col="skyblue",main="")
  d1=d[d[,1] > 47 & d[,1] < 49,]
  abline(v=48,col="red",lty=2)
abline(h=c(thr1,thr2 ),col=c("red","green"),lty=2)
    plot(d1[,1],d1[,3],xlab="Chr5(Mb)",ylab="B0",pch=16,cex=0.8,col="skyblue",ylim=c(-2,max(d1[,3])))
  ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
  ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
  rect(ann[-c(8,10:11),3],-2,ann[-c(8,10:11),4],-0.2,col="gray",border = "gray")
  glu=ann[c(8,10:11),]
  rect(glu[,3],-2,glu[,4],-0.2,col="red",border = "red")
  abline(h=c(thr1,thr2),col=c("red","green"),lty=2)
   dev.off() 
