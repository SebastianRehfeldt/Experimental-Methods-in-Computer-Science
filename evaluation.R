library(pscl)

fm <- glm(halsteadData$defects ~ log(halsteadData$lOBlank+0.01) + log(halsteadData$LocCodeAndComment+0.01) + log(halsteadData$uniq_Opnd+0.01)+log(halsteadData$total_Opnd+0.01)+log(halsteadData$branchCount+0.01),family=binomial(link='logit'))
#fm <- glm(halsteadData$defects ~ log(halsteadData$total_Opnd+0.01) + log(halsteadData$uniq_Opnd+0.01) + log(halsteadData$lOBlank+0.01)+log(halsteadData$`v(g)`+0.01),family=binomial(link='logit'))
pR2(fm)[4]


tp <- 0
fp <- 0
tn <- 0
fn <- 0

probV <- vector()

for(i in 1:nrow(halsteadData)){
  temp <- exp(fm$coefficients[[1]]+fm$coefficients[[2]]*log(halsteadData[i,]$lOBlank+0.01)+fm$coefficients[[3]]*log(halsteadData[i,]$LocCodeAndComment+0.01)+fm$coefficients[[4]]*log(halsteadData[i,]$uniq_Opnd+0.01)+fm$coefficients[[5]]*log(halsteadData[i,]$total_Opnd+0.01)+fm$coefficients[[6]]*log(halsteadData[i,]$branchCount+0.01))
  prob <- temp/(1+temp)
  probV[i] <- prob
  predicted <- round(prob+0.35)
  if(predicted == 1){
    if(halsteadData[i,]$defects == 1){
      tp = tp+1
    }
    else{
      fp = fp+1
    }
  }
  else{
    if(halsteadData[i,]$defects == 1){
      fn = fn+1
    }
    else{
      tn = tn+1
    }
  }
}

precision <- tp/(tp+fp)
recall <- tp/(tp+fn)

thresholdVector[8] <- 0.15
precisionVector[8] <- precision
recallVector[8] <- recall

plot(precisionVector,ylim=0:1,ylab = "",col="green",xlab="Threshhold", xaxt="n")
par(new=TRUE)
plot(recallVector,ylim=0:1,ylab = "",col="red",xlab="", xaxt="n")
axis(1, at=1:8, labels=thresholdVector)
legend("topright", c("Precision", "Recall"), col=c("green","red"), lwd=10)
