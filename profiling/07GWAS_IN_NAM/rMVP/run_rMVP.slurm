#!/bin/sh
#SBATCH --job-name=rMVP
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=120:00:00
#SBATCH --mem=60G
#SBATCH --error=rMVP.err
#SBATCH --output=rMVP.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
module load R
Rscript run_rMVP_step2.r