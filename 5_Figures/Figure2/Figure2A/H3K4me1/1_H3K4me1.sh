

cd /Figure2/Figure2A/H3K4me1

EXC_bw=/Genome_browser_data/HistoneModification/H3K4me1-ex.sorted.bw
INH_bw=/Genome_browser_data/HistoneModification/H3K4me1-in.sorted.bw

computeMatrix  reference-point --referencePoint center -S $EXC_bw $INH_bw -R COMMON_peak.bed EXC_peak.bed INH_peak.bed -a 2000 -b 2000  --missingDataAsZero -out histone.gz --outFileNameMatrix histone.matrix2

gunzip -c histone.gz | head -n 1 > normalized.data.txt
R -f nromalize.R
gzip normalized.data.txt

plotHeatmap -m normalized.data.txt.gz --missingDataColor white \
--colorList white,"#d6f3cf","#5FD146","#007E00","#005800" \
--startLabel "" \
--endLabel "" \
--whatToShow 'heatmap and colorbar' \
-out H3K4me1.colorful.pdf

