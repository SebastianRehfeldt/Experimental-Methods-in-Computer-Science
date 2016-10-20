require(plotrix)

data=c(0, 7139, 7401, 7414, 7421, 7423, 7579, 7622, 7636, 7651, 7660, 7664, 7678, 7701, 7729, 7743, 7743, 7749, 7757, 7758, 7803, 7816)
titles =c("", "loc", "iv(g)", "v(g)",  "branchCount", "lOBlank", "b", "lOCode", "lOComment", "t", "uniq_Opnd", "total_Opnd", "ev(g)", "total_Op", "n", "d", "LocCoAndCom.","e", "l", "v", "i", "uniq_Op")

# Set margins
op <- par(mar = c(8,2,2,1) + 0.1) ## default is c(5,4,4,2) + 0.1

gap.barplot(data,gap=c(100,lowest * 0.98),xlab="",ytics=c(0,7000, 7200, 7400, 7600, 7800, 8000),
            ylab="",main="AIC values with differet metrices", col=c("white"),
            xlim=c(1.5,length(twogrp)+0.5), ylim=c(0,1000), xaxlab = c(-1,1:(length(twogrp)-1)), xaxs = "i", xaxt="n", yaxs = "i"
            )
axis(1, labels=titles, at = seq(1, 22, by = 1), las=2, cex.axis=1)

par(op)