# Used as guide:
# https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/

# Load libraries
library(pscl)
library(ROCR)
library(xtable)

# Array of used metric names
allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")

# Create a data frame for results
s_results <- matrix(0, ncol = 2, nrow = 0)
s_results <- data.frame(s_results)
colnames(s_results) = c("METRIC", "AIC")

# Shuffle the data
shuffled <- halsteadData[sample(nrow(halsteadData)),]

count = 0;
# Calculate logistic regression for every single metric against defects
for (str in allColumns) {
  count = count + 1
  data = shuffled[c(str, "defects")]
  
  # Use logarithms of the original values
  for (i in 1:2) {
    if (data[i,1] != 0) {
      data[i,1] = log(data[i,1])
    }
  }
  
  model <- glm(data$defects ~data[,str],family=binomial(link='logit'))
  aic = model$aic
  s_results[count,] = c(str, round(aic, digits = 0))
}

# Sort and print the results
res = s_results[order(s_results$AIC),]
print(res)

# Print table for AIC values
# latexTable = xtable(res[2], caption = "AUC and AIC values for different metrices", digits=c(0,0))
# print(latexTable)

