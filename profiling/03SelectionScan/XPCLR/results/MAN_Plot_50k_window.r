library("data.table")
library(qqman)
 d=fread("Early_late.xpclr.txt",header = T,data.table=F)
 pos=(d[,3]+d[,4])/2
 d=cbind(d[,c(1,2)],pos,d[,12])
 colnames(d)[4]="XPCLR"
 thr=quantile(d[,4],0.995)
 sig=d[d[,4]>=thr,]
 write.table(sig,"sig_early_late_50k.xpclr995.txt",sep="\t",col.names = T,quote=F,row.names = F)
  out=paste("XPCLR_early_late_50k",".Manttan.png",sep="")
  png(out,height = 140,width =210,units = "mm",res=600)
  par(mfrow=c(1,1),mar=c(4,5,1,1))
  manhattan(d, chr = "chrom", bp = "pos", p = "XPCLR", snp = "id",
            col = c("slateblue", "cyan4"), chrlabs = NULL,
            suggestiveline = F, genomewideline =thr ,logp = F,ylim=c(0,max(d[,4])+5),ylab="XPCLR")
  dev.off()
  
