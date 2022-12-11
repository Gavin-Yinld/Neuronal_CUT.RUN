#!bin/bash

########################################
####H3K27me3 rep1
bam=H3K27me3-exc-rep1.rmdup.q30.bam # data for excitatory neurons
macs2 callpeak -t $bam -g mm -f BAM --broad -p 0.05 -n H3K27me3-exc-rep1 -B --outdir ./ 

bam=H3K27me3-inh-rep1.rmdup.q30.bam # data for inhibitory neurons
macs2 callpeak -t $bam -g mm -f BAM --broad -p 0.05 -n H3K27me3-inh-rep1 -B --outdir ./ 
####H3K27me3 rep2
bam=H3K27me3-exc-rep2.rmdup.q30.bam # data for excitatory neurons
macs2 callpeak -t $bam -g mm -f BAM --broad -p 0.05 -n H3K27me3-exc-rep2 -B --outdir ./ 

bam=H3K27me3-inh-rep2.rmdup.q30.bam # data for inhibitory neurons
macs2 callpeak -t $bam -g mm -f BAM --broad -p 0.05 -n H3K27me3-inh-rep2 -B --outdir ./ 
