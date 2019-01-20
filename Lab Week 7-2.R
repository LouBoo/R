president <- c("Obama:2009-2007", "Bush:2001-2009", "Clinton:1993-2001", "Bush:1989-1993", "Reagan:1981-1989")
president_term <- strsplit(president, ":")
president_upper <- lapply(president_term, toupper)
class(president_upper)

select_first <- function(x) {
  x[1]
}

lapply(president_upper, select_first)





n <- nrow(mtcars)
x <- mtcars$wt
y <- mtcars$mpg

beta.omitting.one = function(i, x, y) {
  reg <- lm(y[-i]~x[-i])
  return(reg$coefficient[2])
}

beta.jack = sapply(1:n, FUN=beta.omitting.one, x=mtcars$wt, y=mtcars$mpg)
sqrt((n-1)^2/n) * sd(beta.jack)



reg.full <- lm(y~x)
summary(reg.full)
bhat <- reg.full$coefficients[2]
num <- sum(((x - mean(x))^2)*(reg.full$residuals^2))/n
den <- sum((x - mean(x))^2)/(n-1)
sqrt(num)/sqrt(n)*den



B <- 999
bstar <- c()

for (b in 1:B) {
  index <- sample(1:n, size=n, replace=TRUE)
  xstar <- mtcars$wt[index]
  ystar <- mtcars$mpg[index]
  regstar <- lm(ystar~xstar)
  bstar[b] <- regstar$coefficients[2]
}

sd(bstar)