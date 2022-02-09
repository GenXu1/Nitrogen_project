#!/bin/sh
#SBATCH --job-name=HB73R3.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HB73R3.err
#SBATCH --output=HB73R3.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HB73R3_clean_R1.fastq.gz -R HB73R3_clean_R2.fastq.gz --rg-id HB73R3 --rg HB73R3 --sortReadsByCoordinates -o HB73R3.bam
