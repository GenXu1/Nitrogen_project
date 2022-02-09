library(data.table)
library(Ropt)
d=fread("282panel.AGPV4.B2_MAF.stat.txt", header=T,data.table=F)
d1=d[d[,7]>0,]
write.table(d1,file="282panel.AGPV4.B2_MAF.stat.txt",row.names = F,quote = F,sep="\t",col.names = T)

d=fread("TEO.AGPV4.B2_MAF.stat.txt", header=T,data.table=F)
d1=d[d[,7]>0,]
write.table(d1,file="TEO.AGPV4.B2_MAF.stat.txt",row.names = F,quote = F,sep="\t",col.names = T)

d=fread("LR.AGPV4.B2_MAF.stat.txt", header=T,data.table=F)
d1=d[d[,7]>0,]
write.table(d1,file="LR.AGPV4.B2_MAF.stat.txt",row.names = F,quote = F,sep="\t",col.names = T)

