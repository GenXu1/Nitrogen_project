open(E,">run.txt");
for($i=1;$i<=10;$i++)
{
 $out="TEO_Chr$i\.slurm";
 open(R,">$out"); #
print R "#!/bin/sh
#SBATCH --job-name=TEO_Chr$i
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=160:00:00
#SBATCH --mem=120G
#SBATCH --error=TEO_Chr$i\.err
#SBATCH --output=TEO_Chr$i\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
angsd -bam TEO_list_bam.txt -out all_Chrs/TEO/Chr$i\.TEO -doMajorMinor 1 -doMaf 1 -doSaf 2 -uniqueOnly 0 -anc /common/jyanglab/gxu6/Reference/B73_V4/maize-genome-V4.fa -minMapQ 30 -minQ 20 -nInd 17 -minInd 10 -indF TEO_inbreeding.txt -baq 1 -ref /common/jyanglab/gxu6/Reference/B73_V4/maize-genome-V4.fa -GL 1 -P 12 -r $i
realSFS all_Chrs/TEO/Chr$i\.TEO.saf.idx -P 12 -fold 1 > all_Chrs/TEO/Chr$i\.TEO.sfs
realSFS saf2theta all_Chrs/TEO/Chr$i\.TEO.saf.idx -sfs all_Chrs/TEO/Chr$i\.TEO.sfs -outname all_Chrs/TEO/Chr$i\.TEO
thetaStat do_stat all_Chrs/TEO/Chr$i\.TEO.thetas.idx
thetaStat do_stat all_Chrs/TEO/Chr$i\.TEO.thetas.idx -win 25000 -step 25000  -outnames all_Chrs/TEO/Chr$i\.TEO.theta.25k.gz
";
print E "sbatch $out\n";  

}