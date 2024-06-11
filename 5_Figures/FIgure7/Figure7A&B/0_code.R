options(stringsAsFactors=F)
library(dplyr)
library(Seurat)
library(patchwork)

#################################################################################################################
load("E12.neurons.Rdata")
colnames(E12) <- gsub("_","",colnames(E12) )
colnames(E12) <- gsub(":","",colnames(E12) )
EXC <- c()
INH <- c()
for(i in 1:ncol(E12))
{
  print(i)
  if(E12["Neurod6",i]>0 & E12["Gad2",i]==0)
  {
    EXC <- c(EXC,i)
  } 
  if (E12["Neurod6",i]==0 & E12["Gad2",i]>0)
  {
    INH <- c(INH,i)
  }
}
colnames(E12)[EXC] <- paste("EXC",colnames(E12)[EXC],sep='_')
colnames(E12)[INH] <- paste("INH",colnames(E12)[INH],sep='_')
E12 <- E12[,grep("EXC|INH",colnames(E12))]

E12_norm <- CreateSeuratObject(counts = E12, project = "E12_norm3k", min.cells = 3, min.features = 200)
E12_norm[["percent.mt"]] <- PercentageFeatureSet(E12_norm, pattern = "^MT-")
E12_norm <- NormalizeData(E12_norm)

#################################################################################################################
load("E13.neurons.Rdata")
colnames(E13) <- gsub("_","",colnames(E13) )
colnames(E13) <- gsub(":","",colnames(E13) )
EXC <- c()
INH <- c()
for(i in 1:ncol(E13))
{
  print(i)
  if(E13["Neurod6",i]>0 & E13["Gad2",i]==0)
  {
    EXC <- c(EXC,i)
  } 
  if (E13["Neurod6",i]==0 & E13["Gad2",i]>0)
  {
    INH <- c(INH,i)
  }
}
colnames(E13)[EXC] <- paste("EXC",colnames(E13)[EXC],sep='_')
colnames(E13)[INH] <- paste("INH",colnames(E13)[INH],sep='_')
E13 <- E13[,grep("EXC|INH",colnames(E13))]

E13_norm <- CreateSeuratObject(counts = E13, project = "E13_norm3k", min.cells = 3, min.features = 200)
E13_norm[["percent.mt"]] <- PercentageFeatureSet(E13_norm, pattern = "^MT-")
E13_norm <- NormalizeData(E13_norm)

#################################################################################################################
load("E14.neurons.Rdata")
colnames(E14) <- gsub("_","",colnames(E14) )
colnames(E14) <- gsub(":","",colnames(E14) )
EXC <- c()
INH <- c()
for(i in 1:ncol(E14))
{
  print(i)
  if(E14["Neurod6",i]>0 & E14["Gad2",i]==0)
  {
    EXC <- c(EXC,i)
  } 
  if (E14["Neurod6",i]==0 & E14["Gad2",i]>0)
  {
    INH <- c(INH,i)
  }
}
colnames(E14)[EXC] <- paste("EXC",colnames(E14)[EXC],sep='_')
colnames(E14)[INH] <- paste("INH",colnames(E14)[INH],sep='_')
E14 <- E14[,grep("EXC|INH",colnames(E14))]

E14_norm <- CreateSeuratObject(counts = E14, project = "E14_norm3k", min.cells = 3, min.features = 200)
E14_norm[["percent.mt"]] <- PercentageFeatureSet(E14_norm, pattern = "^MT-")
E14_norm <- NormalizeData(E14_norm)

#################################################################################################################
load("E15.neurons.Rdata")
colnames(E15) <- gsub("_","",colnames(E15) )
colnames(E15) <- gsub(":","",colnames(E15) )
EXC <- c()
INH <- c()
for(i in 1:ncol(E15))
{
  print(i)
  if(E15["Neurod6",i]>0 & E15["Gad2",i]==0)
  {
    EXC <- c(EXC,i)
  } 
  if (E15["Neurod6",i]==0 & E15["Gad2",i]>0)
  {
    INH <- c(INH,i)
  }
}
colnames(E15)[EXC] <- paste("EXC",colnames(E15)[EXC],sep='_')
colnames(E15)[INH] <- paste("INH",colnames(E15)[INH],sep='_')
E15 <- E15[,grep("EXC|INH",colnames(E15))]

E15_norm <- CreateSeuratObject(counts = E15, project = "E15_norm3k", min.cells = 3, min.features = 200)
E15_norm[["percent.mt"]] <- PercentageFeatureSet(E15_norm, pattern = "^MT-")
E15_norm <- NormalizeData(E15_norm)
########################################################################################################
load("E16.neurons.Rdata")
colnames(E16) <- gsub("_","",colnames(E16) )
colnames(E16) <- gsub(":","",colnames(E16) )
EXC <- c()
INH <- c()
for(i in 1:ncol(E16))
{
  print(i)
  if(E16["Neurod6",i]>0 & E16["Gad2",i]==0)
  {
    EXC <- c(EXC,i)
  } 
  if (E16["Neurod6",i]==0 & E16["Gad2",i]>0)
  {
    INH <- c(INH,i)
  }
}
colnames(E16)[EXC] <- paste("EXC",colnames(E16)[EXC],sep='_')
colnames(E16)[INH] <- paste("INH",colnames(E16)[INH],sep='_')
E16 <- E16[,grep("EXC|INH",colnames(E16))]

E16_norm <- CreateSeuratObject(counts = E16, project = "E16_norm3k", min.cells = 3, min.features = 200)
E16_norm[["percent.mt"]] <- PercentageFeatureSet(E16_norm, pattern = "^MT-")
E16_norm <- NormalizeData(E16_norm)

#######################################################################################################
load("P1.neurons.Rdata")
P1_norm <- CreateSeuratObject(counts = P1, project = "P13k", min.cells = 3, min.features = 200)
P1_norm[["percent.mt"]] <- PercentageFeatureSet(P1_norm, pattern = "^MT-")
P1_norm <- NormalizeData(P1_norm)

#######################################################################################################
load("P7.neurons.Rdata")
P7_norm <- CreateSeuratObject(counts = P7, project = "P73k", min.cells = 3, min.features = 200)
P7_norm[["percent.mt"]] <- PercentageFeatureSet(P7_norm, pattern = "^MT-")
P7_norm <- NormalizeData(P7_norm)

#######################################################################################################
load("P21.neuron.Rdata")
P21_norm <- CreateSeuratObject(counts = P21, project = "P213k", min.cells = 3, min.features = 200)
P21_norm[["percent.mt"]] <- PercentageFeatureSet(P21_norm, pattern = "^MT-")
P21_norm <- NormalizeData(P21_norm)

#######################################################################################################
load("P60.neuron.Rdata")
P60_norm <- CreateSeuratObject(counts = P60, project = "P603k", min.cells = 3, min.features = 200)
P60_norm[["percent.mt"]] <- PercentageFeatureSet(P60_norm, pattern = "^MT-")
P60_norm <- NormalizeData(P60_norm)

##############################################################

ifnb.list <- list(E12_norm,E13_norm,E14_norm,E15_norm,E16_norm,P1_norm,P7_norm,P21_norm,P60_norm)
features <- SelectIntegrationFeatures(object.list = ifnb.list)
immune.anchors <- FindIntegrationAnchors(object.list = ifnb.list, anchor.features = features)
save(immune.anchors,file="immune.anchors.Rdata")
immune.combined <- IntegrateData(anchorset = immune.anchors)

DefaultAssay(immune.combined) <- "integrated"

# Run the standard workflow for visualization and clustering
immune.combined <- ScaleData(immune.combined, verbose = FALSE)
immune.combined <- RunPCA(immune.combined, npcs = 30, verbose = FALSE)
immune.combined <- RunUMAP(immune.combined, reduction = "pca", dims = 1:30)
immune.combined <- FindNeighbors(immune.combined, reduction = "pca", dims = 1:30)
immune.combined <- FindClusters(immune.combined, resolution = 0.5)

DimPlot(immune.combined, reduction = "umap",group.by="orig.ident",cols = c("#c04f4e", "#0063ae"))

library(stringr)
test <- str_split(immune.combined@assays$RNA@counts@Dimnames[[2]],"_",simplify=T)
immune.combined@meta.data$stage <- test[,3]
immune.combined@meta.data$identity2 <- paste(immune.combined@meta.data$orig.ident,test[,3],sep="_")

DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("#9e0142","#f46d43","#fdae61","#fee08b","#ffffbf","#abdda4","#66c2a5","#3288bd","#5e4fa2")
		)


save(immune.anchors,immune.combined,file="combined.Rdata")

pdf("test.pdf")
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("#5e4fa2","grey","grey","grey","grey","grey","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","#5e4fa2","grey","grey","grey","grey","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","#5e4fa2","grey","grey","grey","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","#5e4fa2","grey","grey","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","grey","#5e4fa2","grey","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","grey","grey","#5e4fa2","grey","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","grey","grey","grey","#5e4fa2","grey","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","grey","grey","grey","grey","#5e4fa2","grey")
		)
DimPlot(immune.combined, reduction = "umap",group.by="stage",
		cols = c("grey","grey","grey","grey","grey","grey","grey","grey","#5e4fa2")
		)
dev.off()







































