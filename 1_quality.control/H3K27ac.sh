#!bin/bash
########################################
####H3K27ac rep1
R1=H3K27ac_exc_rep1_R1.fq.gz  # data for excitatory neurons
R2=H3K27ac_exc_rep1_R2.fq.gz
trim_galore --fastqc -o ./ --paired --gzip $R1 $R2

R1=H3K27ac_inh_rep1_R1.fq.gz  # data for inhibitory neurons
R2=H3K27ac_inh_rep1_R2.fq.gz
trim_galore --fastqc -o ./ --paired --gzip $R1 $R2

####H3K27ac rep2
R1=H3K27ac_exc_rep2_R1.fq.gz   # data for excitatory neurons
R2=H3K27ac_exc_rep2_R2.fq.gz
trim_galore --fastqc -o ./ --paired --gzip $R1 $R2

R1=H3K27ac_inh_rep2_R1.fq.gz   # data for inhibitory neurons
R2=H3K27ac_inh_rep2_R2.fq.gz
trim_galore --fastqc -o ./ --paired --gzip $R1 $R2
