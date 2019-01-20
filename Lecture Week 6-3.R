# Pairwise Bootstrap

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
  index <- sample(1:nrow(mtcars), size = n, replace=TRUE)
  xstar <- mtcars$wt[index]
  ystar <- mtcars$mpg[index]
  
  regstar <- lm(ystar~xstar)
  bstar[b] <- regstar$coefficients[2]
  
  numstar <- sum(((xstar - mean(xstar))^2)*(reg$residuals^2))/n
  denstar <- sum((xstar - mean(xstar))^2)/(n-1)
  sestar <- sqrt(numstar)/denstar
  
  tstar[b] <- sqrt(n)*(bstar[b] - bhat) / sestar
}

tstar <- sort(tstar, decreasing = TRUE)
hist(tstar, breaks = 30, probability = TRUE, col = "grey", main = "Distribution of t*", xlim = c(-9, 9))
lines(density(tstar), col = "red", lwd = 3)
cv <- c(tstar[25], tstar[975])
abline(v = c(cv, t), col = c("blue"), lty = c(2, 2, 1), lwd = 3)

print(paste("bhat is", round(bhat, 3)))
print(paste("t stat is", round(t, 3)))
print(paste("5% pairwise bootstrap critical values are", round(cv[1], 3), "and", round(cv[2], 3)))