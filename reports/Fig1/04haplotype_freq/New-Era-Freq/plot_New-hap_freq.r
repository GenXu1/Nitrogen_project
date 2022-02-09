library(data.table)
library(Ropt)
d=fread("New-hap.freq.txt", header=T,data.table=F)
d=d[d[,2]=="Teosinte" |  d[,2]=="Landrace" |  d[,2]=="New-Era"|  d[,2]=="Old-Era",]
pdf("Blocks_fav_hap_freq.pdf",height = 4,width = 4)
par(mar=c(4,4,2,0),mfrow=c(1,1))
cols <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00")
cols=adjustcolor(cols,alpha.f = 0.6)
for(i in unique(d[,1])[1])
{
 d1=d[d[,1]==i,] 
 plot(1:4,d1[c(4,1,3,2),3],pch=16,col=cols[1],cex=1,lwd=2,type="b",axes=F,xlab="Population",ylab="New-Era haplotype Freq",main="",ylim=c(0,1))
 axis(2,tick=-0.03,las=1)
 axis(1,tick=-0.03,at=1:4,labels = d1[c(4,1,3,2),2])
 grid()
}
j=2
for(i in unique(d[,1])[-1])
{
  d1=d[d[,1]==i,] 
  points(1:4,d1[c(4,1,3,2),3],pch=16,col=cols[j],cex=1,lwd=2,type="b",main="",ylim=c(0,1))
j=j+1
}
legend("top",legend =qq("BLK{1:6}"),pch=16,lwd=2,cex=1,col=cols,bty="n",ncol=6 )
dev.off()

library(ggplot2)
library(data.table)
d=fread("New-hap.freq2.txt", header=T,data.table=F)
colnames(d)=c("Block","Era","Freq")
cols <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00")
cols=adjustcolor(cols,alpha.f = 0.6)
#d$Era <- factor(d$Era,levels=c("ER60","ER70","ER80","ER90","ER00","ER10"))
pdf("CN_era_fav_hap_6Blks.pdf",height = 5,width = 5)
par(mar=c(4,4,2,0),mfrow=c(1,1))
ggplot(data = d,aes(x=Era,y=Freq,colour=Block))+
  geom_point(size=1.5)+
  scale_color_manual(values = cols)+
  geom_smooth(method = 'lm',formula = y~x)+
  theme_classic()+
  labs(y = "Favorable haplotype freq",
       x="Era")+
 ylim(0, 1)+
  theme(legend.position="top")+
  guides(color=guide_legend('',nrow=1,ncol=6,label.position='right'))+
  scale_x_continuous(breaks = 1:6,labels=c("1960s","1970s","1980s","1990s","2000s","2010s"))+
theme(axis.text.x = element_text(size=12),axis.text.y = element_text(size=12))
 dev.off()
 
  



