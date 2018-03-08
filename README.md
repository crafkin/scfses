# Overview
The Stata program `scfses` obtains accurate point estimates and standard errors of an arbitrary percentile (or the mean) of a variable in the Survey of Consumer Finances (SCF). For example, `scfses` can help you easily obtain the median and standard error on the median. It incorporates weights and accounts for both _imputation variability_ and _sampling variability_. 

# Updates
Update March 8, 2018: Fixed an error in computing standard errors on means. 

# Installation and Set Up 
To install the program, run 

`net install scfses, from(https://raw.github.com/crafkin/scfses/master/) replace`

in Stata.

Alternatively, download `scfses.ado` and `scfses.sthlp` and place them in your `PLUS` folder. (To find your `PLUS` folder, run `sysdir list` in Stata.) 

To download the SCF dataset, go to [the SCF website](https://www.federalreserve.gov/econres/scfindex.htm). Download both the "Main Survey Data" and the "Replicate Weight File." 

# Usage
Usage notes are documented in detail in the Stata help file. 

* It is not straightforward to generate standard errors on the mean or a specified percentile of the unconditional distribution of an SCF variable. If you are not careful, your standard errors and confidence intervals may be too small. `scfses` follows SCF guidance on combining _imputation variability_ and _sampling variability_ to obtain standard errors.

* `scfses` estimates imputation variability by computing the sample variance of within-implicate point estimates. `scfses` estimates sampling variability by using the information contained in the replicate draw variables to construct the distribution of the variable from the first implicate; the sample variance of that distribution represents sampling variability. The program combines imputation and sampling variability following the SCF guidance.

* Confidence intervals incorporate a degrees-of-freedom correction (Barnard and Rubin 1999) to account for imputation variance. 

* `scfses` stores point estimates and standard errors for post-estimation analysis. 

* `scfses` requires a vector of replicate sampling variables and replicate weight variables &mdash; one for each replicate used to compute sampling variance. 

# Author
Charlie Rafkin  
National Bureau of Economic Research  
crafkin@nber.org

Program developed to obtain estimates in:  
Beshears, John, James Choi, David Laibson, and Brigitte C. Madrian. "Household Finance." In *Handbook of Behavioral Economics*, edited by B. Douglas Bernheim, Stefano DellaVigna, and David Laibson. Elsevier: 2018 (expected). </p>


<!---
# References 
Barnard, John, and Donald B. Rubin. 1999. "Small-Sample Degrees of Freedom with Multiple Imputation."     *Biometrica*  86 (4): 948-955.  
Kennickell, Arthur B. 2000. "Wealth Measurement in the Survey of Consumer Finances: Methodology and Directions for Future Research."  
Monalto, Catherine Phillips, and Jaimie Sung. 1996. "Multiple Imputation in the 1992 Survey of Consumer Finances." *Financial Counseling and Planning* 7 (1): 133-146.  
--> 