#!/bin/sh
#SBATCH --job-name=HW153RL3.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HW153RL3.err
#SBATCH --output=HW153RL3.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HW153RL3_clean_R1.fastq.gz -R HW153RL3_clean_R2.fastq.gz --rg-id HW153RL3 --rg HW153RL3 --sortReadsByCoordinates -o HW153RL3.bam
