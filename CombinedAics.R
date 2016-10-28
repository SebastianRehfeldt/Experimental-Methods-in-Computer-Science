# This script calculates AIC values of models with multiple metrices
# It starts by searching the metric with the best AIC value
# It then searchs the metric which has the best AIC combined with the first metric
# The previous step is executed again and again until all metrices are in the list

# Data to use
usedData = halsteadData

level = 9

# Column names without 'defects'
allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
columnCount = length(allColumns)

# Array for column numbers
variables = c();

# Array for column names
columns = c();

# Array for AIC values
aics = c();

# This for-loop searches first the best single metric, and then the best group of two, three, four and so on
for (level in 1:level) {
  smallestVal = 99999
  smallest = c(0)
  for (i in 1:columnCount) {
    # Don't calculate values for already used metric
    if (!i %in% variables) {
      
      usedColumns = c();
      if (length(variables) > 0) {
        for (x in 1:length(variables)) {
          usedColumns[x]= allColumns[variables[x]]
        }    
      }
      
      usedColumns[length(usedColumns)+1] = allColumns[i]
      usedColumns[length(usedColumns)+1] = "defects"
      
      model <- glm(defects ~ .,family=binomial(link='logit'), data=usedData[usedColumns])
      aic = model$aic
      
      # Save values if they are smaller than previous ones
      if (aic < smallestVal) {
        smallestVal = aic
        smallest = i
      }
    }
  }
  print(c("LEVEL", level, "AIC:", smallestVal, "WITH", allColumns[smallest]))
  variables[level] = smallest
  columns[level] = allColumns[smallest]
  aics[level] = smallestVal
}

plot(aics, main="AIC values by metric count", xlab="Amount of used metrices", xtics=1:10)

# Create a data frame for results
results <- matrix(0, ncol = 2, nrow = level)
results <- data.frame(results)
colnames(results) = c("AIC", "Model")

results[,1] = aics
results[,2] = columns

bestCombinedAic = variables

print(variables)
