#!/bin/sh
#SBATCH --job-name=HSDR2.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HSDR2.err
#SBATCH --output=HSDR2.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HSDR2_clean_R1.fastq.gz -R HSDR2_clean_R2.fastq.gz --rg-id HSDR2 --rg HSDR2 --sortReadsByCoordinates -o HSDR2.bam
