library(data.table)
library(Ropt)
f=fread("early_late_50K.windowed.weir.fst",head=T,data.table = F)
#f=f[f[,5]>0,]
f[f[,5]<0,5]=0
f=f[,c(1:3,5)]
f=f[order(f[,1],f[,2]),]
d0=f[f[,4]<quantile(f[,4],0.9),]
d1=f[f[,4]>=quantile(f[,4],0.90),]

bk=1
bl=1
for(j in 2:nrow(d1))
{if(d1[j,1]==d1[j-1,1])
{
  if(d1[j,2]-d1[j-1,3]>0)
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
colnames(ro)=colnames(d0)
dd=rbind(d0,ro)
dd=dd[order(dd[,1],dd[,2]),]
thr=quantile(dd[,4],0.999)
d1=dd[dd[,4]>=thr,]
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
colnames(ro)=colnames(f)

write.table(ro,"Old_New.FST.90_999.txt",col.na=T,row.na=F,quote=F,sep="\t")

