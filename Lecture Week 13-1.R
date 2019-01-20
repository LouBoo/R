# Programming a derivative

# 1. Find a derivative of f(x)=sqrt(x) at x=5

1/(2*sqrt(5))

h <- 1e-8
x <- 5
f_prime5 <- (sqrt(x+h)-sqrt(x))/h

# make a function for general derivative function

f <- function(x) {
  f <- sqrt(x)
  return(f)
}

x <- 5
f_der <- function(x, f) {
  h <- 1e-8
  f_der <- (f(x+h)-f(x))/h
  return(f_der)
}

f_der(x=5, f=f)

# 2. Find an integral of f(x)=sqrt(x) in x=(0,5)

x <- c(0,5)
h <- 0.00001
area <- 0
for(i in seq(from=x[1], to=x[2]-h, by=h)) {
  area <- area + h*sqrt(i)
}
area
2/3 * 5^(3/2)

# make a function for general integration

g <- function(x) {
  g <- exp(x)
  return(g)
}

g_int <- function(x, g) {
  h <- 0.00001
  area <- 0
  for(i in seq(from=x[1], to=x[2]-h, by=h)) {
    area <- area + h*g(i)
  }
  return(area)
}

g_int(x=x, g=g)

# Linear programming

# mathematical technique for maximizing or minimizing a linear function of se
# example: maximize profit, minimize cost

# optimize the value of a linear function with a set of linear constraints
# max z=c1*x1+...+cn*xn               # xi is called decision variables
# s.t. a1*x1+...+an*xn < d1
#      b1*x1+...+bn*xn < d2
# Solution: LP Problem is generally solved using the Simplex Method

# Example:
# f(x,y) = x + y
# s.t. 2x + y =< 20, x + 3y =< 20, x => 0, y => 0

install.packages("lpSolve")
library(lpSolve)

obj.fun <- c(1,1)
const <- matrix(c(2,1,1,3,1,0,0,1), ncol=2, byrow=TRUE)
const.dir <- c("<=", "<=", ">=", ">=")
rhs <- c(20, 20, 0, 0)

prod.sol <- lp("max", obj.fun, const, const.dir, rhs)
prod.sol$solution