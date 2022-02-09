@f=glob "*err";
open(R,">Mapping_rate.txt");
foreach $f(@f)
{
$na=$f;
$na=~s/\.err//;
open(T,"$f")||die "Can't open your file!";
while(<T>)
{
	chomp;
	s/\|\|//g;
	s/\ \ //g;
if(/Total\ fragments/)
{
$a=$_;
$l=<T>;
$l=~s/\|\|//g;
$l=~s/\ \ //g;
print R "$na	$a	$l";
}
	}
}

close(T);