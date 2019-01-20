pdf(file="plots.pdf")


n = 50
set.seed(0)
x = sort(runif(n, min=-2, max=2))
y = x^3 + rnorm(n)
plot(x, y, type="p")
plot(x, y, type="l")


plot(x, y, main="Shrunken points", cex=0.5)
plot(x, y, main="Expanded points", cex=2)


plot(x, y, xlim=c(-1, 1), ylim=c(-5, 5), xlab="Trimmed x", ylab="Trimmed y")


x.trimmed.index <- which(x>=-1 & x<=1)
x.trimmed <- x[x.trimmed.index]
y.trimmed <- y[x.trimmed.index]
plot(x.trimmed, y.trimmed)


plot(x, y, pch=20)
plot(x, y, pch=21)
plot(x, y, pch=c(21, 20))


x2 = sort(runif(n, min=-2, max=2))
y2 = x2^2 + rnorm(n)
plot(x, y, main="x and y", xlab="x", ylab="y")
points(x2, y2, pch=20, col="blue")
lines(x2, y2, pch=20, col="red", lwd=2)
legend(1.4, -4, legend=c("Cubic", "Quadratic"), col=c("black", "blue"), pch=c(21, 20), cex=0.8)


x <- 1:10
y1 <- x^2
y2 = 2*y1
plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
lines(x, y2, pch=18, col="blue", type="b", lty=2)
legend(1, 95, legend=c("Line 1", "Line 2"), col=c("red", "blue"), lty=1:2, cex=0.8)
text(1, 50, labels="hello")
text(1, 5, labels="MSQE")


dev.off()