#!bin/bash

thread=10
index=mm10.bowtie2.index
########################################
####H3K4me3 rep1
R1=H3K4me3-exc-rep1_R1_trimed.fq.gz	# data for excitatory neurons
R2=H3K4me3-exc-rep1_R2_trimed.fq.gz 
bowtie2 -p $thread -x $index -1 $R1 -2 $R2 -t -q -N 1 -L 25 --no-mixed --no-discordant | samtools sort -@ $thread -O bam -o H3K4me3-exc-rep1.bam 
java -jar picard.jar  MarkDuplicates --INPUT H3K4me3-exc-rep1.bam  --OUTPUT H3K4me3-exc-rep1.rmdup.bam --METRICS_FILE log_dup_qc_matrix.v2 --VALIDATION_STRINGENCY LENIENT --ASSUME_SORTED --REMOVE_DUPLICATES true
samtools view -q30 -b H3K4me3-exc-rep1.rmdup.bam > H3K4me3-exc-rep1.rmdup.q30.bam 

R1=H3K4me3-inh-rep1_R1_trimed.fq.gz	# data for inhitatory neurons
R2=H3K4me3-inh-rep1_R2_trimed.fq.gz 
bowtie2 -p $thread -x $index -1 $R1 -2 $R2 -t -q -N 1 -L 25 --no-mixed --no-discordant | samtools sort -@ $thread -O bam -o H3K4me3-inh-rep1.bam 
java -jar picard.jar  MarkDuplicates --INPUT H3K4me3-inh-rep1.bam  --OUTPUT H3K4me3-inh-rep1.rmdup.bam --METRICS_FILE log_dup_qc_matrix.v2 --VALIDATION_STRINGENCY LENIENT --ASSUME_SORTED --REMOVE_DUPLICATES true
samtools view -q30 -b H3K4me3-inh-rep1.rmdup.bam > H3K4me3-inh-rep1.rmdup.q30.bam 

####H3K4me3 rep2
R1=H3K4me3-exc-rep2_R1_trimed.fq.gz	# data for excitatory neurons
R2=H3K4me3-exc-rep2_R2_trimed.fq.gz 
bowtie2 -p $thread -x $index -1 $R1 -2 $R2 -t -q -N 1 -L 25 --no-mixed --no-discordant | samtools sort -@ $thread -O bam -o H3K4me3-exc-rep2.bam 
java -jar picard.jar  MarkDuplicates --INPUT H3K4me3-exc-rep2.bam  --OUTPUT H3K4me3-exc-rep2.rmdup.bam --METRICS_FILE log_dup_qc_matrix.v2 --VALIDATION_STRINGENCY LENIENT --ASSUME_SORTED --REMOVE_DUPLICATES true
samtools view -q30 -b H3K4me3-exc-rep2.rmdup.bam > H3K4me3-exc-rep2.rmdup.q30.bam 

R1=H3K4me3-inh-rep2_R1_trimed.fq.gz	# data for inhitatory neurons
R2=H3K4me3-inh-rep2_R2_trimed.fq.gz 
bowtie2 -p $thread -x $index -1 $R1 -2 $R2 -t -q -N 1 -L 25 --no-mixed --no-discordant | samtools sort -@ $thread -O bam -o H3K4me3-inh-rep2.bam 
java -jar picard.jar  MarkDuplicates --INPUT H3K4me3-inh-rep2.bam  --OUTPUT H3K4me3-inh-rep2.rmdup.bam --METRICS_FILE log_dup_qc_matrix.v2 --VALIDATION_STRINGENCY LENIENT --ASSUME_SORTED --REMOVE_DUPLICATES true
samtools view -q30 -b H3K4me3-inh-rep2.rmdup.bam > H3K4me3-inh-rep2.rmdup.q30.bam 
