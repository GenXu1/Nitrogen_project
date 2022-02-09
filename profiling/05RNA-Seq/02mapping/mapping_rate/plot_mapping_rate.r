library(data.table)
library(Ropt)
library(vioplot)
d=fread("Mapping_rate.txt",header = T,sep="\t",data.table=F)
tiff("mapping_rate.tiff",height = 100,width =210,units = "mm",res=600)
par(mfrow=c(1,1),mar=c(7,5,1,1))
d[,2]=d[,2]*2/1e6
d[,3]=d[,3]*2/1e6

d1=d[,2:3]
rownames(d1)=d[,1]
barplot(as.matrix(t(d1)),beside = T,border="white",col=c("black","gray"),ylab="Read counts (M)",las=2,ylim=c(0,70))
legend("top",c("Total reads", "Mapped reads"),ncol = 2,col=c("black","gray"),pch=15,bty="n",cex=1.2)
dev.off()

tiff("data_size_mapping_rate.tiff",height = 150,width =100,units = "mm",res=300)
par(mfrow=c(2,1),mar=c(4,5,1,1))
hist(d[,4],breaks = 10,xlab="Gb",main="Data size")
hist(d[,5],breaks = 10,xlab="%",main="Mapping rate")
dev.off()


