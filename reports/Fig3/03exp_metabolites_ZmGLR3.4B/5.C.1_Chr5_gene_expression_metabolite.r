####################Conbine all results
library(pheatmap)
library(Ropt)
f=data.frame(Ty=c("N/-1","N/1","Y/-1","Y/1"))
ge=read.table("2M_genes_gene_exp.txt",sep="\t",header = T)
ress=NULL
for(g in unique(ge[,1]))
{
  #ge=read.table("2M_genes_gene_exp.txt",sep="\t",header = T)
m0 <- read.table("metabolite_name.txt", header=TRUE,sep="\t")
m <- read.table("metabolite_rep1_genotype_namecorrect.txt", header=TRUE)
chr5=ge[ge[,1]==g,]
d0 <- merge(chr5, m,by="Genotype")
for(tr in unique(d0[,6]))
{
  d=d0[d0[,6]==tr,] ##d=d[d[,3]=="L3Tip",] 
  idx <- grep("^X\\.", names(d))
  out <- data.frame()
  for(i in idx){
    #d$newd <- rescale(d[, i], to=c(0,1))
    #  fit <- lm(CPM ~ d[, i] + TissueWODate, data=d)
    fit <- lm(CPM ~ d[, i], data=d)
    pval <- summary(fit)$coefficients[2,4]
    tem <- data.frame(trait= names(d)[i], pval=pval, eff=summary(fit)$coefficients[2,1], std=summary(fit)$coefficients[2,2])
    out <- rbind(out, tem)
  }
  out1=out[,c(1,3)]
m0=merge(m0,out1,by="trait")
colnames(m0)[ncol(m0)]=qq("eff_{tr}")
}
m0=m0[order(m0[,3]),]
colnames(m0)=gsub("eff_","",colnames(m0))
m0=m0[,c(1:3,7,8,4,10,6,9,5)]
m1=m0[,-c(1:3)]
m2=apply(m1, 2, function(x){ifelse(x>0,1,-1)})
# pheatmap(m0[,-c(1:3)],scale = "column",cluster_rows=F,cluster_cols=F,fontsize = 12,display_numbers=F,col=colorRampPalette(c("green","white","firebrick3"))(50) )
# pheatmap(m0[,-c(1:3)],cluster_rows=F,cluster_cols=F,fontsize = 12,display_numbers=F )
# x=scale(m0[,-c(1:3)])
pdf(qq("FPKM_expression_metabolite_{g}_1.pdf"),height = 5,width = 6)
par(mar=c(4,4,2,2),mfrow=c(1,1))
pheatmap(m2,cluster_rows=F,cluster_cols=F,fontsize = 12,display_numbers=F,col=c("skyblue",adjustcolor(c("#EA5514"),alpha.f = 0.7)),border_color ="white" )
dev.off()
 
##########chisq.test
m3=cbind(m0[,1:3],m2)
re=NULL
for(i in 4:ncol(m3))
{
  d=m3[,c(3,i)]
  x=qq("{d[,1]}/{d[,2]}")
  x2=as.data.frame(table(x))
  colnames(x2)[1]="Ty"
  x2=merge(f,x2,by="Ty",all=T)
  x2[which(is.na(x2[,2])=="TRUE"),2]=0
  m4=matrix(c(x2[4,2],x2[2,2],x2[3,2],x2[1,2]),nrow=2,ncol=2)
  rownames(m4)=c("with_N","without_N")
  colnames(m4)=c("Positive","Nagetive")
  p=chisq.test(m4)$p.value
  r=c(colnames(m3)[i],p)
  re=rbind(re,r)
}
colnames(re)=c("Tissue","Chisq_P_value")
re=cbind(rep(g,nrow(re)),re)
colnames(re)[1]="Gene"
ress=rbind(ress,re)
}


write.table(ress,file="Chisq_P_value.txt",row.names = F,col.names = T,quote = F,sep="\t")
