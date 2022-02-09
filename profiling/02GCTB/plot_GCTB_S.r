library("data.table")
plot_error <- function(x, y, sd, len = 1, col = "black") {
  len <- len * 0.05
  arrows(x0 = x, y0 = y, x1 = x, y1 = y - sd, col = col, angle = 90, length = len)
  arrows(x0 = x, y0 = y, x1 = x, y1 = y + sd, col = col, angle = 90, length = len)
}

d=fread("HN_traits_S.txt",header = T,sep="\t",data.table=F)
png("HN_traits_S.png",height = 120,width =210,units = "mm",res=600)
par(mfrow=c(1,1),mar=c(4,4,1,1))
plot(1:nrow(d),d[,2],pch=16,cex=2,col="blue",ylim=c(-3,2),las=1,axes=F,main="HN",ylab="S",xlab="Traits")
plot_error(x=1:nrow(d),y=d[,2],sd=d[,3],len=0.3)
axis(2,las=1)
axis(1,las=1,at=1:nrow(d),labels =d[,1])
abline(h=0,lty=2,col="red")
dev.off()

d=fread("LN_traits_S.txt",header = T,sep="\t",data.table=F)
png("LN_traits_S.png",height = 120,width =210,units = "mm",res=600)
par(mfrow=c(1,1),mar=c(4,4,1,1))
plot(1:nrow(d),d[,2],pch=16,cex=2,col="blue",ylim=c(-3,2),las=1,axes=F,main="LN",ylab="S",xlab="Traits")
plot_error(x=1:nrow(d),y=d[,2],sd=d[,3],len=0.3)
axis(2,las=1)
axis(1,las=1,at=1:nrow(d),labels =d[,1])
abline(h=0,lty=2,col="red")
dev.off()

d=fread("Ratio_traits_S.txt",header = T,sep="\t",data.table=F)
png("Ratio_traits_S.png",height = 120,width =210,units = "mm",res=600)
par(mfrow=c(1,1),mar=c(4,4,1,1))
plot(1:nrow(d),d[,2],pch=16,cex=2,col="blue",ylim=c(-3,2),las=1,axes=F,main="HN/LN",ylab="S",xlab="Traits")
plot_error(x=1:nrow(d),y=d[,2],sd=d[,3],len=0.3)
axis(2,las=1)
axis(1,las=1,at=1:nrow(d),labels =d[,1])
abline(h=0,lty=2,col="red")
dev.off()

