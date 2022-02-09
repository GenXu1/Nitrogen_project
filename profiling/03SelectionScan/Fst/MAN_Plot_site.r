library("data.table")
library(qqman)
 d=fread("early_late_site.weir.fst",header = T,data.table=F)
 d=d[d[,3]>=0,]
 snp=paste(d[,1],d[,2],sep="-")
 d=cbind(snp,d)
 d=na.omit(d)
 thr=quantile(d[,4],0.995)
 sig=d[d[,4]>=thr,]
 write.table(sig,"early_late_site.weir.99fst.txt",sep="\t",col.names = T,quote=F,row.names = F)
  out=paste("early_late_site",".Manttan.png",sep="")
  png(out,height = 140,width =210,units = "mm",res=600)
  par(mfrow=c(1,1),mar=c(4,5,1,1))
  manhattan(d, chr = "CHROM", bp = "POS", p = "WEIR_AND_COCKERHAM_FST", snp = "snp",
            col = c("slateblue", "cyan4"), chrlabs = NULL,
            suggestiveline = F, genomewideline =thr ,logp = F,ylim=c(0,1),ylab="Fst")
  dev.off()
  
