# multi-population_HWE_tests
This is a simple R script that takes a GENEPOP file as input and performs classical chi-squared tests of Hardy-Weinberg Equilibrium on genotypic data from multiple populations using the function `hw.test` from the R package pegas and corrects for multiple comparisons using the Bonferroni correction as implemented in the function `p.adjust` from R package stats.

## R packages needed
- pegas<sup>1</sup>
- adegenet<sup>2,3</sup>
- dplyr<sup>4</sup>

## Citation
If you use this scrip on your work, please cite the article where this script was first used:

## References
1 Paradis E (2010) pegas: an R package for population genetics with an integrated-modular approach. _Bioinformatics_, 26(3):419-420. <https://doi.org/10.1093/bioinformatics/btp696>.
2 Jombart T (2008) adegenet: a R package for the multivariate analysis of genetic markers. _Bioinformatics_, 24(11):1403-1405. <https://doi.org/10.1093/bioinformatics/btn129> 
3 Jombart T and Ahmed I (2011) adegenet 1.3-1: new tools for the analysis of genome-wide SNP data. _Bioinformatics_, 27(21):3070-3071. <https://doi.org/10.1093/bioinformatics/btr521>
4 Wickham H, François R, Henry L, Müller K, Vaughan D (2023) dplyr: A Grammar of Data Manipulation. R package version 1.1.4. <https://CRAN.R-project.org/package=dplyr>.
