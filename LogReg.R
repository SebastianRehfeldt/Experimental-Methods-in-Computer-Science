# Used as guide:
# https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/

# Load libraries
library(pscl)
library(ROCR)
library(xtable)

# Array of used metric names
allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")

# Create a data frame for results
s_results <- matrix(0, ncol = 3, nrow = 0)
s_results <- data.frame(s_results)
colnames(s_results) = c("METRIC", "AUC", "AIC")

# Shuffle the data
shuffled <- processedData[sample(nrow(processedData)),]

count = 0;
# Calculate logistic regression for every single metric against defects
for (str in allColumns) {
  count = count + 1
  data = shuffled[c(str, "defects")]
  
  # Use logarithms of the original values
  for (i in 1:length(data[,1])) {
    if (data[i,1] != 0) {
      data[i,1] = log(data[i,1])
    }
  }
  
  train <- data[1:8000,]
  test <- data[8001:10880,]
  
  model <- glm(defects ~.,family=binomial(link='logit'),data=train)
  anova(model, test="Chisq")
  pR2(model)
  
  p <- predict(model, newdata=subset(test,select=str), type="response")
  pr <- prediction(p, test$defects)
  prf <- performance(pr, measure = "tpr", x.measure = "fpr")
  
  # Draw the ROC curve
  # plot(prf)

  auc <- performance(pr, measure = "auc")
  auc <- auc@y.values[[1]]
  aic = model$aic

  s_results[count,] = c(str, round(auc, digits = 3), round(aic, digits = 0))
}

# Sort and print the results
res = s_results[order(s_results$AIC),]
print(res)

# Print table for AIC values
# latexTable = xtable(res[2], caption = "AUC and AIC values for different metrices", digits=c(0,0))
# print(latexTable)

