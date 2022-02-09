library(data.table)
library(Ropt)
library(vioplot)
g=fread("Gene_structure.txt", header=T,data.table=F,na.strin="NA")
g=g[g[,2]=="Gene2" & g[,1]=="B73_V4" & g[,3]=="exon",]
d1=fread("Glu.methy.CG.Teo_Maize.txt", header=T,data.table=F,na.strin="NA")
d1=d1[,c(1:2,23:36)]
h1=d1[,c(1:2,3,4,6:10,12,13)]
h3=d1[,c(1:2,5,11,14:16)]
res=NULL
for(i in 1:nrow(g))
{
  d2=g[i,]
  s=d2[1,4];e=d2[1,5]
 h11=h1[h1[,2]>=s & h1[,2]<=e,] 
 h33=h3[h3[,2]>=s & h3[,2]<=e,] 
 m1=apply(h11[,-c(1:2)],2,function(x){x1=na.omit(x);mean(x1)})
 m3=apply(h33[,-c(1:2)],2,function(x){x1=na.omit(x);mean(x1)})
 p=t.test(m1,m3)$p.value
 r=c(qq("Exon{i}"),p,m1,m3)
 res=rbind(res,r)
}
colnames(res)[1:2]=c("Exon","P-value")
write.table(res,file="DNA-meth_exon.txt",row.names = F,quote = F,sep="\t")

d=fread("DNA-meth_exon.txt", header=T,data.table=F,na.strin="NA")
pdf("DNA-meth_exon.pdf",height = 2.7,width = 5.5)
par(mar=c(4,4,1,0),mfrow=c(1,1))
h1=t(d[,3:11])
h3=t(d[,12:16])
h1[,4]=h1[,4]+0.01
vioplot(h1[,1],h3[,1],h1[,2],h3[,2],h1[,3],h3[,3],h1[,4],h3[,4],h1[,5],h3[,5],h1[,6],h3[,6],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="mCG",names=rep(c("Hap1","Hap3"),6),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6,ylim=c(0,1.2))
abline(v=c(2.5,4.5,6.5,8.5,10.5),col="gray")
box()
segments(6.7,0,7.3,0,col="slateblue")
points(7,0,col="white",pch=16)
dev.off()
