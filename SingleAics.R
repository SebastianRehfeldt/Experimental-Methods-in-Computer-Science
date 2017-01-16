# Used as guide:
library(pscl)
library(xtable)
# https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/
# This script calculates AIC values from single metrices

# Create a data frame for results
results <- matrix(0, ncol = 2, nrow = 0)
results <- data.frame(results)

colnames(results) = c("METRIC", "AIC")

usedData <- HalsteadDataShuffled

count = 0;
# Calculate logistic regression for every single metric against defects
for (str in allMetricNames) {
  print(paste("Calculating", count+1, "/", length(allMetricNames), ", ", str))
  count = count + 1
  data = usedData[c(str, "defects")]

  model <- glm(data$defects ~data[,str],family=binomial(link='logit'))
  aic = model$aic
  results[count,] = c(str, round(aic, digits = 1))
}

# Sort and print the results
aic_values = results[order(results$AIC),]
print("")
print(aic_values)





usedData <- HalsteadDataShuffledLog

count = 0;
# Calculate logistic regression for every single metric against defects
for (str in allMetricNames) {
  print(paste("Calculating", count+1, "/", length(allMetricNames), ", ", str))
  count = count + 1
  data = usedData[c(str, "defects")]
  
  model <- glm(data$defects ~data[,str],family=binomial(link='logit'))
  aic = model$aic
  results[count,] = c(str, round(aic, digits = 1))
}

# Sort and print the results
log_aic_values = results[order(results$AIC),]
print("")
print(log_aic_values)









