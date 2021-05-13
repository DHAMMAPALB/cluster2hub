#!/usr/bin/perl
#use strict;
#use warnings;

$dir=$ARGV[0];
$ppis=$ARGV[1];
open(FILE,"$ppis");my @A=<FILE>;close FILE;$A=join("",@A);$A=~s/\r//ig;my @B=split(/\n/,$A);$n=@B;
$incs="$dir/Clusters_Objects.tsv";
open(FILE2,"$incs");my @A2=<FILE2>;close FILE2;$A2=join("",@A2);$A2=~s/\r//ig;my @B2=split(/\n/,$A2);$n2=@B2;my @cts=split(/\t/,$B2[0]);$ncts=@cts;
for($ii=0;$ii<$ncts;$ii++)
{
	$intfs="$dir/Cluster_".$ii."_Tfs_all.txt";
	open(FILE1,"$intfs");
	my @A1=<FILE1>;
	close FILE1;
	$A1=join("",@A1);
	$A1=~s/\r//ig;
	my @B1=split(/\n/,$A1);
	$n1=@B1;
	my @tfs;
	for($i=1;$i<$n1;$i++)
	{
		my @C1=split(/\t/,$B1[$i]);
		push(@tfs,$C1[0]);
	}
	$ntfs=@tfs;

	my @clust;
	for($i=2;$i<$n2;$i++)
	{
		my @C2=split(/\t/,$B2[$i]);
		if($C2[$ii] ne "")
		{
			push(@clust,$C2[$ii]);
		}
	}
	$nclust=@clust;
	
	$outtfsppis="$dir/Cluster_".$ii."_Tfs_all_ppis.txt";
	open(OUT,">$outtfsppis");
#	print OUT "Protein_1\tProtein_2\n";
	for($i=0;$i<$n;$i++)
	{
		my @C=split(/\t/,$B[$i]);
		for($j=0;$j<$ntfs;$j++)
		{
			if($C[0] eq $tfs[$j])
			{
				for($k=0;$k<$nclust;$k++)
				{
					if($C[1] eq $clust[$k])
					{
						print OUT "$B[$i]\n";
						last;
					}
				}
			}
			elsif($C[1] eq $tfs[$j])
			{
				for($k=0;$k<$nclust;$k++)
				{
					if($C[0] eq $clust[$k])
					{
						print OUT "$B[$i]\n";
						last;
					}
				}
			}
			else
			{
			}
		}
	}
	close OUT;
	@tfs=();@clust=();
}
