library(data.table)
library(Ropt)
d=fread("sampling_value.txt",head=T,na.str="NA",data.table=F)
hist(d[,2],col="skyblue",breaks = 30,border = "white",xlab="Number of overlapped Sweeps",main="1000 time permutation test",las=1,cex.axis=1.2,cex.lab=1.2)
abline(v=75,col="red")
d1=d[d[,2]>75,]
p=(nrow(d1)+1)/1000
