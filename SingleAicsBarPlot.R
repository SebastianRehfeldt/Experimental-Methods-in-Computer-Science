# This script needs the result of SingleAics to work correctly
require(plotrix)

switch = "org"

if (switch == "org") {
  usedData = aic_values
} else if (switch == "log") {
  usedData = log_aic_values
}

data = c(0);
titles = c("");
for (i in 1:length(usedData[,2])) {
  data[i+1] = as.numeric(usedData[i,2])
  titles[i+1] = usedData[i,1]
}
# Set margins
par(mar = c(8,2,2,1) + 0.1)

# Draw barplot
if (switch == "org") {
  # For original data
  gap.barplot(data, gap=c(100,8200), ytics=c(0,8400, 8600, 8800, 9000), ylim=c(0,1000), ylab="",main="AIC values with different metrices with logarithmic and original data", col=c("white"), xlab="", xlim=c(1.5,length(data)+0.5), xaxlab = c(-1,1:(length(data)-1)), xaxs = "i", xaxt="n", yaxs = "i")
} else if (switch == "log") {
  # For logarithmic data
  gap.barplot(data, gap=c(100,8200), ytics=c(0,8200, 8400, 8600, 8800, 9000), ylab="",main="AIC values of logarithmic data with different metrices", col=c("white"), xlab="", xlim=c(1.5,length(data)+0.5), ylim=c(0,1000), xaxlab = c(-1,1:(length(data)-1)), xaxs = "i", xaxt="n", yaxs = "i")
}


# Set X-axis labels
axis(1, labels=titles, at = seq(1, length(titles), by = 1), las=2, cex.axis=0.75)

