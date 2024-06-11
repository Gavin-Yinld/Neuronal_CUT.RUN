#!bin/bash

########################################
####H3K27ac 
rep1=H3K27ac-exc-rep1_peaks.narrowPeak  # data for excitatory neuron
rep2=H3K27ac-exc-rep2_peaks.narrowPeak
sorted_rep1=H3K27ac-exc-rep1_peaks.sorted.narrowPeak
sorted_rep2=H3K27ac-exc-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --rank signal.value --output-file H3K27ac-exc_idr --plot --log-output-file H3K27ac-exc.idr.log

rep1=H3K27ac-inh-rep1_peaks.narrowPeak  # data for inhitatory neuron
rep2=H3K27ac-inh-rep2_peaks.narrowPeak
sorted_rep1=H3K27ac-inh-rep1_peaks.sorted.narrowPeak
sorted_rep2=H3K27ac-inh-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --rank signal.value --output-file H3K27ac-inh_idr --plot --log-output-file H3K27ac-inh.idr.log
