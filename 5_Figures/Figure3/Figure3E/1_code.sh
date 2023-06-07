#!/bin/sh

EGR1_ex=EGR1_ex.bed
EGR1_in=EGR1_in.bed
H3K27ac_ex=/Genome_browser_data/HistoneModification/H3K27ac-ex.sorted.bw
H3K4me1_ex=/Genome_browser_data/HistoneModification/H3K4me1-ex.sorted.bw
H3K4me3_ex=/Genome_browser_data/HistoneModification/H3K4me3-ex.sorted.bw
H3K27me3_ex=/Genome_browser_data/HistoneModification/H3K27me3-ex.sorted.bw
H3K27ac_in=/Genome_browser_data/HistoneModification/H3K27ac-in.sorted.bw
H3K4me1_in=/Genome_browser_data/HistoneModification/H3K4me1-in.sorted.bw
H3K4me3_in=/Genome_browser_data/HistoneModification/H3K4me3-in.sorted.bw
H3K27me3_in=/Genome_browser_data/HistoneModification/H3K27me3-in.sorted.bw


computeMatrix  reference-point \
-S $H3K27ac_ex $H3K4me1_ex $H3K4me3_ex $H3K27me3_ex \
-R $EGR1_ex  \
-bs 50  \
--samplesLabel  H3K27ac H3K4me1 H3K4me3 H3K27me3 \
-b 5000 -a 5000 \
-out EXC.gz

plotProfile --dpi 300   \
-m  EXC.gz \
-out EXC.profile.pdf \
--plotHeight 12  --plotWidth  15  \
--yAxisLabel   "Mark signal"   \
--plotFileFormat pdf \
--perGroup \
--colors "red" "#61d04f" "#cd2fbc" "#29e2e5"




computeMatrix  reference-point \
-S $H3K27ac_in $H3K4me1_in $H3K4me3_in $H3K27me3_in \
-R $EGR1_in  \
-bs 50  \
--samplesLabel  H3K27ac H3K4me1 H3K4me3 H3K27me3 \
-b 5000 -a 5000 \
-out INH.gz

plotProfile --dpi 300   \
-m  INH.gz \
-out INH.profile.pdf \
--plotHeight 12  --plotWidth  15  \
--yAxisLabel   "Mark signal"   \
--plotFileFormat pdf \
--perGroup \
--colors "red" "#61d04f" "#cd2fbc" "#29e2e5"
