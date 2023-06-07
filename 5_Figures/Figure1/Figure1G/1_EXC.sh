#!/bin/sh

H3K27ac_ex=/Genome_browser_data/HistoneModification/H3K27ac-ex.sorted.bw
H3K4me1_ex=/Genome_browser_data/HistoneModification/H3K4me1-ex.sorted.bw
H3K4me3_ex=/Genome_browser_data/HistoneModification/H3K4me3-ex.sorted.bw
H3K27me3_ex=/Genome_browser_data/HistoneModification/H3K27me3-ex.sorted.bw
H3K27ac_in=/Genome_browser_data/HistoneModification/H3K27ac-in.sorted.bw
H3K4me1_in=/Genome_browser_data/HistoneModification/H3K4me1-in.sorted.bw
H3K4me3_in=/Genome_browser_data/HistoneModification/H3K4me3-in.sorted.bw
H3K27me3_in=/Genome_browser_data/HistoneModification/H3K27me3-in.sorted.bw


computeMatrix  scale-regions \
-S $H3K27ac_ex $H3K4me1_ex $H3K4me3_ex $H3K27me3_ex \
-R mm10.TSS.bed  \
-bs 50  \
--samplesLabel  H3K27ac H3K4me1 H3K4me3 H3K27me3 \
-m 1000 -b 2000 -a 2000 \
-out EXC.gz


plotProfile --dpi 300   \
-m  EXC.gz \
-out EXC.profile.pdf \
--plotHeight 12  --plotWidth  15  \
--yAxisLabel   "Mark signal"   \
--plotFileFormat pdf \
--perGroup \
--colors "#df536b" "#61d04f" "#cd2fbc" "#29e2e5"

