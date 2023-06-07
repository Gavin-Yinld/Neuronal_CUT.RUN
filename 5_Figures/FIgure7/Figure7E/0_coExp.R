options(stringsAsFactors = FALSE);
# BiocManager::install("Mfuzz")
library(Mfuzz)
library(limma)
library(ggplot2)
library(reshape2)
library(stringr)
library(ggalt)
library(ggstatsplot)
library(tidyverse)

load("matrix.Rdata")
INH.genes <- read.table("INH.genes.unique",header=F)[,1]
colnames(EXC_mat) <- paste("EXC",colnames(EXC_mat),sep="_")
colnames(INH_mat) <- paste("INH",colnames(INH_mat),sep="_")
mat <- merge(EXC_mat,INH_mat,by=0)
rownames(mat) <- mat[,1]
mat <- mat[,-1]  
genes.exp <- mat[which(rownames(mat) %in% INH.genes),] 


genes.exp <- genes.exp[apply(genes.exp,1,sd)>0,]
df3Ex<- ExpressionSet(assayData = as.matrix(genes.exp))
df3F <- standardise(df3Ex)
set.seed(100)

m <- mestimate(df3F)
Dmin(df3F,m,crange=seq(4,40,1),repeats=3,visu=TRUE)


cl <- mfuzz(df3F,c=5,m=m)
mfuzz.plot2(df3F, cl=cl,mfrow=c(3,5),centre=TRUE,x11=F,centre.lwd=0.2)
save(cl,file="INH.cluster.result.Rdata")
#############################################################################
##########plot module

p <- list()

for(i in 1:max(cl$cluster))
{
  genes <- names(cl$cluster)[which(cl$cluster==i)]
  genes.exp2 <- genes.exp[genes,]
  plot.data <- melt(t(genes.exp2))
  plot.data2 <- data.frame(
    m = tapply(plot.data$value,plot.data$Var1,mean),
    sd = tapply(plot.data$value,plot.data$Var1,function(x){sd(x)/sqrt(length(x))})
  )
  
  temp <- str_split(row.names(plot.data2),"_",simplify=T)
  plot.data2$cell_type <- temp[,1]
  plot.data2$stage <- temp[,2] 
  plot.data2$ymax <- plot.data2$m + plot.data2$sd
  plot.data2$ymin <- plot.data2$m - plot.data2$sd
  plot.data2$ymin[which(plot.data2$ymin<0)] <- 0
  
  plot.data2$stage <- factor(plot.data2$stage,levels = c("E12","E13","E14","E15","E16","P1","P7","P21","P60"))
  p[[i]] <- ggplot(plot.data2,aes(x=stage,y=m,group=cell_type,color=cell_type)) +
    geom_ribbon(aes(x=stage,ymin=ymin,ymax=ymax,fill=cell_type),color=NA,alpha=0.2)+
    xlab("") + ylab("Expression level (CPM)") + 
    geom_xspline() + geom_point()+
    theme(
      panel.background = element_blank(),
      panel.border = element_rect(fill=NA),
      axis.title = element_text(size=15,color="black"),
      axis.text = element_text(size=12,color="black"),
      legend.position = "none",
      plot.title = element_text(hjust = 0.5)
    ) + 
    ggtitle(paste0("cluster ",i, " (n=",nrow(genes.exp2),")")) + 
    scale_y_continuous(expand = c(0,0),limit=c(0,max(plot.data2$ymax)+0.2)) + 
    scale_x_discrete(expand = c(0,0)) +
    scale_color_manual(name="",values = c("#c04f4e", "#0063ae")) +
    scale_fill_manual(name="",values = c("#c04f4e", "#0063ae"))
  
}
#pdf("INH.all.cluster.pdf",height=7,width=10)
cowplot::plot_grid(p[[1]],p[[2]],p[[3]],p[[4]],p[[5]])
#dev.off()

################################################
############# correlation with Egr1 expression

cor.egr1 <- c()
Egr1.exp <- INH_mat[grep("Egr1",rownames(INH_mat)),]
for(i in 1:max(cl$cluster))
{
  genes <- names(cl$cluster)[which(cl$cluster==i)]
  genes.exp2 <- genes.exp[genes,grep("INH",colnames(genes.exp))]
  genes.exp2 <- colMeans(genes.exp2)
  cor.egr1 <- c(cor.egr1,cor(t(Egr1.exp),as.numeric(genes.exp2)))
}

save(cor.egr1,file="INH.cluster.correlation.with.Egr1.Rdata")
#######################################################################
##############  cluster 1

genes <- names(cl$cluster)[which(cl$cluster %in% c(1))]
genes.exp2 <- genes.exp[genes,]
plot.data <- melt(t(genes.exp2))
plot.data2 <- data.frame(
  m = tapply(plot.data$value,plot.data$Var1,mean),
  sd = tapply(plot.data$value,plot.data$Var1,function(x){sd(x)/sqrt(length(x))})
)

temp <- str_split(row.names(plot.data2),"_",simplify=T)
plot.data2$cell_type <- temp[,1]
plot.data2$stage <- temp[,2] 
plot.data2$ymax <- plot.data2$m + plot.data2$sd
plot.data2$ymin <- plot.data2$m - plot.data2$sd
plot.data2$ymin[which(plot.data2$ymin<0)] <- 0

plot.data2$stage <- factor(plot.data2$stage,levels = c("E12","E13","E14","E15","E16","P1","P7","P21","P60"))
ggplot(plot.data2,aes(x=stage,y=m,group=cell_type,color=cell_type)) +
  geom_ribbon(aes(x=stage,ymin=ymin,ymax=ymax,fill=cell_type),color=NA,alpha=0.2)+
  xlab("") + ylab("Expression level (CPM)") + 
  geom_xspline() + geom_point()+
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.title = element_text(size=15,color="black"),
    axis.text = element_text(size=12,color="black"),
    legend.position = c(0.3,0.8),
    plot.title = element_text(hjust = 0.5)
  ) + 
  ggtitle(paste0("cluster ","1", " (n=",nrow(genes.exp2),")")) + 
  scale_color_manual(name="",values = c("#c04f4e", "#0063ae")) +
  scale_fill_manual(name="",values = c("#c04f4e", "#0063ae"))


write.table(genes,file="INH.module1.genes",quote=F,row.names=F,col.names=F)




