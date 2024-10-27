options(stringsAsFactors=F)
library(Signac)
library(Seurat)
library(GenomeInfoDb)
library(EnsDb.Mmusculus.v79)
library(ggplot2)
library(patchwork)
library(data.table)
library(stringr)
set.seed(1234)
load("data.peaks.counts.Rdata")
EXC_barcode <- read.table("EXC_barcode.txt")[,1]
INH_barcode <- read.table("INH_barcode.txt")[,1]


colnames(data)[which(colnames(data)%in%EXC_barcode)] <- paste0("EXC_",colnames(data)[which(colnames(data)%in%EXC_barcode)])
colnames(data)[which(colnames(data)%in%INH_barcode)] <- paste0("INH_",colnames(data)[which(colnames(data)%in%INH_barcode)])
data <- data[which(rowSums(data)>0),]
rownames(data) <- gsub("chr","",rownames(data))
counts <- data


brain_assay <- CreateChromatinAssay(
  counts = counts,
  sep = c(":", "-"),
  genome = "mm10",
  fragments = 'data_fragment.tsv.gz',
  validate.fragments=T,
  min.cells = 1
)


brain <- CreateSeuratObject(
  counts = brain_assay,
  assay = 'peaks',
  project = 'ATAC'
)




brain <- RunTFIDF(brain)
brain <- FindTopFeatures(brain, min.cutoff = 'q5')
brain <- RunSVD(object = brain)

brain <- RunUMAP(
  object = brain,
  reduction = 'lsi',
  dims = 2:30
)



DimPlot(object = brain, label = F,dims = c(1, 2),cols = c("#c04f4e", "#0063ae"),) 


