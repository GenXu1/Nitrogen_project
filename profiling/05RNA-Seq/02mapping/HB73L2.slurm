#!/bin/sh
#SBATCH --job-name=HB73L2.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HB73L2.err
#SBATCH --output=HB73L2.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HB73L2_clean_R1.fastq.gz -R HB73L2_clean_R2.fastq.gz --rg-id HB73L2 --rg HB73L2 --sortReadsByCoordinates -o HB73L2.bam
