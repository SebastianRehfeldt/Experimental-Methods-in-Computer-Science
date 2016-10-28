library(pscl)
library(ROCR)
# This script calculates AUC values of models with multiple metrices
# It starts by searching the metric with the best AIC value
# It then searchs the metric which has the best AIC combined with the first metric
# The previous step is executed again and again until all metrices are in the list
# Shuffle data

data <- HalsteadDataShuffled

# Column names without 'defects'
allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
columnCount = length(allColumns)

# Array for column numbers
variables = c();

# Array for column names
columns = c();

# Array for AIC values
aucs = c();

# This for-loop searches first the best single metric, and then the best group of two, three, four and so on
for (level in 1:columnCount) {
  greatestAuc = 0
  greatestVar = c(0)
  
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
      
      train <- data[1:9000,][usedColumns]
      test <- data[9001:9548,][usedColumns]
      
      model <- glm(defects ~ .,family=binomial(link='logit'), data=train)
      
      anova(model, test="Chisq")
      pR2(model)
      fitted.results <- predict(model,newdata=subset(test,select=usedColumns),type='response')
      fitted.results <- ifelse(fitted.results > 0.5,1,0)
      
      misClasificError <- mean(fitted.results != test$defects)
      #print(paste('Accuracy',1-misClasificError))
      acc = 1-misClasificError
      
      p <- predict(model, newdata=subset(test,select=usedColumns), type="response")
      pr <- prediction(p, test$defects)
      prf <- performance(pr, measure = "tpr", x.measure = "fpr")
      plot(prf)
      
      auc <- performance(pr, measure = "auc")
      auc <- auc@y.values[[1]]

      if (auc > greatestAuc) {
        greatestAuc = auc
        greatestVar = i
      }
    }
  }
  
  print(c("LEVEL", level, "AUC:", greatestAuc, "WITH", allColumns[greatestVar]))
  variables[level] = greatestVar
  columns[level] = allColumns[greatestVar]
  aucs[level] = greatestAuc
}


