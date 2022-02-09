@f=glob "*sweep.txt";
foreach $f(@f)
{
$out=$f;$out=~s/sweep\.txt/sweep1\.txt/;
open(T,"$f")||die "Can't open your file!";
open(R,">$out");
while(<T>)
{
	chomp;
	@aa=split;
if($aa[3]>0){print R "$_\n";}
	
	}
close(T);
`rm $f`;
`mv $out $f`;
}