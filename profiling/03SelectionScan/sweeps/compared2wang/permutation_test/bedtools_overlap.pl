@f=glob "sweeps_Old_New*.bed";
foreach $f (@f)
{
	$out=$f;
	$out=~s/bed/sweep\.txt/;
	`bedtools intersect -a $f -b ../Wang_selective_sweep_V4_merge.bed -wao > $out`;
	}