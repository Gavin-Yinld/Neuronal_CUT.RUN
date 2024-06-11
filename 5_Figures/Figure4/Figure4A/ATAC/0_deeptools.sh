#!/bin/sh

cd /Figure4/Figure4A/ATAC


cluster1=/Figure4/Figure4A/EGR1.Common.bed
cluster2=/Figure4/Figure4A/EGR1.EXC.bed
cluster3=/Figure4/Figure4A/EGR1.INH.bed

EXC=/Genome_browser_data/ATAC-seq/EXC.rmdup.bw
INH=/Genome_browser_data/ATAC-seq/INH.rmdup.bw

computeMatrix  reference-point \
--referencePoint center -S $EXC $INH \
-R $cluster1 $cluster2 $cluster3 \
-a 2000 -b 2000 -bs 10 \
--missingDataAsZero \
-out histone.gz \
--outFileNameMatrix histone.matrix2

plotHeatmap -m histone.gz \
--missingDataColor white \
--colorList white,skyblue,green,yellow,orange,red \
--zMin 0 0 --zMax 45 40 \
--startLabel "" \
--endLabel "" \
-out histone.color.pdf

