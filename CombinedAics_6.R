# For calculating the last for loop in parallel with 20 threads
library(foreach)
library(doMC)
registerDoMC(3)

usedLogData = HalsteadDataShuffledLog

# Column names without 'defects'
allColumns <<- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
columnCount <<- length(allColumns)

sval = 99999
arr = c(0)


# Start the clock!
ptm <- proc.time()

foreach(i=1:columnCount,.combine=cbind) %dopar% {
  print(paste(i))
      foreach(j=i:columnCount,.combine=cbind) %dopar% {
        if(i < j) {
          usedColumns = c(allColumns[i], allColumns[j], allColumns[k], "defects");
          
          model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
          aic_log = model_log$aic

          # Save values if they are smaller than previous ones
          if (aic_log < sval) {
            sval <<- aic_log
            arr <<- c(i,j)
          }     

    }
  }
}

# Stop the clock
print(proc.time() - ptm)





