library(data.table)
library(Ropt)
library(vioplot)
##Plot phenotypes in different haplotypes
p=fread("Phenotype.txt",head=T,data.table = F)
tr=fread("traits_plots.txt",head=F,data.table = F)[,1]
p1=cbind(p[,1],p[,colnames(p)%in%tr])
colnames(p1)[1]="ID"
pdf("Pheno_diff_Blocks_haps4_v3.pdf",height = 1.2,width = 4.7)
par(mfcol=c(1,6),mar=c(4,3,1,0))
for(b in 1:1)
{
  inf=qq("BLK{b}.hap.txt")
  bl1=fread(inf,head=T,data.table = F)
  bl1=bl1[bl1[,ncol(bl1)]>0,]
  bl1=bl1[,c(1,ncol(bl1))]
  d1=merge(p1,bl1,by=1)
  haps=unique(bl1[,ncol(bl1)])
  bl1[which(bl1[,1]=="B73"),]
  d1a=d1[d1[,ncol(d1)]==1,]
  d1b=d1[d1[,ncol(d1)]==2,] 
  for(k in 2:2)
  {
    vioplot(na.omit(d1a[,k]),na.omit(d1b[,k]),col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="",names=c("Hap1","Hap2"),cex.axis = 1,cex.lab = 1.5,main=colnames(d1a)[k],las=1,axes=F,horizontal =F,xlab="",cex=0.6,ylim=c(1.5,4))
    
  }
  
}

for(b in 2:6)
{
  inf=qq("BLK{b}.hap.txt")
  bl1=fread(inf,head=T,data.table = F)
  bl1=bl1[bl1[,ncol(bl1)]>0,]
  bl1=bl1[,c(1,ncol(bl1))]
  d1=merge(p1,bl1,by=1)
  haps=unique(bl1[,ncol(bl1)])
  bl1[which(bl1[,1]=="B73"),]
  d1a=d1[d1[,ncol(d1)]==1,]
  d1b=d1[d1[,ncol(d1)]==2,] 
  d1c=d1[d1[,ncol(d1)]==3,] 
  for(k in 2:2)
  {
    vioplot(na.omit(d1a[,k]),na.omit(d1c[,k]),col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),axes=F,horizontal =F,xlab="",las=1,cex=0.6,ylim=c(1.5,4))
    
  }
  
}
dev.off()


pdf("Pheno_diff_Block4_hap_other_traits_V2.pdf",height = 1.2,width = 4.2)
par(mfcol=c(1,5),mar=c(4,3,1,0))
inf="BLK4.hap.txt"
  bl1=fread(inf,head=T,data.table = F)
  bl1=bl1[bl1[,ncol(bl1)]>0,]
  bl1=bl1[,c(1,ncol(bl1))]
  d1=merge(p1,bl1,by=1)
  d1[,6]=90-d1[,6]
  haps=unique(bl1[,ncol(bl1)])
  bl1[which(bl1[,1]=="B73"),]
  d1a=d1[d1[,ncol(d1)]==1,]
  d1b=d1[d1[,ncol(d1)]==2,] 
  for(k in c(3,4,6,7,8))
  {
    vioplot(na.omit(d1a[,k]),na.omit(d1b[,k]),col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="",names=c("Hap1","Hap2"),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6)
    
  }
dev.off()  
