library(data.table)
library(Ropt)
library(VennDiagram)
d1=fread("HN_LN_Leaf.q001.fd2sig.txt", header=T,data.table=F)
d2=fread("pop_OLD_vs_NEW_Leaf.q001.fd2sig.txt", header=T,data.table=F)

d3=fread("HN_LN_Root.q001.fd2sig.txt", header=T,data.table=F)
d4=fread("pop_OLD_vs_NEW_Root.q001.fd2sig.txt", header=T,data.table=F)
HN_LN_L=d1[,1]
HN_LN_R=d3[,1]
Old_New_L=d2[,1]
Old_New_R=d4[,1]

tiff("DEGs_venn.tiff",res=600,units = "mm",height = 120,width = 150)
par(mar=c(4,4,2,2),mfrow=c(1,1))
grid.newpage()
T <- venn.diagram(list(A = HN_LN_L, B = HN_LN_R, C = Old_New_L, D = Old_New_R), filename = NULL, lwd = 1, lty = 2,
                  col = c("red", "green", "blue","darkorange"), fill = c("red", "green", "blue","darkorange"), cat.col = c("red",
                                                                                                 "green", "blue","darkorange"), reverse = TRUE)
grid.draw(T)
dev.off()

