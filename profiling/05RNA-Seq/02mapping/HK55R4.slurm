#!/bin/sh
#SBATCH --job-name=HK55R4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HK55R4.err
#SBATCH --output=HK55R4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HK55R4_clean_R1.fastq.gz -R HK55R4_clean_R2.fastq.gz --rg-id HK55R4 --rg HK55R4 --sortReadsByCoordinates -o HK55R4.bam
