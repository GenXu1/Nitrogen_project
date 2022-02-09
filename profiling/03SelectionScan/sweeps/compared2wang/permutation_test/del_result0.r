library(data.table)
library(Ropt)
f=list.files(path=".",patt="sweep.txt")
res=NULL
for(i in f)
{
  id=gsub(".txt","",i)
  d=fread(i,head=F,data.table = F)
  d=d[d[,4]>0,]
  reg=qq("{d[,1]}-{d[,2]}-{d[,3]}")
  reg1=unique(reg)
 r=c(id,length(reg1))
 res=rbind(res,r) 
}
colnames(res)=c("Samping","Overlap(N)")
write.table(res,"sampling_value.txt",quote = F,col.na=T,row.names = F,sep="\t")
