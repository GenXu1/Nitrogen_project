open(T,"chr_length.txt")||die "Can't open your file!";
while(<T>)
{
	chomp;
@aa=split;
$hash{$aa[0]}=$aa[1];
	}
close(T);

open(E,">run.txt");
for($i=1;$i<=10;$i++)
{
	$len=$hash{$i};
	$start=1;$end=$start+19999999;
while($end<=$len)
{
	$reg="Chr$i\_$start\_$end";
	$out="Early_late_$reg\.slurm";
	$out1="Early_late_$reg\.xpclr.txt";
	print E "sbatch $out\n";
	$cmd="xpclr --out /common/jyanglab/gxu6/project/07_282panel/03_selection_scan_early_late/XPCLR/result/$out1 --input /common/jyanglab/shared/Gen_Xu/282_panel_V4_from_hapmap3_12_21_2020/hmp321_282_agpv4_maf005_miss03.vcf --format vcf --samplesA early_lines.txt --samplesB late_lines.txt --chr $i --start $start --stop $end --ld 0.7 --maxsnps 200 --minsnps 200 --size 50000 --step 5000";
	open(R,">$out");
	print R "#!/bin/sh
#SBATCH --job-name=Early_late_$reg
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=100:00:00
#SBATCH --mem=50G
#SBATCH --error=Early_late_$reg\.err
#SBATCH --output=Early_late_$reg\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
module load python/3.3
source activate xpclr
$cmd";	
	$start=$start+20000000;$end=$start+19999999;
	}
	$reg="Chr$i\_$start\_$len";
$out="Early_late_$reg\.slurm";
	$out1="Early_late_$reg\.xpclr.txt";
	print E "sbatch $out\n";
	$cmd="xpclr --out /common/jyanglab/gxu6/project/07_282panel/03_selection_scan_early_late/XPCLR/result/$out1 --input /common/jyanglab/shared/Gen_Xu/282_panel_V4_from_hapmap3_12_21_2020/hmp321_282_agpv4_maf005_miss03.vcf --format vcf --samplesA early_lines.txt --samplesB late_lines.txt --chr $i --start $start --stop $end --ld 0.7 --maxsnps 200 --minsnps 200 --size 50000 --step 5000";
	open(R,">$out");
	print R "#!/bin/sh
#SBATCH --job-name=Early_late_$reg
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=100:00:00
#SBATCH --mem=50G
#SBATCH --error=Early_late_$reg\.err
#SBATCH --output=Early_late_$reg\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
module load python/3.3
source activate xpclr
$cmd";

	}
