options(stringsAsFactors=F)

fofn <- read.table("./input/fofn",header=F)
fofn$value <- 0
idr_folder <- "./input/"
genome <- read.table("./input/chrom_size",sep='\t',header=F)
size <- sum(genome[,2])

for(i in 1:nrow(fofn))
{
	print(fofn[i,1])
	f <- paste0(idr_folder,fofn[i,1])
	peak <- read.table(f,sep='\t',header=F)
	peak_size <- sum(peak[,3] - peak[,2])
	fofn[i,2] <- 100*peak_size/size
}

fofn[,1] <- gsub("-","\t",fofn[,1])
write.table(fofn,file="genome.coverage.txt",sep='\t',quote=F,row.names=F,col.names=F)


