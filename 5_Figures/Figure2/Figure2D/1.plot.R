options(stringsAsFactors = F)
library(ggplot2)
EXC <- read.table("EXC_AllStitched.table.txt",header=T,sep='\t')
EXC$x <- nrow(EXC)+1 - EXC$enhancerRank
EXC$isSuper <- as.character(EXC$isSuper)
EXC$isSuper <- factor(EXC$isSuper,levels = c("1","0"),labels = c("Super enhancer (n=1846)","Typical enhancer (n=49361)"))
p1 <- ggplot(EXC,aes(x=x,y=EXC.H3K27ac.sorted.bam,color=isSuper)) + geom_point() + geom_line() +
  geom_hline(yintercept = 11792.88,color="grey",linetype="dashed")+
  geom_vline(xintercept = 49362,color="grey",linetype="dashed")+
  xlab("Enhacners") + ylab("H3K27ac signal") +
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(color="black",fill=NA),
    axis.title = element_text(color="black",size=14),
    axis.text.x=element_blank(),
    axis.text.y = element_text(color="black",size=14),
    legend.position = c(0.4,0.7),
    legend.text = element_text(color="black",size=13),
  ) + 
  scale_color_manual(name="Enhancer type",values = c("#c04f4e","grey"))
  
INH <- read.table("INH_AllStitched.table.txt",header=T,sep='\t')
INH$x <- nrow(INH)+1 - INH$enhancerRank
INH$isSuper <- as.character(INH$isSuper)
INH$isSuper <- factor(INH$isSuper,levels = c("1","0"),labels = c("Super enhancer (n=1790)","Typical enhancer (n=36672)"))
p2 <- ggplot(INH,aes(x=x,y=INH.H3K27ac.sorted.bam,color=isSuper)) + geom_point() + geom_line() +
  geom_hline(yintercept = 15598.8,color="grey",linetype="dashed")+
  geom_vline(xintercept = 36673,color="grey",linetype="dashed")+
  xlab("Enhacners") + ylab("H3K27ac signal") +
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(color="black",fill=NA),
    axis.title = element_text(color="black",size=14),
    axis.text.x=element_blank(),
    axis.text.y = element_text(color="black",size=14),
    legend.position = c(0.4,0.7),
    legend.text = element_text(color="black",size=13),
  ) + 
  scale_color_manual(name="Enhancer type",values = c("#0063ae","grey"))

cowplot::plot_grid(p1,p2)
       