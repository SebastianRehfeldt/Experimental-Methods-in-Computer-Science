correlations1 <- vector(mode = "logical",length=21)
correlations2 <- vector(mode = "logical",length=21)
for(i in 1:21){
  correlations1[i] <- cor(halsteadData[,22],halsteadData[,i]+0.1)
  correlations2[i] <- cor(halsteadData[,22],log(halsteadData[,i]+0.1))
}

barplot(correlations1, col=rgb(0,0,1,1/4))
barplot(correlations2, col=rgb(0,1,0,1/4),add = TRUE,names.arg = header[1:21], las=3)