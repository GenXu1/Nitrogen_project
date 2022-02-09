#!/bin/sh
#SBATCH --job-name=LW153L2.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LW153L2.err
#SBATCH --output=LW153L2.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LW153L2_clean_R1.fastq.gz -R LW153L2_clean_R2.fastq.gz --rg-id LW153L2 --rg LW153L2 --sortReadsByCoordinates -o LW153L2.bam
