library(data.table)
library(Ropt)
rr=NULL
for(j in 1:6)
{
  inf=qq("BLK{j}.hap.txt")
  d=fread(inf,header = T,sep="\t",data.table=F)
  id=fread("TEO_LR_Early_late_Wang_ID.txt",header = F,sep="\t",data.table=F)
  colnames(id)=c("ID","Pop","POP1")
  d1=merge(d,id,by=1)
  dd=d1[d1[,1]=="B73",]
  h=dd[1,5]
  res=NULL
  for(i in unique(d1[,7]))
  {
    d2=d1[d1[,7]==i,]
    
    d3=d2[d2[,5]==h,]
    ra=nrow(d3)/nrow(d2)
    r=c(qq("BLK{j}"),i,ra)
    res=rbind(res,r)
  } 
  rr=rbind(rr,res)
}
colnames(rr)=c("BLK","Pop","Freq")
rr=rr[order(rr[,1],rr[,2]),]
write.table(rr,"New-hap.freq.txt",sep="\t",col.names = T,row.names = F,quote=F)
