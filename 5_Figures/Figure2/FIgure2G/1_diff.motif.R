options(stringsAsFactors=F)

diff <- read.table("motif.difference",sep="\t",header=F)

result <- apply(diff,1,function(x){
	num1 <- 105841
	num2 <- as.numeric(x[6])
	num3 <- 73632
	num4 <- as.numeric(x[14])
	cha <- 100*(num2/num1  -  num4/num3)
	if(cha > 0)
	{
		p <- binom.test(x = num2, n = num1, p = num4/num3, alternative = "greater")
		return(c(p$p.value,cha))
	} else {
		p <- binom.test(x = num4, n = num3, p = num2/num1, alternative = "greater")
		return(c(p$p.value,cha))

	}
})

enrich <- data.frame(TF = diff[,1],p=-log(t(result)[,1],10),diff=t(result)[,2])
save(enrich,file="motif.difference.Rdata")

