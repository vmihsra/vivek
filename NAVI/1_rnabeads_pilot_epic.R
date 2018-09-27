###############################################################################################################################
### STD PIPE ###
library(RnBeads)
options(bitmapType="cairo")

## Preprocess Sample Sheet ##
pre_sample_sheet = read.table(
    pipe("grep 'VM' /home/rtm/vivek/navi/EPIC/2018_09_18_Vivek_GenStudSS_FFPE_16.csv|perl -pe 's/\\,/\\t/g'|cut -f1,6,7")
    )

colnames(pre_sample_sheet) = c("Sample_ID","Sentrix_ID","Sentrix_Position")
write.csv(pre_sample_sheet,"rnbeads_sample_sheet.csv",row.names=F)

## Options and Parameters ##

#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")
report.dir <- file.path("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")

# Analysis directory
analysis.dir <- "/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_analysis"

# Vanilla parameters
rnb.options(filtering.sex.chromosomes.removal=TRUE, identifiers.column="Sample_ID")
rnb.options(differential=FALSE)

# Normalization parameters
rnb.options(normalization=TRUE,normalization.method="swan",normalization.background.method="methylumi.noob")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

rnb.run.analysis(dir.reports=report.dir, sample.sheet=sample.annotation, data.dir=idat.dir, data.type="infinium.idat.dir")
###############################################################################################################################
## preprocessing
#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization")
report.dir <- file.path("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization")

# Vanilla parameters
rnb.options(identifiers.column="Sample_ID")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

data.source <- c(idat.dir, sample.annotation)
result <- rnb.run.import(data.source=data.source,data.type="infinium.idat.dir", dir.reports=report.dir)
rnb.set.norm <- rnb.execute.normalization(result$rnb.set, method="swan",bgcorr.method="enmix.oob")

save.rnb.set(rnb.set.norm,path="/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization/rnb.set.norm.RData")
###############################################################################################################################
suppressMessages(library(RnBeads))

rnb.set.norm=load.rnb.set("rnb.set.norm.RData.zip")
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevus","Melanoma","Nevus","Melanoma","Nevus","Melanoma","Nevus",
                     "Melanoma","Nevus","Melanoma","Nevus","Melanoma","Nevus","Melanoma","Nevus") )

MvsN_dmc <- rnb.execute.computeDiffMeth(rnb.set.norm_no12,pheno.cols=c("Tumor"))