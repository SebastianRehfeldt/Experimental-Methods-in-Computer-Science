
# Calculate logarithmic and non-logarithmic shuffled halstead data
HalsteadDataShuffled <- halsteadData[sample(nrow(halsteadData)),]
HalsteadDataShuffledLog <- HalsteadDataShuffled

# I don't know why, but this is much faster than basic loop for all the data  -Jani
for (col in 1:(length(HalsteadDataShuffled[1,])-1)) {
  colData = HalsteadDataShuffled[,col]
  #print(paste("Column ", col, "/", length(HalsteadDataShuffled[1,]-1)))
  for (row in 1:length(colData)) {
    if(colData[row] != 0) {
      colData[row] = log(colData[row])
    }
  }
  HalsteadDataShuffledLog[,col] = colData
}

HalsteadDataShuffledCombined = HalsteadDataShuffled
for (i in 1:(length(HalsteadDataShuffled[1,])-1)) {
  HalsteadDataShuffledCombined[,i+22] = HalsteadDataShuffledLog[,i]
  colnames(HalsteadDataShuffledCombined)[i+22] = paste("log(", colnames(HalsteadDataShuffledLog)[i], ")")
}

allColumnNames = colnames(HalsteadDataShuffled)
allMetricNames = allColumnNames[! allColumnNames %in% c("defects")]
allMetricNamesCombined = colnames(HalsteadDataShuffledCombined)
allMetricNamesCombined = allMetricNamesCombined[! allMetricNamesCombined %in% c("defects")]



