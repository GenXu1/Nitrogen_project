for($i=1;$i<=6;$i++)
{
$inf="BLK$i\.vcf";
`plink --vcf $inf --make-bed --out BLK$i`;
`plink --bfile BLK$i  --distance-matrix --out BLK$i`;
`admixture BLK$i\.bed 3 > BLK$i`;

}