options(stringsAsFactors = F)
load("data.Rdata")
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
library(gtable)
library(grid)

names(data) <- gsub(".rmdup.q30.bam.RPKM.bedgraph.gz","",names(data))

par(mfrow=c(1,2),mar=c(2,2.5,2,1))

  plot.data <- cbind(data[["EGR1_ex_rep3"]][,"RPKM"],data[["EGR1_ex_rep4"]][,"RPKM"])
  #plot.data <- plot.data[rowSums(plot.data)>0,]
  plot.data <- log(plot.data+1,2)
  p=cor(plot.data[,1],plot.data[,2])
  print(p)
  smoothScatter(plot.data[,1], plot.data[,2],transformation = function(x) x ^ 0.4,xlim = c(0,10),ylim = c(0,10),
                xlab="",ylab="",axes=F,
                colramp = colorRampPalette(c("white","#000099", "#00FEFF", "#45FE4F","#FCFF00", "#FF9400", "#FF3100")))
  axis(1,at=seq(0,10,by=2),labels = c(0,"","","","",10),cex.axis=1.5)
  axis(2,las=2,at=seq(0,10,by=2),labels = c(0,"","","","",10),cex.axis=1.5)
  box()
  title(main = "EXC",line=0.5,cex.main=2)
  text(2.5,9,labels=paste0("R=",round(p,2)),cex=1.5)

  plot.data2 <- cbind(data[["EGR1_in_rep3"]][,"RPKM"],data[["EGR1_in_rep4"]][,"RPKM"])
  plot.data2 <- log(plot.data2+1,2)
  p2=cor(plot.data2[,1],plot.data2[,2])
  print(p2)
  smoothScatter(plot.data2[,1], plot.data2[,2],transformation = function(x) x ^ 0.4,xlim = c(0,10),ylim = c(0,10),
                xlab="",ylab="",axes=F,
                colramp = colorRampPalette(c("white","#000099", "#00FEFF", "#45FE4F","#FCFF00", "#FF9400", "#FF3100")))
  axis(1,at=seq(0,10,by=2),labels = c(0,"","","","",10),cex.axis=1.5)
  axis(2,las=2,at=seq(0,10,by=2),labels = c(0,"","","","",10),cex.axis=1.5)
  box()
  title(main = "INH",line=0.5,cex.main=2)
  text(2.5,9,labels=paste0("R=",round(p2,2)),cex=1.5)
  