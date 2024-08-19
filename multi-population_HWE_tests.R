## This script performs the HWE tests and correct for multiple comparisons using multi-population_HWE_tests.R

library(dplyr)
library(adegenet)
library(pegas)

wd="/Volumes/LaCie/PBS_nextRAD/scaffold_level_reference/SNPfilt/mapped150/test/"
genpop=
pop_csv=
corr_method=

#####################################################################################
# Set working directory:
setwd("/Volumes/LaCie/PBS_nextRAD/scaffold_level_reference/SNPfilt/mapped150/test/")

# Import genepop file to genind object:
genind <- import2genind("Nsim_5065_loci_11057SNPs - cópia.gen", ncode=3)
pops<-read.csv("populations - cópia.csv",header=F)#a csv file with each pop name in the same row separated by a coma.
popNames(genind)<-pops

# Perform a classical chi-squared test based on expected genotype frequencies to test for Hardy-Weinberg departures. 
hwe_by_pop <- seppop(genind) %>% lapply(hw.test, B = 0)

#Given a set of p-values, returns p-values adjusted using bonferroni correction
extention<-".txt"
for (f in 1:length(hwe_by_pop)){
  name<-names(hwe_by_pop[f])
  nametxt<-paste(name,extention,sep="")
  hwe_file<-as.data.frame(hwe_by_pop[[f]])
  corr_pval<-p.adjust(hwe_file$`Pr(chi^2 >)`, method = "bonferroni")
  hwe_corr<-cbind(hwe_file,corr_pval)
  write.table(hwe_corr,nametxt,sep="\t",quote=F,col.names=T,row.names=T)
} 
