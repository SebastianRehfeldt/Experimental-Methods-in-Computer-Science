# Used:
# https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/

str = "v(g)";

data = processedData[c(str, "defects")]
data = data[order(data[, str]),c(1,2)]
#data = processedData
train <- data[1:8000,]
test <- data[8001:10880,]

model <- glm(defects ~.,family=binomial(link='logit'),data=train)

anova(model, test="Chisq")
library(pscl)
pR2(model)

library(ROCR)
p <- predict(model, newdata=subset(test,select=str), type="response")
pr <- prediction(p, test$defects)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc