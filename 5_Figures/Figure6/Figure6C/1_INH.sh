#!/bin/sh
cd /Figure6/Figure6E


cluster1=EGR1.Common.bed
cluster2=EGR1.EXC.bed
cluster3=EGR1.INH.bed

E12=/Genome_browser_data/developmental_ATAC-seq/INH.12.bw
E13=/Genome_browser_data/developmental_ATAC-seq/INH.13.bw
E14=/Genome_browser_data/developmental_ATAC-seq/INH.14.bw
E15=/Genome_browser_data/developmental_ATAC-seq/INH.15.bw
E16=/Genome_browser_data/developmental_ATAC-seq/INH.16.bw
P0=/Genome_browser_data/developmental_ATAC-seq/INH.P0.bw
P21=/Genome_browser_data/developmental_ATAC-seq/INH.P21.bw
P56=/Genome_browser_data/developmental_ATAC-seq/INH.P56.bw

computeMatrix  reference-point \
--referencePoint center -S $E12 $E13 $E14 $E15 $E16 $P0 $P21 $P56 \
-R $cluster1 $cluster2 $cluster3 \
-a 2000 -b 2000 -bs 10 \
--missingDataAsZero \
-out INH.gz \
--outFileNameMatrix INH.matrix2

# gunzip -c histone.gz | head -n 1 > normalized.data.txt
# R -f /data_group/lvxuemei/yinliduo/histone/2_compare.difference/2_deeptools/nromalize.R
# gzip normalized.data.txt

plotHeatmap -m INH.gz \
--missingDataColor white \
--zMin 0 0 0 0 0 0 0 0 --zMax 100 100 100 100 100 100 100 100 \
--colorList white,skyblue,green,yellow,orange,red \
--startLabel "" \
--endLabel "" \
-out INH.color.max100.pdf

#--zMin 0 0 --zMax 45 40 \