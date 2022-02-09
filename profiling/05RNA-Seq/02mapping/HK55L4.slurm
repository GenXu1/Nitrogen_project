#!/bin/sh
#SBATCH --job-name=HK55L4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=HK55L4.err
#SBATCH --output=HK55L4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r HK55L4_clean_R1.fastq.gz -R HK55L4_clean_R2.fastq.gz --rg-id HK55L4 --rg HK55L4 --sortReadsByCoordinates -o HK55L4.bam
