# Exercise
# 1. Take a derivative of the cdf of N(2, 2^2) at x=0.

x <- 0
cdf <- function(x) {
  cdf <- pnorm(x, 2, 2^2)
  return(cdf)
}

cdf_der <- function(x, cdf) {
  h <- 1e-8
  cdf_der <- cdf(x+h)-cdf(x)
  return(cdf_der)
}

cdf_der(x=x, cdf=cdf)

pnorm(1e-8, 2, 2^2)-pnorm(0, 2, 2^2)





# 2. Calculate the volume of a half sphere with a radius of 1.

x <- c(0,1)
r <- 1

s <- function(r, x) {
  s <- (pi * (r^2 - x^2))
  return(s)
}

sphere_int <- function(x, s) {
  h <- 0.00001
  area <- 0
  for(i in seq(from=x[1], to=x[2]-h, by=h)) {
    area <- area + h*s(r, i)
  }
  return(area)
}

sphere_int(x, s)





# 3. Find maximizer of the following
# (1) The effects on revenue for each advertisement is $200 and $600
# Objective: f(x,y) = 200x + 600y
# (2) The price for each advertisement is $150 and $100 and total expense
# for this cannot be more than $10000
# S.t. 150x + 100y <= 10000
# (3) The price for models for each advertisement is $50 and $300 and total
# expense for this cannot be more than $10000
# S.t. 50x + 300y <= 10000
# (4) At least we should have 95 advertisements in total
# x >= 0, y >= 0, x + y >= 95

##install.packages("lpSolve")

library(lpSolve)

obj.fun <- c(200,600)
const <- matrix(c(150, 100, 50, 300, 1, 1, 1, 0, 0, 1), ncol=2, byrow=TRUE)
const.dir <- c("<=", "<=", ">=", ">=", ">=")
rhs <- c(10000, 10000, 95, 0, 0)

prod.sol <- lp("max", obj.fun, const, const.dir, rhs)
prod.sol$solution