library(ComplexHeatmap)
library(circlize)
data <- read.csv("pairwise.cor2.csv",header=T,row.names=1)
colnames(data) <- gsub("\\.","-",rownames(data))

#Heatmap(data)
f1 = colorRamp2(c(-0.2, 0, 1), c("blue", "white", "red"))
f2 = colorRamp2(c(0, 5, 10), c("blue", "white", "red"))
f3 =colorRampPalette(c("#342988", "white", "#FFA39A","firebrick3","#7F0000"))(50)
ha = rowAnnotation(
  cell_type=rep(c("EXC","EXC","INH","INH"),4),
  Assay = c(rep("H3K27ac",4),rep("H3K27me3",4),rep("H3K4me1",4),rep("H3K4me3",4)),
  Replicate = rep(c("rep1","rep2"),8),
  col = list(Assay =c("H3K27ac"="#df536b","H3K4me1"="#61d04f","H3K4me3"="#cd2fbc","H3K27me3"="#29e2e5"),
             Replicate = c("rep1" = "#7EB0E1","rep2" = "#D6F4FF"),
             cell_type = c("EXC" = "#ff3737","INH" = "#0099cc")
             )
  )


Heatmap(data, rect_gp = gpar(type = "none"),col=f3,
        left_annotation = ha,
        cell_fun = function(j, i, x, y, w, h, fill) {
          if(as.numeric(x) <=1 - as.numeric(y)) {
            grid.rect(x, y, w, h, gp = gpar(fill = fill, col = fill))
          }
        })



