open(T,"Glu2_seqc.aln")||die "Can't open your file!";
open(R,">Glu2_seqc.aln2");
$l=<T>;
print R "$l";
while(<T>)
{
	chomp;
	if(/^>/){
	print R "\n$_\n";next;
	}
print R "$_";
 
	}