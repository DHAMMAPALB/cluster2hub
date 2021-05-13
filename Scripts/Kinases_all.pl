#!/usr/bin/perl
#use strict;
#use warnings;

$dir=$ARGV[0];
open(FILE,"$dir/Clusters_Objects.tsv");my @A=<FILE>;close FILE;my @B=split(/\t/,$A[0]);$n=@B;
for($ii=0;$ii<$n;$ii++)
{
	$filea="$dir/Kinases/Cluster_".$ii."_ARCHS4_Kinases.txt";
	$outa="$dir/Kinases/Cluster_".$ii."_ARCHS4_Kinases_2.txt";
	open(FILE,"$filea");my @A1=<FILE>;close FILE;$A1=join("",@A1);$A1=~s/\r//ig;my @B1=split(/\n/,$A1);$n1=@B1;
	open(OUT,">$outa");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n1;$i++){my @C1=split(/\t/,$B1[$i]);if($C1[3]<=0.01){print OUT "$C1[0]\t";$C1[1]=~s/ human kinase ARCHS4 coexpression//ig;print OUT uc($C1[1])."\thuman kinase ARCHS4 coexpression\t$C1[2]\t$C1[3]\t$C1[4]\t$C1[9]\n";}}
	close OUT;

	$fileb="$dir/Kinases/Cluster_".$ii."_KinomeScan_Kinases.txt";
	$outb="$dir/Kinases/Cluster_".$ii."_KinomeScan_Kinases_2.txt";
	open(FILE,"$fileb");my @A2=<FILE>;close FILE;$A2=join("",@A2);$A2=~s/\r//ig;my @B2=split(/\n/,$A2);$n2=@B2;
	open(OUT,">$outb");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n2;$i++){my @C2=split(/\t/,$B2[$i]);if($C2[3]<=0.01){print OUT "$C2[0]\t";my @D2=split(/ /,$C2[1]);$nD2=@D2;print OUT "$D2[0]\t";for($j=1;$j<$nD2;$j++){print OUT "$D2[$j] ";}print OUT "\t$C2[2]\t$C2[3]\t$C2[4]\t$C2[9]\n";}}
	close OUT;

	$filec="$dir/Kinases/Cluster_".$ii."_GEO_down_Kinases.txt";
	$outc="$dir/Kinases/Cluster_".$ii."_GEO_down_Kinases_2.txt";
	open(FILE,"$filec");my @A3=<FILE>;close FILE;$A3=join("",@A3);$A3=~s/\r//ig;my @B3=split(/\n/,$A3);$n3=@B3;
	open(OUT,">$outc");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n3;$i++){my @C3=split(/\t/,$B3[$i]);if($C3[3]<=0.01){print OUT "$C3[0]\t";my @D3=split(/ /,$C3[1]);$nD3=@D3;print OUT "$D3[0]\t";for($j=1;$j<$nD3;$j++){print OUT "$D3[$j] ";}print OUT "\t$C3[2]\t$C3[3]\t$C3[4]\t$C3[9]\n";}}
	close OUT;

	$filed="$dir/Kinases/Cluster_".$ii."_GEO_up_Kinases.txt";
	$outd="$dir/Kinases/Cluster_".$ii."_GEO_up_Kinases_2.txt";
	open(FILE,"$filed");my @A4=<FILE>;close FILE;$A4=join("",@A4);$A4=~s/\r//ig;my @B4=split(/\n/,$A4);$n4=@B4;
	open(OUT,">$outd");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n4;$i++){my @C4=split(/\t/,$B4[$i]);if($C4[3]<=0.01){print OUT "$C4[0]\t";my @D4=split(/ /,$C4[1]);$nD4=@D4;print OUT "$D4[0]\t";for($j=1;$j<$nD4;$j++){print OUT "$D4[$j] ";}print OUT "\t$C4[2]\t$C4[3]\t$C4[4]\t$C4[9]\n";}}
	close OUT;

	$filee="$dir/Kinases/Cluster_".$ii."_L1000_down_Kinases.txt";
	$oute="$dir/Kinases/Cluster_".$ii."_L1000_down_Kinases_2.txt";
	open(FILE,"$filee");my @A5=<FILE>;close FILE;$A5=join("",@A5);$A5=~s/\r//ig;my @B5=split(/\n/,$A5);$n5=@B5;
	open(OUT,">$oute");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n5;$i++){my @C5=split(/\t/,$B5[$i]);if($C5[3]<=0.01){print OUT "$C5[0]\t";my @D5=split(/ /,$C5[1]);$nD5=@D5;print OUT "$D5[0]\t";for($j=1;$j<$nD5;$j++){print OUT "$D5[$j] ";}print OUT "\t$C5[2]\t$C5[3]\t$C5[4]\t$C5[9]\n";}}
	close OUT;

	$filef="$dir/Kinases/Cluster_".$ii."_L1000_up_Kinases.txt";
	$outf="$dir/Kinases/Cluster_".$ii."_L1000_up_Kinases_2.txt";
	open(FILE,"$filef");my @A6=<FILE>;close FILE;$A6=join("",@A6);$A6=~s/\r//ig;my @B6=split(/\n/,$A6);$n6=@B6;
	open(OUT,">$outf");print OUT "\tTerm\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\n";
	for($i=1;$i<$n6;$i++){my @C6=split(/\t/,$B6[$i]);if($C6[3]<=0.01){print OUT "$C6[0]\t";my @D6=split(/ /,$C6[1]);$nD6=@D6;print OUT "$D6[0]\t";for($j=1;$j<$nD6;$j++){print OUT "$D6[$j] ";}print OUT "\t$C6[2]\t$C6[3]\t$C6[4]\t$C6[9]\n";}}
	close OUT;

	$kinases_all="$dir/Kinases/Cluster_".$ii."*"."_2.txt";
	$fileall="$dir/Kinases/Cluster_".$ii."_Kinases_all.txt";
	$fileall2="$dir/Kinases/Cluster_".$ii."_Kinases_all2.txt";
	$out="$dir/Cluster_".$ii."_Kinases_all.txt";
	`cat $kinases_all | cut -f 2- > $fileall`;
	`sed -i 's/Term\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes//ig' $fileall`;
	`awk 'NF' $fileall | sort > $fileall2`;
	`sed -i '1s/^/Term\tType\tOverlap\tP.value\tAdjusted.P.value\tGenes\\n/ig' $fileall2`;
	`mv $fileall2 $fileall`; 
	`mv $fileall $out`;
}
