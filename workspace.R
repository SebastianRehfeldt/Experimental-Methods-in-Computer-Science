header <- c("loc","v(g)","ev(g)","iv(g)","n","v","l","d","i","e","b","t","lOCode","lOComment","lOBlank","LocCodeAndComment","uniq_Op","uniq_Opnd","total_Op","total_Opnd","branchCount","defects")
mydata <- read.csv("bugData.csv",dec = ".",sep = ",",header = FALSE)
colnames(mydata) <- header
head(mydata)


#factor to numeric
mydata[,17] <- as.numeric(as.character(mydata[,17]))
mydata[,18] <- as.numeric(as.character(mydata[,18]))
mydata[,19] <- as.numeric(as.character(mydata[,19]))
mydata[,20] <- as.numeric(as.character(mydata[,20]))
mydata[,21] <- as.numeric(as.character(mydata[,21]))

#boolean to int
mydata[,22] <- as.character(mydata[,22])
temp = sapply(mydata[,22], function(x){if(x){1}else{0}})
names(temp) = NULL
mydata[,22] <- as.numeric(temp)
rm(temp)

#processed data
processedData <- na.omit(mydata) #removes lines with NaN
cor(processedData)