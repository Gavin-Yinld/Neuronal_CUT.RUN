options(stringsAsFactors = F)
load("GSE102827neuron.activity.scRNAseq.Rdata")
data <- read.csv("GSE102827_merged_all_raw.csv/GSE102827_merged_all_raw.csv",row.names=1)
data <- data[,which(colnames(data)%in%rownames(info))]
colnames(data) <- gsub("_",".",colnames(data))
rownames(info) <- gsub("_",".",rownames(info))
info$celltype <- gsub("_",".",info$celltype)
index <- rownames(info)[which(info$maintype %in% c("Excitatory","Interneurons"))]
info <- info[index,]
data <- data[,which(colnames(data)%in%index)]
index <- rownames(info)[which(info$celltype %in% c("Hip","RSP","Sub"))]
info <- info[-which(info$celltype %in% c("Hip","RSP","Sub")),]
data <- data[,-which(colnames(data)%in%index)]
for(i in 1:ncol(data))
{
  print(i)
  index <- which(rownames(info)==colnames(data)[i])
  type <- info[index,"celltype"]
  colnames(data)[i] <- paste(type,colnames(data)[i],sep='_')
  rownames(info)[index] <- paste(type,rownames(info)[index],sep='_')
}



library(dplyr)
library(Seurat)

# Initialize the Seurat object with the raw (non-normalized data).
brain <- CreateSeuratObject(counts = data, project = "brain3k", min.cells = 3, min.features = 200)
brain
#rownames(dataSC)[grep("Mt",rownames(dataSC))]

brain[["percent.mt"]] <- PercentageFeatureSet(brain, pattern = "Mt")

VlnPlot(brain, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(brain, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(brain, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
CombinePlots(plots = list(plot1, plot2))
brain <- subset(brain, subset = nFeature_RNA > 200 & percent.mt < 10)
brain <- NormalizeData(brain, normalization.method = "LogNormalize", scale.factor = 10000)
brain <- FindVariableFeatures(brain, selection.method = "vst", nfeatures = 2000)

top10 <- head(VariableFeatures(brain), 10)

# plot variable features with and without labels
plot1 <- VariableFeaturePlot(brain)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
CombinePlots(plots = list(plot1, plot2))
all.genes <- rownames(brain)
brain <- ScaleData(brain, features = all.genes)
brain <- RunPCA(brain, features = VariableFeatures(object = brain))

ElbowPlot(brain)
# brain <- RunUMAP(brain, dims = 1:20)
brain <- RunTSNE(pbmc, dims = 1:10)
Stimulation <- info$stim

brain@meta.data$Stimulation <- factor(Stimulation)
DimPlot(brain, reduction = "umap",pt.size=0.05,label=F,
        cols=c("#823164","#f3757b","#5c4da0","#8b82b5","#0f8c41","#744d1f","#0c6190","#707831",
                                        "#6acee8","#d81670","#f79d1e","red"))
DimPlot(brain[,colnames(brain)[which(brain$Stimulation=="0h")]], reduction = "umap",pt.size=0.05,label=F,
        cols=c("#823164","#f3757b","#5c4da0","#8b82b5","#0f8c41","#744d1f","#0c6190","#707831",
               "#6acee8","#d81670","#f79d1e","red"))
DimPlot(brain[,colnames(brain)[which(brain$Stimulation=="1h")]], reduction = "umap",pt.size=0.05,label=F,
        cols=c("#823164","#f3757b","#5c4da0","#8b82b5","#0f8c41","#744d1f","#0c6190","#707831",
               "#6acee8","#d81670","#f79d1e","red"))
DimPlot(brain[,colnames(brain)[which(brain$Stimulation=="4h")]], reduction = "umap",pt.size=0.05,label=F,
        cols=c("#823164","#f3757b","#5c4da0","#8b82b5","#0f8c41","#744d1f","#0c6190","#707831",
               "#6acee8","#d81670","#f79d1e","red"))


vilon <- paste(info$celltype,info$stim)

brain@meta.data$vilon <- factor(vilon)
p1 <- FeaturePlot(brain, features =  c("Egr1"),pt.size=0.01,ncol=1)
p2 <- VlnPlot(brain, features = c("Egr1"),pt.size=0,split.by = "Stimulation" ,ncol=1,
        cols=c("#879cc7","#df85b6","#a2cd4b"))
cowplot::plot_grid(p1,p2,ncol=2,rel_widths = c(0.35,0.65))
################################################################
save(brain,info,file="scRNAseq.neurons.seurat.Rdata")

brain$index <- paste(info$maintype,info$stim,sep="_")

ave.exp.map <- as.data.frame(AverageExpression(brain,group.by = "index"))
aggrated.exp.map <- as.data.frame(AggregateExpression(brain,group.by = "index"))

write.table(ave.exp.map,file="stimulate.pseudobulk.NN2018.averaged.txt",sep="\t",quote=F)
write.table(aggrated.exp.map,file="stimulate.pseudobulk.NN2018.aggregated.txt",sep="\t",quote=F)
##############################################################
######## subset
brain$index2 <- paste(info$celltype,info$stim,sep="_")

ave.exp.map <- as.data.frame(AverageExpression(brain,group.by = "index2"))
# aggrated.exp.map <- as.data.frame(AggregateExpression(brain,group.by = "index2"))

write.table(ave.exp.map,file="stimulate.pseudobulk.NN2018.averaged.subset.txt",sep="\t",quote=F)
# write.table(aggrated.exp.map,file="stimulate.pseudobulk.NN2018.aggregated.subset.txt",sep="\t",quote=F)



