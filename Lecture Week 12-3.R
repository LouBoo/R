rm(list-ls())


# simple DGP
e <- rnorm(100, 0, 0.1)
x1 <- runif(100, min=2, max=5)
x2 <- runif(100, min=-1, max=4)
x3 <- rnorm(100, 3, 2)
y1 <- 5*x1 - 3*x2 + 9*x3 + e
data1 <- as.data.frame(cbind(y1,x1,x2,x3))


# OLS
lm(y1 ~ x1 + x2 + x3, data=data1)


# Optimization
obj1 <- function(beta, dataset) {
  
  y <- dataset[,1]
  x1 <- dataset[,2]
  x2 <- dataset[,3]
  x3 <- dataset[,4]
  res <- t(y - beta[1]*x1 - beta[2]*x2 - beta[3]*x3)%*%(y - beta[1]*x1 - beta[2]*x2 - beta[3]*x3)
  return(res)
}


# Optimization (more than one dimension)
optim(c(0,0,0), obj1, dataset=data1)
optim(c(0,0,0), obj1, dataset=data1, method="BFGS", control=list(trace=TRUE))
optim(c(0,0,0), obj1, dataset=data1, method="Nelder-Mead", control=list(trace=TRUE, maxit=3000, abstol=1e-5))


# Optimization (one dimension)
optimize(function(x) (x-pi)^2, c(0, 10))


# Nonlinear optimization
# simple DGP
y2 <- 1/(1 + exp(-(3 + 7*x1))) + e
data2 <- as.data.frame(cbind(y2,x1))

obj2 <- function(beta, dataset) {
  
  y <- dataset[,1]
  x1 <- dataset[,2]
  
  yhat <- 1/(1 + exp(-(beta[1] + beta[2]*x1)))
  
  res <- t(y - yhat)%*%(y - yhat)
  
  return(res)
}


optim(c(1,1), obj2, dataset=data2, method="BFGS")
optim(c(1,1), obj2, dataset=data2, method="Nelder-Mead")


# Nonlinear optimization function
nlm(obj2, c(1,1), dataset=data2)
nlminb(c(1,1), obj2, dataset=data2, lower=c(1,1), upper=c(5,9))


# Something you need to know
y3 <- 5*x1/(1 + 3*x2 + 9*x3) + e
data3 <- as.data.frame(cbind(y3,x1,x2,x3))

obj3 <- function(beta, dataset) {
  y <- dataset[,1]
  x1 <- dataset[,2]
  x2 <- dataset[,3]
  x3 <- dataset[,4]
  yhat <- beta[1]*x1/(1 + beta[2]*x2 - beta[3]*x3)
  res <- t(y - yhat)%*%(y -yhat)
  return(res)
}

optim(c(1,1,1), obj3, dataset=data3, method="BFGS")
optim(c(1,1,1), obj3, dataset=data3, method="Nelder-Mead")

nlm(obj3, c(1,1,1), dataset=data3)



# ggplot2
# install.packages("ggplot2")
# install.packages("gridExtra")
library(ggplot2)
library(gridExtra)

X <- seq(-3,3,length.out=100)
Y1 <- dnorm(X,0,1)
Y2 <- dnorm(X,0,0.5)

# Scatter plot
ggplot(NULL,aes(x=X))+ ggtitle("Normal Distribution") + geom_point(aes(y=Y1, col="N(0,1)"), size=1)

# Add line
ggplot(NULL, aes(x=X)) + ggtitle("Normal Distribution") + geom_point(aes(y=Y1, col="N(0,1)"), size=1) + geom_line(aes(y=Y2, col="N(0,0.5)"), size=1, linetype="solid")

# 





