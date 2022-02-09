library(data.table)
library(Ropt)
pop=fread("282_pop_structure.txt", header=F,data.table=F)
colnames(pop)=c("ID","POP")
pc=fread("BLK4.eigenvec", header=F,data.table=F)
eig=fread("BLK4.eigenval", header=F,data.table=F)[,1]
pc.percent <- 100 * eig[1:10]/sum(eig)
pc.percent=round(pc.percent,2)
plot(1:10,pc.percent,type="b",main="BLK4",xlab="PCs")

PC1=pc[,3]
PC2=pc[,4]
PC3=pc[,5]
pdf("BLK4.PCA.3D.pdf",height = 4,width = 4.3)
par(mar=c(4,4,2,2),mfrow=c(1,1))
scatterplot3d(PC1, PC2, PC3, highlight.3d=F, col.axis="black", xlab=qq("PC1 ({pc.percent[1]}%)"), ylab=qq("PC2 ({pc.percent[2]}%)"), zlab=qq("PC3 ({pc.percent[3]}%)"),col.grid="grey", pch=1,color="blue",box=F,cex.symbols=0.8,cex.axis=0.8)
dev.off()

pdf("suishi_BLK4.pdf",height = 4,width = 4.3)
plot(1:10,cumsum(pc.percent),type="b",pch=16,col="gray",lwd=2,xlab="PCs",ylab="Explained variation (%)",main = "BLK4")
grid()
dev.off()

pc=pc[,c(1,3,4,5)]
colnames(pc)=c("ID","PC1","PC2","PC3")
pc=merge(pop,pc,by=1)
col0=rainbow(20)[seq(1,20,by=3)[1:6]]
col0[3]="gray"
col0[1]=adjustcolor(col0[1],alpha.f = .4)
col0[2]=adjustcolor(col0[2],alpha.f = .4)
col0[3]=adjustcolor(col0[3],alpha.f = .4)
col0[4]=adjustcolor(col0[4],alpha.f = .4)
col0[5]=adjustcolor(col0[5],alpha.f = .4)
col0[6]=adjustcolor(col0[6],alpha.f = .4)
col=vector(length = nrow(pc))
col[which(pc[,2]=="nss")]=col0[1]
col[which(pc[,2]=="popcorn")]=col0[2]
col[which(pc[,2]=="mixed")]=col0[3]
col[which(pc[,2]=="ts")]=col0[4]
col[which(pc[,2]=="ss")]=col0[5]
col[which(pc[,2]=="sweet")]=col0[6]

eig=fread("BLK4.eigenval", header=F,data.table=F)[,1]
pc.percent <- 100 * eig[1:10]/sum(eig)
pc.percent=round(pc.percent,2)

pdf("BLK4.PCA.2D_V3.pdf",height = 4,width = 4)
par(mar=c(4,4,2,2),mfrow=c(1,1))
plot(pc[,3], pc[,4],col=col,pch=16, xlab=qq("PC1 ({pc.percent[1]}%)"), ylab=qq("PC2 ({pc.percent[2]}%)"),las=1,tck=-0.02)
#legend("topleft",c("SS","NSS","TS","Sweet","Popcorn","Mixed"),pch=16,col=c(col0[c(5,1,4,6,2,3)]),bty="n",ncol=2) ##??????,right:????????????,c("Teosinte","Landrace","Trop")??????????????????,bty???????????????
dev.off()
