options(stringsAsFactors = F)
library(ggplot2)
load("shufflue.Rdata")
plot.data <- data.frame(lab1=c("EXC","EXC","INH","INH"),
                        leb2=c("EGR1","Shuffle","EGR1","Shuffle"),
                        value=c(0.6603467,mean(EXC),0.3631285,mean(INH))
                        )

plot.EXC <- as.data.frame(plot.data[which(plot.data$lab1=="EXC"),])
p1 <- ggplot(plot.EXC ,aes(x=leb2,y=value,fill=leb2)) + geom_bar(stat="identity",width = 0.6)  +
  xlab("") + ylab("Fraction of super enhancers") +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.title = element_text(color="black",size=14),
    axis.text = element_text(color="black",size=14),
    legend.position = "none",
    legend.text = element_text(color="black",size=13),
  ) + 
  scale_fill_manual(name="",values = c("#c04f4e","grey")) + scale_y_continuous(expand = c(0,0))


plot.INH <- as.data.frame(plot.data[which(plot.data$lab1=="INH"),])
p2 <- ggplot(plot.INH ,aes(x=leb2,y=value,fill=leb2)) + geom_bar(stat="identity",width = 0.6)  +
  xlab("") + ylab("Fraction of super enhancers") +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.title = element_text(color="black",size=14),
    axis.text = element_text(color="black",size=14),
    legend.position = "none",
    legend.text = element_text(color="black",size=13),
  ) + 
  scale_fill_manual(name="",values = c("#0063ae","grey")) + scale_y_continuous(expand = c(0,0))

cowplot::plot_grid(p1,p2)
       