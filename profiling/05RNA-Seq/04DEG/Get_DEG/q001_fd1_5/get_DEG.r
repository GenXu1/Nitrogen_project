library("data.table")
library(Ropt)
f=list.files(path = ".",pattern = "csv")
for(i in f)
{
  out=gsub("csv","q001.fd1.5.sig.txt",i)
  d=fread(i,header = T,sep=",",data.table=F)
  d1=d[d[,7]<0.01 & abs(d[,3])>0.585,]
  d1=na.omit(d1)
  colnames(d1)[1]=c("Gene")
  write.table(d1,file=out,row.names = F,col.na=T,quote = F,sep="\t")
}

