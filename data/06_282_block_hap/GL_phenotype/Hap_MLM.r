library(Ropt)
blk4 <- read.table("blk4_hap.txt", header=TRUE,sep="\t")
blk3 <- read.table("blk3_hap.txt", header=TRUE,sep="\t")
pca=read.table("GEMMA_PCA.txt", header=T,sep="\t")
p=read.table("Phenotype.txt", header=TRUE,sep="\t")
p_bk3=merge(blk3,p,by=1)
p_bk4=merge(blk4,p,by=1)
p_bk3=merge(pca,p_bk3,by=1)
p_bk4=merge(pca,p_bk4,by=1)
p_bk4=p_bk4[p_bk4[,5]!=2,]
p_bk4[p_bk4[,5]==3,5]=0
#p_bk4[,5]=qq("H{p_bk4[,5]}")
out=NULL
for(i in 6:ncol(p_bk3))
{
 d=na.omit(p_bk3[,c(2:5,i)])
  h1=d[d[,4]==1,]
  h2=d[d[,4]==2,]
  h3=d[d[,4]==3,]
  hap=d[, 4]
  tra=d[,5]
  pc1=d[, 1]
  pc2=d[, 2]
  pc3=d[, 3]
  fit <- lm(tra ~ as.factor(hap)+pc1+pc2+pc3, data=d)
  pval <- summary(fit)$coefficients[2,4]
  tem <- data.frame(trait= names(d)[5], pval=pval, eff=summary(fit)$coefficients[2,1], std=summary(fit)$coefficients[2,2],Nhap1=nrow(h1),hap1=mean(h1[,5]),Nhap2=nrow(h2),hap2=mean(h2[,5]),Nhap3=nrow(h3),hap3=mean(h3[,5]))
  out <- rbind(out, tem)
}
write.table(out,"blk3_hap_MLM.txt",col.names = T,row.names = F,quote = F,sep="\t")

out=NULL
for(i in 6:ncol(p_bk4))
{
  d=na.omit(p_bk4[,c(2:5,i)])
  h1=d[d[,4]==1,]
  h2=d[d[,4]==2,]
  h3=d[d[,4]==3,]
  hap=d[, 4]
  tra=d[,5]
  pc1=d[, 1]
  pc2=d[, 2]
  pc3=d[, 3]
  fit <- lm(tra ~ as.factor(hap)+pc1+pc2+pc3, data=d)
  pval <- summary(fit)$coefficients[2,4]
  tem <- data.frame(trait= names(d)[5], pval=pval, eff=summary(fit)$coefficients[2,1], std=summary(fit)$coefficients[2,2],Nhap1=nrow(h1),hap1=mean(h1[,5]),Nhap2=nrow(h2),hap2=mean(h2[,5]),Nhap3=nrow(h3),hap3=mean(h3[,5]))
  out <- rbind(out, tem)
}
write.table(out,"blk4_hap_MLM2.txt",col.names = T,row.names = F,quote = F,sep="\t")

d=read.table("G_N.txt", header=TRUE,sep="\t")
d=na.omit(d)
h1=d[d[,3]==1,]
h2=d[d[,3]==2,]
h3=d[d[,3]==3,]
vioplot::vioplot(h1[,2],h2[,2],h3[,2],col="gray",names=c("Hap1","Hap2","Hap3"),ylab="N")
b73=h3[h3[,1]=="B73",]
points(3.2,b73[1,2],pch=16,cex=2,col="red")

k55=h1[h1[,1]=="K55",]
points(1.2,k55[1,2],pch=16,cex=2,col="red")
e=fread("early_lines.txt",head=F,data.table = F)[,1]
l=fread("late_lines.txt",head=F,data.table = F)[,1]
ee=d[d[,1]%in%e,]
ll=d[d[,1]%in%l,]
vioplot::vioplot(ee[,2],ll[,2],col="gray",names=c("Old-Era","New-Era"))
mean(ee[,2])
mean(ll[,2])
t.test(ee[,2],ll[,2])

p=read.table("Phenotype.txt", header=TRUE,sep="\t")
d=p[,c(1,which(colnames(p)=="UpperLeafAngle"))]
ee=d[d[,1]%in%e,]
ll=d[d[,1]%in%l,]
vioplot::vioplot(ee[,2],ll[,2],col="gray",names=c("Old-Era","New-Era"))
mean(ee[,2])
mean(ll[,2])
t.test(ee[,2],ll[,2])

