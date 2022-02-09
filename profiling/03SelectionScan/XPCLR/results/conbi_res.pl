$out="$ARGV[0]\.xpclr.txt";
open(R,">$out");
$l="id	chrom	start	stop	pos_start	pos_stop	modelL	nullL	sel_coef	nSNPs	nSNPs_avail	xpclr	xpclr_norm\n";
print R "$l";
$p="$ARGV[0]\_Chr\*xpclr.txt";
@f=glob "$p";
foreach $f(@f)
{
	print "$f\n";
	open(T,"$f")||die "Can't open your file!";
	$l=<T>;
while(<T>)
{
	chomp;
@aa=split;
if(length($aa[11])>0)
{print R "$_\n";}
	
	}	
close(T);
	}
close(R);