################################################################################################################################
# Cleanup
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-01_S60_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-02_S46_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-03_S47_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-04_S56_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-05_S61_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-06_S48_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-07_S49_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-08_S57_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-09_S62_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-10_S50_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-11_S51_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-12_S58_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-13_S52_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-14_S63_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-15_S53_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-16_S54_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-17_S59_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-18_S55_R1_001.fastq.gz &
################################################################################################################################

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-01_S60_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix NHM_H3K4me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-02_S46_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix NHM_H3K9me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-03_S47_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix NHM_H3K27me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-04_S56_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix NHM_H3K27ac_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-05_S61_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A_H3K4me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-06_S48_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A_H3K9me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-07_S49_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A_H3K27me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-08_S57_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A_H3K27ac_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-09_S62_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix BRAF_H3K4me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-10_S50_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix BRAF_H3K9me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-11_S51_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix BRAF_H3K27me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-12_S58_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix BRAF_H3K27ac_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-13_S52_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix BRAF_input_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-14_S63_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A+BRAF_H3K4me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-15_S53_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A+BRAF_H3K9me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-16_S54_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A+BRAF_H3K27me3_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-17_S59_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A+BRAF_H3K27ac_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-18_S55_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix CDKN2A+BRAF_input_
################################################################################################################################
