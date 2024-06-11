options(stringsAsFactors=F)
library(GenomicRanges)
library(bedtoolsr)


####################### read datasets

EGR1_EXC <- read.table("ex_34_idr",sep="\t",header=F)
EGR1_INH <- read.table("in_34_idr",sep="\t",header=F)

TAD_CA1 <- read.table("EXC_CA1_boundaries.bed",sep="\t",header=F)
TAD_L6 <- read.table("EXC_L6_boundaries.bed",sep="\t",header=F)
TAD_L25 <- read.table("EXC_L5_boundaries.bed",sep="\t",header=F)
TAD_INH <- read.table("INH_boundaries.bed",sep="\t",header=F)

enrichment <- function(bed,TAD)
{
	bed.gr <- GRanges(bed[,1],IRanges(bed[,2],bed[,3]))
	TAD.gr <- GRanges(paste0("chr",TAD[,1]),IRanges(TAD[,2],TAD[,3]))
	hits1 <- as.data.frame(findOverlaps(bed.gr,TAD.gr))
	shuffle <- c()
	for(i in 1:1000)
	{
		TAD.shuffle <- bt.shuffle(i=TAD,g="chrom_size")
		TAD.shuffle.gr <- GRanges(TAD.shuffle[,1],IRanges(TAD.shuffle[,2],TAD.shuffle[,3]))
		shuffle.hits <- as.data.frame(findOverlaps(bed.gr,TAD.shuffle.gr))
		shuffle <- c(shuffle,length(unique(shuffle.hits[,1]))/nrow(bed))
	}
	return(list(number1 = length(unique(hits1[,1])),
				number2 = nrow(bed),
				number3 = length(unique(hits1[,1]))/nrow(bed),
				shuffle = shuffle
				))
	
}

EXC_CA1 <- enrichment(EGR1_EXC,TAD_CA1)
EXC_L6 <- enrichment(EGR1_EXC,TAD_L6)
EXC_L25 <- enrichment(EGR1_EXC,TAD_L25)
INH <- enrichment(EGR1_INH,TAD_INH)

save(EXC_CA1,EXC_L6,EXC_L25,INH,file="shuffle.4types.Rdata")





















