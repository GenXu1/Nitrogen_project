#canopy-HN-1-Sep.assoc.txt
@f=glob '*assoc.txt';
open(R,">3PC_block_GWAS_res.txt");
print R "Trait	chr	rs	ps	n_miss	allele1	allele0	af	beta	se	logl_H1	l_remle	l_mle	p_wald	p_lrt	p_score\n";
foreach $f(@f)
{
$na=$f;$na=~s/\.assoc\.txt//;
open(T,"$f")||die "Can't open your file!";
$l=<T>;
while(<T>)
{
print R "$na	$_";		
	}
close(T);
}
close(R);