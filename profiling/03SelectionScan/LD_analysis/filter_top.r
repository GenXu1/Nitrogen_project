library("data.table")
canopy=fread("canopy_coverage_row10535_days.csv",header = T,data.table=F,sep=",")
id=fread("sample_ID.txt",header = F,data.table=F)
for(i in unique(canopy$Treatment))
{
  for(j in unique(canopy$date))
  {
    d=canopy[canopy[,5]==i & canopy[,6]==j,]
    
    
  } 
}
