open(T,"../B73_V4.protein.fa")||die "Can't open your file!";
while(<T>)
{
	chomp;
@aa=split /\t/,$_,2;
$hash{$aa[0]}=$aa[1];
	}
close(T);

open(T,"DESeq2_DEG_Leaf_pop_treat_interaction_results2.q001.fd2sig.txt")||die "Can't open your file!";
open(R,">Leaf_pop_treat_interaction_results2.q001.fd2_pro.txt");
while(<T>)
{
	chomp;
@bb=split /\t/,$_;
$g=">$bb[0]";
if(exists($hash{$g}))
{print R "$g\n$hash{$g}\n";}
	}