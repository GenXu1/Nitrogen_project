open(E,">run.txt");
open(T,"sample_list.txt")||die "Can't open your file!";
while(<T>)
{
		chomp;
		$na=$_;#HK55L1_clean_R1.fastq.gz
		$out="$na"."\.slurm";
	open(R,">$out");
print R 
"#!/bin/sh
#SBATCH --job-name=$na\.mapping
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=16:00:00
#SBATCH --mem=30G
#SBATCH --error=$na\.err
#SBATCH --output=$na\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
subread-align -t 0 -T 16 -i /common/jyanglab/gxu6/Reference/B73_V4/Rsubread/maize-genome-V4 -r $_\_clean_R1.fastq.gz -R $_\_clean_R2.fastq.gz --rg-id $_ --rg $_ --sortReadsByCoordinates -o $na\.bam
";

print E "sbatch $out\n";	
	}