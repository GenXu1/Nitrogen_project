#!/bin/sh
#SBATCH --job-name=LK55R1.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LK55R1.err
#SBATCH --output=LK55R1.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LK55R1_clean_R1.fastq.gz -R LK55R1_clean_R2.fastq.gz --rg-id LK55R1 --rg LK55R1 --sortReadsByCoordinates -o LK55R1.bam
