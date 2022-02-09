library("data.table")
library(qqman)
 d=fread("early_late_50K.windowed.weir.fst",header = T,data.table=F)
 pos=(d[,2]+d[,3])/2
 d=cbind(d[,1],pos,d[,5])
 d=d[d[,3]>=0,]
 snp=paste(d[,1],d[,2],sep="-")
 d=cbind(snp,d)
 d=na.omit(d)
 colnames(d)=c("SNP","Chr","Pos","Fst")
 write.table(d,"early_late_50k.weir.99fst.txt",sep="\t",col.names = T,quote=F,row.names = F)
 
 d=fread("early_late_50k.weir.99fst.txt",header = T,data.table=F)
 thr=quantile(d[,4],0.995)
 sig=d[d[,4]>=thr,]
 write.table(sig,"sig_early_late_50k.weir.99fst.txt",sep="\t",col.names = T,quote=F,row.names = F)
  out=paste("early_late_50k",".Manttan.png",sep="")
  png(out,height = 140,width =210,units = "mm",res=600)
  par(mfrow=c(1,1),mar=c(4,5,1,1))
  manhattan(d, chr = "Chr", bp = "Pos", p = "Fst", snp = "SNP",
            col = c("slateblue", "cyan4"), chrlabs = NULL,
            suggestiveline = F, genomewideline =thr ,logp = F,ylim=c(0,0.5),ylab="Fst")
  dev.off()
  
