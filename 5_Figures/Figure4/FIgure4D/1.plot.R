options(stringsAsFactors = F)
library(ggplot2)
load("shuffle.4types.Rdata")


plot.data <- data.frame(lab1=c(rep("EXC",6),rep("INH",2)),
                        lab2=rep(c("CA1","L6","L25","INH"),each=2),
                        lab3=rep(c("data","shuffle"),4),
                        value=c(EXC_CA1[[3]],mean(EXC_CA1[[4]]),
                                EXC_L6[[3]],mean(EXC_L6[[4]]),
                                EXC_L25[[3]],mean(EXC_L25[[4]]),
                                INH[[3]],mean(INH[[4]])
                                )
                        )

plot.data$lab2 <- factor(plot.data$lab2,levels = c("CA1","L6","L25","INH"))

p <- ggplot(plot.data ,aes(x=lab2,y=value,fill=lab3)) + geom_bar(stat="identity",position="dodge",width = 0.6)  +
  xlab("") + ylab("Fraction of EGR1 binding sites") +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.title = element_text(color="black",size=14),
    axis.text = element_text(color="black",size=14),
    legend.position = "right",
    legend.text = element_text(color="black",size=13),
  ) + 
  scale_fill_manual(name="",values = c("#c04f4e","grey")) + 
  scale_y_continuous(expand = c(0,0),limits = c(0,0.15),breaks = seq(0,0.15,by=0.05)) 

pdf("")

dev.off()

m1 <- matrix(c(EXC_CA1[[1]],EXC_CA1[[2]],mean(EXC_CA1[[4]])*1000,1000),2,2) 
fisher.test(m1) #p-value = 2.296e-05

m2 <- matrix(c(EXC_L6[[1]],EXC_L6[[2]],mean(EXC_L6[[4]])*1000,1000),2,2) 
fisher.test(m2) #p-value = 4.314e-05

m3 <- matrix(c(EXC_L25[[1]],EXC_L25[[2]],mean(EXC_L25[[4]])*1000,1000),2,2) 
fisher.test(m3) #p-value = 5.652e-05

m4 <- matrix(c(INH[[1]],INH[[2]],mean(INH[[4]])*1000,1000),2,2) 
fisher.test(m4) #p-value = 4.618e-12








