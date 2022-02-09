#!/bin/sh
#SBATCH --job-name=HK55R3.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HK55R3.err
#SBATCH --output=HK55R3.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HK55R3_clean_R1.fastq.gz -R HK55R3_clean_R2.fastq.gz --rg-id HK55R3 --rg HK55R3 --sortReadsByCoordinates -o HK55R3.bam
