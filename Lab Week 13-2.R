set.seed(0)
n <- 1000
R = c(0.5, 2)
prob <- c(0.7, 0.3)
rain <- sample(R, n, replace = TRUE, prob = prob)

comm_dr = rexp(n = n, rate = 1/rain) + 1
comm_tr = rexp(n = n, rate = 1) + 3

x.range = range(c(comm_dr, comm_tr))
breaks = seq(min(x.range), max(x.range), length = 20)

setwd("D:/Documents (Louis Booth)/R/graphics")
pdf("histograms with lines.pdf")

hist(comm_dr, breaks = breaks, probability = TRUE, xlim = x.range,
     col = "red", xlab = "Commute Time",
     main = "Comparison of Commute", ylim = c(0, 1))

hist(comm_tr, breaks=breaks, probability=TRUE, col=rgb(1,0,0,0.2), add=TRUE)

lines(density(comm_dr), lwd=2, col=4)
lines(density(comm_tr), lwd=2, col=3)
legend("topright", legend=c("Drive","Train"), lty=1, lwd=2, col=4:3)

dev.off()

mean((comm_dr - comm_tr) > 0)
var(comm_dr) - var(comm_tr)