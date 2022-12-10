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
########################################
####H3K4me3 
rep1=H3K4me3-exc-rep1_peaks.narrowPeak  # data for excitatory neuron
rep2=H3K4me3-exc-rep2_peaks.narrowPeak
sorted_rep1=H3K4me3-exc-rep1_peaks.sorted.narrowPeak
sorted_rep2=H3K4me3-exc-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --rank signal.value --output-file H3K4me3-exc_idr --plot --log-output-file H3K4me3-exc.idr.log

rep1=H3K4me3-inh-rep1_peaks.narrowPeak  # data for inhitatory neuron
rep2=H3K4me3-inh-rep2_peaks.narrowPeak
sorted_rep1=H3K4me3-inh-rep1_peaks.sorted.narrowPeak
sorted_rep2=H3K4me3-inh-rep2_peaks.sorted.narrowPeak
sort -k7,7nr $rep1 > $sorted_rep1
sort -k7,7nr $rep2 > $sorted_rep2
idr --samples $sorted_rep1 $sorted_rep2 --input-file-type narrowPeak --rank signal.value --output-file H3K4me3-inh_idr --plot --log-output-file H3K4me3-inh.idr.log
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
