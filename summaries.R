sink("summaries.txt")

withoutBugs = subset(processedData,defects==0)
withBugs = subset(processedData,defects==1)

for(i in 1:(ncol(processedData)-1)){

    
  paste("Summary for ",toString(header[i])," and no bugs", sep="")
  print(summary(withoutBugs[,i]))
  
  paste("Summary for ",toString(header[i])," with bugs", sep="")
  print(summary(withBugs[,i]))

  print("======================")
}
sink()