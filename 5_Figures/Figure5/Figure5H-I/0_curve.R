options(stringsAsFactors=F)
library(limma)
exp <- read.table("stimulate.pseudobulk.NN2018.averaged.subset.txt",row.names = 1,header=T,sep="\t")

exp_norm <- normalizeBetweenArrays(exp)
c2.genes <- read.table("EXC.genes",header=F)[,1]
c3.genes <- read.table("INH.genes",header=F)[,1]

c2 <- log(exp_norm[which(rownames(exp) %in% c2.genes),]+1,2)
c3 <- log(exp_norm[which(rownames(exp) %in% c3.genes),]+1,2)


# library(vioplot)
# vioplot(c2,las=2,ylim=c(0,2))
# boxplot(c2)

plot.EXC <- data.frame(mean=apply(c2,2,mean),median=apply(c2,2,median),
                       celltype="0",timepoint="0h"
                       )
plot.EXC$timepoint[grep("1h",rownames(plot.EXC))] <- "1h"
plot.EXC$timepoint[grep("4h",rownames(plot.EXC))] <- "4h"

plot.EXC$celltype[grep("ExcL23",rownames(plot.EXC))] <- "ExcL23"
plot.EXC$celltype[grep("ExcL4",rownames(plot.EXC))] <- "ExcL4"
plot.EXC$celltype[grep("ExcL5.1",rownames(plot.EXC))] <- "ExcL5.1"
plot.EXC$celltype[grep("ExcL5.2",rownames(plot.EXC))] <- "ExcL5.2"
plot.EXC$celltype[grep("ExcL5.3",rownames(plot.EXC))] <- "ExcL5.3"
plot.EXC$celltype[grep("ExcL6",rownames(plot.EXC))] <- "ExcL6"
plot.EXC$celltype[grep("Int.Cck",rownames(plot.EXC))] <- "Int.Cck"
plot.EXC$celltype[grep("Int.Npy",rownames(plot.EXC))] <- "Int.Npy"
plot.EXC$celltype[grep("Int.Pv",rownames(plot.EXC))] <- "Int.Pv"
plot.EXC$celltype[grep("Int.Sst.1",rownames(plot.EXC))] <- "Int.Sst.1"
plot.EXC$celltype[grep("Int.Sst.2",rownames(plot.EXC))] <- "Int.Sst.2"
plot.EXC$celltype[grep("Int.Vip",rownames(plot.EXC))] <- "Int.Vip"

plot.EXC$order <- 1
plot.EXC$order[grep("ExcL4|Int.Npy",rownames(plot.EXC))] <- 2
plot.EXC$order[grep("ExcL5.1|Int.Pv",rownames(plot.EXC))] <- 3
plot.EXC$order[grep("ExcL5.2|Int.Sst.1",rownames(plot.EXC))] <- 4
plot.EXC$order[grep("ExcL5.3|Int.Sst.2",rownames(plot.EXC))] <- 5
plot.EXC$order[grep("ExcL6|Int.Vip",rownames(plot.EXC))] <- 6
plot.EXC$maintype <- "EXC"
plot.EXC$maintype[grep("Int",rownames(plot.EXC))] <- "INH"


library(ggplot2)
p1 <- ggplot(plot.EXC,aes(x=timepoint,y=mean)) + geom_point(aes(color=maintype),size=2) + 
  geom_line(aes(color=maintype,group = maintype)) + xlab("") + ylab("Average expression ( log2(CPM+1) )")+
  facet_wrap(.~order,ncol=6)+
  theme(panel.background = element_blank(),
        panel.border = element_rect(fill=NA),
        panel.grid.major.y = element_line(color="grey80",linetype=2),
        axis.title = element_text(color="black",size=15),
        axis.text = element_text(color="black",size=15),
        strip.background = element_blank(),
        strip.text = element_blank(),
        plot.title = element_text(hjust = 0.5,color="black",size=15)
        ) + 
  scale_colour_manual(name="",values = c("#c04f4e","#0063ae"))+
  ggtitle("EXC-predominant")



plot.INH <- data.frame(mean=apply(c3,2,mean),median=apply(c3,2,median),
                       celltype="0",timepoint="0h"
)
plot.INH$timepoint[grep("1h",rownames(plot.INH))] <- "1h"
plot.INH$timepoint[grep("4h",rownames(plot.INH))] <- "4h"

plot.INH$celltype[grep("ExcL23",rownames(plot.INH))] <- "ExcL23"
plot.INH$celltype[grep("ExcL4",rownames(plot.INH))] <- "ExcL4"
plot.INH$celltype[grep("ExcL5.1",rownames(plot.INH))] <- "ExcL5.1"
plot.INH$celltype[grep("ExcL5.2",rownames(plot.INH))] <- "ExcL5.2"
plot.INH$celltype[grep("ExcL5.3",rownames(plot.INH))] <- "ExcL5.3"
plot.INH$celltype[grep("ExcL6",rownames(plot.INH))] <- "ExcL6"
plot.INH$celltype[grep("Int.Cck",rownames(plot.INH))] <- "Int.Cck"
plot.INH$celltype[grep("Int.Npy",rownames(plot.INH))] <- "Int.Npy"
plot.INH$celltype[grep("Int.Pv",rownames(plot.INH))] <- "Int.Pv"
plot.INH$celltype[grep("Int.Sst.1",rownames(plot.INH))] <- "Int.Sst.1"
plot.INH$celltype[grep("Int.Sst.2",rownames(plot.INH))] <- "Int.Sst.2"
plot.INH$celltype[grep("Int.Vip",rownames(plot.INH))] <- "Int.Vip"
plot.INH$celltype[grep("Int.Vip",rownames(plot.INH))] <- "Int.Vip"

plot.INH$order <- 1
plot.INH$order[grep("ExcL4|Int.Npy",rownames(plot.INH))] <- 2
plot.INH$order[grep("ExcL5.1|Int.Pv",rownames(plot.INH))] <- 3
plot.INH$order[grep("ExcL5.2|Int.Sst.1",rownames(plot.INH))] <- 4
plot.INH$order[grep("ExcL5.3|Int.Sst.2",rownames(plot.INH))] <- 5
plot.INH$order[grep("ExcL6|Int.Vip",rownames(plot.INH))] <- 6
plot.INH$maintype <- "EXC"
plot.INH$maintype[grep("Int",rownames(plot.INH))] <- "INH"


library(ggplot2)
p2 <- ggplot(plot.INH,aes(x=timepoint,y=mean)) + geom_point(aes(color=maintype),size=2) + 
  geom_line(aes(color=maintype,group = maintype)) + xlab("") + ylab("Average expression ( log2(CPM+1) )")+
  facet_wrap(.~order,ncol=6)+
  theme(panel.background = element_blank(),
        panel.border = element_rect(fill=NA),
        panel.grid.major.y = element_line(color="grey80",linetype=2),
        axis.title = element_text(color="black",size=15),
        axis.text = element_text(color="black",size=15),
        strip.background = element_blank(),
        strip.text = element_blank(),
        plot.title = element_text(hjust = 0.5,color="black",size=15)
  ) + 
  scale_colour_manual(name="",values = c("#c04f4e","#0063ae"))+
  ggtitle("INH-predominant")

cowplot::plot_grid(p1,p2,ncol=1)


