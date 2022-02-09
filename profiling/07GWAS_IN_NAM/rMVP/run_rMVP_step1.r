library(rMVP)
# /common/dweikat/ydelen2
# Full-featured function (Recommended)
MVP.Data(fileVCF="NAM_AGPV4_GBS_sort_maf001.recode.vcf",
         #filePhe="Phenotype.txt",
         fileKin=F,
         filePC=F,
         out="NAM_AGPV4"
         )

# Only convert genotypes
#MVP.Data.VCF2MVP("NAM_AGPV4", out='mvp') 

# calculate from mvp_geno_file
MVP.Data.PC(TRUE, mvp_prefix='NAM_AGPV4', pcs.keep=25)
# calculate from mvp_geno_file
MVP.Data.Kin(TRUE, mvp_prefix='NAM_AGPV4', out='NAM_AGPV4')

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
    nPC.GLM=3,
    nPC.MLM=3,
    nPC.FarmCPU=3,
    priority="speed",
    #ncpus=10,
    vc.method="BRENT",
    maxLoop=10,
    method.bin="static",
    #permutation.threshold=TRUE,
    #permutation.rep=100,
    threshold=0.05,
    method=c("GLM", "MLM", "FarmCPU"),
    p.threshold=0.00001
    
  )
  gc()
}

#########Phenotype distribution
MVP.Hist(phe=phenotype, file.type="jpg", breakNum=18, dpi=300)

