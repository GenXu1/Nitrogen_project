library(data.table)
library(Ropt)
ID=fread("blk1_hap.txt", header=T,data.table=F)[,1]
for(i in 1:6)
{
  inf=qq("blk{i}_hap.txt")
  d=fread(inf, header=T,data.table=F)
  hap=d[,2]
  d[d[,2]!=1,2]=0
  p=length(unique(hap))
  for(j in 2:p)
  {
    d=cbind(d,hap)  
    d[d[,j+1]!=j,j+1]=0
  }
 colnames(d)=c("ID",qq("BLK{i}_{1:p}"))
  ID=merge(ID,d,by=1)
}
write.table(ID,"Block_geno.txt",col.names = T,row.names = F,sep="\t",quote=F)

ID=fread("Block_geno.txt", header=T,data.table=F)
for(i in 2:ncol(ID))
{
  d2=ID[,i]
  mk=sort(na.omit(unique(d2)))
    ID[which(ID[,i]==0),i]="AA" 
    ID[which(ID[,i]==mk[2]),i]="GG"
}
d=t(ID)
write.table(d,"Block_geno_hmp.txt",col.names = T,row.names = T,sep="\t",quote=F)
