withoutBugs = subset(processedData,defects==0)
withBugs = subset(processedData,defects==1)

meanRatios <- vector();

for(i in 1:(ncol(processedData)-1)){
  meanRatios[i] <- mean(withBugs[,i])/mean(withoutBugs[,i]);
}

barplot(meanRatios,main = "Ratio of means (withBugs/ withoutBugs)", ylab = "Ratio of means",names.arg = header[1:21], las=3)