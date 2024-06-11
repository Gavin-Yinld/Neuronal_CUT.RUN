options(stringsAsFactors = F)
EGR1.exc <- read.table("ex.sorted.bed",sep='\t',header=F)
EGR1.inh <- read.table("in.sorted.bed",sep='\t',header=F)

EGR1 <- merge(EGR1.exc,EGR1.inh,by=1)
colnames(EGR1) <- c("loci","EGR1.exc","EGR1.inh")

Histone.exc <- read.table("H3K4me3-ex.sorted.bed",sep='\t',header=F)
Histone.inh <- read.table("H3K4me3-in.sorted.bed",sep='\t',header=F)

Histone <- merge(Histone.exc,Histone.inh,by=1)
colnames(Histone) <- c("loci","Histone.exc","Histone.inh")  

dat <- merge(EGR1,Histone,by="loci")
dat$EGR1.diff <- dat$EGR1.exc - dat$EGR1.inh
dat$Histone.diff <- dat$Histone.exc - dat$Histone.inh 


plot(dat$EGR1.diff,dat$Histone.diff)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
library(gtable)
library(grid)
R = cor(dat$EGR1.diff, dat$Histone.diff)
p = cor.test(dat$EGR1.diff, dat$Histone.diff)$p.value
Colormap <- rev(brewer.pal(11,'Spectral'))
d=densCols(dat$EGR1.diff, dat$Histone.diff, colramp = colorRampPalette(Colormap))
ggplot(dat,aes(EGR1.diff,Histone.diff)) + 
  xlab('EGR1 binding difference (EXC-INH)') + ylab('Histone modification (EXC-INH)')+
  geom_point(aes(EGR1.diff, Histone.diff, col = d), size = 1.8)+  scale_color_identity() +
  geom_smooth(method="lm",se=F,colour="red",size=0.3,formula = y ~ x) +
  theme(panel.background=element_blank(),
        panel.border=element_rect(fill=NA),
        panel.grid.major=element_line(colour="grey85",linetype =2),
        axis.line=element_line(),
        axis.text=element_text(size=15,color='black'),
        axis.title=element_text(size=15,color='black')) +
  coord_cartesian(xlim=c(-300,300),ylim = c(-300,200)) 


