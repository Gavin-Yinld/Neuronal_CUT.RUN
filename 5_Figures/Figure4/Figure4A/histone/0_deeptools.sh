#!/bin/sh

cd /Figure4/Figure4A/histone

cluster1=/Figure4/Figure4A/EGR1.Common.bed
cluster2=/Figure4/Figure4A/EGR1.EXC.bed
cluster3=/Figure4/Figure4A/EGR1.INH.bed


H3K27ac_EXC=/Genome_browser_data/HistoneModification/H3K27ac-ex.sorted.bw
H3K4me1_EXC=/Genome_browser_data/HistoneModification/H3K4me1-ex.sorted.bw
H3K4me3_EXC=/Genome_browser_data/HistoneModification/H3K4me3-ex.sorted.bw
H3K27me3_EXC=/Genome_browser_data/HistoneModification/H3K27me3-ex.sorted.bw

H3K27ac_INH=/Genome_browser_data/HistoneModification/H3K27ac-in.sorted.bw
H3K4me1_INH=/Genome_browser_data/HistoneModification/H3K4me1-in.sorted.bw
H3K4me3_INH=/Genome_browser_data/HistoneModification/H3K4me3-in.sorted.bw
H3K27me3_INH=/Genome_browser_data/HistoneModification/H3K27me3-in.sorted.bw


computeMatrix  reference-point \
--referencePoint center -S $H3K27ac_EXC $H3K4me1_EXC $H3K4me3_EXC $H3K27me3_EXC $H3K27ac_INH $H3K4me1_INH $H3K4me3_INH $H3K27me3_INH \
-R $cluster1 $cluster2 $cluster3 \
-a 2000 -b 2000 -bs 10  \
--missingDataAsZero \
-out histone.gz \
--outFileNameMatrix histone.matrix2

plotHeatmap -m histone.gz  \
--missingDataColor white \
--colorList white,skyblue,green,yellow,orange,red \
--zMin 0 0 0 0 --zMax 30 35 40 20 30 30 60 20 \
--startLabel "" \
--endLabel "" \
-out histone.colorful.pdf

