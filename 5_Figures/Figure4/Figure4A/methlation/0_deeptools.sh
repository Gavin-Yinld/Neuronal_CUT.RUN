#!/bin/sh
cd /Figure4/Figure4A/methlation

cluster1=/Figure4/Figure4A/EGR1.Common.bed
cluster2=/Figure4/Figure4A/EGR1.EXC.bed
cluster3=/Figure4/Figure4A/EGR1.INH.bed

EXC=/Genome_browser_data/Methylome/EXC.bw
INH=/Genome_browser_data/Methylome/INH.bw


computeMatrix  reference-point \
--referencePoint center -S $EXC $INH  \
-R $cluster1 $cluster2 $cluster3 \
-a 2000 -b 2000 -bs 500  \
-out egr1.peaks.with.motifs.ml.mat300.gz \
--outFileNameMatrix plot.matrix300

plotHeatmap -m egr1.peaks.with.motifs.ml.mat300.gz \
--missingDataColor white \
--zMin 0 0 0 --zMax 1 1 1 \
--colorList darkblue,skyblue,green,yellow,orange,red \
--startLabel "" \
--endLabel "" \
--yMin 0 --yMax 1 \
--sortRegions ascend \
-out final.pdf
