library(xtable)

dataWithoutBugs = subset(processedData, defects == 0)
dataWithBugs = subset(processedData, defects == 1)

# Select metrics
# selectedColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "LocCodeAndComment", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount", "defects")
selectedColumns <- c("loc", "v(g)", "ev(g)", "iv(g)", "n", "v", "l", "d", "i", "e", "b", "t", "lOCode", "lOComment", "lOBlank", "uniq_Op", "uniq_Opnd", "total_Op", "total_Opnd", "branchCount", "defects")
dataWithoutBugs = dataWithoutBugs[selectedColumns] 
dataWithBugs = dataWithBugs[selectedColumns]


noBugSummary = t(summary(dataWithoutBugs))
withBugSummary = t(summary(dataWithBugs))

cellCount = nrow(noBugSummary) * ncol(noBugSummary)
for (i in 1:cellCount) {
  noBugSummary[i] = unlist(strsplit(noBugSummary[i], split=':', fixed=TRUE))[2];
  noBugSummary[i] = gsub("^\\s+|\\s+$", "", noBugSummary[i]);
  noBugSummary[i] = round(as.double(noBugSummary[i]), digits = 2)

  withBugSummary[i] = unlist(strsplit(withBugSummary[i], split=':', fixed=TRUE))[2];
  withBugSummary[i] = gsub("^\\s+|\\s+$", "", withBugSummary[i]);
  withBugSummary[i] = round(as.double(withBugSummary[i]), digits = 2)  
}

# Set column names
colnames(noBugSummary) = c("Min","1st Qu.","Median","Mean","3rd Qu.","Max");
colnames(withBugSummary) = c("Min","1st Qu.","Median","Mean","3rd Qu.","Max");

noBugLatexTable = xtable(noBugSummary, caption = "Basic statistics from data without defects")
withBugLatexTable = xtable(withBugSummary, caption = "Basic statistics from data with defects")



ratios = noBugSummary
for (i in 1:cellCount) {
  ratios[i] = round(as.double(withBugSummary[i]) / as.double(noBugSummary[i]), digits=2)
}
ratioLatexTable = xtable(ratios, caption = "'with bugs' values  divided by 'no bugs' values")

print(noBugLatexTable)
print(withBugLatexTable)
print(ratioLatexTable)


