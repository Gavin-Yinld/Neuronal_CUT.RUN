options(stringsAsFactors=F)

EXC <- read.table("EXC_knownResults.txt",sep="\t",header=F,skip=1)
INH <- read.table("INH_knownResults.txt",sep="\t",header=F,skip=1)

dat <- merge(EXC,INH,by=1,all=T)
dif <- as.numeric(gsub("%","",dat[,7])) - as.numeric(gsub("%","",dat[,15]))

dat <- dat[order(dif,decreasing=T),]
write.table(dat,file="motif.difference",sep="\t",quote=F,row.names=F,col.names=F)
