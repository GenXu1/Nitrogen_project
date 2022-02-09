library(data.table)
library(Ropt)
####get R2
#plink --vcf 2M_Glu_early_late.recode.vcf --r2 --ld-window-kb 2000 --ld-window-r2 0 --out 2M_Glu_early_late_r2
d=fread("2M_Glu_early_late2_r2_lead_left.ld",head=F,data.table = F)
xp=fread("Glu_region_2M_XPCLR.txt",head=T,data.table = F)
lead=xp[which.max(xp[,5]),]###47940001 47990000
d2=xp[-which.max(xp[,5]),]
res=NULL
for(i in 1:nrow(d2))
{
  d3=d2[i,]
 d4=d[d[,2]>=d3[1,2] & d[,2]<=d3[1,3],] 
 re=cbind(d3,mean(d4[,7]))
 res=rbind(res,re)
}
colnames(res)[6]="r2"
################################
d=fread("2M_Glu_early_late2_r2_lead_right.ld",head=F,data.table = F)
for(i in 1:nrow(d2))
{
  d3=d2[i,]
  d4=d[d[,5]>=d3[1,2] & d[,5]<=d3[1,3],] 
  re=cbind(d3,mean(d4[,7]))
  colnames(re)[6]="r2"
  res=rbind(res,re)
}
res=na.omit(res)
write.table(res,file="Glu_region_2M_XPCLR_r22.txt",row.names = F,quote = F,sep="\t",col.names = T)


