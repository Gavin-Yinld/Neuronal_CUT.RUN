
############ step 1. Quality control
## replicate 1
R1=INH_rep1_1.fq.gz
R2=INH_rep1_2.fq.gz
fastp -i $R1 -o ./INH_rep1_1.fq.gz -I $R2 -O INH_rep1_2.fq.gz 

## replicate 2
R1=INH_rep2_1.fq.gz
R2=INH_rep2_2.fq.gz
fastp -i $R1 -o ./INH_rep2_1_trimed.fq.gz -I $R2 -O INH_rep2_2_trimed.fq.gz 

############ step 2. mapping 
thread=10
genome=./Mouse.mm10/hisat2/grcm38_tran/genome_tran
## replicate 1
R1=INH_rep1_1_trimed.fq.gz
R2=INH_rep1_2_trimed.fq.gz 
hisat2 --dta -p $thread -x $genome -1 $R1 -2 $R2 -S INH_rep1.sam > summary.txt
samtools sort -@ $thread -o INH_rep1.bam INH_rep1.sam # convert to bam file
## replicate 2
R1=INH_rep2_1_trimed.fq.gz
R2=INH_rep2_2_trimed.fq.gz 
hisat2 --dta -p $thread -x $genome -1 $R1 -2 $R2 -S INH_rep2.sam > summary.txt
samtools sort -@ $thread -o INH_rep2.bam INH_rep2.sam # convert to bam file


############ step 3. quantify gene expression 
gtf=./Mouse.mm10/Mus_musculus.GRCm38.102.gtf
## replicate 1
stringtie -e -A gene_abund.ori.tab -B -p $thread INH_rep1.bam  -G $gtf -o INH_rep1.ori.gtf
stringtie -e -A gene_abund.ori.tab -B -p $thread INH_rep1.bam  -G $gtf -o INH_rep2.ori.gtf

