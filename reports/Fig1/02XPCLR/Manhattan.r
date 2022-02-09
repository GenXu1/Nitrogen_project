library(data.table)
library(Ropt)
ch=fread("chr_length_v4.txt", header=T,data.table=F)
d=fread("Early_late.xpclr.txt", header=T,data.table=F)
pos=(d[,3]+d[,4])/2
d=cbind(d[,c(1,2)],pos,d[,12])
colnames(d)[4]="XPCLR"
thr=quantile(d[,4],0.995)
sig=d[d[,4]>=thr,]
d=d[order(d[,2],d[,3]),]
dd=NULL
for (k in 1:10)
{
  sub=subset(d,d[,2]==k)
  sub[,3]=sub[,3]+ch[k,3]
  dd=rbind(dd,sub)
}
dd$pos=dd$pos/1e6

  #outf="Old_New_XPCLR.tiff"
  #tiff(outf,res=600,units = "mm",height = 60,width = 143)
  pdf("Old_New_XPCLR33.pdf",height = 1.8,width =6.5)
  par(mar=c(4,2,1,0),mfrow=c(1,1))
  col=ifelse(dd[,2]%%2==1,"black","gray")
 plot(dd[,3],dd[,4],col=col,pch=16,cex=0.4,bty="l",xlim=c(0,2100),axes=F,cex.lab=0.6,xlab="",ylab="XPCLR")
 axis(2,las=2,tck=-.03,cex.axis=0.8)
 axis(1,at=c(153.5208585,429.262855,669.31791,910.6491295,1146.097552,1345.065257,1523.272613,1705.024703,1875.470912,2030.84696),labels=1:10,tck=-0.03,cex.axis=0.8)
 ######highlight
 d2=d[d[,2]==5 & d[,3]>=47e6 & d[,3]<=49e6,]
 d3=dd[dd[,1]%in%d2[,1],]
 #points(d3[,3],d3[,4],col="red",cex=0.6,pch=16)
 #box()  
 dev.off()
###############Region signal, LD 
 lead_s=d2[which.max(d2[,4]),]
 write.table(d2,file="Glu_region_2M_XPCLR.txt",row.names = F,quote = F,sep="\t",col.names = T)

 tiff("Glu_reg_sig.tiff",res=600,units = "mm",height = 70,width = 143)
 pdf("Glu_reg_sig.pdf",height = 1.8,width =7)
 par(mar=c(4,4,1,0),mfrow=c(1,1))
 d=fread("Glu_region_2M_XPCLR_r2.txt", header=T,data.table=F)
 rgb.palette <- colorRampPalette(rev(c("gray","orange" ,"red")), space = "rgb")
 color=rgb.palette(18)[18:1]
 col=vector(length=nrow(d))
 for(i in 1:18)
 {
   s=(i-1)/18;e=i/18;
   cat(s,e,"\n")
   col[d[,6]>=s & d[,6]<=e] =color[i]
 }
 plot(d[,4]/1e6,d[,5],col=col,pch=16,xlab="",ylab="XP-CLR",axes=F,ylim=c(-8,105),cex=0.8)
 axis(2,las=1,at=seq(0,100,20),tck=-.03)
 
 ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
 ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
 rect(ann[-c(8,10:11),3],-8,ann[-c(8,10:11),4],-2,col="gray",border = "gray")
 glu=ann[c(8,10:11),]
 rect(glu[,3],-8,glu[,4],-2,col="gray",border = "gray")
 axis(1,tck=-.03)
 dev.off()
 
 pdf("col.pdf",height = 4,width = 5)
 par(mfrow=c(1,1),mar=c(2,4,1,1))
 plot(1:10,col=color,pch=15,cex=2)
 dev.off()
 
 
 pdf("Glu_reg_sig.pdf",height = 1.8,width =7.5)
 par(mar=c(4,4,1,0),mfrow=c(1,1))
 d=fread("Glu_region_2M_XPCLR_r2_median.txt", header=T,data.table=F)
 rgb.palette <- colorRampPalette(rev(c("gray","orange" ,"red")), space = "rgb")
 color=rgb.palette(18)[18:1]
 col=vector(length=nrow(d))
 for(i in 1:18)
 {
   s=(i-1)/18;e=i/18;
   cat(s,e,"\n")
   col[d[,6]>=s & d[,6]<=e] =color[i]
 }
 plot(d[,4]/1e6,d[,5],col=col,pch=16,xlab="",ylab="XP-CLR",axes=F,ylim=c(-5,105),cex=0.8)
 axis(2,las=1,at=seq(0,100,20),tck=-.03)
 
 ann=fread("chr5_glu_annotation.txt",header = T,data.table=F)[,1:5]
 ann[,3]=ann[,3]/1e6;ann[,4]=ann[,4]/1e6;
 rect(ann[-c(8,10:11),3],-6,ann[-c(8,10:11),4],-2,col="gray",border = "gray")
 #glu=ann[c(8,10:11),]
# rect(glu[,3],-6,glu[,4],-2,col="red",border = "red")
 axis(1,tck=-.03)
 dev.off()
 