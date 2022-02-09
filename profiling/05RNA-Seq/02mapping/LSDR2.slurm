#!/bin/sh
#SBATCH --job-name=LSDR2.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LSDR2.err
#SBATCH --output=LSDR2.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LSDR2_clean_R1.fastq.gz -R LSDR2_clean_R2.fastq.gz --rg-id LSDR2 --rg LSDR2 --sortReadsByCoordinates -o LSDR2.bam
