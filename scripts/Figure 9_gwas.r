library("Matrix")
library("bravo")
library("doParallel")


X = readRDS("data/zmat_sparse.rds")


cl <- makeCluster(detectCores(), outfile="")
registerDoParallel(cl)


## Day 18 ###################################################################
print("Starting with Day 18")
phen.all.18 = read.table(file = "data/mung_phenotype_blups_day18.txt",header = T,skip=2)

stopifnot(all.equal.character(rownames(X),phen.all.18$Taxa))
# The X and Y are aligned by genotype so that's good.



print("Starting with Day 18")
fits = foreach(ii = 2:ncol(phen.all.18),.packages = c("bravo","Matrix")) %dopar%
{
  print(ii)
  X = X; # Force R top make a copy to each worker
  y = phen.all.18[,ii]
  phen.name = names(phen.all.18)[ii]
  set.seed(2441139)
  fit = sven(X = X,y = y,Ntemp = 30,Miter = 100,verbose = F,lam = 0.1)
  fit$Phenotype=phen.name
  return(fit)
}

saveRDS(object = fits,file="GWAS-results-day18-2.rds")

print("Done with Day 18")


## Day 15 ################################################################### 
print("Starting with Day 15")
phen.all.15 = read.table(file = "data/mung_phenotype_blups_day15.txt",header = T,skip=2)

stopifnot(all.equal.character(rownames(X),phen.all.15$Taxa))
# The X and Y are aligned by genotype so that's good.


fits = foreach(ii = 2:ncol(phen.all.15),.packages = c("bravo","Matrix")) %dopar%
{
  print(ii)
  X = X; # Force R top make a copy to each worker
  y = phen.all.15[,ii]
  phen.name = names(phen.all.15)[ii]
  set.seed(2441139)
  fit = sven(X = X,y = y,Ntemp = 30,Miter = 500,verbose = F,lam = 0.1)
  fit$Phenotype=phen.name
  return(fit)
}

saveRDS(object = fits,file="GWAS-results-day15-2.rds")

print("Done with Day 15")


## Day 12 ########################################################

# 12th day
print("Starting with Day 12")
phen.all.12 = read.table(file = "data/mung_phenotype_blups_day12.txt",header = T,skip=2)

stopifnot(all.equal.character(rownames(X),phen.all.12$Taxa))
# The X and Y are aligned by genotype so that's good.


fits = foreach(ii = 2:ncol(phen.all.12),.packages = c("bravo","Matrix")) %dopar%
  {
    print(ii)
    X = X; # Force R top make a copy to each worker
    y = phen.all.12[,ii]
    phen.name = names(phen.all.12)[ii]
    set.seed(2441139)
    fit = sven(X = X,y = y,Ntemp = 30,Miter = 500,verbose = F,lam = 0.1)
    fit$Phenotype=phen.name
    return(fit)
  }

saveRDS(object = fits,file="GWAS-results-day12-2.rds")

print("Done with Day 12")

stopCluster(cl)




