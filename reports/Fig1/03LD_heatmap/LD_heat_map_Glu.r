library(data.table)
library(Ropt)
d=fread("Wang_Glu_sort.hmp.txt",head=T,data.table = F,na.strings = "NA")
d[,4]=d[,4]/1e6
#d=d[d[,4]>=47.9,]
id=sort(sample(1:nrow(d),200))
d1=d[id,]
write.table(d1,"Wang_Glu.hmp.200SNPs.hmp.txt",col.names = T,row.names = F,sep="\t",quote=F)

myLDplot=function(file,LD=F,out=F){
  library("genetics")
  library("LDheatmap")
  data=read.table(file,head=T,com="",sep="\t",row=1,na.string="NN")
  gene=data[,11:ncol(data)]
  gene=data.frame(t(gene))
  gty=makeGenotypes(gene,sep="")
    rgb.palette <- colorRampPalette(rev(c("gray","orange" ,"red")), space = "rgb")
  #png(file=sub("txt","png",file),height = 50,width =210,units = "mm",res=600)
pdf(file=sub("txt","pdf",file),height = 3,width =6)
   #myld=LDheatmap(gty,genetic.distances=data$pos,flip=T,color=rgb.palette(18))
  myld=LDheatmap(gty,genetic.distances=data$pos,flip=T,color=rgb.palette(18),add.map=F)
    dev.off()
  
  if(LD){
    write.table(myld$LDmatrix,file=sub(".txt","_LD.txt",file),sep="\t",quote=F)
  }
  
  if(out){ myld}else{NULL}
  
}

#example
myLDplot("282_2Glu.hmp.200SNPs.hmp.txt",LD=T)
myLDplot("Wang_Glu.hmp.200SNPs.hmp.txt",LD=T)
