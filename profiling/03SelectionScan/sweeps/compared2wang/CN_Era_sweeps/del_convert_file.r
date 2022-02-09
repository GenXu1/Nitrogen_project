library(data.table)
library(Ropt)
d=fread("V4_coverted_res.bed",head=F,na.str="NA",data.table=F)
res=NULL
for(i in unique(d[,4]))
{
  d1=d[d[,4]==i,]
  r=c(d1[1,1],d1[1,2],max(d1[,3]),d1[1,4])
  res=rbind(res,r)
}
write.table(res,"Wang_CN_sweeps.bed",sep="\t",col.names = F,row.names = F,quote=F)
