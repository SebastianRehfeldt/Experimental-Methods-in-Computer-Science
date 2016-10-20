#to get total data remove loc from subset and increase ylim for boxplot to 500

withoutBugs = subset(processedData,defects==0 & loc <= 37)
withBugs = subset(processedData,defects==1 & loc <= 37)

p1 <- hist(withoutBugs[,2],breaks = 100)
p2 <- hist(withBugs[,2][withBugs[,2]<150],breaks = 100) #remove some lines to make picture clearer

xlim <- c(min(p1$breaks, p2$breaks), max(p1$breaks, p2$breaks))
plot( p1, col=rgb(0,0,1,1/4), xlim = xlim, ylim=c(0,0.25), xlab="McCabe Complexity",main="",freq = FALSE)
plot( p2, col=rgb(1,0,0,1/4), add=T,freq = FALSE)
legend("topright", c("Without Bugs", "With Bugs"), col=c(rgb(0,0,1,1/4), col=rgb(1,0,0,1/4)), lwd=10)
box()

par(mfrow=c(1,2))
boxplot(withoutBugs[,2],log = "y", main="Modules without bugs", ylab="McCabe Score",pars=list(ylim=c(1,50)))
boxplot(withBugs[,2],log = "y", main="Modules with bugs", ylab="McCabe Score",pars=list(ylim=c(1,50)))