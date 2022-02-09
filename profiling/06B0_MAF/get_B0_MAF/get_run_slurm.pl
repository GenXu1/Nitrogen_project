open(E,">run1.txt");
open(T,"frq_spectrum _files.txt")||die "Can't open your file!";
while(<T>)
{
	chomp;##Chr8.TEO_AGPV4.frq.input.txt
	$na=$_;
	$na=~s/\.frq\.input\.txt//;
	$o="$na\.slurm";
	@a=split /\./,$na;
	$pop=$a[1];$pop=~s/\_AGPV4//;
	$sfs="$pop\.Spect_DAF_B0MAF.txt";
	open(R,">$o");
$cmd2="python /common/jyanglab/gxu6/software/BalLeRMix/software/BalLeRMix_v2.3.py -i $_ --spect $sfs --nosub --MAF -o $na\.B0_MAF.stat.txt";
print R "#!/bin/sh
#SBATCH --job-name=B0\.$_
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=160:00:00
#SBATCH --mem=20G
#SBATCH --error=$_\.err
#SBATCH --output=$_\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
$cmd1
$cmd2";
print E "sbatch $o\n";
	}
close(T,R);	