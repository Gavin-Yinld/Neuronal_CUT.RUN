options(stringsAsFactors = FALSE);
# BiocManager::install("Mfuzz")
library(Mfuzz)
library(limma)
library(clusterProfiler)
library(ggplot2)
library(ggstatsplot)
library(tidyverse)
library(ggplot2)
library(reshape2)
library(stringr)
library(ggalt)

load("cluster.result.Rdata")

gene.list <- c("Calb2","Kcnh2")
p <- list()
for(i in gene.list)
{
  print(i)
  cluster <- cl$cluster[i]
  genes.exp <- mat[i,]
  plot.data <- melt(t(genes.exp))

  temp <- str_split(plot.data[,1],"_",simplify=T)
  plot.data$cell_type <- temp[,1]
  plot.data$stage <- temp[,2] 

  
  
  plot.data$stage <- factor(plot.data$stage,levels = c("E12","E13","E14","E15","E16","P1","P7","P21","P60"))
  p[[i]] <- ggplot(plot.data,aes(x=stage,y=value,group=cell_type,color=cell_type)) +
    xlab("") + ylab("Expression level (CPM)") + 
    geom_xspline() + geom_point()+
    theme(
      panel.background = element_blank(),
      panel.border = element_blank(),
      axis.line = element_line(),
      axis.title = element_text(size=15,color="black"),
      axis.text.x = element_text(size=12,color="black",angle = 60,vjust=0.5,hjust=0.5),
      axis.text.y = element_text(size=12,color="black"),
      legend.position = c(0.3,0.8),
      plot.title = element_text(hjust = 0.5)
    ) + 
    ggtitle(i) + 
    scale_color_manual(name="",values = c("#c04f4e","#0063ae")) +
    scale_fill_manual(name="",values = c("#c04f4e","#0063ae"))

  
}

cowplot::plot_grid(p[[1]],p[[2]],ncol=1)



