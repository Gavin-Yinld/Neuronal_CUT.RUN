options(stringsAsFactors = F)
EGR1.exc <- read.table("ex.sorted.bed",sep='\t',header=F)
EGR1.inh <- read.table("in.sorted.bed",sep='\t',header=F)

EGR1 <- merge(EGR1.exc,EGR1.inh,by=1)
colnames(EGR1) <- c("loci","EGR1.exc","EGR1.inh")

Meth.exc <- read.table("inter_exc.cpg.ml.merge.10X.txt",sep='\t',header=F,skip=1)[,1:2]
Meth.inh <- read.table("inhibiroty.neuron.10X.cpg.ml",sep='\t',header=F,skip=1)[,1:2]

Meth <- merge(Meth.exc,Meth.inh,by=1)
colnames(Meth) <- c("loci","Meth.exc","Meth.inh")  

dat <- merge(EGR1,Meth,by="loci")
dat$EGR1.diff <- dat$EGR1.exc - dat$EGR1.inh
dat$Meth.diff <- (dat$Meth.exc - dat$Meth.inh)*100 


plot(dat$EGR1.diff,dat$Meth.diff)
plot(dat$EGR1.diff,dat$Meth.diff)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
library(gtable)
library(grid)
R = cor(dat$EGR1.diff, dat$Meth.diff)
p = cor.test(dat$EGR1.diff, dat$Meth.diff)$p.value
Colormap <- rev(brewer.pal(11,'Spectral'))
d=densCols(dat$EGR1.diff, dat$Meth.diff, colramp = colorRampPalette(Colormap))
ggplot(dat,aes(EGR1.diff,Meth.diff)) + 
  xlab('EGR1 binding difference (EXC-INH)') + ylab('Methylation level (EXC-INH, %)')+
  geom_point(aes(EGR1.diff, Meth.diff, col = d), size = 1.8)+  scale_color_identity() +
  geom_smooth(method="lm",se=F,colour="red",size=0.3,formula = y ~ x) +
  theme(panel.background=element_blank(),
        panel.border=element_rect(fill=NA),
        panel.grid.major=element_line(colour="grey85",linetype =2),
        axis.line=element_line(),
        axis.text=element_text(size=15,color='black'),
        axis.title=element_text(size=15,color='black')) +
  coord_cartesian(xlim=c(-300,300),ylim = c(-100,100)) 

