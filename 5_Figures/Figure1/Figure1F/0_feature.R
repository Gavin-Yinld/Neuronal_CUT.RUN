options(stringsAsFactors=F)
setwd("/data_group/lvxuemei/yinliduo/histone/1_data.process/12_remove_black.list/peaks.without.blackslist/genomic.feature")
library(GenomicRanges)
file=commandArgs(T)[1]
bed <- read.table(file,sep='\t',header=F)
bed.gr <- GRanges(bed[,1],IRanges(round(rowMeans(bed[,2:3]),0),round(rowMeans(bed[,2:3]),0)))
bed$feature <- "0"

feature <- read.table("/data_group/lvxuemei/yinliduo/database/mm10.annotation/mm10_refseq_all_types.bed",)

Exon <- feature[grep("cds",feature[,4]),1:3]
Exon.gr <- GRanges(Exon[,1],IRanges(Exon[,2],Exon[,3]))
Promoter <- feature[grep("up",feature[,4]),1:3]
Promoter.gr <- GRanges(Promoter[,1],IRanges(Promoter[,2],Promoter[,3]))
Intron <- feature[grep("intron",feature[,4]),1:3]
Intron.gr <- GRanges(Intron[,1],IRanges(Intron[,2],Intron[,3]))
UTR3 <- feature[grep("utr3",feature[,4]),1:3]
UTR3.gr <- GRanges(UTR3[,1],IRanges(UTR3[,2],UTR3[,3]))
UTR5 <- feature[grep("utr5",feature[,4]),1:3]
UTR5.gr <- GRanges(UTR5[,1],IRanges(UTR5[,2],UTR5[,3]))


Intron.hits <- unique(as.data.frame(findOverlaps(bed.gr,Intron.gr ))[,1])
bed[Intron.hits,"feature"] <- "Intron"
Exon.hits <- unique(as.data.frame(findOverlaps(bed.gr,Exon.gr ))[,1])
bed[Exon.hits,"feature"] <- "Exon"
Promoter.hits <- unique(as.data.frame(findOverlaps(bed.gr,Promoter.gr ))[,1])
bed[Promoter.hits,"feature"] <- "Promoter"
UTR5.hits <- unique(as.data.frame(findOverlaps(bed.gr,UTR5.gr ))[,1])
bed[UTR5.hits,"feature"] <- "UTR5"
UTR3.hits <- unique(as.data.frame(findOverlaps(bed.gr,UTR3.gr ))[,1])
bed[UTR3.hits,"feature"] <- "UTR3"
bed[which(bed$feature=="0"),"feature"] <- "Intergenic"

result <- data.frame(freq = table(bed$feature)/nrow(bed))

tmp <- unlist(strsplit(file,"\\/"))
out_file <- tmp[length(tmp)]
write.table(result,file=out_file,quote=F,col.names=F,row.names=F)








