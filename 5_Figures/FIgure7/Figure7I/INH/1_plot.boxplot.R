options(stringsAsFactors=F)
load("INH.jaccard.Rdata")
library(ggplot2)
library(reshape2)



EXC_mat <- EXC_mat[order(rowSums(EXC_mat[,8:9]),decreasing = F),]

plot.EXC <- melt(t(EXC_mat))
plot.EXC$lab <- "EXC"
INH_mat <- INH_mat[order(rowSums(INH_mat[,8:9]),decreasing = F),]

plot.INH <- melt(t(INH_mat))
plot.INH$lab <- "INH"
plot.data <- rbind(plot.EXC,plot.INH)

ggplot(plot.data,aes(x=Var1,y=value,fill=lab)) + geom_boxplot(outlier.shape = NA)+
  xlab("") + ylab("Jaccard index")+ 
  theme(panel.background = element_blank(),
        panel.border=element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_text(size=15,color='black'),
        axis.text = element_text(size=12,color='black'),
        axis.line =  element_line(),
        legend.position = c(0.4,0.6),
        plot.title = element_text(hjust = 0.5)
  ) +
  scale_fill_manual(name="",values =c("#c04f4e", "#0063ae"))



result <- c()

for(s in c("E12","E13","E14","E15","E16","P1","P7","P21","P60"))
{
  print(s) 
  EXC <- plot.data[which(plot.data$Var1==s & plot.data$lab=="EXC"),"value"]
  INH <- plot.data[which(plot.data$Var1==s & plot.data$lab=="INH"),"value"]
  result <- c(result,t.test(EXC,INH)$p.value)
}

ks.test(plot.data$value[which(plot.data$lab=="EXC")],plot.data$value[which(plot.data$lab=="INH")])
