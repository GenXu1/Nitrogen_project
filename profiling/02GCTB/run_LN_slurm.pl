open(E,">run_LN.txt");
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
	$out="LN_$hash{$t}\.slurm";
	open(R,">$out"); #
$cmd="/common/jyanglab/gxu6/software/gctb_2.0_scr/gctb --bfile ../genotype/282_GCTB_G --pheno 282_LN_Traits.txt --mpheno $t --out Results_LN/$hash{$t} --bayes S --pi 0.05 --hsq 0.5 --S 0 --wind 0.1 --chain-length 410000 --burn-in 10000 > Results_LN/$hash{$t}\.log";
print R "#!/bin/sh
#SBATCH --job-name=LN_$hash{$t}
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=165:00:00
#SBATCH --mem=20G
#SBATCH --error=LN_$hash{$t}\.err
#SBATCH --output=LN_$hash{$t}\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
$cmd";
print E "sbatch $out\n";		

}


