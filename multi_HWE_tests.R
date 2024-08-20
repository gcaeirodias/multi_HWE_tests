## This is a function to perform HWE tests on each population defined in a genepop file and to correct for multiple comparisons
multi_HWE_tests <- function(genepop, allele_code, pop_csv=NULL, multi_corr = "bonferroni") {
  # Ensure allele_code is either 2 or 3
  if (!(allele_code %in% c(2, 3))) {
    stop("allele_code must be either 2 or 3.")
  }
  # Import genepop file to genind object using import2genind {adegenet}.
  genind <- import2genind(genepop, ncode = allele_code)
  # If pop_csv is provided, read population names from .csv file and assign them to the genind object.
  if (!is.null(pop_csv)) {
    pops <- read.csv(pop_csv, header = FALSE)
    popNames(genind) <- pops
  }
  # Perform classical chi-squared tests based on expected genotype frequencies to test for Hardy-Weinberg departures using hw.test {pegas}.
  hwe_by_pop <- seppop(genind) %>% lapply(hw.test, B = 0)
  # Perform multiple corrections for each population and save .txt file with results.
  extention <- ".txt"
  for (f in 1:length(hwe_by_pop)) {
    name <- names(hwe_by_pop[f])
    nametxt <- paste(name, extention, sep = "")
    hwe_file <- as.data.frame(hwe_by_pop[[f]])
    corr_pval <- p.adjust(hwe_file$`Pr(chi^2 >)`, method = multi_corr)
    hwe_corr <- cbind(hwe_file, corr_pval)
    write.table(hwe_corr, nametxt, sep = "\t", quote = FALSE, col.names = TRUE, row.names = TRUE)
  }
}
