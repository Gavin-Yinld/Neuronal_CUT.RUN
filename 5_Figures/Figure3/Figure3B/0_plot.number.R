options(stringsAsFactors = F)
library(ggplot2)
plot.data <- data.frame(value=c(24783,10391),lab=c("EXC","INH"))
plot.data$lab <- factor(plot.data$lab,levels = c("EXC","INH"))

ggplot(plot.data,aes(x=lab,y=value,fill=lab)) + geom_bar(stat='identity',width=0.5) +
  xlab("")+ylab("Number of peaks")+
  scale_y_continuous(expand = c(0,0),limits = c(0,25000)) +
  theme(panel.background = element_blank(),
        panel.border = element_blank(),
        axis.text = element_text(color="black",size=15),
        axis.title =  element_text(color="black",size=15),
        axis.line = element_line(),
        legend.position = "none"
        ) + 
 scale_fill_manual(values = c("#c04f4e","#0063ae"))
