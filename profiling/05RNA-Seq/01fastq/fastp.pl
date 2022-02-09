open(E,">run.txt");
open(T,"sample_list.txt")||die "Can't open your file!";
while(<T>)
{
		chomp;
		$na=$_;#RNATEOR1
		$out="$na"."\.slurm";
	open(R,">$out");
print R 
"#!/bin/sh
#SBATCH --job-name=$na\.fastp
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=$na\.err
#SBATCH --output=$na\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
fastp -i $na\_1.fq.gz -I $na\_2.fq.gz -o $na\_clean_R1.fastq.gz -O $na\_clean_R2.fastq.gz -c --thread=8 -Q ";

print E "sbatch $out\n";	
	}