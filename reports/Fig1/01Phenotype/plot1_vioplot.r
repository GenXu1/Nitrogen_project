library(data.table)
library(Ropt)
library(vioplot)
##Plot HN-N, LN-N in old and new lines
p=fread("Phenotype.txt",head=T,data.table = F)
p=p[,c(1,13,28,43,4,19,34,6,21,36)]
e=fread("early_lines.txt",head=F,data.table = F)[,1]
ee=p[p[,1]%in%e,]
l=fread("late_lines.txt",head=F,data.table = F)[,1]
ll=p[p[,1]%in%l,]
pdf("N_Content_response_N_CHL_DW.pdf",height = 2,width = 8.5)
#png("N_treatment_response.png",height = 150,width = 210,units = "mm",res=300)
par(layout(matrix(c(1,1,2,3,3,4,5,5,6),nr=1)),mar=c(4,4,1,1))
vioplot(ee[,2],ll[,2],ee[,3],ll[,3],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="N",names=rep(c("Old-Era","New-Era"),2),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.3,ylim=c(1.5,3.5))
vioplot(ee[,4],ll[,4],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="HN/LN",names=c("Old-Era","New-Era"),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6,ylim=c(1,1.8))

vioplot(ee[,5],ll[,5],ee[,6],ll[,6],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="CHL",names=rep(c("Old-Era","New-Era"),2),cex.axis = 1,cex.lab = 1.5,main="",las=1,ylim=c(200,500),axes=F,horizontal =F,xlab="",cex=0.6)
vioplot(ee[,7],ll[,7],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="HN/LN",names=c("Old-Era","New-Era"),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6,ylim=c(1,1.8))

vioplot(ee[,8],ll[,8],ee[,9],ll[,9],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="CHL",names=rep(c("Old-Era","New-Era"),2),cex.axis = 1,cex.lab = 1.5,main="",las=1,ylim=c(4,11),axes=F,horizontal =F,xlab="",cex=0.6)
vioplot(ee[,10],ll[,10],col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="HN/LN",names=c("Old-Era","New-Era"),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6,ylim=c(0.5,1.8))
dev.off()

t.test(ee[,8],ll[,8])
t.test(ee[,9],ll[,9])
t.test(ee[,10],ll[,10])


t.test(ee[,3],ll[,3])
t.test(ee[,2],ll[,2])

##get sfig1
pdf("N_treatment_response_other_traits2.pdf",height = 5,width = 8.3)
par(mfrow=c(1,1),mar=c(4,4,1,1))
vioplot(ee[,2],ll[,2],ee[,3],ll[,3],ee[,5],ll[,5],ee[,6],ll[,6],
        ee[,7],ll[,7],ee[,8],ll[,8],ee[,9],ll[,9],ee[,10],ll[,10],
        ee[,11],ll[,11],ee[,12],ll[,12],ee[,14],ll[,14],ee[,15],ll[,15],ee[,16],ll[,16],
        col=c("slateblue","cyan4"),border =c("slateblue","cyan4"),ylab="HN/LN",names=rep(c("Old-Era","New-Era"),13),cex.axis = 1,cex.lab = 1.5,main="",las=1,ylim=c(0.5,2.5),axes=F,horizontal =F,xlab="",cex=0.6)
#abline(h=2.5,lty=2,col="gray",lwd=2.5)
#grid()
dev.off()