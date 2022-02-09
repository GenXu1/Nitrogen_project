#!/bin/sh
#SBATCH --job-name=LSDL3.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LSDL3.err
#SBATCH --output=LSDL3.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LSDL3_clean_R1.fastq.gz -R LSDL3_clean_R2.fastq.gz --rg-id LSDL3 --rg LSDL3 --sortReadsByCoordinates -o LSDL3.bam
