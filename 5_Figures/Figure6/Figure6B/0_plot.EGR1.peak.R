options(stringsAsFactors = FALSE)
library(ggplot2)
library(reshape2)
library(ggalt)
peak_number <- read.table("opened.EGR1.peaks.number",sep="\t",header=T,row.names = 1) 
plot.peak <- melt(t(peak_number))
plot.peak$Var2 <- factor(plot.peak$Var2,levels = c("E12","E13","E14","E15","E16","P0","P21","P60"),
                         labels=c("E12.5","E13.5","E14.5","E15.5","E16.5","P0","P21","P56")) 
p1 <- ggplot(plot.peak,aes(x=Var2,y=value,group=Var1,color=Var1)) +
  xlab("") + ylab("#Accessible EGR1 binding sites") + 
  geom_xspline() + geom_point()+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.title = element_text(size=15,color="black"),
    axis.text.x = element_text(size=12,color="black",angle = 60,vjust=0.5,hjust=0.5),
    axis.text.y = element_text(size=12,color="black"),
    axis.ticks.x = element_blank(),
    legend.position = c(0.3,0.8),
    plot.title = element_text(hjust = 0.5)
  ) + 
  scale_color_manual(values=c("#c04f4e","#0063ae"),name="")+
  scale_y_continuous(limits = c(0,25000))


############################

peak_number$diff <- peak_number$EXC-peak_number$INH
plot.data2 <- melt(t(peak_number))
plot.data2 <- plot.data2[which(plot.data2$Var1=="diff"),]
p2 <- ggplot(plot.data2,aes(x=Var2,y=value,fill=Var2)) + geom_bar(stat='identity')+
  geom_hline(yintercept = 0) + 
  xlab("") + ylab("#Accessible EGR1 binding sites (EXC-INH)")+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line.y = element_line(),
    axis.title = element_text(size=15,color="black"),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size=12,color="black"),
    axis.ticks.x = element_blank(),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5)
  ) + 
  scale_fill_manual(values = c("#9e0142","#f46d43","#fdae61","#fee08b","#ffffbf","#abdda4","#3288bd","#5e4fa2"))

cowplot::plot_grid(p1,p2,ncol=1)
