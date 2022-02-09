library(data.table)
library(Ropt)
#############plot in blocks
d=fread("Blocks.txt", header=T,data.table=F)
TEO=fread("GLR.TEO_Concatenated_count.txt", header=F,data.table=F)[,-3]
MZ=fread("GLR.282panel_Concatenated_count.txt", header=F,data.table=F)[,-3]
freq_T=TEO[,3]/TEO[,4]
freq_M=MZ[,3]/MZ[,4]
TEO1=cbind(TEO,freq_T)
MZ1=cbind(MZ,freq_M)
col=c("#E39500","#43A178")

##################
d_TEO=fread("GLR.TEO_Concatenated_delterious_allele_count.txt", header=F,data.table=F)[,-3]
d_MZ=fread("GLR.282panel_delterious_allele_Concatenated_count.txt", header=F,data.table=F)[,-3]
d_freq_T=d_TEO[,3]/d_TEO[,4]
d_freq_M=d_MZ[,3]/d_MZ[,4]
d_TEO1=cbind(d_TEO,d_freq_T)
d_MZ1=cbind(d_MZ,d_freq_M)
#######plot blk4
b=4
  b1=d[b,]
  chr=5;s=b1[1,2];e=b1[1,3]
  TEO2=TEO1[TEO1[,1]==chr & TEO1[,2]>=s & TEO1[,2]<=e,]
  MZ2=MZ1[MZ1[,1]==chr & MZ1[,2]>=s & MZ1[,2]<=e,]  
  TEO3=hist(TEO2[,5],breaks = 20)
  MZ3=hist(MZ2[,5],breaks = 20)
  TEO_f=TEO3$counts/nrow(TEO2)
  MZ_f=MZ3$counts/nrow(MZ2)
  dd=cbind(TEO_f,MZ_f)
  dd=as.matrix(dd)
  colnames(dd)=NULL
  r=NULL
  for(i in 1:nrow(dd))
  {
    d1=dd[i,]
    r=c(r,d1)
  }
 # barplot(r,beside = T,ylim=c(0,0.4),col=col,border = col,xlab="Derived allele frequency",ylab="Proportion of sites",las=1)
  
  pdf("BLK4_SFS_no_LR_V2.pdf",height = 3,width =6)
  par(mar=c(4,4,1,0),mfrow=c(1,1))
  x=barplot(r,beside = T,ylim=c(0,0.5),col=col,border = col,las=1,ylab="Proportion of sites",xlab="Derived allele frequency")
  axis(1,at=c(0,x[seq(4,40,by=4)]+0.4),labels = seq(0,1,by=0.1))
  legend("top",legend=c("Teosinte","Maize"),pch=15,col=col,bty="n")

dev.off()

####plot blk1-6
for(b in c(1:6)[-4])
{
  b1=d[b,]
  chr=5;s=b1[1,2];e=b1[1,3]
  TEO2=TEO1[TEO1[,1]==chr & TEO1[,2]>=s & TEO1[,2]<=e,]
  MZ2=MZ1[MZ1[,1]==chr & MZ1[,2]>=s & MZ1[,2]<=e,]  
  TEO3=hist(TEO2[,5],breaks = 20)
  MZ3=hist(MZ2[,5],breaks = 20)
  TEO_f=TEO3$counts/nrow(TEO2)
  MZ_f=MZ3$counts/nrow(MZ2)
  dd=cbind(TEO_f,MZ_f)
  dd=as.matrix(dd)
  colnames(dd)=NULL
  r=NULL
  for(i in 1:nrow(dd))
  {
    d1=dd[i,]
    r=c(r,d1)
  }
  # barplot(r,beside = T,ylim=c(0,0.4),col=col,border = col,xlab="Derived allele frequency",ylab="Proportion of sites",las=1)
  
  pdf(qq("BLK{b}_SFS_no_LR_V2.pdf"),height = 4,width =9)
  par(mar=c(4,4,1,0),mfrow=c(1,1))
  x=barplot(r,beside = T,ylim=c(0,max(r)),col=col,border = col,las=1,ylab="Proportion of sites",xlab="Derived allele frequency")
   axis(1,at=c(0,x[seq(4,40,by=4)]+0.4),labels = seq(0,1,by=0.1))
 # legend("top",legend=c("Teosinte","282 maize"),pch=15,col=col,bty="n")
  dev.off()
  }


#####################Whole genome SFS
rm(list=ls())
TEO=fread("TEO_Concatenated_count.txt", header=T,data.table=F)[,-3]
MZ=fread("282panel_Concatenated_count.txt", header=T,data.table=F)[,-3]
freq_T=TEO[,3]/TEO[,4]
freq_M=MZ[,3]/MZ[,4]
TEO1=cbind(TEO,freq_T)
MZ1=cbind(MZ,freq_M)
col=c("#E39500","#43A178")

###plot
 
  TEO3=hist(TEO1[,5],breaks = 20)
  MZ3=hist(MZ1[,5],breaks = 20)
  TEO_f=TEO3$counts/nrow(TEO1)
  MZ_f=MZ3$counts/nrow(MZ1)
  dd=cbind(TEO_f,MZ_f)
  dd=as.matrix(dd)
  colnames(dd)=NULL
  r=NULL
  for(i in 1:nrow(dd))
  {
    d1=dd[i,]
    r=c(r,d1)
  }
  # barplot(r,beside = T,ylim=c(0,0.4),col=col,border = col,xlab="Derived allele frequency",ylab="Proportion of sites",las=1)
  
  pdf(qq("Genome-wide-SFS_no_LR_V2.pdf"),height = 4,width =9)
  par(mar=c(4,4,1,0),mfrow=c(1,1))
  x=barplot(r,beside = T,ylim=c(0,max(r)),col=col,border = col,las=1,ylab="Proportion of sites",xlab="Derived allele frequency")
   axis(1,at=c(0,x[seq(4,40,by=4)]+0.4),labels = seq(0,1,by=0.1))
  # legend("top",legend=c("Teosinte","282 maize"),pch=15,col=col,bty="n")
  dev.off()
