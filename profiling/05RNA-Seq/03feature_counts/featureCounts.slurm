#!/bin/sh
#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=16:00:00
#SBATCH --mem=60G
#SBATCH --error=featureCounts.err
#SBATCH --output=featureCounts.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
featureCounts -p -a /common/jyanglab/gxu6/Reference/B73_V4/maize-genome-V4.gtf -t exon -g gene_id -o counts.txt *.bam