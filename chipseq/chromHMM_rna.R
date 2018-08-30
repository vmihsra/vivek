x = readRDS("NHM_vsd.rds")

bed = read.table("poised_kmeans_zmet.bed",sep="\t",stringsAsFactors=F)

genes = bed[,4]

integra = x[match(genes,rownames(x)),]

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

sig_vsd = integra[,c(10,11,12,1,2,3,4,5,6)]
sig_vsd = sig_vsd[complete.cases(sig_vsd),]
rownames(sig_vsd)=NULL

colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
svg("chromHMM_rna.svg")
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.65,dendrogram='none',     
Rowv=FALSE,
Colv=FALSE)
dev.off()