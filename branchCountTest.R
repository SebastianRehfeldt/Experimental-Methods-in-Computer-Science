library(exactRankTests)
a <- withBugs$branchCount[sample(1:nrow(withBugs), 1000, replace=FALSE)]
b <- withoutBugs$branchCount[sample(1:nrow(withoutBugs), 1000, replace=FALSE)]
perm.test(a, b, paired=FALSE, alternative="greater", exact=TRUE)

c <- a-b
length(which(c>0))