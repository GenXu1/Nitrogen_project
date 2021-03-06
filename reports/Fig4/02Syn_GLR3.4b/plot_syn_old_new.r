library(data.table)
library(Ropt)
d=fread("Glu2_seqc.aln3", header=F,data.table=F,skip=0)
na=d[,1]
d1=d[,-1]
d1=t(d1)
colnames(d1)=c("Hap1","Hap2","Hap3")
d1=d1[,c(1:3)]
mi=apply(d1, 2, function(x){x1=x[x>0];min(x1)})
ma=apply(d1, 2, max)
len=ma-mi
pdf("Gene2.syn_Hap123.pdf",height = 2.5,width = 4.3)
par(mar=c(4,4,2,0),mfrow=c(1,1))
plot(1,1,xlim=c(0,max(len)),ylim=c(2,22),col="white",axes=F,xlab="",ylab="",main="")
y2=21
for(i in 1:3)
{
  d2=d1[,i]
  d2=d2[d2>0]
  d2=d2-min(d2)
    rect(0,y2-1.5,max(d2),y2+1.5) 
    y2=y2-7
}

d1=as.data.frame(d1)
y2=21
for(i in 1:3)
{
 d2=d1[,i:(i+1)] 
 d3=d2[d2[,1]>0 & d2[,2]>0,] 
 d3[,1]=d3[,1]-min(d3[,1])
 d3[,2]=d3[,2]-min(d3[,2])
 segments(d3[,1],y2-1.6,d3[,2],(y2-7+1.6),col="gray",lwd=0.05)
 y2=y2-7
}
axis(2,las=1,at=seq(21,7,by=-7),labels = colnames(d1))

y2=21
d4=fread("Gene_structure2.txt", header=T,data.table=F)
d4=d4[d4[,2]=="Gene2"& d4[,3]=="exon",]
k=1
for(i in unique(d4[,1])[c(2,9,1)])
{
  d5=d4[d4[,1]==i,]
  d5[,4]=d5[,4]-mi[k]
  d5[,5]=d5[,5]-mi[k]
  rect(d5[,4],rep(y2-1,nrow(d5)),d5[,5],rep(y2+1,nrow(d5)),col = "black", border = "black")
  segments(min(d5[,4]),y2,max(d5[,5]),y2,lwd=2)
  y2=y2-7 
  k=k+1
}
segments(0,3,1000,3,lwd=2)

dev.off()

