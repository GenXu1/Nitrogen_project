library(data.table)
library(ggplot2)
pdf("yield_in_diff_years3.pdf",height = 4,width = 6)
par(mfrow=c(1,1),mar=c(4,4,1,4))
d=fread("USDA_Nitrogen.txt",head=T,data.table = F)
d1=d[,colnames(d)%in%c("average")]
d1=cbind(d[,1],d1)
d1=as.data.frame(d1)
colnames(d1)=c("Year","nitrogen")
plot(d1[,1],d1[,2],xlim=c(1866,2020),ylim=c(0,180),axes=F,col="white",xlab="Year",ylab="Grain yield (BU/AC)")
axis(4)
#lines(loess(d1[,2]~d1[,1], d1, span=20, degree=2),lwd=3,col="skyblue")
lines(spline(d1[,1],d1[,2],n=2000),lwd=5,col=adjustcolor("blue", alpha.f = 0.5))

d=fread("yield_diff_year.txt",head=T,data.table = F)
g1=d[d[,3]=="1866-1936",]
g2=d[d[,3]=="1937-1955",]
g3=d[d[,3]=="1956-2020",]
points(d[,1],d[,2],col="white")
points(g1[,1],g1[,2],col=adjustcolor("orange", alpha.f = 0.8),pch=16)
points(g2[,1],g2[,2],col=adjustcolor("cyan3", alpha.f = 0.8),pch=16)
points(g3[,1],g3[,2],col=adjustcolor("brown2", alpha.f = 0.8),pch=16)
x1=lm(g1[,2]~g1[,1])$coefficients
y1=1866;y2=1936;y3=1955;y4=2020
segments(y1,y1*x1[2]+x1[1],y2,y2*x1[2]+x1[1])
x2=lm(g2[,2]~g2[,1])$coefficients
segments(y2,y2*x2[2]+x2[1],y3,y3*x2[2]+x2[1])
x3=lm(g3[,2]~g3[,1])$coefficients
segments(y3,y3*x3[2]+x3[1],y4,y4*x3[2]+x3[1])
legend("topleft",c("1866-1936","1937-1955","1956-2020"),col=adjustcolor(c("orange","cyan3","brown2"), alpha.f = 0.8),pch=16,bty="n")
axis(1)
axis(2)
box()
dev.off()