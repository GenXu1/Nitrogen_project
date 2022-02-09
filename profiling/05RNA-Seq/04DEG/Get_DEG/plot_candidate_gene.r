library(data.table)
library(Ropt)
inf=fread("group_info.txt",head=T,data.table=F)
d=fread("FPKM_Old_new_four_lines.csv",head=T,data.table=F,skip=0)
g=c("Zm00001d014451","Zm00001d014456","Zm00001d014458")
d1=d[d[,1]%in%g,]
d2=t(d1)
colnames(d2)=d2[1,]
d2=d2[-1,]
write.table(d2,"Glu.gene.FPKM.txt",quote = F,sep="\t",row.names = T,col.names = T)

#########Get mean value and sd
d=fread("Glu.gene.FPKM.txt",head=T,data.table=F)
res=NULL
for(i in unique(d[,9]))
{
  d1=d[d[,9]==i,]
  d2=d1[,2:4]
  m=apply(d2,2,mean)
  sd=apply(d2,2,sd)
  r=c(i,m,sd)
  res=rbind(res,r)
}
colnames(res)[1]="ID"
colnames(res)[2:4]=qq("{colnames(res)[2:4]}-mean")
colnames(res)[5:7]=qq("{colnames(res)[5:7]}-sd")
write.table(res,"Glu.gene.FPKM_mean.txt",quote = F,sep="\t",row.names = F,col.names = T)

####plot FPKM
d=fread("Glu.gene.FPKM_mean.txt",head=T,data.table=F)
g1=d[,c(8,2,5)]
g2=d[,c(8,3,6)]
g3=d[,c(8,4,7)]
tiff("Glu.gene.FPKM.tiff",res=600,units = "mm",height = 180,width = 210)
par(mfrow=c(3,1),mar=c(4,4,1,1))
##########Gene1
x=barplot(g1[,2],col=c("slateblue","cyan4"),border ="white",ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,2),main="Gene1")
abline(v=6.25,lty=2)
axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
legend("topright",c("HN","LN"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g1[,2], x1 = x, y1 = g1[,2]-g1[,3],angle = 90, length = 0.05)
arrows(x0 = x, y0 = g1[,2], x1 = x, y1 = g1[,2]+g1[,3],angle = 90, length = 0.05)
text(x=c(3.5,9),y=c(1.9,1.9),labels=c("Shoot","Root"),font=2,cex=1)
##########Gene2
x=barplot(g2[,2],col=c("slateblue","cyan4"),border ="white",ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,15),main="Gene2")
abline(v=6.25,lty=2)
axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
legend("topright",c("HN","LN"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g2[,2], x1 = x, y1 = g2[,2]-g2[,3],angle = 90, length = 0.05)
arrows(x0 = x, y0 = g2[,2], x1 = x, y1 = g2[,2]+g2[,3],angle = 90, length = 0.05)
text(x=c(3.5,9),y=c(14,14),labels=c("Shoot","Root"),font=2,cex=1)
##########Gene3
x=barplot(g3[,2],col=c("slateblue","cyan4"),border ="white",ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,45),main="Gene3")
abline(v=6.25,lty=2)
axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
legend("topright",c("HN","LN"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g3[,2], x1 = x, y1 = g3[,2]-g3[,3],angle = 90, length = 0.05)
arrows(x0 = x, y0 = g3[,2], x1 = x, y1 = g3[,2]+g3[,3],angle = 90, length = 0.05)
text(x=c(3.5,9),y=c(44,44),labels=c("Shoot","Root"),font=2,cex=1)
dev.off()

################Get candidate gene res
library(data.table)
library(Ropt)
g=c("Zm00001d014451","Zm00001d014456","Zm00001d014458")
f=list.files(path=".",patt="csv")[-11]
res=NULL
for(i in f)
{
  na=gsub(".csv","",i)
  d=fread(i,head=T,data.table=F,skip=0)
  d1=d[d[,1]%in%g,]
  Compa=rep(na,nrow(d1))
  d2=cbind(d1,Compa)
  res=rbind(res,d2)
}
res1=res[order(res[,8],res[,1]),]
colnames(res1)[1]="Gene"
write.table(res1,"Candidate_gene_res.txt",quote=F,sep="\t",col.names = T,row.names = F)

#################plot#####candidate
tiff("Candidate_gene_fd3.tiff",res=600,units = "mm",height = 180,width = 210)
par(mfrow=c(1,1),mar=c(12,4,1,1))
d=fread("Candidate_gene_res.txt",head=T,data.table=F,skip=0)
fd=d[,9]
q=-log10(d[,7])
plot(1:30,fd,pch=16,cex=q/3,col=c("gray","slateblue","cyan4"),ylab="Fold Change",axes=F,xlab="",ylim=c(-5,3))
axis(2,las=1)
axis(1,las=2,at=seq(2,30,by=3),labels = d[seq(2,30,by=3),8])
abline(v=seq(3.5,30.5,by=3),type=2,col="gray")
box()
dev.off()

tiff("Lend.tiff",res=600,units = "mm",height = 180,width = 210)
par(mfrow=c(1,1),mar=c(12,4,1,1))
x=c(1e-2,1e-4,1e-6,1e-8)
plot(rep(1,4),1:4,pch=16,cex=-log10(x)/3)
dev.off()

tiff("Lend2.tiff",res=600,units = "mm",height = 180,width = 210)
par(mfrow=c(1,1),mar=c(12,4,1,1))
x=c(1e-2,1e-4,1e-6,1e-8)
plot(rep(1,3),1:3,pch=16,cex=2,col=c("gray","slateblue","cyan4"))
dev.off()