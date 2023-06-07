options(stringsAsFactors = F)
library(ggplot2)
library(stringr)
EXC <- read.table("EXC.kegg",fill=T,quote="",sep='\t',header=T)
EXC <- EXC[,c("Term","Count","PValue")]
EXC$PValue <- -log(EXC$PValue,10)
INH <- read.table("INH.kegg",fill=T,quote="",sep='\t',header=T)
INH <- INH[,c("Term","Count","PValue")]
INH$PValue <- -log(INH$PValue,10)
data <- merge(EXC,INH,by="Term",all=T)

for(i in 1:nrow(data))
{
  for(j in 1:ncol(data))
  {
    if(is.na(data[i,j]))
    {
      data[i,j] <- 0
    }
  }
}


index <- data$PValue.x >= -log(0.05,10) | data$PValue.y >= -log(0.05,10)
data <- data[index,]



data$x <- data$Count.x - data$Count.y
data$y <- data$PValue.x - data$PValue.y

data$Term <- str_split(data$Term,":",simplify=T)[,2]
data <- data[order(data$y),]
###############################################################################
plot.EXC <- data[130:139,]
plot.EXC$Term <- factor(plot.EXC$Term,levels = plot.EXC$Term[order(plot.EXC$PValue.x)])
p1 <- ggplot(plot.EXC,aes(x=Term,y=PValue.x)) + 
  geom_bar(stat='identity',width=0.8,fill='#c04f4e') +
  xlab("") + ylab("-log(P value)")+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.text.x = element_text(size=15,color='black'),
    axis.text.y = element_text(size=15,color='black'),
    axis.title.y = element_text(size=15,color='black'),
    axis.title.x = element_text(size=15,color='black'),
    axis.line.x = element_line(),
    legend.text = element_text(size=13),
    legend.title =  element_text(size=14),
    legend.position = "none",
    strip.background = element_blank(),
    strip.text = element_text(size=15)
  ) + 
  coord_flip() + 
  geom_hline(yintercept = 1:10,color="white")+
  scale_y_continuous(expand = c(0,0),breaks = c(0,2,4,6,8,10))


plot.INH <- data[1:10,]
plot.INH$Term <- factor(plot.INH$Term,levels = plot.INH$Term[order(plot.INH$PValue.y)])
p2 <- ggplot(plot.INH,aes(x=Term,y=PValue.y)) + 
  geom_bar(stat='identity',width=0.8,fill='#0063ae') +
  xlab("") + ylab("-log(P value)")+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.text.x = element_text(size=15,color='black'),
    axis.text.y = element_text(size=15,color='black'),
    axis.title.y = element_text(size=15,color='black'),
    axis.title.x = element_text(size=15,color='black'),
    axis.line.x = element_line(),
    legend.text = element_text(size=13),
    legend.title =  element_text(size=14),
    legend.position = "none",
    strip.background = element_blank(),
    strip.text = element_text(size=15)
  ) + 
  coord_flip() + 
  geom_hline(yintercept = seq(0.5,4,by=0.5),color="white")+
  scale_y_continuous(expand = c(0,0),breaks = 0:4 )

cowplot::plot_grid(p1,p2,nrow=2)





