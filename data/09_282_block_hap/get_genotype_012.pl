open(T,"Glu.hmp321_282_agpv4_maf005_miss03.vcf")||die "Can't open your file!";
open(R,">Glu.hmp321_282_agpv4_maf005_miss03.vcf2");
while(<T>)
{
	chomp;
if(/^#/){print R "$_\n";next;}
s/0\/0/0/g;
s/1\/1/2/g;
s/1\/0/1/g;
s/0\/1/1/g;
s/.\/./NA/g;
print R "$_\n";		
	}
close(T,R);