options(stringsAsFactors = F)

library(ggplot2)
plot.data <- read.table("genome.coverage.txt",sep='\t')

plot.data$V1 <- factor(plot.data$V1,levels=c("H3K27ac","H3K4me1","H3K4me3","H3K27me3"))
ggplot(plot.data,aes(x=V1,y=V3,fill=V2)) + 
  geom_hline(yintercept = c(0,1),linetype="dashed",color="grey60")+
  geom_bar(stat='identity',position='dodge')+
  xlab("") + ylab("Number of peaks") + 
  theme( panel.background = element_blank(),
         panel.border = element_blank(),
         axis.line = element_line(color="black"),
         axis.title = element_text(color="black",size=15),
         axis.text.y = element_text(color="black",size=15),
         axis.text.x = element_text(color="black",size=15,angle=60,hjust=1,vjust=1),
         legend.position = c(0.8,0.8),
         legend.text = element_text(color="black",size=12)
  )+
  scale_fill_manual(name="",values = c("#ff2b28","#008fba"),labels=c("EXC","INH")) +
  scale_y_continuous(expand=c(0,0))
