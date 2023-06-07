#!/bin/sh

cd /Figure4/Figure4A/EGR1


cluster1=/Figure4/Figure4A/EGR1.Common.bed
cluster2=/Figure4/Figure4A/EGR1.EXC.bed
cluster3=/Figure4/Figure4A/EGR1.INH.bed

EXC=/Genome_browser_data/EGR1/ex.sorted.bw
INH=/Genome_browser_data/EGR1/in.sorted.bw

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
--zMin 0 0 --zMax 160 130 \
--startLabel "" \
--endLabel "" \
-out histone.colorful.pdf

