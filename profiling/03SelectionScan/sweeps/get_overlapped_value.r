library(data.table)
library(Ropt)
d1=fread("XPCLR_overlap.txt",head=F,data.table = F)
d2=fread("FST_overlap.txt",head=F,data.table = F)
reg1=qq("{d1[,1]}\t{d1[,2]}")
reg2=qq("{d2[,1]}\t{d2[,2]}")
d1=cbind(d1,reg1)
d2=cbind(d2,reg2)
res=NULL
for(i in unique(reg1))
{
  d11=d1[d1[,10]==i,]
  re=c(i,max(as.numeric(d11[,7])))
  res=rbind(res,re)
}
write.table(res,file="XPCLR_overlap2.txt",quote = F,col.names = F,row.names = F,sep="\t")

res=NULL
for(i in unique(reg2))
{
  d22=d2[d2[,10]==i,]
  re=c(i,max(as.numeric(d22[,7])))
  res=rbind(res,re)
}
write.table(res,file="FST_overlap2.txt",quote = F,col.names = F,row.names = F,sep="\t")




