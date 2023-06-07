options(stringsAsFactors = F)
library("ggplot2")
library("reshape2")
library('wesanderson')
library('ggsci')


plot.EXC <- read.table("ex_34_idr",sep=" ",header=F)
plot.EXC$V1 <- factor(plot.EXC$V1,levels = c("Promoter","UTR5","Exon","Intron","UTR3","Intergenic"),
                      labels = c("Promoter","5'UTR","Exon","Intron","3'UTR","Intergenic"))
mycols <- c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF",wes_palette("Darjeeling1")[c(2,4)])
p1 <- ggplot(plot.EXC, aes(x = "", y = V2, fill = V1)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  scale_fill_manual(values = mycols) +
  theme_void() +
  theme(strip.text = element_text(size=20),
        legend.text =element_text(size=15),
        legend.title = element_blank())

plot.INH <- read.table("in_34_idr",sep=" ",header=F)
plot.INH$V1 <- factor(plot.INH$V1,levels = c("Promoter","UTR5","Exon","Intron","UTR3","Intergenic"),
                      labels = c("Promoter","5'UTR","Exon","Intron","3'UTR","Intergenic"))
mycols <- c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF",wes_palette("Darjeeling1")[c(2,4)])
p2 <- ggplot(plot.INH, aes(x = "", y = V2, fill = V1)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  scale_fill_manual(values = mycols) +
  theme_void() +
  theme(strip.text = element_text(size=20),
        legend.text =element_text(size=15),
        legend.title = element_blank())


cowplot::plot_grid(p1,p2)

