options(stringsAsFactors = F)
plot.data <- read.csv("plot.data.csv")

library(ggplot2)
plot.data$Marker <- factor(plot.data$Marker ,levels=c("H3K27ac","H3K4me3","H3K4me1","H3K27me3"))
plot.data$V1 <- factor(plot.data$V1 ,levels=c("Intergenic","UTR5","Promoter","Exon","Intron","UTR3"),
                       labels = c("Intergenic","5'UTR","Promoter","Exon","Intron","3'UTR"))
plot.data$Cell_type <- factor(plot.data$Cell_type,levels=c("ex","in"),labels=c("EXC","INH"))

ggplot(plot.data,aes(x=Cell_type,y=V2,fill=V1))+geom_bar(stat="identity") +
  facet_grid( ~ Marker) + xlab("") + ylab("Fraction of genome") +
  theme(panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=15,color='black'),
        axis.title = element_text(size=15,color='black'),
        strip.background = element_blank(),
        strip.text = element_text(size=15,color='black'),
        legend.title =  element_blank(),
        legend.text = element_text(size=12,color='black')
        )+
  scale_y_continuous(expand = c(0,0)) 
  


