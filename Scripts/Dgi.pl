#!/usr/bin/perl
#use strict;
#use warnings;

$dir=$ARGV[0];
$dgi=$ARGV[1];
open(FILE,"$dgi");my @A=<FILE>;close FILE;$A=join("",@A);$A=~s/\r//ig;my @B=split(/\n/,$A);$n=@B;
for($ii=0;$ii<$n;$ii++){my @C=split(/\t/,$B[$ii]);push(@p,$C[0]);}$np=@p;
$incs="$dir/Clusters_Objects.tsv";
open(FILE2,"$incs");my @A2=<FILE2>;close FILE2;$A2=join("",@A2);$A2=~s/\r//ig;my @B2=split(/\n/,$A2);$n2=@B2;my @cts=split(/\t/,$B2[0]);$ncts=@cts;
for($ii=0;$ii<$ncts;$ii++)
{
	$intfs="$dir/Cluster_".$ii."_Network_Hubs.txt";
	open(FILE1,"$intfs");
	my @A1=<FILE1>;
	close FILE1;
	$A1=join("",@A1);
	$A1=~s/\r//ig;
	my @B1=split(/\n/,$A1);
	$n1=@B1;
	$outdgi="$dir/Cluster_".$ii."_Network_Hubs_DGI.txt";
	open(OUT,">$outdgi");
	print OUT "$B1[0]\n";
	for($i=1;$i<$n1;$i++)
	{
		my @C1=split(/\t/,$B1[$i]);
		for($j=0;$j<$np;$j++)
		{
			if($C1[0] eq $p[$j])
			{
				print OUT "$B1[$i]\t$B[$j]\n";
			}
		}
	}
	close OUT;
}
