library(data.table)
library(Ropt)
library(vioplot)
##Plot phenotypes in different haplotypes
p=fread("Glu_282_gene_express.V4.txt",head=T,data.table = F)
p=p[p[,2]=="Zm00001d014456" & p[,9]=="L3Tip" ,c(10,2,8,9)]
hap=fread("BLK4.hap.txt",head=T,data.table = F)
colnames(hap)[1]="Genotype"
d=merge(hap,p,by=1)
hap1=d[d[,5]==1,]
hap2=d[d[,5]==2,]
hap3=d[d[,5]==3,]
pdf("Express_Pheno_diff_haps_blk4.pdf",height = 3,width = 4)
#png("N_treatment_response.png",height = 150,width = 210,units = "mm",res=300)
par(mfrow=c(1,1),mar=c(4,4,1,1))
vioplot(hap1[,7],hap2[,7],hap3[,7],col=c("slateblue","cyan4","darkgoldenrod2"),border =c("slateblue","cyan4","darkgoldenrod2"),ylab="FPKM",names=c("Hap1","Hap2","Hap3"),cex.axis = 1,cex.lab = 1.5,main="",las=1,axes=F,horizontal =F,xlab="",cex=0.6)
dev.off()

