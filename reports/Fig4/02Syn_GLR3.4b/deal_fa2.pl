open(T,"Glu2_seqc.aln2")||die "Can't open your file!";
open(R,">Glu2_seqc.aln3");
while(<T>)
{
	chomp;
	if(/^>/){#>chr5:50308526-50324144_A188_Zm00
	print R "\n$_\	";
	@aa=split /\-/,$_;
	@bb=split /\:/,$aa[0];
	$r=$bb[1]-1;
	next;
	}
	$n=length($_)-1;
	@re=();
	for($i=0;$i<=$n;$i++)
	{
	$m=substr($_,$i,1);
	if($m=~/\-/){push @re,0;}else{$r=$r+1;push @re,$r;}
	
	}
$re=join "\t",@re;
print R "$re";
 
	}