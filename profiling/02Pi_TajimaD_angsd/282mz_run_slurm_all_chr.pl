open(E,">run.txt");
for($i=1;$i<=10;$i++)
{
 $out="282MZ_Chr$i\.slurm";
 open(R,">$out"); #
print R "#!/bin/sh
#SBATCH --job-name=282MZ_Chr$i
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=160:00:00
#SBATCH --mem=250G
#SBATCH --error=282MZ_Chr$i\.err
#SBATCH --output=282MZ_Chr$i\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
angsd -bam 282MZ_list_bam.txt -out all_Chrs/282MZ/Chr$i\.282MZ -doMajorMinor 1 -doMaf 1 -doSaf 2 -uniqueOnly 0 -anc /common/jyanglab/gxu6/Reference/B73_V4/maize-genome-V4.fa -minMapQ 30 -minQ 20 -nInd 269 -minInd 100 -indF 282MZ_inbreeding.txt -baq 1 -ref /common/jyanglab/gxu6/Reference/B73_V4/maize-genome-V4.fa -GL 1 -P 12 -r $i
realSFS all_Chrs/282MZ/Chr$i\.282MZ.saf.idx -P 12 -fold 1 > all_Chrs/282MZ/Chr$i\.282MZ.sfs
realSFS saf2theta all_Chrs/282MZ/Chr$i\.282MZ.saf.idx -sfs all_Chrs/282MZ/Chr$i\.282MZ.sfs -outname all_Chrs/282MZ/Chr$i\.282MZ
thetaStat do_stat all_Chrs/282MZ/Chr$i\.282MZ.thetas.idx
thetaStat do_stat all_Chrs/282MZ/Chr$i\.282MZ.thetas.idx -win 25000 -step 25000  -outnames all_Chrs/282MZ/Chr$i\.282MZ.theta.25k.gz
";
print E "sbatch $out\n";  

}