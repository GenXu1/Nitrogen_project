library(data.table)
library(Ropt)
library(scatterplot3d)
for(i in 1:6)
{
  pc=fread(qq("BLK{i}.eigenvec"), header=F,data.table=F)
  eig=fread(qq("BLK{i}.eigenval"), header=F,data.table=F)[,1]
  pc.percent <- 100 * eig[1:10]/sum(eig)
  pc.percent=round(pc.percent,2)
  plot(1:10,pc.percent,type="b",main="BLK2",xlab="PCs")
  
  PC1=pc[,3]
  PC2=pc[,4]
  PC3=pc[,5]
  pdf(qq("suishi_BLK{i}.pdf"),height = 4,width = 4.3)
  plot(1:10,cumsum(pc.percent),type="b",pch=16,col="gray",lwd=2,xlab="PCs",ylab="Explained variation (%)",main = "BLK2")
  grid()
  dev.off()
  
  pdf(qq("BLK{i}.PCA.2D.pdf"),height = 4,width = 4.3)
  par(mar=c(4,4,2,2),mfrow=c(1,1))
  plot(PC1, PC2,col=adjustcolor("blue",alpha.f = 0.4),pch=16, xlab=qq("PC1 ({pc.percent[1]}%)"), ylab=qq("PC2 ({pc.percent[2]}%)"))
  dev.off() 
}
