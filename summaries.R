sink("summaries.txt")

withoutBugs = subset(processedData,defects==0)
withBugs = subset(processedData,defects==1)

for(i in 1:(ncol(processedData)-1)){

  print(header[i])  
  print("Summary without bugs")
  print(summary(withoutBugs[,i]))
  print("Summary with bugs")
  print(summary(withBugs[,i]))

  print("======================")
}
sink()