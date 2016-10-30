withoutBugs = subset(processedData,defects==0)
withBugs = subset(processedData,defects==1)



par(mfrow=c(1,2))
boxplot(withoutBugs[,1],log="y",pars=list(ylim=c(1,700)),main="Modules without bugs", ylab="McCabe Score")
boxplot(withBugs[,1],log="y",pars=list(ylim=c(1,700)),main="Modules with bugs", ylab="McCabe Score")
