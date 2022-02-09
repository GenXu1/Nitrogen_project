library(data.table)
library(Ropt)
library(lme4)
d=read.table("data/01phenotype/clean_phe.txt",header = T,sep="\t",as.is=T)
d1=d[d[,2]=="LN",c(1,5,3,4)]
d2=melt(d1,1:2,variable.factor =F)
d2=d2[,c(3,1,4,2)]
colnames(d2)=c("env","lines","y","trait")
d2[,3]=as.numeric(d2[,3])
he=NULL
bl=as.data.frame(unique(d[,1]))
colnames(bl)="id"
for(i in unique(as.character(d2[,4])))
{
  data=d2[d2[,4]==i,]
  data$lines=factor(data$lines)
  data$env=factor(data$env)
  blp=lmer(y~+(1|env)+(1|lines),data=data)
  x=summary(blp)
  ##H=Vg/(Vg+Vge/l+Ve/rl)
  v=as.data.frame(x$varcor)
  vg=v[1,4]
  ve=v[3,4]
  H=vg/(vg+ve/2)
  hee=c(i,H)
  he=rbind(he,hee)
  blups= ranef(blp)
  names(blups)
  lines=blups$lines+blp@beta
  blp.out=data.frame(id=rownames(lines),blp=lines)
  colnames(blp.out)[2]=i
  bl=merge(bl,blp.out,by=1,all=T)
}
colnames(he)=c("Trait","Heritability")
write.table(bl,file="data_blup_LN_result.txt",row.names = F,quote = F,sep="\t")
write.table(he,file="Heritability_LN_result.txt",row.names = F,quote = F,sep="\t")

