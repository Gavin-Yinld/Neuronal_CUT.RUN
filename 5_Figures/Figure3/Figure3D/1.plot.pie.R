options(stringsAsFactors = F)
library("ggplot2")
library("reshape2")
library('wesanderson')
library('ggsci')
dat <- read.table("Fraction.txt",sep="\t",header=T,row.names = 1)

plot.data <- melt(t(dat))
plot.data$Var2 <- factor(plot.data$Var2,levels = 1:8,labels=c("Strong active promoter","Active promoter","Active enhancer","Weak enhancer",
                                                              "Weak active domain","Repressed domain","Poised domain","Quiescent"))
mycols <- c("#D1468A","#F45D78","#F9F871","#FFD05A","#FFA75A","#00867D","#0082CB","white")

plot.EXC <- plot.data[which(plot.data$Var1=="EXC"),]
p1 <- ggplot(plot.EXC, aes(x = "", y = value, fill = Var2)) +
  geom_bar(width = 1, stat = "identity", color = "black") +
  coord_polar("y", start = 0)+
  scale_fill_manual(values = mycols) +
  theme_void() +
  theme(strip.text = element_text(size=20),
        legend.text =element_text(size=15),
        legend.title = element_blank())

plot.INH <- plot.data[which(plot.data$Var1=="INH"),]
p2 <- ggplot(plot.INH, aes(x = "", y = value, fill = Var2)) +
  geom_bar(width = 1, stat = "identity", color = "black") +
  coord_polar("y", start = 0)+
  scale_fill_manual(values = mycols) +
  theme_void() +
  theme(strip.text = element_text(size=20),
        legend.text =element_text(size=15),
        legend.title = element_blank())


cowplot::plot_grid(p1,p2)

