library("data.table")
library(Ropt)
for(i in 1:6)
{
  file=read.table(qq("BLK{i}.3.Q"))
#  file=file[order(file[,1],file[,3]),]
  barplot(t(as.matrix(file)), col=rainbow(3),xlab="Individual #", ylab="Ancestry", border=NA)
  
  id=read.table("ID.txt")
  
  f=cbind(id,file)
  which(id[,1]=="B73")
  Hap=vector(length = nrow(id))
  Hap[f[,2]>=0.7]=3
  Hap[f[,3]>=0.7]=2
  Hap[f[,4]>=0.7]=1
  f=cbind(f,Hap)
  colnames(f)=c("ID","Q1","Q2","Q3","Haplotype")
  write.table(f,qq("BLK{i}.hap.txt"),sep="\t",col.names = T,row.names = F,quote=F)
  
}
