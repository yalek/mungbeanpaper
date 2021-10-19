# mungbeanpaper
Source code for analysis used in the paper, "Dissecting the root phenotypic and genotypic variability of the Iowa mung bean diversity panel"

#Where SNP data is required please reach out (corresponding author) to check on the availability of the SNP/marker data

#Folders
README - contains information required to replicate the results
blups - contains blups and descriptive statistics
data - contains sample and processed data
figures - contains figures
gwas - contains results of GWAS studies
scripts - contains scripts used to replicate the results
tables - contains relavant tables


STEPS
#Sample data provided - 1500 raw data points across three time points( days 12, 15, 18)

Blups - run all_blups.Rmd script
Figure 3 (heritability) - all_blups.Rmd 
Table 2 and Table S2 (day 15 and days 12, 18 decriptive) - all_blups.Rmd 

Figure 2 (Correlations) - Figure 2_correlations.Rmd
Table 3 and Table S3 - iroot_rank_calculations.Rmd
Figure 5 (Dendograms), Figure S1/Figure S2 - Figure 5.Rmd (You will need access to the SNP data)
Figure 6A/Figure S3A (PCA) - Figure 6a.Rmd - (You will need access to the SNP data)
Figure 6B/Figure S3B/Table S4 (PCA/ with genotypic cluster) - You will need access to the SNP data
Figure 6C/6D/Figure S3C/D (Overlaying ideotype on PCA) - Figure 6c.Rmd - Will need access to the SNP data
Figure 7  - Figure 5.Rmd
Figure 8 (manhattan) - Figure 8_tassel_formating
Figure 9 (SVEN plot) - runs on SVEN conceptual framework in R.
Table S5 - SVEN
