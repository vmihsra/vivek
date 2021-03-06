# Unzip all files
unzip "*.zip"

ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R1_001.fastq.gz $1_L002_R1_001.fastq.gz \> .fastq.gz\n/g'
# 
ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R2_001.fastq.gz $1_L002_R2_001.fastq.gz \> .fastq.gz\n/g'
# 

cat DLP-02_S1_L001_R1_001.fastq.gz DLP-02_S1_L002_R1_001.fastq.gz > VM36_R1.fastq.gz
cat DLP-03_S2_L001_R1_001.fastq.gz DLP-03_S2_L002_R1_001.fastq.gz > VM35_R1.fastq.gz
cat DLP-06_S3_L001_R1_001.fastq.gz DLP-06_S3_L002_R1_001.fastq.gz > VM37_R1.fastq.gz
cat DLP-08_S6_L001_R1_001.fastq.gz DLP-08_S6_L002_R1_001.fastq.gz > VM42_R1.fastq.gz
cat DLP-09_S7_L001_R1_001.fastq.gz DLP-09_S7_L002_R1_001.fastq.gz > VM41_R1.fastq.gz
cat DLP-19_S4_L001_R1_001.fastq.gz DLP-19_S4_L002_R1_001.fastq.gz > VM6_R1.fastq.gz
cat DLP-72_S8_L001_R1_001.fastq.gz DLP-72_S8_L002_R1_001.fastq.gz > NORMAL_VM45_VM46_R1.fastq.gz
cat DLP-75_S10_L001_R1_001.fastq.gz DLP-75_S10_L002_R1_001.fastq.gz > VM16_R1.fastq.gz
cat DLP-79_S11_L001_R1_001.fastq.gz DLP-79_S11_L002_R1_001.fastq.gz > VM48_R1.fastq.gz
cat DLP-85_S5_L001_R1_001.fastq.gz DLP-85_S5_L002_R1_001.fastq.gz > VM5_R1.fastq.gz
cat DLP-86_S9_L001_R1_001.fastq.gz DLP-86_S9_L002_R1_001.fastq.gz > VM46_R1.fastq.gz
cat DLP-94_S12_L001_R1_001.fastq.gz DLP-94_S12_L002_R1_001.fastq.gz > VM1000_R1.fastq.gz
cat DLP-95_S13_L001_R1_001.fastq.gz DLP-95_S13_L002_R1_001.fastq.gz > NORMAL_VM999_VM1000_R1.fastq.gz


cat DLP-02_S1_L001_R2_001.fastq.gz DLP-02_S1_L002_R2_001.fastq.gz > VM36_R2.fastq.gz
cat DLP-03_S2_L001_R2_001.fastq.gz DLP-03_S2_L002_R2_001.fastq.gz > VM35_R2.fastq.gz
cat DLP-06_S3_L001_R2_001.fastq.gz DLP-06_S3_L002_R2_001.fastq.gz > VM37_R2.fastq.gz
cat DLP-08_S6_L001_R2_001.fastq.gz DLP-08_S6_L002_R2_001.fastq.gz > VM42_R2.fastq.gz
cat DLP-09_S7_L001_R2_001.fastq.gz DLP-09_S7_L002_R2_001.fastq.gz > VM41_R2.fastq.gz
cat DLP-19_S4_L001_R2_001.fastq.gz DLP-19_S4_L002_R2_001.fastq.gz > VM6_R2.fastq.gz
cat DLP-72_S8_L001_R2_001.fastq.gz DLP-72_S8_L002_R2_001.fastq.gz > NORMAL_VM45_VM46_R2.fastq.gz
cat DLP-75_S10_L001_R2_001.fastq.gz DLP-75_S10_L002_R2_001.fastq.gz > VM16_R2.fastq.gz
cat DLP-79_S11_L001_R2_001.fastq.gz DLP-79_S11_L002_R2_001.fastq.gz > VM48_R2.fastq.gz
cat DLP-85_S5_L001_R2_001.fastq.gz DLP-85_S5_L002_R2_001.fastq.gz >  VM5_R2.fastq.gz
cat DLP-86_S9_L001_R2_001.fastq.gz DLP-86_S9_L002_R2_001.fastq.gz > VM46_R2.fastq.gz
cat DLP-94_S12_L001_R2_001.fastq.gz DLP-94_S12_L002_R2_001.fastq.gz > VM1000_R2.fastq.gz
cat DLP-95_S13_L001_R2_001.fastq.gz DLP-95_S13_L002_R2_001.fastq.gz > NORMAL_VM999_VM1000_R2.fastq.gz
###
#


/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/NORMAL_VM45_VM46_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/NORMAL_VM45_VM46_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/NORMAL_VM999_VM1000_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/NORMAL_VM999_VM1000_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM1000_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM1000_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM16_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM16_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM35_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM35_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM36_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM36_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM37_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM37_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM41_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM41_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM42_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM42_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM46_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM46_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM48_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM48_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM5_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM5_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes3/fastq_trimmed \
/home/rtm/vivek/navi/wes3/fastq/VM6_R1.fastq.gz \
/home/rtm/vivek/navi/wes3/fastq/VM6_R2.fastq.gz &

############################################################################################################################
# Mapping

for fastqfile in /home/rtm/vivek/navi/wes3/fastq_trimmed/*R1*.fq.gz ;
do echo $fastqfile; 
fastq2=$(echo $fastqfile|perl -pe "s/R1_val_1/R2_val_2/g") ;
samplename=$(echo $fastqfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/fastq_trimmed\///g'|perl -pe 's/_R.+_val_.+//g') ;
echo $fastq2;
echo $samplename;
bwa mem -t 23 -T 0 -R "@RG\tID:$samplename\tLB:WES3\tPL:illumina\tPU:NULL\tSM:$samplename" \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz $fastqfile $fastq2 | \
samtools view -Shb -o /home/rtm/vivek/navi/wes3/bam/$samplename.bam - ;
done

############################################################################################################################
# BAM SORT
for bamfile in /home/rtm/vivek/navi/wes3/bam/*bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.bam//g') ;
echo $samplename;
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=$bamfile \
OUTPUT=/home/rtm/vivek/navi/wes3/bam/$samplename.sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT;
done
############################################################################################################################
# RMDUP
for bamfile in /home/rtm/vivek/navi/wes3/bam/*.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.sort.bam//g') ;
echo $samplename;
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=$samplename.MFILE.txt \
INPUT=$bamfile \
OUTPUT=$samplename.rmdup.sort.bam ;
done
############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
for bamfile in /home/rtm/vivek/navi/wes3/bam/*.rmdup.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.rmdup.sort.bam//g') ;
echo $samplename;
############################# Target intervals #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I $bamfile \
-o /home/rtm/vivek/navi/wes3/bam/$samplename.realign_target.intervals ;
############################# INDEL REALigner #############################
java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes3/bam/$samplename.realign_target.intervals \
--noOriginalAlignmentTags \
-I $bamfile \
--out /home/rtm/vivek/navi/wes3/bam/$samplename.realigned.bam ;
############################## baserecalibrator #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I /home/rtm/vivek/navi/wes3/bam/$samplename.realigned.bam \
-o /home/rtm/vivek/navi/wes3/bam/$samplename.bqsr.grp ;
############################# recalibrate #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/$samplename.realigned.bam \
--BQSR /home/rtm/vivek/navi/wes3/bam/$samplename.bqsr.grp \
-o /home/rtm/vivek/navi/wes3/bam/$samplename.recalibrated.bam ;
done
############################################################################################################################

for bamfile in /home/rtm/vivek/navi/wes3/bam/*.rmdup.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.rmdup.sort.bam//g') ;
echo $samplename
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc \
-bam /home/rtm/vivek/navi/wes3/bam/$samplename.sort.bam \
-outfile /home/rtm/vivek/navi/wes3/bam/bamqc/$samplename.pdf --java-mem-size=200G ;
done
############################################################################################################################
#### MUTECT VCF ALL Variant NO NORMAL
for bamfile in /home/rtm/vivek/navi/wes3/bam/*recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes3\/bam\/} ;
sample=${name//\.recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes3/vcf_test/all_$sample.vcf.gz
done
############################################################################################################################

############################################################################################################################
#### MUTECT VCF ALL Variant NO NORMAL using gatk4.1.3
for bamfile in /home/rtm/vivek/navi/wes3/bam/*recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes3\/bam\/} ;
sample=${name//\.recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.3.0/gatk-package-4.1.3.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes3/vcf_gatk4.1.3/all_$sample.vcf.gz
done
############################################################################################################################
#### FUNCOTATOR VCF ALL Variant NO NORMAL
for vcf in /home/rtm/vivek/navi/wes3/vcf_gatk4.1.3/*tbi;
do echo $vcf; 
name=${vcf//\/home\/rtm\/vivek\/navi\/wes3\/vcf_gatk4.1.3\/} ;
name=${name//\.vcf\.gz\.tbi} ;
echo $name;
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/wes3/vcf_gatk4.1.3/$name.vcf.gz \
-O /home/rtm/vivek/navi/wes3/vcf_test/$name.filtered.vcf.gz ;
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes3/vcf_test/$name.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/wes3/vcf_test/$name.filtered.PASS.vcf.gz \
   --exclude-filtered ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes3/vcf_test/$name.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/wes3/vcf_test/$name.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF;
done
#######################################################################


grep -w "BRAF" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
BRAF_WES_MiniMAF.tab

grep "NRAS" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
NRAS_WES_MiniMAF.tab

grep -w "NF1" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
NF1_WES_MiniMAF.tab


grep -w "BRAF" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
BRAF_WES3_MiniMAF.tab

grep "NRAS" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
NRAS_WES3_MiniMAF.tab

grep -w "NF1" *.maf|cut -f 1,5-10,35,37,38,41,42| \
grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|sort -V -k 1 > \
NF1_WES3_MiniMAF.tab

