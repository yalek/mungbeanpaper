library("dplyr")

library("Matrix")
library("bravo")

rm(list=ls())

X = readRDS("data/zmat_sparse.rds")
SNP = colnames(X)
SNP = gsub("^X","",SNP)

## Day 18: ############################

fits = readRDS("GWAS-results-day18-2.rds")
da18 = data.frame(Phenotype = character(0), Hits = character(0),MIP=numeric(0))
for(ii in 1:length(fits)) {
  if(length(fits[[ii]]$model.wam) == 0) {
    da18 = rbind(da18, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = "N/A",
                                  MIP= NA))
  } else {
    da18 = rbind(da18, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = SNP[fits[[ii]]$model.wam],
                                  MIP = round(fits[[ii]]$mip.wam,2)))
  }

}
da18$Day = "18"
# write.csv(x = da18,file = "results-day18.csv",row.names = F)

## Day 15: ############################

fits = readRDS("GWAS-results-day15-2.rds")
da15 = data.frame(Phenotype = character(0), Hits = character(0),MIP=numeric(0))
for(ii in 1:length(fits)) {
  # cat("\n\n",fits1[[ii]]$Phenotype,"\n")
  # cat("WAM Model: ",colnames(X)[fits[[ii]]$model.wam]," (", round(fits1[[ii]]$mip.wam,2) ,")\n");
  if(length(fits[[ii]]$model.wam) == 0) {
    da15 = rbind(da15, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = "N/A",
                                  MIP= NA))
  } else {
    da15 = rbind(da15, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = SNP[fits[[ii]]$model.wam],
                                  MIP = round(fits[[ii]]$mip.wam,2)))
  }
  
}

da15$Day = "15"
# write.csv(x = da15,file = "results-day15.csv",row.names = F)

## Day 12: ############################

fits = readRDS("GWAS-results-day12-2.rds")
da12 = data.frame(Phenotype = character(0), Hits = character(0),MIP=numeric(0))
for(ii in 1:length(fits)) {
  # cat("\n\n",fits1[[ii]]$Phenotype,"\n")
  # cat("WAM Model: ",colnames(X)[fits[[ii]]$model.wam]," (", round(fits1[[ii]]$mip.wam,2) ,")\n");
  if(length(fits[[ii]]$model.wam) == 0) {
    da12 = rbind(da12, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = "N/A",
                                  MIP= NA))
  } else {
    da12 = rbind(da12, data.frame(Phenotype=fits[[ii]]$Phenotype,
                                  Hits = SNP[fits[[ii]]$model.wam],
                                  MIP = round(fits[[ii]]$mip.wam,2)))
  }
}

da12$Day = "12"

# write.csv(x = da12,file = "results-day12.csv",row.names = F)



da = rbind(da12,da15,da18) %>% arrange(Phenotype,Day) %>% relocate(Day,.after=Phenotype)

write.csv(file = "SVEN_Hits.csv",x = da,row.names = FALSE,na = "")







