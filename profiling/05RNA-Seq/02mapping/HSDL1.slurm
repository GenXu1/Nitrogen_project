#!/bin/sh
#SBATCH --job-name=HSDL1.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HSDL1.err
#SBATCH --output=HSDL1.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HSDL1_clean_R1.fastq.gz -R HSDL1_clean_R2.fastq.gz --rg-id HSDL1 --rg HSDL1 --sortReadsByCoordinates -o HSDL1.bam
