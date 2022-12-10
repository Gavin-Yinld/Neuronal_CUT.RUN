<div align=center><img width="1000" height="300" src="https://github.com/Gavin-Yinld/Neuronal_CUT.RUN/blob/main/github.png"/></div>

# CUT&RUN data analysis for histone modification and transcription factor in excitatory and inhibitory neurons
To investigate the cell-type specific histone modification and transcription factor bindings, we performed cut and run of four histone modifications and the transcription factor EGR1 in excitatory and inhibitory neurons in adult mouse brain, followed by high throughput sequencing. This repository is used for recording the data analysis pipeline.

Sequencing adapters and low-quality bases were first trimed with cutadapt (v1.18) and trim_galore (v0.5.0) for all cun&run libraries. The retained reads were aligned to mouse genome (mm10) using bowtie2 (v2.3.5) in pair-end mode with option “-N 1 -L 25”.PCR duplications were removed using picard (v2.25.0) with the option “REMOVE_DUPLICATES=true”. Non-redundant reads were further filtered for minimal mapping quality (MAPQ ≥ 30) using samtools (v1.12) view with option “-q30”.

Peak calling for histone modifications was performed by MACS2 (v2.2.5) using option “-p 0.05” for H3K27ac and H3K4me3, “--broad -p 0.05” for H3K4me1 and H3K27me3. The reproducible peaks between biological replicates was further identified following irreproducible discovery rate (IDR, v2.0.4.2) framework with parameters “--rank signal.value”. Stricter parameters were adopted for EGR1 cun&run datasets peak calling to generate the reliable transcription factor binding sites，with option “-p 0.005” for MACS2 and “--rank signal.value --idr-threshold 0.02” for IDR framework.

Raw and processed data of this study are available in the NCBI Gene Expression Omnibus (GEO) with the accession number GSE218312. 

## Table of contents
1. Quality control
2. Mapping
3. Peak calling
4. Reproducible peaks identification
