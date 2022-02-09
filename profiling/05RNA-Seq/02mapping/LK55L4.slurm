#!/bin/sh
#SBATCH --job-name=LK55L4.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=LK55L4.err
#SBATCH --output=LK55L4.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r LK55L4_clean_R1.fastq.gz -R LK55L4_clean_R2.fastq.gz --rg-id LK55L4 --rg LK55L4 --sortReadsByCoordinates -o LK55L4.bam
