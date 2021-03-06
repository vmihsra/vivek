cut -f 1-6 /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.broadPeak > /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.bed

python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.bed \
-g HG38 \
-o /root/vivek/chip-seq/ROSE/NHM &> NHM.log
# NOTES WORST PROGRAM EVER, RUN INSIDE THE DIRECTORY WITH THE SCRIPTS...
################################################################################
cut -f 1-6 /root/vivek/chip-seq/macs2/BRAF_H3K27ac_peaks.broadPeak > /root/vivek/chip-seq/macs2/BRAF_H3K27ac_peaks.bed

python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/BRAF_H3K27ac_peaks.bed \
-g HG38 \
-o /root/vivek/chip-seq/ROSE/BRAF &> BRAF.log
################################################################################
cut -f 1-6 /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.broadPeak > /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.bed

python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.bed \
-g HG38 \
-o /root/vivek/chip-seq/ROSE/CDKN2A+BRAF &> CDKN2A+BRAF.log
##############################################################
cat * | sort -k1,1 -k2,2n|bedtools merge -i -|grep -v "_" > superEnhancer_merged.bed

computeMatrix scale-regions \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed \
--sortRegions descend -bs 10 -a 0 -b 0 -p max -out superEnhancer_merged_10bd.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m superEnhancer_merged_10bd.mat --kmeans 3 \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out superEnhancer_merged_10bd.pdf --outFileSortedRegions superEnhancer_merged_10bd_kmeans.bed

###
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed \
--sortRegions descend -bs 1000 -a 100000 -b 100000 -p max -out superEnhancer_merged_200k.mat --referencePoint center


plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m superEnhancer_merged_200k.mat --kmeans 10 \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out superEnhancer_merged_200k.pdf --outFileSortedRegions superEnhancer_merged_200k.bed
##############################################################

cat braf_specific_se.bed > R_diffSE.bed
echo "#BRAF-specific" >> R_diffSE.bed
cat cb_specific_se.bed >> R_diffSE.bed
echo "#CDKN2A+BRAF-specific" >> R_diffSE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R R_diffSE.bed \
--sortRegions descend -bs 1000 -a 100000 -b 100000 -p max -out R_diffSE.mat --referencePoint center


plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m R_diffSE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out R_diffSE.pdf 
