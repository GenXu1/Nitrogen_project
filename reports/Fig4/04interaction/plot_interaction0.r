library(data.table)
start=47.7;end=48.3
gd=fread("gene_info.txt", header=T,data.table=F)
gd[,3]=gd[,3]/1e6;gd[,4]=gd[,4]/1e6;
gd=gd[gd[,3]>=start & gd[,4]<=end,]
inf="3genes_interactions.txt";col="#E39500";minp=start;maxp=end
dd=fread(inf,head=T,na.str="NA",data.table=F)
dd[,2]=dd[,2]/1e6;dd[,3]=dd[,3]/1e6;dd[,4]=dd[,4]/1e6;dd[,5]=dd[,5]/1e6
dd=dd[dd[,2]>=start & dd[,5]<=end,]
lim=c(start,end)

out="Interaction_3genes_chip3.pdf"
pdf(out,height =15 ,width = 8.5)
par(mfrow=c(13,1),mar=c(2,4,2,2))
col1=adjustcolor("gray",alpha.f =0.7)
col2=adjustcolor("red",alpha.f =0.7)
col3=adjustcolor("blue",alpha.f =0.7)

i=unique(dd[,8])[2]
d1=dd[dd[,8]==i,]
plot(1,1,xlim=lim,ylim=c(0,4),axes = F,xlab="",ylab="",main=i)
abline(h=1,lwd=2)
for(j in 1:nrow(d1))
{
  s=spline(c((d1[j,2]+d1[j,3])/2,(d1[j,3]+d1[j,4])/2,(d1[j,4]+d1[j,5])/2),c(1,6,1),n=201)
  x=s$x
  y=spline(c(1,3,5),c(5,6,5),n=201)$y-4
  points( x,y,type="l",lwd=2,col="slateblue") 
}
rect(gd[,3],0.8,gd[,4],1.2,col=col1,border = col1)
rect(gd[c(2,4,5),3],0.8,gd[c(2,4,5),4],1.2,col=col2,border = col2)
rect(gd[c(7:9),3],0.8,gd[c(7:9),4],1.2,col=col3,border = col3)

i=unique(dd[,8])[3]
d1=dd[dd[,8]==i,]
plot(1,1,xlim=lim,ylim=c(0,4),axes = F,xlab="",ylab="",main=i)
abline(h=1,lwd=2)
for(j in 1:nrow(d1))
{
  s=spline(c((d1[j,2]+d1[j,3])/2,(d1[j,3]+d1[j,4])/2,(d1[j,4]+d1[j,5])/2),c(1,6,1),n=201)
  x=s$x
  y=spline(c(1,3,5),c(5,6,5),n=201)$y-4
  points( x,y,type="l",lwd=2,col="slateblue") 
}
rect(gd[,3],0.8,gd[,4],1.2,col=col1,border = col1)
rect(gd[c(2,4,5),3],0.8,gd[c(2,4,5),4],1.2,col=col2,border = col2)
rect(gd[c(7:9),3],0.8,gd[c(7:9),4],1.2,col=col3,border = col3)

 i=unique(dd[,8])[1]
  d1=dd[dd[,8]==i,]
  plot(1,1,xlim=lim,ylim=c(0,4),axes = F,xlab="",ylab="",main=i)
  abline(h=1,lwd=2)
  for(j in 1:nrow(d1))
  {
    s=spline(c((d1[j,2]+d1[j,3])/2,(d1[j,3]+d1[j,4])/2,(d1[j,4]+d1[j,5])/2),c(1,6,1),n=201)
    x=s$x
    y=spline(c(1,3,5),c(5,6,5),n=201)$y-4
    points( x,y,type="l",lwd=2,col="cyan4") 
  }
  rect(gd[,3],0.8,gd[,4],1.2,col=col1,border = col1)
  rect(gd[c(2,4,5),3],0.8,gd[c(2,4,5),4],1.2,col=col2,border = col2)
  rect(gd[c(7:9),3],0.8,gd[c(7:9),4],1.2,col=col3,border = col3)
  
  i=unique(dd[,8])[4]
  d1=dd[dd[,8]==i,]
  plot(1,1,xlim=lim,ylim=c(0,4),axes = F,xlab="",ylab="",main=i)
  abline(h=1,lwd=2)
  for(j in 1:nrow(d1))
  {
    s=spline(c((d1[j,2]+d1[j,3])/2,(d1[j,3]+d1[j,4])/2,(d1[j,4]+d1[j,5])/2),c(1,6,1),n=201)
    x=s$x
    y=spline(c(1,3,5),c(5,6,5),n=201)$y-4
    points( x,y,type="l",lwd=2,col="cyan4") 
  }
  rect(gd[,3],0.8,gd[,4],1.2,col=col1,border = col1)
  rect(gd[c(2,4,5),3],0.8,gd[c(2,4,5),4],1.2,col=col2,border = col2)
  rect(gd[c(7:9),3],0.8,gd[c(7:9),4],1.2,col=col3,border = col3)
  
##plot ChIP-seq
#  start=47.7;end=48.3
  dp_f=list.files(path=".",pattern = "bw")
  ##plot chip-seq in teo
  dp_f1=dp_f[c(4,3)]
  for(i in dp_f1)
  {
    d1=fread(i,head=F,na.str="NA",data.table=F)
    d1=d1[d1[,2]>=start*1e6 & d1[,2]<=end*1e6,]
    plot((d1[,2]+d1[,3])/2e6,d1[,4],xlim=c(start,end),ylim=c(0,80),type="h",col="slateblue",axes = F,ylab="")
    # axis(1,las=1,at=c(start,135.96,135.99,end),cex.axis=1.5)
    axis(2,tick=0.03,las=1)
  }
  
  ##plot chip-seq in teo
  dp_f2=dp_f[c(2,1)]
  for(i in dp_f2)
  {
    d1=fread(i,head=F,na.str="NA",data.table=F)
    d1=d1[d1[,2]>=start*1e6 & d1[,2]<=end*1e6,]
    plot((d1[,2]+d1[,3])/2e6,d1[,4],xlim=c(start,end),ylim=c(0,80),type="h",col="cyan4",axes = F,ylab="")
    # axis(1,las=1,at=c(start,135.96,135.99,end),cex.axis=1.5)
    axis(2,tick=0.03,las=1)
  }
  
  d1=fread("STARR/starr-rna.dup.reverse-5-48028767..48051268.bedgraph",head=F,na.str="NA",data.table=F,skip=1)
 d1=d1[d1[,2]>=start*1e6 & d1[,3]<=end*1e6,]
   plot((d1[,2]+d1[,3])/2e6,d1[,4],xlim=c(start,end),ylim=c(0,800),type="h",col="slateblue",main="STAR-RNA",axes = F,ylab="",xlab="")
  axis(2,tick=0.03,las=1)
  
  d1=fread("STARR/starr-scaled-input.dup.reverse-5-48028767..48051268.bedgraph",head=F,na.str="NA",data.table=F)
  d1=d1[d1[,2]>=start*1e6 & d1[,3]<=end*1e6,]
    plot((d1[,2]+d1[,3])/2e6,d1[,4],xlim=c(start,end),type="h",ylim=c(0,800),col="slateblue",main="STAR-input",axes = F,ylab="",xlab="")
  axis(2,tick=0.03,las=1)
  
  plot(1,1,xlim=c(start,end),ylim=c(0,4),axes = F,xlab="",ylab="")
  #axis(1,cex.axis=1.5,at=c(start,135.96,135.99,end))
  axis(1,cex.axis=1.5)
  dev.off()
