open(T,"Blocks.txt")||die "Can't open your file!";
$l=<T>;
while(<T>)
{
	chomp;
@aa=split;##1	47000083	47270374
$out="BLK$aa[0]\.vcf";
open(E,"TEO_LR_282_Wang.Glu.vcf")||die "Can't open your file!";
open(R,">$out");
while(<E>)
{
	chomp;
if(/^#/){print R "$_\n";next;}
@bb=split;
if($bb[1]>=$aa[1] && $bb[1]<=$aa[2])
{print R "$_\n";}

}
close(E,R);
	}
close(T);

