library(data.table)
library(Ropt)
d=fread("Block_Era_Fav_freq.txt", header=T,data.table=F)
re=NULL
for(i in unique(d[,1]))
{
  d1=d[d[,1]==i,]
  fit=lm(d1[,3]~d1[,2],data=d1)
  pval <- summary(fit)$coefficients[2,4]
  r=c(i,pval)
  re=rbind(re,r)
}
colnames(re)=c("Blocks","P-value")
write.table(re,file="Block_lm_P-value.txt",row.names = F,quote = F,sep="\t",col.names = T)
