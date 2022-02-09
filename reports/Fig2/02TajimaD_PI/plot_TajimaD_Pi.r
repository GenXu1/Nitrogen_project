library(data.table)
library(Ropt)
TEO=fread("TEO.Pi_TajimaD.w25k.step25k.txt", header=T,data.table=F)
TEO=na.omit(TEO)
TEO=TEO[TEO[,5]>=1,]
thr1=quantile(TEO[,4],0.99)
thr2=quantile(TEO[,4],0.95)
thr3=quantile(TEO[,6],0.99)
thr4=quantile(TEO[,6],0.95)


MZ=fread("282MZ.Pi_TajimaD.w25k.step25k.txt", header=T,data.table=F)
MZ=na.omit(MZ)
MZ=MZ[MZ[,5]>=1,]
thr111=quantile(MZ[,4],0.99)
thr222=quantile(MZ[,4],0.95)
thr333=quantile(MZ[,6],0.99)
thr444=quantile(MZ[,6],0.95)

d=fread("Blocks.txt", header=T,data.table=F)
i=4
b1=d[i,]
chr=5;s=b1[1,2];e=b1[1,3]

###########2Mb windown
chr=5;s=47e6;e=49e6
TEO1=TEO[TEO[,1]==chr & TEO[,2]>=s & TEO[,2]<=e,]
MZ1=MZ[MZ[,1]==chr & MZ[,2]>=s & MZ[,2]<=e,]

col1=adjustcolor("#E39500",alpha.f = 1)
col3=adjustcolor("#43A178",alpha.f = 1)
out="Pi_B0_GLR_region_25k.pdf"
pdf(out,height = 8,width = 9)
par(mfrow=c(5,1),mar=c(2,4,1,1))
#######plot Pi
plot(TEO1[,2]/1e6,TEO1[,6],pch=16,col=col1,type="b",xlab="",ylab="Nucleotide diversity",ylim=c(0,0.03),lwd=2,xlim=c(s/1e6,e/1e6),cex=2.5,axes=F)
abline(h=thr4,lty=2,lwd=1.5)
axis(2,cex.lab=1.2,las=1,at=c(0,0.01,0.02,0.03))
plot(MZ1[,2]/1e6,MZ1[,6],pch=16,col=col3,type="b",lwd=2,cex=2.5,ylim=c(0,0.03),axes=F,ylab="",xlab="")
abline(h=thr444,lty=2,lwd=1.5)
axis(2,cex.lab=1.2,las=1,at=c(0,0.01,0.02,0.03))

#######plot B0
TEO=fread("GLR.TEO.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
LR=fread("GLR.LR.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
MZ=fread("GLR.282panel.AGPV4.B0_MAF.stat.txt", header=T,data.table=F)
col1=adjustcolor("#E39500",alpha.f = 1)
col2=adjustcolor("#53B3E9",alpha.f = 1)
col3=adjustcolor("#43A178",alpha.f = 1)
plot(TEO[,2]/1e6,TEO[,4],pch=16,col=col1,axes=F,ylab="B0,MAF",ylim=c(0,80))
axis(2,cex.lab=1.2,las=1,at=c(0,40,80))
abline(h=43.35914,lty=2,lwd=1.5)

plot(MZ[,2]/1e6,MZ[,4],pch=16,col=col3,axes=F,ylab="B0,MAF",ylim=c(-50,250),xlab = "Chr5 (Mb)")
axis(2,cex.lab=1.2,las=1,at=c(0,100,200))
abline(h=82.27545,lty=2,lwd=1.5)
axis(1,cex.lab=1.2)
ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
rect(ann[-c(8,10:11),3],-20,ann[-c(8,10:11),4],-3,col="gray",border = "gray")
#glu=ann[c(8,10:11),]
#rect(glu[,3],-20,glu[,4],-3,col="red",border = "red")
blk=fread("Blocks.txt",header = T,data.table=F)
blk[,2]/1e6
rect(blk[,2]/1e6,-55,blk[,3]/1e6,-20,col="white",border = "black")
dev.off()




