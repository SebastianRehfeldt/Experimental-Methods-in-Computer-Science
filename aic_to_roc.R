allColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount")
usedColumns = c("loc", "v(g)", "ev(g)", "iv(g)", "defects");

# Lenght: 9548
data = halsteadData;



model <- glm(defects ~ .,family=binomial(link='logit'), data=data)
aic = model$aic


train <- data[1:9000,]
test <- data[9001:9548,]