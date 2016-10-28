allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
usedVariables = bestCombinedAic[1]
usedColumns = c();
for (num in 1:length(usedVariables)) {
  usedColumns[num] = allColumns[usedVariables[num]]
}
usedColumns[length(usedColumns)+1] = "defects"

# Get only used columns from the data
data = HalsteadDataShuffled[usedColumns];

train <- data[1:8000,]
test <- data[8001:9548,]

model <- glm(defects ~ .,family=binomial(link='logit'), data=train)

anova(model, test="Chisq")
library(pscl)
pR2(model)
fitted.results <- predict(model,newdata=subset(test,select=usedColumns),type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)

misClasificError <- mean(fitted.results != test$defects)
#print(paste('Accuracy',1-misClasificError))

library(ROCR)
p <- predict(model, newdata=subset(test,select=usedColumns), type="response")
pr <- prediction(p, test$defects)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
print(auc)