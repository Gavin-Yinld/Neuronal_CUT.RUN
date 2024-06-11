options(stringsAsFactors=F)
library(ggplot2)
load("cluster.exp.Rdata")

par(cex=1,new=T)
plot( ecdf( c2[,3] ),col="#0063ae",xlim=c(0,400),main="EXC predominant",ylab="Cumulative fraction",xlab="TPM")
lines( ecdf( c2[,2]),col="#c04f4e")
par(new=T)
par(fig=c(.3, 0.85, .12, .8), new = TRUE, cex=0.8)
boxplot(log(c2[,2:3]+1,2),col= c("#c04f4e","#0063ae"),ylab="log2(TPM+1)",outline=F)

par(cex=1,new=T)
plot( ecdf( c3[,2] ),col="#c04f4e",xlim=c(0,400),main="INH predominant",ylab="Cumulative fraction",xlab="TPM")
lines( ecdf( c3[,3]),col="#0063ae")
par(new=T)
par(fig=c(.3, 0.85, .12, .8), new = TRUE, cex=0.8)
boxplot(log(c3[,2:3]+1,2),col= c("#c04f4e","#0063ae"),ylab="log2(TPM+1)",outline=F)

wilcox.test(c2[,2],c2[,3],alternative="greater",paired=T)
wilcox.test(c3[,2],c3[,3],alternative="less",paired=T)





