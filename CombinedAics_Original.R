# This script calculates AIC values of models with multiple metrices
# It starts by searching the metric with the best AIC value
# It then searchs the metric which has the best AIC combined with the first metric
# The previous step is executed again and again until all metrices are in the list
# Data to use
usedData = HalsteadDataShuffled
usedLogData = HalsteadDataShuffledLog

# Column names without 'defects'
allColumns <<- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
columnCount <<- length(allColumns)

smallestVal_1 = 99999
smallest_1 = c(0)
smallestVal_1_log = 99999
smallest_1_log = c(0)

smallestVal_2 = 99999
smallest_2 = c(0)
smallestVal_2_log = 99999
smallest_2_log = c(0)

smallestVal_3 = 99999
smallest_3 = c(0)
smallestVal_3_log = 99999
smallest_3_log = c(0)

smallestVal_4 = 99999
smallest_4 = c(0)
smallestVal_4_log = 99999
smallest_4_log = c(0)

smallestVal_5 = 99999
smallest_5 = c(0)
smallestVal_5_log = 99999
smallest_5_log = c(0)


for (i in 1:columnCount) {

  usedColumns = c(allColumns[i]);
  usedColumns[length(usedColumns)+1] = "defects"
  
  model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
  model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
  
  aic = model$aic
  aic_log = model_log$aic
  
  # Save values if they are smaller than previous ones
  if (aic < smallestVal_1) {
    smallestVal_1 <<- aic
    smallest_1 <<- i
  }
  
  # Save values if they are smaller than previous ones
  if (aic_log < smallestVal_1_log) {
    smallestVal_1_log <<- aic_log
    smallest_1_log <<- i
  }      
  
  
  for (j in i:columnCount) {
    
    if(i < j) {
      print(paste(i,j))
      usedColumns = c(allColumns[i], allColumns[j]);
      usedColumns[length(usedColumns)+1] = "defects"
      
      model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
      model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
      
      aic = model$aic
      aic_log = model_log$aic
      
      # Save values if they are smaller than previous ones
      if (aic < smallestVal_2) {
        smallestVal_2 <<- aic
        smallest_2 <<- c(i,j)
      }
      
      # Save values if they are smaller than previous ones
      if (aic_log < smallestVal_2_log) {
        smallestVal_2_log <<- aic_log
        smallest_2_log <<- c(i,j)
      }    
    }
    
    
    for (k in j:columnCount) {
      
      if(i < j && j < k) {
        print(paste(i,j, k))
        usedColumns = c(allColumns[i], allColumns[j], allColumns[k]);
        usedColumns[length(usedColumns)+1] = "defects"
        
        model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
        model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
        
        aic = model$aic
        aic_log = model_log$aic
        
        # Save values if they are smaller than previous ones
        if (aic < smallestVal_3) {
          smallestVal_3 <<- aic
          smallest_3 <<- c(i,j,k)
        }
        
        # Save values if they are smaller than previous ones
        if (aic_log < smallestVal_3_log) {
          smallestVal_3_log <<- aic_log
          smallest_3_log <<- c(i,j,k)
        }  
      }
      
      
      for (l in k:columnCount) {
        if(i < j && j < k && k < l) {
          print(paste(i,j, k, l))
          usedColumns = c(allColumns[i], allColumns[j], allColumns[k], allColumns[l]);
          usedColumns[length(usedColumns)+1] = "defects"
          
          model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
          model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
          
          aic = model$aic
          aic_log = model_log$aic
          
          # Save values if they are smaller than previous ones
          if (aic < smallestVal_4) {
            smallestVal_4 <<- aic
            smallest_4 <<- c(i,j,k,l)
          }
          
          # Save values if they are smaller than previous ones
          if (aic_log < smallestVal_4_log) {
            smallestVal_4_log <<- aic_log
            smallest_4_log <<- c(i,j,k,l)
          }     
        }
        
        for (m in l:columnCount) {
          if(i < j && j < k && k < l && l < m) {
            print(paste(i,j, k, l,m))
            usedColumns = c(allColumns[i], allColumns[j], allColumns[k], allColumns[l], allColumns[m]);
            usedColumns[length(usedColumns)+1] = "defects"
            
            model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
            model_log <- glm(defects ~ .,family=binomial(link='logit'), data=usedLogData[usedColumns])
            
            aic = model$aic
            aic_log = model_log$aic
            
            # Save values if they are smaller than previous ones
            if (aic < smallestVal_5) {
              smallestVal_5 <<- aic
              smallest_5 <<- c(i,j,k,l,m)
            }
            
            # Save values if they are smaller than previous ones
            if (aic_log < smallestVal_5_log) {
              smallestVal_5_log <<- aic_log
              smallest_5_log <<- c(i,j,k,l,m)
            }     
          }
        }
      }
    }
  }
}







