library(data.table)
library(Ropt)
library(DESeq2)
library(edgeR)
library(pheatmap)
library("RColorBrewer")
##http://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html
############????????????????????????#############################
ct=fread("counts.txt",head=T,data.table=F,skip=1)
ct[,1]=gsub("gene:","",ct[,1])
rownames(ct)=ct[,1]
ct=ct[,-c(1:6)]

group_info <- read.table("group_info.txt", stringsAsFactors = F, header = T)
g_Root=group_info[group_info[,4]=="Root",]
ct_r=ct[,g_Root[,7]]

ct=ct_r
treatment <- factor(g_Root[,5])
genotype <- factor(g_Root[,3])
pop<-factor(g_Root[,6])
geneLists <-  row.names(ct)
# ????????????
keepGene <- rowSums(edgeR::cpm(ct)>0) >=4 ##Filtering. Only keep in the analysis those genes which had > 0 reads per million mapped reads in at least two libraries.
table(keepGene);dim(ct)
dim(ct[keepGene,])
ct <- ct[keepGene,]
rownames(ct) <- geneLists[keepGene]

(colData <- data.frame(row.names=colnames(ct), treatment=treatment,genotype=genotype,pop=pop) )

### ??????DESeqDataSet??????
# ?????????????????????????????????????????????????????????????????????????????????????????????:
dds <- DESeqDataSetFromMatrix(countData = ct,
                              colData = colData,
                              design = ~ treatment+pop)
dds <- DESeq(dds)
resultsNames(dds)
res <- results(dds, name="treatment_LN_vs_HN")
res <- res[order(res$padj),] 
write.csv(res,"HN_LN_Root.csv",quote = F,row.names = T)

res <- results(dds, name="pop_OLD_vs_NEW")
res <- res[order(res$padj),] 
write.csv(res,"pop_OLD_vs_NEW_Root.csv",quote = F,row.names = T)
