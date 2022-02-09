library(data.table)
library(Ropt)
library(vioplot)
exp=fread("TPM_TEO_MZ.csv",header = T,sep=",",data.table=F)
exp=exp[exp[,2]>0 | exp[,3]>0 | exp[,4]>0 | exp[,5]>0,]
exp[,2]=exp[,2]+0.01
exp[,3]=exp[,3]+0.01
exp[,4]=exp[,4]+0.01
exp[,5]=exp[,5]+0.01
exp[,6]=exp[,6]+0.01
exp[,7]=exp[,7]+0.01
pdf("Gene_expression.pdf",height = 6,width = 8)
par(mfrow=c(1,1),mar=c(2,4,1,1))
vioplot(log10(exp[,2]),log10(exp[,3]),log10(exp[,4]),log10(exp[,5]),log10(exp[,6]),log10(exp[,7]),col="gray",border ="gray",ylab="log10(TPM)",names=c("TEO_Rep1","TEO_Rep2","TEO_Rep3","W22_Rep1","W22_Rep2","W22_Rep3"),axes=FALSE,las=1)
dev.off()

library(PerformanceAnalytics)
TEO=exp[,2:4]
MZ=exp[,5:7]
TEO_m=apply(TEO, 1,mean)
MZ_m=apply(MZ, 1,mean)
pdf("Gene_expression_ratio.pdf",height = 4,width = 4)
par(mfrow=c(1,1),mar=c(4,4,1,1))
chart.Histogram(log10(MZ_m/TEO_m),methods=c("add.density","add.rug"),cex.axis = 1.2,cex.lab = 1.2,xlab="log10(MZ/TEO)",main="",lwd=.7)
#hist(log10(MZ_m/TEO_m),col="skyblue",breaks = 50,xlab="log10(MZ/TEO)",main="")
dev.off()
