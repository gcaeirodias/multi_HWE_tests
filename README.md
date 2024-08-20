# multi_HWE_tests
This is an R function that takes a genepop file as input and performs classic chi-squared tests of Hardy-Weinberg Equilibrium (HWE) on genotypic data (microsatellites, SNPs, mycrohaplotypes) from each population using the R function `hw.test` {pegas} and corrects for multiple comparisons using the R function `p.adjust` {stats}. The output is a text file (.txt) for each population with all pairs of loci that significantly deviate from HWE. Soon I'll improve the function to identify the pairs of loci that are common across all populations i.e., to identify potential non-neutral loci.

## R packages needed
- pegas<sup>1</sup>
- adegenet<sup>2,3</sup>
- dplyr<sup>4</sup>

## Usage
~~~
multi_HWE_tests(genepop, allele_code = 3, pop_cvs = NULL, multi_corr = "bonferroni")
~~~

## Arguments
~~~
genepop
     The path to a genepop file (.gen).
     
allele_code
     The number of characters used for coding one allele at each locus in the genepop file. Possible values are 2 or 3.
     [Default: 3]

pop_csv
     An optional comma separated values (.csv) file with the names of all populations to be used.
     [Default: Null]

multi_corr
     The multi-comparison correction method to be used. The options are any method implemented on p.adjust {stats} R function.
     [Default: bonferroni]
~~~

## pop_csv example format
~~~
Pop1,Pop2,Pop3,Pop4,Pop5,Pop6
~~~

## Citation
If you use this scrip on your work, please cite the article where this script was first used: Osborne MJ, Caeiro-Dias G, Turner TF () In review.

## References
1. Paradis E (2010) pegas: an R package for population genetics with an integrated-modular approach. _Bioinformatics_, 26(3):419-420. <https://doi.org/10.1093/bioinformatics/btp696>.
2. Jombart T (2008) adegenet: a R package for the multivariate analysis of genetic markers. _Bioinformatics_, 24(11):1403-1405. <https://doi.org/10.1093/bioinformatics/btn129>.
3. Jombart T and Ahmed I (2011) adegenet 1.3-1: new tools for the analysis of genome-wide SNP data. _Bioinformatics_, 27(21):3070-3071. <https://doi.org/10.1093/bioinformatics/btr521>.
4. Wickham H, François R, Henry L, Müller K, Vaughan D (2023) dplyr: A Grammar of Data Manipulation. R package version 1.1.4. <https://CRAN.R-project.org/package=dplyr>.

## Contact
Send your questions, suggestions, or comments to gcaeirodias@unm.edu
