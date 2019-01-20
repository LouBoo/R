setwd("P:/R/data")
rev_exp0 <- read.csv("district_rev_exp.csv", na.strings = "-")
head(rev_exp0)
rev_exp0$STATE <- as.factor(rev_exp0$STATE)
aggregate(rev_exp0$TOTALREV, by=list(rev_exp0$STATE), na.rm=TRUE, FUN=mean, trim=0.2)





x_y <- function(x,y) {
  xy <- (x+y) - 1/(x+y)
  if (x+y == 0) {
    return(0)
  } else {
    return(xy)
  }
}

x_y(-2,2)
x_y(2,2)





fun <- function(x) {
  y <- x^3 + 2*x + 5
}

fun_der <- function(x) {
  yder <- 3*x^2 + 2
}

curve(fun, xlim=c(-2,2), col = 'blue', lwd = 2, lty = 2, ylab = 'f(x)')

abline(h=0)
abline(v=0)

nr <- function(f, fder, int) {
  x <- c(int-5, int)
  i <- 2
  while(abs(x[i] - x[i-1]) > 0.0001) {
    x[i+1] <- x[i] - fun(x[i])/fun_der(x[i])
    i <- i +1
  }
  x[i]
}

nr(fun, fun_der, int=5)