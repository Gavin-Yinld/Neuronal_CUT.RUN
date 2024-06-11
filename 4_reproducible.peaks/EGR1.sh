#!bin/bash

########################################
####Transcription factor EGR1 
rep1=EGR1-exc-rep1_peaks.narrowPeak  # data for excitatory neuron
rep2=EGR1-exc-rep2_peaks.narrowPeak
sorted_rep1=EGR1-exc-rep1_peaks.sorted.narrowPeak
sorted_rep2=EGR1-exc-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --idr-threshold 0.02 --rank signal.value --output-file EGR1-exc_idr --plot --log-output-file EGR1-exc.idr.log

rep1=EGR1-inh-rep1_peaks.narrowPeak  # data for inhitatory neuron
rep2=EGR1-inh-rep2_peaks.narrowPeak
sorted_rep1=EGR1-inh-rep1_peaks.sorted.narrowPeak
sorted_rep2=EGR1-inh-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --idr-threshold 0.02 --rank signal.value --output-file EGR1-inh_idr --plot --log-output-file EGR1-inh.idr.log
