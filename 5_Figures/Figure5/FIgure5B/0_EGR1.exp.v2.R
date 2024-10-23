options(stringsAsFactors=F)
setwd("/data_group/lvxuemei/yinliduo/EGR1/2_integrate.Hic/7_exp.target.gene")
####################################################################################################################################
###############gene feature
tpm <- read.table("TPM.all.txt",sep='\t',header=T)
tpm <- tpm[!duplicated(tpm[,1]),]
tpm <- tpm[,c(1,54,55,2:5)]
colnames(tpm) <- c("Symbol","EXC_1","EXC_2","INH_1","INH_2","INH_3","INH_4")
Egr1 <- tpm[grep("Egr1",tpm$Symbol),2:7]

library(ggplot2)
library(reshape2)

plot.data <- melt(Egr1)
plot.data$lab <- c(rep("EXC",2),rep("INH",4))
plot.data$value <- as.numeric(plot.data$value)

plot.data3 <- data.frame(value=c(102.85,106.27,mean(c(83.6,56.06)),mean(c(113,20.82))),
                         lab = c("EXC","EXC","INH","INH"))


plot.data2 <- data.frame(value=c(mean(plot.data3[1:2,"value"]),mean(plot.data3[3:4,"value"])),
                         lab=c("EXC","INH"),
                         sd=c(sd(plot.data3[1:2,"value"]),sd(plot.data3[3:4,"value"]))
                         )

ggplot(plot.data2,aes(x=lab,y=value,fill=lab)) +
  geom_errorbar( aes(x=lab, y=value, ymin=value-sd, ymax=value+sd),width=0.3,size=1)+
  geom_bar(stat="identity",width = 0.6) +
  xlab("") + ylab("TPM")+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.text.x = element_text(size=15,color='black'),
    axis.text.y = element_text(size=15,color='black'),
    axis.title = element_text(size=15,color='black'),
    axis.line = element_line(),
    legend.text = element_text(size=13),
    legend.title =  element_text(size=12),
    legend.position = "none",
    strip.background = element_blank(),
    strip.text = element_text(size=15,color='black',face="italic")
  ) + 
  scale_fill_manual(values = c("#c04f4e","#0063ae")) +
  scale_y_continuous(expand = c(0,0))

ggplot(plot.data,aes(x=lab,y=value,fill=lab)) + geom_boxplot()+
  xlab("") + ylab("TPM")


t.test(c(plot.data3[1:2,1],plot.data3[3:4,1]))



