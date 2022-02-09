library(rMVP)
Kinship <- attach.big.matrix("NAM_AGPV4.kin.desc")
genotype <- attach.big.matrix("NAM_AGPV4.geno.desc")
phenotype <- read.table("NAM_phenotype.txt",head=TRUE,sep="\t")
map <- read.table("NAM_AGPV4.geno.map" , head = TRUE)

for(i in 2:ncol(phenotype)){
  imMVP <- MVP(
    phe=phenotype[, c(1, i)],
    geno=genotype,
    map=map,
    K=Kinship,
    #CV.GLM=Covariates,
    #CV.MLM=Covariates,
    #CV.FarmCPU=Covariates,
    nPC.GLM=25,
    nPC.MLM=25,
    nPC.FarmCPU=25,
    priority="speed",
    ncpus=16,
    vc.method="BRENT",
    maxLoop=10,
    method.bin="static",
    #permutation.threshold=TRUE,
    #permutation.rep=100,
    threshold=0.05,
    method=c("GLM", "MLM", "FarmCPU"),
   # p.threshold=0.000001
    
  )
  gc()
}

#########Phenotype distribution
MVP.Hist(phe=phenotype, file.type="jpg", breakNum=18, dpi=300)

