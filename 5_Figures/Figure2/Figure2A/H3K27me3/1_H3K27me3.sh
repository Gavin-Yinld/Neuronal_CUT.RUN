

cd /Figure2/Figure2A/H3K4me3


EXC_bw=/Genome_browser_data/HistoneModification/H3K4me3-ex.sorted.bw
INH_bw=/Genome_browser_data/HistoneModification/H3K4me3-in.sorted.bw

computeMatrix  reference-point --referencePoint center -S $EXC_bw $INH_bw -R COMMON_peak.bed EXC_peak.bed INH_peak.bed -a 2000 -b 2000  --missingDataAsZero -out histone.gz --outFileNameMatrix histone.matrix2

gunzip -c histone.gz | head -n 1 > normalized.data.txt
R -f nromalize.R
gzip normalized.data.txt

plotHeatmap -m normalized.data.txt.gz --colorList "white","#5AC1C9","#00747C" \
--whatToShow 'heatmap and colorbar' \
--missingDataColor white -out H3K27me3.colorful.pdf
