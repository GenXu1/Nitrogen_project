library(data.table)
library(Ropt)
pop=fread("282_pop_structure.txt", header=F,data.table=F)
e=fread("early_lines.txt", header=F,data.table=F)[,1]
l=fread("late_lines.txt", header=F,data.table=F)[,1]
ee=merge(pop,e,by=1)
ll=merge(pop,l,by=1)
e_nss=ee[ee[,2]=="nss",1]
l_nss=ll[ll[,2]=="nss",1]
write.table(e_nss,"early_NSS_lines.txt",row.names = F,col.names = F,sep="\t",quote=F)
write.table(l_nss,"late_NSS_lines.txt",row.names = F,col.names = F,sep="\t",quote=F)

