library(data.table)
library(vioplot)
################Weight of Plant shoot and root#####################
d1=fread("shoot_root_fresh_weight2.txt",head=T,data.table = F,na.str="NA")
shoot=d1[d1[,4]=="Shoot",]
root=d1[d1[,4]=="Root",]
pdf("Fresh_weight_shoot_root2.pdf",height = 3,width =6)
par(mfrow=c(2,1),mar=c(0,4,0,2))
vioplot(t(shoot[,5:12]),col=c("white"),border ="black",ylab="g",names=rep(c("","","",""),each=2),main="",las=1,axes=T,ylim=c(1,7))
for(i in 1:8)
{points(jitter(rep(i,8),factor =1.5),shoot[i,5:12],pch=16,cex=0.8,col=adjustcolor("brown", alpha.f = 0.8))
}
#legend("topright",c("HN","LN"),col=c("#FF7F0066","skyblue"),pch=15,bty="n",cex=2)
abline(v=c(2.5,4.5,6.5),col="gray")
vioplot(t(root[,5:12]),col=c("white"),border ="black",ylab="g",names=rep(c("B73","SD40","K55","W153R"),each=2),main="",las=1,ylim=c(0.5,4))
for(i in 1:8)
{points(jitter(rep(i,8),factor =1.5),root[i,5:12],pch=16,cex=0.8,col=adjustcolor("brown", alpha.f = 0.8))
}
abline(v=c(2.5,4.5,6.5),col="gray")
dev.off()

#################################################################
d1=fread("shoot_root_dry_weight2.txt",head=T,data.table = F,na.str="NA")
shoot=d1[d1[,4]=="Shoot",]
root=d1[d1[,4]=="Root",]
pdf("Dry_weight_shoot_root2.pdf",height = 3.2,width =4)
par(mfrow=c(2,1),mar=c(0,4,0,0))
od=
vioplot(t(shoot[,5:12]),col=c("white"),border ="black",ylab="g",names=rep(c("","","",""),each=2),main="",las=1,ylim=c(0,0.6))
for(i in 1:8)
{points(jitter(rep(i,8),factor =1.5),shoot[i,5:12],pch=16,cex=0.8,col=adjustcolor("brown", alpha.f = 0.5))
}
#legend("topleft",c("HN","LN"),col=c("#FF7F0066","skyblue"),pch=15,bty="n",cex=2)
abline(v=c(2.5,4.5,6.5),col="gray")

vioplot(t(root[,5:12]),col=c("white"),border ="black",ylab="g",names=rep(c("B73","SD40","K55","W153R"),each=2),main="",las=1,ylim=c(0,0.6))
for(i in 1:8)
{points(jitter(rep(i,8),factor =1.5),root[i,5:12],pch=16,cex=0.8,col=adjustcolor("brown", alpha.f = 0.5))
}
#legend("topright",c("HN","LN"),col=c("#FF7F0066","skyblue"),pch=15,bty="n",cex=2)
abline(v=c(2.5,4.5,6.5),col="gray")
dev.off()

##########################t-test
res=NULL
d1=fread("shoot_root_fresh_weight2.txt",head=T,data.table = F,na.str="NA")
shoot=d1[d1[,4]=="Shoot",]
root=d1[d1[,4]=="Root",]

for(i in c(1,3,5,7))
{
  p=t.test(shoot[i,-c(1:4)],shoot[i+1,-c(1:4)])$p.value
  re=c("fresh","Shoot",shoot[i,1],shoot[i,4],p)
  res=rbind(res,re)
}

for(i in c(1,3,5,7))
{
  p=t.test(root[i,-c(1:4)],root[i+1,-c(1:4)])$p.value
  re=c("fresh","Root",root[i,1],root[i,4],p)
  res=rbind(res,re)
}

d1=fread("shoot_root_dry_weight2.txt",head=T,data.table = F,na.str="NA")
shoot=d1[d1[,4]=="Shoot",]
root=d1[d1[,4]=="Root",]
for(i in c(1,3,5,7))
{
  p=t.test(shoot[i,-c(1:4)],shoot[i+1,-c(1:4)])$p.value
  re=c("dry","Shoot",shoot[i,1],shoot[i,4],p)
  res=rbind(res,re)
}

for(i in c(1,3,5,7))
{
  p=t.test(root[i,-c(1:4)],root[i+1,-c(1:4)])$p.value
  re=c("Dry","Root",root[i,1],root[i,4],p)
  res=rbind(res,re)
}
res=res[,-4]
colnames(res)=c("Type","Tissue","Genotype","P-value")
write.table(res,file="HN_LN_P-value.txt",row.names = F,col.names = T,quote = F,sep="\t")
