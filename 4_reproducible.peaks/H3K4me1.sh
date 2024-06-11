#!bin/bash

########################################
####H3K4me1 
rep1=H3K4me1-exc-rep1_peaks.broadPeak  # data for excitatory neuron
rep2=H3K4me1-exc-rep2_peaks.broadPeak
sorted_rep1=H3K4me1-exc-rep1_peaks.sorted.broadPeak
sorted_rep2=H3K4me1-exc-rep2_peaks.sorted.broadPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type broadPeak --rank signal.value --output-file H3K4me1-exc_idr --plot --log-output-file H3K4me1-exc.idr.log

rep1=H3K4me1-inh-rep1_peaks.broadPeak  # data for inhitatory neuron
rep2=H3K4me1-inh-rep2_peaks.broadPeak
sorted_rep1=H3K4me1-inh-rep1_peaks.sorted.broadPeak
sorted_rep2=H3K4me1-inh-rep2_peaks.sorted.broadPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type broadPeak --rank signal.value --output-file H3K4me1-inh_idr --plot --log-output-file H3K4me1-inh.idr.log
