#!bin/bash

########################################
####Transcription factor EGR1 rep1
bam=EGR1-exc-rep1.rmdup.q30.bam # data for excitatory neurons
macs2 callpeak -t $bam -g mm -f BAM -p 0.005 -n EGR1-exc-rep1 -B --outdir ./ 

bam=EGR1-inh-rep1.rmdup.q30.bam # data for inhibitory neurons
macs2 callpeak -t $bam -g mm -f BAM -p 0.005 -n EGR1-inh-rep1 -B --outdir ./ 
####Transcription factor EGR1 rep2
bam=EGR1-exc-rep2.rmdup.q30.bam # data for excitatory neurons
macs2 callpeak -t $bam -g mm -f BAM -p 0.005 -n EGR1-exc-rep2 -B --outdir ./ 

bam=EGR1-inh-rep2.rmdup.q30.bam # data for inhibitory neurons
macs2 callpeak -t $bam -g mm -f BAM -p 0.005 -n EGR1-inh-rep2 -B --outdir ./ 
