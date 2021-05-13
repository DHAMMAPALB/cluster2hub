#!/usr/bin/perl
#use strict;
#use warnings;

$dir=$ARGV[0];
open(FILE,"$dir/Clusters_Objects.tsv");my @A=<FILE>;close FILE;my @B=split(/\t/,$A[0]);$n=@B;
for($ii=0;$ii<$n;$ii++)
{
	$filea="$dir/Tfs/Cluster_".$ii."_ARCHS4_TFs.txt";
	$outa="$dir/Tfs/Cluster_".$ii."_ARCHS4_TFs_2.txt";
	open(FILE,"$filea");my @A1=<FILE>;close FILE;$A1=join("",@A1);$A1=~s/\r//ig;my @B1=split(/\n/,$A1);$n1=@B1;
	open(OUT,">$outa");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n1;$i++){my @C1=split(/\t/,$B1[$i]);print OUT "$C1[0]\t";$C1[1]=~s/ human tf ARCHS4 coexpression//ig;print OUT uc($C1[1])."\thuman tf ARCHS4 coexpression\t$C1[2]\t$C1[3]\t$C1[4]\t$C1[9]\n";}
	close OUT;

	$fileb="$dir/Tfs/Cluster_".$ii."_ENCODE_ChEA_Tfs.txt";
	$outb="$dir/Tfs/Cluster_".$ii."_ENCODE_ChEA_Tfs_2.txt";
	open(FILE,"$fileb");my @A2=<FILE>;close FILE;$A2=join("",@A2);$A2=~s/\r//ig;my @B2=split(/\n/,$A2);$n2=@B2;
	open(OUT,">$outb");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n2;$i++){my @C2=split(/\t/,$B2[$i]);print OUT "$C2[0]\t";$C2[1]=~s/ /\t/ig;print OUT uc($C2[1])."\t$C2[2]\t$C2[3]\t$C2[4]\t$C2[9]\n";}
	close OUT;
	
	$filec="$dir/Tfs/Cluster_".$ii."_ENCODE_ChIP_seq_Tfs.txt";
	$outc="$dir/Tfs/Cluster_".$ii."_ENCODE_ChIP_seq_Tfs_2.txt";
	open(FILE,"$filec");my @A3=<FILE>;close FILE;$A3=join("",@A3);$A3=~s/\r//ig;my @B3=split(/\n/,$A3);$n3=@B3;
	open(OUT,">$outc");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n3;$i++){my @C3=split(/\t/,$B3[$i]);my @D3=split(/ /,$C3[1]);$nD3=@D3;if($D3[$nD3-1] eq "hg19"){print OUT "$C3[0]\t";print OUT uc($D3[0])."\thg19\t$C3[2]\t$C3[3]\t$C3[4]\t$C3[9]\n";}}
	close OUT;

	$filed="$dir/Tfs/Cluster_".$ii."_Gene_Coocurrence_Tfs.txt";
	$outd="$dir/Tfs/Cluster_".$ii."_Gene_Coocurrence_Tfs_2.txt";
	open(FILE,"$filed");my @A4=<FILE>;close FILE;$A4=join("",@A4);$A4=~s/\r//ig;my @B4=split(/\n/,$A4);$n4=@B4;
	open(OUT,">$outd");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n4;$i++){my @C4=split(/\t/,$B4[$i]);print OUT "$C4[0]\t".uc($C4[1])."\tEnrichR\t$C4[2]\t$C4[3]\t$C4[4]\t$C4[9]\n";}
	close OUT;

	$filee="$dir/Tfs/Cluster_".$ii."_LOF_GEO_Tfs.txt";
	$oute="$dir/Tfs/Cluster_".$ii."_LOF_GEO_Tfs_2.txt";
	open(FILE,"$filee");my @A5=<FILE>;close FILE;$A5=join("",@A5);$A5=~s/\r//ig;my @B5=split(/\n/,$A5);$n5=@B5;
	open(OUT,">$oute");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n5;$i++){my @C5=split(/\t/,$B5[$i]);my @D5=split(/ /,$C5[1]);$nD5=@D5;my @grp=grep{/human/i}@D5;if($grp[0] ne ""){print OUT "$C5[0]\t";print OUT uc($D5[0])."\tHuman\t$C5[2]\t$C5[3]\t$C5[4]\t$C5[9]\n";}}
	close OUT;

	$filef="$dir/Tfs/Cluster_".$ii."_Perturbations_Expressions_Tfs.txt";
	$outf="$dir/Tfs/Cluster_".$ii."_Perturbations_Expressions_Tfs_2.txt";
	open(FILE,"$filef");my @A6=<FILE>;close FILE;$A6=join("",@A6);$A6=~s/\r//ig;my @B6=split(/\n/,$A6);$n6=@B6;
	open(OUT,">$outf");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n6;$i++){my @C6=split(/\t/,$B6[$i]);my @D6=split(/ /,$C6[1]);$nD6=@D6;my @grp=grep{/human/i}@D6;if($grp[0] ne ""){print OUT "$C6[0]\t";print OUT uc($D6[0])."\tHuman\t$C6[2]\t$C6[3]\t$C6[4]\t$C6[9]\n";}}
	close OUT;

	$fileg="$dir/Tfs/Cluster_".$ii."_TRRUST_Tfs.txt";
	$outg="$dir/Tfs/Cluster_".$ii."_TRRUST_Tfs_2.txt";
	open(FILE,"$fileg");my @A7=<FILE>;close FILE;$A7=join("",@A7);$A7=~s/\r//ig;my @B7=split(/\n/,$A7);$n7=@B7;
	open(OUT,">$outg");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n7;$i++){my @C7=split(/\t/,$B7[$i]);my @D7=split(/ /,$C7[1]);$nD7=@D7;if($D7[$nD7-1]=~/human/ig){print OUT "$C7[0]\t";print OUT uc($D7[0])."\tHuman\t$C7[2]\t$C7[3]\t$C7[4]\t$C7[9]\n";}}
	close OUT;
	
	$tfs_all="$dir/Tfs/Cluster_".$ii."*"."_2.txt";
	$fileall="$dir/Tfs/Cluster_".$ii."_Tfs_all.txt";
	$fileall2="$dir/Tfs/Cluster_".$ii."_Tfs_all2.txt";
	$out="$dir/Cluster_".$ii."_Tfs_all.txt";
	`cat $tfs_all | cut -f 2- > $fileall`;
	`sed -i 's/Term\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes//ig' $fileall`;
	`awk 'NF' $fileall | sort > $fileall2`;
	`sed -i '1s/^/Term\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\\n/ig' $fileall2`;
	`mv $fileall2 $fileall`;
	`mv $fileall $out`;
}
