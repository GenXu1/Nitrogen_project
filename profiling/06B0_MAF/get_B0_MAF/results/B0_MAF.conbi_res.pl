open(R,">$ARGV[0].AGPV4.B0_MAF.stat.txt"); ##Chr1.$ARGV[0]\_AGPV4.B0_MAF.stat.txt
print R "Chr	physPos	genPos	LR	xhat	Ahat	numSites\n";
for($i=1;$i<=10;$i++)
{
$f="Chr1.$ARGV[0]\_AGPV4.B0_MAF.stat.txt";
open(T,"$f")||die "Can't open your file!";
$l=<T>;
while(<T>)
{
@aa=split;
if($aa[5]>0){print R "$i	$_";}

}
close(T);
}

