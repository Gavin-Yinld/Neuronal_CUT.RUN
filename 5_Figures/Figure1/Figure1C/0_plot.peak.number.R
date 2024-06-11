options(stringsAsFactors = F)
library(stringr)
library(ggplot2)
plot.data <- read.table("peak.number.txt",sep=' ')
tmp <- str_split(plot.data[,2],"-",simplify=T)
tmp[,2] <- gsub("_idr","",tmp[,2])
colnames(tmp) <- c("Marker","Cell_type")
plot.data <- cbind(plot.data,tmp)

plot.data$Marker <- factor(plot.data$Marker,levels=c("H3K27ac","H3K4me3","H3K4me1","H3K27me3"))
ggplot(plot.data,aes(x=Marker,y=V1,fill=Cell_type)) + 
  geom_hline(yintercept = seq(25000,150000,by=25000),linetype="dashed",color="grey60")+
  geom_bar(stat='identity',position='dodge')+
  xlab("") + ylab("Number of peaks") + 
  theme( panel.background = element_blank(),
         panel.border = element_blank(),
         axis.line = element_line(color="black"),
         axis.title = element_text(color="black",size=15),
         axis.text.y = element_text(color="black",size=15),
         axis.text.x = element_text(color="black",size=15,angle=60,hjust=1,vjust=1),
         legend.text = element_text(color="black",size=12),
         legend.position = "top"
  )+
  scale_fill_manual(name="",values = c("#c04f4e","#0063ae"),labels=c("EXC","INH")) +
  scale_y_continuous(expand=c(0,0))

