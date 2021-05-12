#!/usr/bin/perl
#use strict;
#use warnings;
use List::Util qw(uniq);

$dir=$ARGV[0];
$ppis=$ARGV[1];
open(FILE,"$ppis");my @A=<FILE>;close FILE;$A=join("",@A);$A=~s/\r//ig;my @B=split(/\n/,$A);$n=@B;
$incs="$dir/Clusters_Objects.tsv";
open(FILE2,"$incs");my @A2=<FILE2>;close FILE2;$A2=join("",@A2);$A2=~s/\r//ig;my @B2=split(/\n/,$A2);$n2=@B2;my @cts=split(/\t/,$B2[0]);$ncts=@cts;
for($ii=0;$ii<$ncts;$ii++)
{
	$inks="$dir/Cluster_".$ii."_Kinases_all.txt";
	open(FILE1,"$inks");
	my @A1=<FILE1>;
	close FILE1;
	$A1=join("",@A1);
	$A1=~s/\r//ig;
	my @B1=split(/\n/,$A1);
	$n1=@B1;
	for($i=1;$i<$n1;$i++)
	{
		my @C1=split(/\t/,$B1[$i]);
		my @D1=split(/\;/,$C1[5]);
		push(@tfs,@D1);
		push(@kinases,$C1[0]);
	}
	@kinases2=uniq(sort(@kinases));
	$nkinases2=@kinases2;
	@tfs2=uniq(sort(@tfs));
	$ntfs2=@tfs2;

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

	for($i=0;$i<$n;$i++)
	{
		my @C=split(/\t/,$B[$i]);
		for($j=0;$j<$nkinases2;$j++)
		{
			if($C[0] eq $kinases2[$j])
			{
				for($k=0;$k<$nclust;$k++)
				{
					if($C[1] eq $clust[$k])
					{
						push(@ppis,$B[$i]);
						last;
					}
				}
				for($k=0;$k<$ntfs2;$k++)
				{
					if($C[1] eq $tfs2[$k])
					{
						push(@ppis,$B[$i]);
						last;
					}			
				}
			}
			elsif($C[1] eq $kinases2[$j])
			{
				for($k=0;$k<$nclust;$k++)
				{
					if($C[0] eq $clust[$k])
					{
						push(@ppis,$B[$i]);
						last;
					}
				}
				for($k=0;$k<$ntfs2;$k++)
				{
					if($C[0] eq $tfs2[$k])
					{
						push(@ppis,$B[$i]);
						last;
					}
				}
			}
			else
			{
			}
			
		}
	}
	@ppis2=uniq(sort(@ppis));
	$nppis2=@ppis2;
	$outksppis="$dir/Cluster_".$ii."_Kinases_all_ppis.txt";
	open(OUT,">$outksppis");
#	print OUT "Protein_1\tProtein_2\n";
	for($i=0;$i<$nppis2;$i++)
	{
		print OUT "$ppis2[$i]\n";
	}
	close OUT;
	@tfs=();
	@tfs2=();
	@kinases=();
	@kinases2=();
	@clust=();
	@ppis=();
}
