library(data.table)
library(Ropt)
ch=fread("chr_length.txt",head=T,na.str="NA",data.table=F)
d=fread("sweeps_Old_New.bed",head=F,na.str="NA",data.table=F)
for(j in 1:1000)
{
re=NULL
for(i in 1:nrow(d))
{
  d1=d[i,];len=d1[1,3]-d1[1,2]+1
  chr=sample(1:10,1)
  s=sample(1:(ch[chr,2]-len),1)
  e=s+len
r=c(chr,s,e)
re=rbind(re,r)
}
re=re[order(re[,1],re[,2]),]
out=qq("sweeps_Old_New-Sample{j}.bed")
write.table(re,out,sep="\t",col.names = F,row.names = F,quote=F)

}
