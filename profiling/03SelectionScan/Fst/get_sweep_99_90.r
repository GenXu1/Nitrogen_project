library(data.table)
library(Ropt)
f=fread("Land_Maize_w50k_10k.windowed.weir.fst",head=T,data.table = F)
f=f[,c(1:3,5)]
d0=f[f[,4]>=quantile(f[,4],0.9) & f[,4]<quantile(f[,4],0.99),]
d1=f[f[,4]>=quantile(f[,4],0.99),]
d1=rbind(d0,d1)
d1=d1[order(d1[,1],d1[,2]),]
thr=quantile(f[,4],0.99)
bk=1
bl=1
for(j in 2:nrow(d1))
{if(d1[j,1]==d1[j-1,1])
{
  if(d1[j,2]-d1[j-1,3]>50000)
  { bk=bk+1}
}
  else{bk=bk+1} 
  bl=c(bl,bk)
}
d1=cbind(d1,bl) 
index=unique(bl)
ro=NULL
for(k in index)
{
  d2=d1[d1[,5]==k,,drop=F]
  m=max(d2[,4])
  interval=c(d2[1,1],d2[1,2],d2[nrow(d2),3],m)
  ro=rbind(ro,interval)
}
ro=as.data.frame(ro)
colnames(ro)=c("Chr","Start","End","FST")
sig=ro[ro[,4]>=thr,]
write.table(sig,"Land_Maize.Fst.99_90.txt",col.na=T,row.na=F,quote=F,sep="\t")
