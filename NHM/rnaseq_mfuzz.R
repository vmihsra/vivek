
countData=readRDS("NHM_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

require(Biobase)
library(Mfuzz)
library(ggplot2)
options(bitmapType="cairo")

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)


############################################################################################################################################
sig_vsd = data.frame(NHM=rowMeans(vsd[which(dLRT_res$padj<0.00001),10:12]),BRAF=rowMeans(vsd[which(dLRT_res$padj<0.00001),1:3]),
                     CDKN2A=rowMeans(vsd[which(dLRT_res$padj<0.00001),7:9]),B_C=rowMeans(vsd[which(dLRT_res$padj<0.00001),4:6]))

wt<-new("ExpressionSet", exprs=as.matrix(sig_vsd))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=9,m=mestimate(wt.s))
pdf('RNASEQ_mfuzz_FDR1e-5.pdf')
mfuzz.plot(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("NHM","BRAF","CDKN2A","B+C"))
dev.off()
table(cl_wt$cluster)

############################################################################################################################################
sig_vsd = data.frame(NHM=rowMeans(vsd[which(dLRT_res$padj<0.05),10:12]),BRAF=rowMeans(vsd[which(dLRT_res$padj<0.05),1:3]),
                     CDKN2A=rowMeans(vsd[which(dLRT_res$padj<0.05),7:9]),B_C=rowMeans(vsd[which(dLRT_res$padj<0.05),4:6]))

wt<-new("ExpressionSet", exprs=as.matrix(sig_vsd))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=9,m=mestimate(wt.s))
pdf('RNASEQ_mfuzz_FDR5.pdf')
mfuzz.plot(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("NHM","BRAF","CDKN2A","B+C"))
dev.off()
table(cl_wt$cluster)


write.table(names(cl_wt$cluster[cl_wt$cluster==1]) ,"ct_1_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==2]) ,"ct_2_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==3]) ,"ct_3_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==4]) ,"ct_4_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==5]) ,"ct_5_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==6]) ,"ct_6_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==7]) ,"ct_7_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==8]) ,"ct_8_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==9]) ,"ct_9_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")

########################################################
# no CDKN2A
countData=readRDS("NHM_counts.rds")
countData = countData[,c(10:12,1:6)]
design<-data.frame(group=c("NHM","NHM","NHM","BRAF","BRAF","BRAF","B_C","B_C","B_C") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

sig_vsd = data.frame(NHM=rowMeans(vsd[which(dLRT_res$padj<0.00001),1:3]),BRAF=rowMeans(vsd[which(dLRT_res$padj<0.00001),4:6]),
                     B_C=rowMeans(vsd[which(dLRT_res$padj<0.00001),7:9]))

wt<-new("ExpressionSet", exprs=as.matrix(sig_vsd))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=5,m=mestimate(wt.s))
saveRDS(cl_wt,"cl_wt_NHM_VE_VEKO_RNASEQ_mfuzz_FDR1e.rds")
pdf('NHM_VE_VEKO_RNASEQ_mfuzz_FDR1e-5.pdf')
mfuzz.plot(wt.s,cl=cl_wt,mfrow=c(3,2),new.window=F,time.labels=c("NHM","VE","VE+KO"))
dev.off()
table(cl_wt$cluster)

write.table(names(cl_wt$cluster[cl_wt$cluster==1]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_1_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==2]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_2_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==3]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_3_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==4]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_4_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==5]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_5_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==6]) ,"NHM_VE_VEKO_RNASEQ_mfuzz_ct_6_rnaseq.txt",quote=F,col.names=F,row.names=F,sep="\t")
