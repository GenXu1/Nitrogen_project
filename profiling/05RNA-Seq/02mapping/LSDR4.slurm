#!/bin/sh
#SBATCH --job-name=LSDR4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LSDR4.err
#SBATCH --output=LSDR4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LSDR4_clean_R1.fastq.gz -R LSDR4_clean_R2.fastq.gz --rg-id LSDR4 --rg LSDR4 --sortReadsByCoordinates -o LSDR4.bam
