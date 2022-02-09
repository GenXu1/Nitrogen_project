library(data.table)
library(Ropt)
ID=fread("blk1_hap.txt", header=T,data.table=F)[,1]
for(i in 1:6)
{
  inf=qq("blk{i}_hap.txt")
  d=fread(inf, header=T,data.table=F)
  hap=d[,2]
  p=ncol(combn(1:length(unique(hap)),2))
  for(j in 2:p)
  {
    d=cbind(d,hap)  
  }
  x=combn(1:max(hap),2)
  for(k in 1:ncol(x))
  {
  x1=x[,k]
  c1=k+1
  d[!d[,c1]%in%x1,c1]=NA
  mk=paste(x1,collapse ="_")
  colnames(d)[c1]=qq("BK{i}_{mk}")
  }
  ID=merge(ID,d,by=1)
}
write.table(ID,"Block_geno.txt",col.names = T,row.names = F,sep="\t",quote=F)

ID=fread("Block_geno.txt", header=T,data.table=F)
for(i in 2:ncol(ID))
{
  d2=ID[,i]
  mk=na.omit(unique(d2))
    ID[which(ID[,i]==mk[1]),i]="AA" 
    ID[which(ID[,i]==mk[2]),i]="GG"
}
d=t(ID)
write.table(d,"Block_geno_hmp.txt",col.names = T,row.names = T,sep="\t",quote=F)
