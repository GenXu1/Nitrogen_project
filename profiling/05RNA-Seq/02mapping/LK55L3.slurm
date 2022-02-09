#!/bin/sh
#SBATCH --job-name=LK55L3.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LK55L3.err
#SBATCH --output=LK55L3.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LK55L3_clean_R1.fastq.gz -R LK55L3_clean_R2.fastq.gz --rg-id LK55L3 --rg LK55L3 --sortReadsByCoordinates -o LK55L3.bam
