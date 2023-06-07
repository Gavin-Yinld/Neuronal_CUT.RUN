#!/bin/sh


cd /Figure6/Figure6E


cluster1=EGR1.Common.bed
cluster2=EGR1.EXC.bed
cluster3=EGR1.INH.bed

E12=/Genome_browser_data/developmental_ATAC-seq/EXC.12.bw
E13=/Genome_browser_data/developmental_ATAC-seq/EXC.13.bw
E14=/Genome_browser_data/developmental_ATAC-seq/EXC.14.bw
E15=/Genome_browser_data/developmental_ATAC-seq/EXC.15.bw
E16=/Genome_browser_data/developmental_ATAC-seq/EXC.16.bw
P0=/Genome_browser_data/developmental_ATAC-seq/EXC.P0.bw
P21=/Genome_browser_data/developmental_ATAC-seq/EXC.P21.bw
P56=/Genome_browser_data/developmental_ATAC-seq/EXC.P56.bw

computeMatrix  reference-point \
--referencePoint center -S $E12 $E13 $E14 $E15 $E16 $P0 $P21 $P56 \
-R $cluster1 $cluster2 $cluster3 \
-a 2000 -b 2000 -bs 10 \
--missingDataAsZero \
-out EXC.gz \
--outFileNameMatrix EXC.matrix2


plotHeatmap -m EXC.gz \
--missingDataColor white \
--zMin 0 0 0 0 0 0 0 0 --zMax 100 100 100 100 100 100 100 100 \
--colorList white,skyblue,green,yellow,orange,red \
--startLabel "" \
--endLabel "" \
-out EXC.color.max100.pdf

#