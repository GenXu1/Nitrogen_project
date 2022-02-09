#!/bin/sh
#SBATCH --job-name=LW153RR4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LW153RR4.err
#SBATCH --output=LW153RR4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LW153RR4_clean_R1.fastq.gz -R LW153RR4_clean_R2.fastq.gz --rg-id LW153RR4 --rg LW153RR4 --sortReadsByCoordinates -o LW153RR4.bam
