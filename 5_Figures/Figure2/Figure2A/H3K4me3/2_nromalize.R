options(stringsAsFactors=F)
argvs <- commandArgs(T)

data <- read.table("histone.gz",header=F,sep='\t',fill=T)

my_norm <- function(x,n){
	average1 <- mean(as.matrix(x[,1:400]))
	std1 <- sd(as.matrix(x[,1:400]))
	for(i in 1:400)
	{
		x[,i] <- (x[,i] - average1)/std1
	}
	average2 <- mean(as.matrix(x[,401:800]))
	std2 <- sd(as.matrix(x[,401:800]))
	for(i in 401:800)
	{
		x[,i] <- (x[,i] - average2)/std2
	}

	return(x)

}

normalize_data <- cbind(data[-1,1:6], my_norm(data[-1,7:ncol(data)],2))


write.table(normalize_data,file="normalized.data.txt",sep='\t',quote=F,row.names=F,col.names=F,append=T)

