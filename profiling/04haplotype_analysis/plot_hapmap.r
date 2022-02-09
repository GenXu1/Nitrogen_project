library(data.table)
library(Ropt)
library(pheatmap)
d=fread("glu_reg_maf005_282panel_012.txt", header=T,data.table=F)
g1=d[d[,2]>=47926635 & d[,2]<=47935975,]
g2=d[d[,2]>=48032203 & d[,2]<=48045502,]
g3=d[d[,2]>=48258780 & d[,2]<=48268573,]
write.table(g1,file="Zm00001d014451.hmp.txt",sep="\t",col.names = T,row.names = F,quote=F)
write.table(g2,file="Zm00001d014456.hmp.txt",sep="\t",col.names = T,row.names = F,quote=F)
write.table(g3,file="Zm00001d014458.hmp.txt",sep="\t",col.names = T,row.names = F,quote=F)

g11=t(g1[,-c(1:9)])
g11=g11[order(g11[,2],g11[,6],g11[,15]),]
g22=t(g2[,-c(1:9)])
g22=g22[order(g22[,2],g22[,6],g22[,7]),]
g33=t(g3[,-c(1:9)])
pdf("Zm00001d014451.pdf",height = 55,width = 45)
par(mar=c(2,2,0,8),mfrow=c(1,1))
pheatmap(g11,cluster_rows =F,cluster_cols =F,fontsize = 16,cellwidth=12,cellheight=12,border_color=NA,color=c("skyblue","gray","pink"),show_colnames =F,show_rownames = T)
dev.off()

pdf("Zm00001d014456.pdf",height = 55,width = 45)
par(mar=c(2,2,0,8),mfrow=c(1,1))
pheatmap(g22,cluster_rows =F,cluster_cols =F,fontsize = 16,cellwidth=12,cellheight=12,border_color=NA,color=c("skyblue","gray","pink"),show_colnames =F,show_rownames = T)
dev.off()
