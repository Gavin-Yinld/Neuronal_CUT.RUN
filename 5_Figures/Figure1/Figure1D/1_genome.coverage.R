options(stringsAsFactors=F)
setwd("/data_group/lvxuemei/yinliduo/histone/1_data.process/12_remove_black.list/peaks.without.blackslist")
fofn <- read.table("fofn",header=F)
fofn$value <- 0
idr_folder <- "/data_group/lvxuemei/yinliduo/histone/1_data.process/12_remove_black.list/peaks.without.blackslist/"
genome <- read.table("/data_group/lvxuemei/yinliduo/database/mm10.annotation/chrom_size",sep='\t',header=F)
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


