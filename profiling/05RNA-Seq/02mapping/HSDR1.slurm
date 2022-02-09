#!/bin/sh
#SBATCH --job-name=HSDR1.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HSDR1.err
#SBATCH --output=HSDR1.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HSDR1_clean_R1.fastq.gz -R HSDR1_clean_R2.fastq.gz --rg-id HSDR1 --rg HSDR1 --sortReadsByCoordinates -o HSDR1.bam
