library(data.table)
library(Ropt)
tr=fread("traits_plots.txt",head=F,data.table = F)[,1]
res=NULL
for(i in 2:6)
{
  inf=qq("blk{i}_hap_MLM2.txt")
  d=fread(inf,head=T,data.table = F)
  d2=d[d[,1]%in%tr,]
  d3=cbind(rep(qq("blk{i}"),nrow(d2)),d2)
  colnames(d3)[1]="BLK"
  res=rbind(res,d3)
}

write.table(res,file="4traits_P.txt",row.names = F,quote = F,sep="\t")

res=NULL
for(i in 1:1)
{
  inf=qq("blk{i}_hap_MLM2.txt")
  d=fread(inf,head=T,data.table = F)
  d2=d[d[,1]%in%tr,]
  d3=cbind(rep(qq("blk{i}"),nrow(d2)),d2)
  colnames(d3)[1]="BLK"
  res=rbind(res,d3)
}

write.table(res,file="4traits_P_BLK1.txt",row.names = F,quote = F,sep="\t")
