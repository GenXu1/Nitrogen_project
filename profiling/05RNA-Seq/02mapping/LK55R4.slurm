#!/bin/sh
#SBATCH --job-name=LK55R4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LK55R4.err
#SBATCH --output=LK55R4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LK55R4_clean_R1.fastq.gz -R LK55R4_clean_R2.fastq.gz --rg-id LK55R4 --rg LK55R4 --sortReadsByCoordinates -o LK55R4.bam
