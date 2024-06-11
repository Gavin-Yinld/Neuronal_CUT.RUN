options(stringsAsFactors=F)
library(ggplot2)
library(reshape2)
library(pheatmap)
library(stringr)
####################################################################################################################################
###############gene feature
tpm <- read.table("all.sample.TPM.txt",sep='\t',header=T,row.names = 1)[,1:4]
colnames(tpm) <- c("EXC_1","EXC_2","INH_1","INH_2")


gene.list <- c("Fhl2","Cacng3","Anxa11","Herc6","Satb2","Prox1","Calb2","Kcnh2")
pattern <- paste(gene.list,collapse="|")

exp <- tpm[grep(pattern,rownames(tpm)),]
exp <- exp[1:8,]
exp2 <- exp
#exp2 <- log(exp2+1,2)
exp3 <- (exp2- rowMeans(exp2))/ unlist(apply(exp2,1,sd))
rownames(exp3) <- str_split(rownames(exp3),"___",simplify = T)[,2]
pheatmap(exp3)

plot.data <- melt(t(exp3))
plot.data$Var1 <- factor(plot.data$Var1,levels = rev(c("EXC_1","EXC_2","INH_1","INH_2")))
plot.data$Var2 <- factor(plot.data$Var2,levels=c("Cacng3","Fhl2","Herc6","Anxa11","Satb2","Prox1","Calb2","Kcnh2"))
ggplot(plot.data,aes(x=Var2,y=Var1,fill=value)) + geom_tile(color="black")+
  xlab("") + ylab("")+ 
  theme(panel.background = element_blank(),
        panel.border=element_rect(fill=NA),
        axis.title.x = element_blank(),
        axis.title.y = element_text(size=15,color='black'),
        axis.text.y = element_text(size=12,color='black'),
        axis.text.x = element_text(size=12,color='black'),
        axis.ticks = element_blank(),
        legend.position = "right",
        plot.title = element_text(hjust = 0.5)
  ) +
  scale_x_discrete(expand = c(0,0))+scale_y_discrete(expand = c(0,0))+
  scale_fill_gradientn(name="Z score",colours=c(rev(c("#C1DDFF","#4671D1")),"white","#FFA2AF","#970030"))





