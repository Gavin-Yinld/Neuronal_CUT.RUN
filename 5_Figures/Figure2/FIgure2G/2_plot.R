options(stringsAsFactors = F)
library(ggplot2)
library(ggrepel)
library(stringr)
load("motif.difference.Rdata")
enrich$color="grey"
enrich$color[which(enrich$p >= 65 & enrich$diff >2 )] <- "#c04f4e"
enrich$color[which(enrich$p >= 65 & enrich$diff < -2 )] <- "#0063ae"


#plot(enrich$diff,enrich$p,col=enrich$color,pch=19)


plot(1:nrow(enrich),enrich$diff,col=enrich$color,pch=19,axes = F,
     ylab=c("% Targets (EXC - INH)"),xlab=c("TFs"))
axis(side=1,labels = NA,at=seq(1,600,by=100))
axis(side=2,las=2,at=seq(-6,4,by=2))

enrich$x <- 1:nrow(enrich)
enrich$label <- str_split(enrich$TF,"\\(",simplify = T)[,1]
enrich$label[which(enrich$color=='grey')] <- NA

TF_list <- c("Egr1","WT1","Rfx2","RFX","X-box","Rfx1","Mef2c","Jun-AP1","NF1","NF1-halfsite","E2A","NeuroD1","NeuroG2","ZEB2","Zeb2","TCF4","THRb","Oligo2","HIC1","Zic")
enrich$label[-which(enrich$label %in% TF_list)] <- NA
ggplot(enrich,aes(x=x,y=diff)) + geom_point(aes(color=color)) + 
  xlab("TFs") + ylab("% Targets (EXC - INH)") + 
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(fill=NA),
    axis.text.y = element_text(size=13,color="black"),
    axis.text.x = element_blank(),
    axis.title = element_text(size=15,color="black"),
    legend.position = "none"
  )+
  geom_text_repel(aes(label=label),                       
                  max.overlaps = 10000,                    # 最大覆盖率，当点很多时，有些标记会被覆盖，调大该值则不被覆盖，反之。
                  size=4,                                  # 字体大小
                  box.padding=unit(0.5,'lines'),           # 标记的边距
                  point.padding=unit(0.1, 'lines'), 
                  segment.color='grey60',                   # 标记线条的颜色
                  show.legend=FALSE) +
  scale_color_manual(values = c("#0063ae","#c04f4e","grey"))


