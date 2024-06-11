options(stringsAsFactors = F)
load("EGR1.TFBS.state.Rdata")
library(ggplot2)
library(reshape2)

c1 <- data.frame(EXC = c1_EXC$state,INH=c1_INH$state)
plot.c1 <- melt(t(c1))
plot.c1$Var2 <- nrow(c1)-plot.c1$Var2 +1

p1 <- ggplot(plot.c1,aes(x=Var1,y=Var2)) + 
  geom_tile(aes(fill=value),color=NA) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(fill=NA,color="black"),
        axis.title = element_blank(),
        axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        legend.title = element_text(size=15,color="black"),
        legend.text = element_text(size=13,color="black")
        ) +
  scale_y_continuous(expand = c(0,0)) + scale_x_discrete(expand = c(0,0)) + 
  scale_fill_manual(name="Chromatin state",values = c("#D1468A","#F45D78","#F9F871","#FFD05A","#FFA75A","#00867D","#0082CB","white"),
                    labels=c("Strong active promoter","Active promoter","Active enhancer","Weak enhancer",
                             "Weak active domain","Repressed domain","Poised domain","Quiescent"
                             ))

c2 <- data.frame(EXC = c2_EXC$state,INH=c2_INH$state)
plot.c2 <- melt(t(c2))
plot.c2$Var2 <- nrow(c2)-plot.c2$Var2 +1

p2 <- ggplot(plot.c2,aes(x=Var1,y=Var2)) + 
  geom_tile(aes(fill=value),color=NA) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(fill=NA,color="black"),
        axis.title = element_blank(),
        axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        legend.title = element_text(size=15,color="black"),
        legend.text = element_text(size=13,color="black"),
  ) +
  scale_y_continuous(expand = c(0,0)) + scale_x_discrete(expand = c(0,0)) + 
  scale_fill_manual(name="Chromatin state",values = c("#D1468A","#F45D78","#F9F871","#FFD05A","#FFA75A","#00867D","#0082CB","white"),
                    labels=c("Strong active promoter","Active promoter","Active enhancer","Weak enhancer",
                             "Weak active domain","Repressed domain","Poised domain","Quiescent"
                    ))

c3 <- data.frame(EXC = c3_EXC$state,INH=c3_INH$state)
plot.c3 <- melt(t(c3))
plot.c3$Var2 <- nrow(c3)-plot.c3$Var2 +1

p3 <- ggplot(plot.c3,aes(x=Var1,y=Var2)) + 
  geom_tile(aes(fill=value),color=NA) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(fill=NA,color="black"),
        axis.title = element_blank(),
        axis.text.y = element_blank(),
        axis.text.x = element_text(size=15,color="black"),
        legend.title = element_text(size=15,color="black"),
        legend.text = element_text(size=13,color="black"),
  ) +
  scale_y_continuous(expand = c(0,0)) + scale_x_discrete(expand = c(0,0)) + 
  scale_fill_manual(name="Chromatin state",values = c("#D1468A","#F45D78","#F9F871","#FFD05A","#FFA75A","#00867D","#0082CB","white"),
                    labels=c("Strong active promoter","Active promoter","Active enhancer","Weak enhancer",
                             "Weak active domain","Repressed domain","Poised domain","Quiescent"
                    ))

cowplot::plot_grid(p1,p2,p3,nrow=3,rel_heights = c(0.68,0.24,0.07))



