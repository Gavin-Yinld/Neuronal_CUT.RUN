options(stringsAsFactors=F)

####################################################################################################################################
###############gene feature
tpm <- read.table("all.sample.TPM.txt",sep='\t',header=T,row.names = 1)
colnames(tpm) <- c("EXC_1","EXC_2","INH_1","INH_2")
Egr1 <- tpm[grep("Egr1",rownames(tpm)),]


library(ggplot2)
library(reshape2)

plot.data <- melt(Egr1)
plot.data$lab <- c(rep("EXC",2),rep("INH",2))
plot.data$value <- as.numeric(plot.data$value)

plot.data2 <- data.frame(value=c(mean(plot.data[1:2,"value"]),mean(plot.data[3:4,"value"])),
                         lab=c("EXC","INH"),
                         sd=c(sd(plot.data[1:2,"value"]),sd(plot.data[3:4,"value"]))
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


t.test(c(plot.data[1:2,"value"],plot.data[3:4,"value"]),alternative="greater")



