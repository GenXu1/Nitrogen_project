#!/bin/sh
#SBATCH --job-name=HSDL2.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HSDL2.err
#SBATCH --output=HSDL2.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HSDL2_clean_R1.fastq.gz -R HSDL2_clean_R2.fastq.gz --rg-id HSDL2 --rg HSDL2 --sortReadsByCoordinates -o HSDL2.bam
