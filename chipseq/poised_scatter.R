computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ~/resources/hg38_tss.bed --referencePoint center \
--sortRegions keep -bs 20 -a 1000 -b 1000 -p max -out H3K4me3_TSS_1k.mat --missingDataAsZero --outFileNameMatrix H3K4me3_TSS_1k.rtxt

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ~/resources/hg38_tss.bed --referencePoint center \
--sortRegions keep -bs 20 -a 1000 -b 1000 -p max -out H3K27me3_TSS_1k.mat --missingDataAsZero --outFileNameMatrix H3K27me3_TSS_1k.rtxt
#######################################################
######
 library(RColorBrewer)

bed = read.table("hg38_tss.bed",sep="\t",stringsAsFactors=F)
k4 = read.table(pipe("grep -v '#' H3K4me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
k27 = read.table(pipe("grep -v '#' H3K27me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
rna = readRDS("NHM_vsd.rds")


ix = match(bed[,4],rownames(rna))
k4 = k4[!is.na(ix),]
k27 = k27[!is.na(ix),]
rna=rna[ix[!is.na(ix)],]
rbPal <- colorRampPalette(c('grey','blue','red'))

pdf("poised_scatter.pdf")
par(mfrow=c(2,2))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,10:12]),breaks = 200))]
plot(log2(rowSums(k4[,1:100])),log2(rowSums(k27[,1:100])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NHM")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,1:3]),breaks = 200))]
plot(log2(rowSums(k4[,101:200])),log2(rowSums(k27[,101:200])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,4:6]),breaks = 200))]
plot(log2(rowSums(k4[,201:300])),log2(rowSums(k27[,201:300])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="CDKN2A")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9]),breaks = 200))]
plot(log2(rowSums(k4[,301:400])),log2(rowSums(k27[,301:400])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF+CDKN2A")
dev.off()


par(mfrow=c(2,2))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,10:12]),breaks = 200))]
plot(log10(rowSums(k4[,1:100])),log10(rowSums(k27[,1:100])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NHM")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,1:3]),breaks = 200))]
plot(log10(rowSums(k4[,101:200])),log10(rowSums(k27[,101:200])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,4:6]),breaks = 200))]
plot(log10(rowSums(k4[,201:300])),log10(rowSums(k27[,201:300])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="CDKN2A")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9]),breaks = 200))]
plot(log10(rowSums(k4[,301:400])),log10(rowSums(k27[,301:400])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF+CDKN2A")