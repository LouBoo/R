eigen.M <- eigen(M)

vec.temp <- eigen.M$vectors[,1]
vec.temp

vec.temp <- RE(vec.temp)

eig.vec <- vec.temp/sum(vec.temp)
eig.vec

pr2 <- function(x) {
  eigen.M <- eigen(M)
  
  vec.temp <- eigen.M$vectors[,1]
  vec.temp <- Re(vec.temp)
  
  eig.vec <- vec.temp/sum(vec.temp)
  plot(eig.vec, type="h")
  return(eig.vec)
}



ind <- 1:1000
T <- 2
M <- matrix(rep(0,1000^2), nrow=1000, ncol=1000)
P <- matrix(rep(0,1000), nrow=1000, ncol=2)
P[2,2] <- 1
for (i in 1:1000) {
  a <- sample(x=1:10, size=1)
  b <- sample(x=1:1000, size=a)
  M[b,i] = 1/a
}

pr.1 <- pr1(M)
pr.2 <- pr2(M)