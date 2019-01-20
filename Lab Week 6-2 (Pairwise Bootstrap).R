plot(mtcars$wt, mtcars$mpg)
x <- mtcars$wt
y <- mtcars$mpg

reg <- lm(y~x)
abline(lm(reg))

bhat <- reg$coefficients[2]
n <- nrow(mtcars)
num <- sum(((x - mean(x))^2)*(reg$residuals^2))/n
den <- sum((x - mean(x))^2)/(n-1)
se <- sqrt(num)/den

t <- sqrt(n)*bhat / se

B <- 999
bstar <- rep(NA, B)
tstar <- rep(NA, B)

for (b in 1: B) {
  index <- sample(1:32, 32, replace=TRUE)
  X <- x[index]
  Y <- y[index]
  reg <- lm(Y~X)
  bstar[b] <- reg$coefficients[2]
  n <- nrow(mtcars)
  num <- sum(((X - mean(X))^2)*(reg$residuals^2))/n
  den <- sum((X - mean(X))^2)/(n-1)
  se <- sqrt(num)/den
  tstar[b] <- sqrt(n)*(bstar[b]-bhat) / se
}

tstar <- sort(tstar, decreasing = TRUE)
tstar[975]
tstar[25]
t

tstar[975] < t
tstar[25] > t