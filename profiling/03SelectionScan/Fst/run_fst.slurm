#!/bin/sh
#SBATCH --job-name=FST
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=120:00:00
#SBATCH --mem=30G
#SBATCH --error=FST.err
#SBATCH --output=FST.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
sh run_fst.sh