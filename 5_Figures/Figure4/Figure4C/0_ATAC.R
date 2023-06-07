options(stringsAsFactors = F)
EGR1.exc <- read.table("ex.sorted.bed",sep='\t',header=F)
EGR1.inh <- read.table("in.sorted.bed",sep='\t',header=F)

EGR1 <- merge(EGR1.exc,EGR1.inh,by=1)
colnames(EGR1) <- c("loci","EGR1.exc","EGR1.inh")

ATAC.exc <- read.table("EXC.rmdup.merge.sorted.bam",sep='\t',header=F)
ATAC.inh <- read.table("INH.rmdup.merge.sorted.bam",sep='\t',header=F)

ATAC <- merge(ATAC.exc,ATAC.inh,by=1)
colnames(ATAC) <- c("loci","ATAC.exc","ATAC.inh")  

dat <- merge(EGR1,ATAC,by="loci")
dat$EGR1.diff <- dat$EGR1.exc - dat$EGR1.inh
dat$ATAC.diff <- dat$ATAC.exc - dat$ATAC.inh 


plot(dat$EGR1.diff,dat$ATAC.diff)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
library(gtable)
library(grid)
R = cor(dat$EGR1.diff, dat$ATAC.diff)
p = cor.test(dat$EGR1.diff, dat$ATAC.diff)$p.value
Colormap <- rev(brewer.pal(11,'Spectral'))
d=densCols(dat$EGR1.diff, dat$ATAC.diff, colramp = colorRampPalette(Colormap))
ggplot(dat,aes(EGR1.diff,ATAC.diff)) + 
  xlab('EGR1 binding difference (EXC-INH)') + ylab('ATAC-seq signal (EXC-INH)')+
  geom_point(aes(EGR1.diff, ATAC.diff, col = d), size = 1.8)+  scale_color_identity() +
  geom_smooth(method="lm",se=F,colour="red",size=0.3,formula = y ~ x) +
  theme(panel.background=element_blank(),
        panel.border=element_rect(fill=NA),
        panel.grid.major=element_line(colour="grey85",linetype =2),
        axis.line=element_line(),
        axis.text=element_text(size=15,color='black'),
        axis.title=element_text(size=15,color='black')) +
  coord_cartesian(xlim = c(-300,300))




