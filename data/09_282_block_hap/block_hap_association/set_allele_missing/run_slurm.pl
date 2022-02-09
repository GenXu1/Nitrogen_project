open(E,">run1.txt");
open(T,"traits.txt")||die "Can't open your file!";
while(<T>)
{
	chomp;
@aa=split;
	$hash{$aa[0]}=$aa[1];
	}	
close(T,R);	
foreach $t(keys %hash)
{
	$out="$hash{$t}\.slurm";
	open(R,">$out"); #
$cmd="GEMMA -bfile 282_Block_geno_hap -k Centered_IBS_kinship_GEMMA.txt -c GEMMA_PCA.txt -p phenotype_GEMMA.txt -lmm 4 -n $t -o $hash{$t} -miss 0.9 -r2 1 -hwe 0 -maf 0.01";
print R "#!/bin/sh
#SBATCH --job-name=$hash{$t}
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=60:00:00
#SBATCH --mem=10G
#SBATCH --error=$hash{$t}\.err
#SBATCH --output=$hash{$t}\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
$cmd";
print E "sbatch $out\n";		

}


