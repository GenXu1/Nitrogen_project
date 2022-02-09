#!/bin/sh
#SBATCH --job-name=LSDL4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LSDL4.err
#SBATCH --output=LSDL4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LSDL4_clean_R1.fastq.gz -R LSDL4_clean_R2.fastq.gz --rg-id LSDL4 --rg LSDL4 --sortReadsByCoordinates -o LSDL4.bam
