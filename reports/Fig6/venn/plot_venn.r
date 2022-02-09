library(data.table)
library(Ropt)
library(VennDiagram)
d1=fread("LN_HN_Leaf_fd2_fdr001_fil_FM.txt", header=T,data.table=F)
d2=fread("NEW_vs_OLD_Leaf_fd2_fdr001_fil_FM.txt", header=T,data.table=F)

d3=fread("LN_HN_Root_fd2_fdr001_fil_FM.txt", header=T,data.table=F)
d4=fread("NEW_vs_OLD_Root_fd2_fdr001_fil_FM.txt", header=T,data.table=F)
HN_LN_L=d1[,1]
HN_LN_R=d3[,1]
Old_New_L=d2[,1]
Old_New_R=d4[,1]

pdf("DEGs_venn3.pdf",height = 3,width = 4)
par(mar=c(4,4,2,2),mfrow=c(1,1))
grid.newpage()
T <- venn.diagram(list(A = HN_LN_L, B = HN_LN_R, C = Old_New_L, D = Old_New_R), filename = NULL, lwd = 1, lty = 2,
                  col = c("pink", "aquamarine2", "deepskyblue","#FF8C00"), fill = c("pink", "aquamarine2", "deepskyblue","#FF8C00"), cat.col = c("pink",
                                                                                                 "aquamarine2", "deepskyblue","#FF8C00"), reverse = TRUE)
grid.draw(T)
dev.off()

