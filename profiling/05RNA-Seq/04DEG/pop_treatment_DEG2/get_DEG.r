library("data.table")
library(Ropt)
f=list.files(path = ".",pattern = "csv")
for(i in f)
{
  out=gsub("csv","q001.fd2sig.txt",i)
  d=fread(i,header = T,sep=",",data.table=F)
  d1=d[d[,7]<0.01 & abs(d[,3])>1,]
  d1=na.omit(d1)
  colnames(d1)[1]=c("Gene")
  write.table(d1,file=out,row.names = F,col.na=T,quote = F,sep="\t")
}

f=list.files(path = ".",pattern = "sig.txt")
re=NULL
for(i in f)
{
  na=gsub(".q001.fd2sig.txt","",i)
  d=fread(i,header = T,sep="\t",data.table=F)
  total=nrow(d);up=nrow(d[d[,3]>0,]);down=nrow(d[d[,3]<0,]);
  r=c(na,total,up,down)
  re=rbind(re,r)
}
colnames(re)=c("Comparison","Total_DEGs","Up","Down")
write.table(re,file="Summary_DEGs.txt",row.names = F,col.na=T,quote = F,sep="\t")