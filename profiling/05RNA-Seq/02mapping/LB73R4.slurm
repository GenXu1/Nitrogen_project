#!/bin/sh
#SBATCH --job-name=LB73R4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LB73R4.err
#SBATCH --output=LB73R4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LB73R4_clean_R1.fastq.gz -R LB73R4_clean_R2.fastq.gz --rg-id LB73R4 --rg LB73R4 --sortReadsByCoordinates -o LB73R4.bam
