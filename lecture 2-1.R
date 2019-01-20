data("mtcars")

"hello world!"

100

n <- 1000





x <- rbinom(n, 10, 0.5)
hist(x)


ls()
rm(x)

x <- seq(1, 20, 0.5)
x

a <- 2
b <- 2
e <- rnorm(length(x), 0, 4)
y <- a + b*x + e
reg <- lm(y~x)
summary(reg)

plot(x, y)
abline(a, b, lty=3, col=3)
abline(reg, lty=1, col=4)
?abline

x2 <- seq(1, 8, 0.05)
e2 <- rnorm(length(x2), 0, 0.5)
y2 <- a + b*sin(x2) + e2
plot(x2, y2)

lpr <- loess(y2~x2)
lines(x2, fitted(lpr), col=2)

ls()
rm(list=ls())