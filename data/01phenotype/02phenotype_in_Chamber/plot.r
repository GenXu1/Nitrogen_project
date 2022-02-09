library(data.table)
library(Ropt)
library(vioplot)
plot_error <- function(x, y, sd, len = 1, col = "black") {
  len <- len * 0.05
  arrows(x0 = x, y0 = y, x1 = x, y1 = y - sd, col = col, angle = 90, length = len)
  arrows(x0 = x, y0 = y, x1 = x, y1 = y + sd, col = col, angle = 90, length = len)
}

d1=fread("plant_height.txt",head=T,data.table = F,na.str="NA")
d2=d1[,-c(1:3)]
m=apply(d2, 1, mean,na.rm=T)
sd=apply(d2, 1, sd,na.rm=T)
x=c(1,2,4,5,7,8,10,11,13,14,16,17,19,20,22,23)
png("plant_height.png",height = 120,width =180,units = "mm",res=600)
par(mfrow=c(1,1),mar=c(4,4,1,1))
plot(x,m,pch=16,col=c("blue","skyblue"),cex=2,ylim=c(10,30),axes=F,ylab="cm",xlab="")
arrows(x0 = x, y0 = m, x1 = x, y1 = m - sd, col = "black", angle = 90, length = 0.03)
arrows(x0 = x, y0 = m, x1 = x, y1 = m + sd, col = "black", angle = 90, length = 0.03)
axis(2,las=1)
axis(1,las=1,at=seq(1.5,22.5,by=3),labels =unique(d1[,1]))
legend("topright",legend = c("HN","LN"),pch=16,col=c("blue","skyblue"),bty="n",horiz=T,cex=1.5)
dev.off()

################Weight of Plant shoot and root#####################
d1=fread("shoot_root_fresh_weight.txt",head=T,data.table = F,na.str="NA")
shoot=d1[d1[,4]=="Shoot",]
root=d1[d1[,4]=="Root",]

png("plant_shoot.png",height = 180,width =210,units = "mm",res=600)
par(mfrow=c(2,1),mar=c(4,4,1,1))

d2=shoot[,-c(1:4)]
m=apply(d2, 1, mean,na.rm=T)
sd=apply(d2, 1, sd,na.rm=T)
x=c(1,2,4,5,7,8,10,11,13,14,16,17,19,20,22,23)

plot(x,m,pch=16,col=c("blue","skyblue"),cex=2,ylim=c(0,8),axes=F,ylab="Fresh Shoot(g)",xlab="")
arrows(x0 = x, y0 = m, x1 = x, y1 = m - sd, col = "black", angle = 90, length = 0.03)
arrows(x0 = x, y0 = m, x1 = x, y1 = m + sd, col = "black", angle = 90, length = 0.03)
axis(2,las=1)
#axis(1,las=1,at=seq(1.5,22.5,by=3),labels =unique(d1[,1]))
legend("topright",legend = c("HN","LN"),pch=16,col=c("blue","skyblue"),bty="n",horiz=T,cex=1.5)

d2=root[,-c(1:4)]
m=apply(d2, 1, mean,na.rm=T)
sd=apply(d2, 1, sd,na.rm=T)
x=c(1,2,4,5,7,8,10,11,13,14,16,17,19,20,22,23)

plot(x,m,pch=16,col=c("blue","skyblue"),cex=2,ylim=c(0,8),axes=F,ylab="g",xlab="")
arrows(x0 = x, y0 = m, x1 = x, y1 = m - sd, col = "black", angle = 90, length = 0.03)
arrows(x0 = x, y0 = m, x1 = x, y1 = m + sd, col = "black", angle = 90, length = 0.03)
axis(2,las=1)
#axis(1,las=1,at=seq(1.5,22.5,by=3),labels =unique(d1[,1]))
legend("topright",legend = c("HN","LN"),pch=16,col=c("blue","skyblue"),bty="n",horiz=T,cex=1.5)
dev.off()














