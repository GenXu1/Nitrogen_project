library(data.table)
library(Ropt)
TEO=fread("GLR.TEO.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
LR=fread("GLR.LR.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
MZ=fread("GLR.282panel.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
col1=adjustcolor("#E39500",alpha.f = 0.6)
col2=adjustcolor("#53B3E9",alpha.f = 0.6)
col3=adjustcolor("#43A178",alpha.f = 0.6)
out="GLR_B0_MAF.pdf"
pdf(out,height = 6,width = 9)
par(mfrow=c(3,1),mar=c(2,4,1,1))
plot(TEO[,2]/1e6,TEO[,4],pch=16,col=col1,axes=F,ylab="B0,MAF",ylim=c(0,80))
axis(2,cex.lab=1.2,las=1)
abline(h=43.35914,lty=2,lwd=1.5)

plot(LR[,2]/1e6,LR[,4],pch=16,col=col2,axes=F,ylab="B0,MAF",ylim=c(0,100))
axis(2,cex.lab=1.2,las=1)
abline(h=65.46509,lty=2,lwd=1.5)

plot(MZ[,2]/1e6,MZ[,4],pch=16,col=col3,axes=F,ylab="B0,MAF",ylim=c(-20,250),xlab = "Chr5 (Mb)")
axis(2,cex.lab=1.2,las=1)
abline(h=82.27545,lty=2,lwd=1.5)
axis(1,cex.lab=1.2)

ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
rect(ann[-c(8,10:11),3],-20,ann[-c(8,10:11),4],-3,col="gray",border = "gray")
glu=ann[c(8,10:11),]
rect(glu[,3],-20,glu[,4],-3,col="red",border = "red")
dev.off()

###thr   teo
##99%: 108.7877; 95%: 43.35914 TEO
 ##99%: 184.7509; 95%: 65.46509 LR
##99%: 229.2615; 95%: 82.27545 MZ
