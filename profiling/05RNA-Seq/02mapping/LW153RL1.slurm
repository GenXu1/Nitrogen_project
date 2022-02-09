#!/bin/sh
#SBATCH --job-name=LW153RL1.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LW153RL1.err
#SBATCH --output=LW153RL1.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LW153RL1_clean_R1.fastq.gz -R LW153RL1_clean_R2.fastq.gz --rg-id LW153RL1 --rg LW153RL1 --sortReadsByCoordinates -o LW153RL1.bam
