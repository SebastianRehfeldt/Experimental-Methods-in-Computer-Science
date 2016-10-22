# This script needs the result of LogReg.R to work correctly
# You can also use

require(plotrix)

data = c(0);
titles = c("");
for (i in 1:length(res[,2])) {
  data[i+1] = as.numeric(res[i,2])
  titles[i+1] = res[i,1]
}

# Set margins
par(mar = c(8,2,2,1) + 0.1)

# Draw barplot
gap.barplot(data,
            gap=c(100,8400),  # Break Y-axis
            ytics=c(0,8400, 8600, 8800, 9000), # Set Y-axis ticks
            ylab="",main="AIC values with different metrices", col=c("white"), xlab="",
            xlim=c(1.5,length(data)+0.5), ylim=c(0,800), xaxlab = c(-1,1:(length(data)-1)), xaxs = "i", xaxt="n", yaxs = "i"
)

# Set X-axis labels
axis(1, labels=titles, at = seq(1, 22, by = 1), las=2, cex.axis=1)

