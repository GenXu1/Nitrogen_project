library("data.table")
library(qqman)
f=list.files(path=".",patt="snpRes$")
for(i in f)
{
  d=fread(i,header = T,data.table=F)
  out=paste(i,".Manttan.png",sep="")
  png(out,height = 140,width =210,units = "mm",res=600)
  par(mfrow=c(1,1),mar=c(4,5,1,1))
  manhattan(d, chr = "Chrom", bp = "Position", p = "A1Effect", snp = "Name",
            col = c("slateblue", "cyan4"), chrlabs = NULL,
            suggestiveline = F, genomewideline = 2,logp = F,ylim=c(min(d[,8]),max(d[,8]))) 
  dev.off()
}

quantile()