#!bin/bash

########################################
####H3K27me3 
rep1=H3K27me3-exc-rep1_peaks.broadPeak  # data for excitatory neuron
rep2=H3K27me3-exc-rep2_peaks.broadPeak
sorted_rep1=H3K27me3-exc-rep1_peaks.sorted.broadPeak
sorted_rep2=H3K27me3-exc-rep2_peaks.sorted.broadPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type broadPeak --rank signal.value --output-file H3K27me3-exc_idr --plot --log-output-file H3K27me3-exc.idr.log

rep1=H3K27me3-inh-rep1_peaks.broadPeak  # data for inhitatory neuron
rep2=H3K27me3-inh-rep2_peaks.broadPeak
sorted_rep1=H3K27me3-inh-rep1_peaks.sorted.broadPeak
sorted_rep2=H3K27me3-inh-rep2_peaks.sorted.broadPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type broadPeak --rank signal.value --output-file H3K27me3-inh_idr --plot --log-output-file H3K27me3-inh.idr.log
