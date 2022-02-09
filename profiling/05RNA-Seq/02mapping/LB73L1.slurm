#!/bin/sh
#SBATCH --job-name=LB73L1.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LB73L1.err
#SBATCH --output=LB73L1.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LB73L1_clean_R1.fastq.gz -R LB73L1_clean_R2.fastq.gz --rg-id LB73L1 --rg LB73L1 --sortReadsByCoordinates -o LB73L1.bam
