library(data.table)
library(Ropt)
inf=fread("group_info.txt",head=T,data.table=F)
d=fread("FPKM_Old_new_four_lines2.csv",head=T,data.table=F,skip=0)
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
pdf("Glu.gene.FPKM.pdf",height = 5,width = 5)
par(mfrow=c(3,1),mar=c(4,4,1,1))
##########Gene1
x=barplot(g1[,2],angle = c(0,30),density = c(100,20),col=c(rep("slateblue",4),rep("cyan4",4)),border =c(rep("slateblue",4),rep("cyan4",4)),ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,2),main="ZmGLR3.4a")
abline(v=6.25,lty=2)
#axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
legend("topright",c("Old-Era","New-Era"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g1[,2], x1 = x, y1 = g1[,2]-g1[,3],angle = 90, length = 0.05,lwd=0.8)
arrows(x0 = x, y0 = g1[,2], x1 = x, y1 = g1[,2]+g1[,3],angle = 90, length = 0.05,lwd=0.8)
text(x=c(3.5,9),y=c(1.9,1.9),labels=c("Shoot","Root"),font=2,cex=1)
##########Gene2
x=barplot(g2[,2],angle = c(0,30),density = c(100,20),col=c(rep("slateblue",4),rep("cyan4",4)),border =c(rep("slateblue",4),rep("cyan4",4)),ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,15),main="ZmGLR3.4b")
abline(v=6.25,lty=2)
#axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
#legend("topright",c("HN","LN"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g2[,2], x1 = x, y1 = g2[,2]-g2[,3],angle = 90, length = 0.05,lwd=0.8)
arrows(x0 = x, y0 = g2[,2], x1 = x, y1 = g2[,2]+g2[,3],angle = 90, length = 0.05,lwd=0.8)
#text(x=c(3.5,9),y=c(14,14),labels=c("Shoot","Root"),font=2,cex=1)
##########Gene3
x=barplot(g3[,2],angle = c(0,30),density = c(100,20),col=c(rep("slateblue",4),rep("cyan4",4)),border =c(rep("slateblue",4),rep("cyan4",4)),ylab="FPKM",width =0.5,space = rep(c(1,0),times=8),las=2,ylim=c(0,45),main="ZmGLR3.4c")
abline(v=6.25,lty=2)
axis(1,at=seq(1,11.5,by=1.5),labels =d[seq(1,15,by=2),8])
#legend("topright",c("HN","LN"),col=c("slateblue","cyan4"),pch=15,ncol=2,bty="n")
arrows(x0 = x, y0 = g3[,2], x1 = x, y1 = g3[,2]-g3[,3],angle = 90, length = 0.05,lwd=0.8)
arrows(x0 = x, y0 = g3[,2], x1 = x, y1 = g3[,2]+g3[,3],angle = 90, length = 0.05,lwd=0.8)
#text(x=c(3.5,9),y=c(44,44),labels=c("Shoot","Root"),font=2,cex=1)
dev.off()


#########Calculate FPKM fold change
d=fread("Glu.gene.FPKM_mean.txt",head=T,data.table=F)
leaf=d[d[,6]=="Leaf",]
HN_leaf=d[d[,6]=="Leaf" & d[,7]=="HN",]
LN_leaf=d[d[,6]=="Leaf" & d[,7]=="LN",]

root=d[d[,6]=="Root",]
HN_Root=d[d[,6]=="Root" & d[,7]=="HN",]
LN_Root=d[d[,6]=="Root" & d[,7]=="LN",]

leaf_N=leaf[leaf[,8]=="NEW",]
leaf_O=leaf[leaf[,8]=="OLD",]
mean(leaf_N[,3])/mean(leaf_O[,3])

HN_leaf_N=HN_leaf[HN_leaf[,8]=="NEW",]
HN_leaf_O=HN_leaf[HN_leaf[,8]=="OLD",]
mean(HN_leaf_N[,3])/mean(HN_leaf_O[,3])

LN_leaf_N=LN_leaf[LN_leaf[,8]=="NEW",]
LN_leaf_O=LN_leaf[LN_leaf[,8]=="OLD",]
mean(LN_leaf_N[,3])/mean(LN_leaf_O[,3])

HN_Root_N=HN_Root[HN_Root[,8]=="NEW",]
HN_Root_O=HN_Root[HN_Root[,8]=="OLD",]
1/(mean(HN_Root_N[,3])/mean(HN_Root_O[,3]))

LN_Root_N=LN_Root[LN_Root[,8]=="NEW",]
LN_Root_O=LN_Root[LN_Root[,8]=="OLD",]
1/(mean(LN_Root_N[,3])/mean(LN_Root_O[,3]))
