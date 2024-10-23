options(stringsAsFactors=F)
library(ggplot2)
load("cluster.exp.Rdata")
##############################################
####EXC
par(cex=1,new=T)
plot( ecdf( log(c2[,2]+1,2) ),col="#c04f4e",xlim=c(0,10),main="EXC predominant",ylab="Cumulative fraction",xlab="log2(TPM+1)")
lines( ecdf( log(c2[,3]+1,2) ),col="#0063ae")
par(new=T)
par(fig=c(.5, 0.95, .12, .8), new = TRUE, cex=0.8)
boxplot(log(c2[,2:3]+1,2),col= c("#c04f4e","#0063ae"),ylab="log2(TPM+1)",outline=F)
dev.off()
##################################################################################
### INH
par(cex=1,new=T)
plot( ecdf( log(c3[,2]+1,2) ),col="#c04f4e",xlim=c(0,10),main="INH predominant",ylab="Cumulative fraction",xlab="log2(TPM+1)")
lines( ecdf( log(c3[,3]+1,2) ),col="#0063ae")
par(new=T)
par(fig=c(.5, 0.95, .12, .8), new = TRUE, cex=0.8)
boxplot(log(c3[,2:3]+1,2),col= c("#c04f4e","#0063ae"),ylab="log2(TPM+1)",outline=F)

wilcox.test(c2[,2],c2[,3])
wilcox.test(c3[,2],c3[,3])
