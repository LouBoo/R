m1 <- c(0,1/3,1/3,1/3)
m2 <- c(0,0,1/2,1/2)
m3 <- c(1,0,0,0)
m4 <- c(1/2,0,1/2,0)

M <- cbind(m1,m2,m3,m4)

p1 <- c(0,0,0,0)
p2 <- c(0,1,0,0)

P <- cbind(p1,p2)

T <- 2
while (sum(abs(P[,T]-P[,T-1])) > 0.001) {
  P <- cbind(P,rep(0,4))
  P[,T+1] <- M%*%P[,T]
  T <- T + 1
}
P[,T]
sum(P[,T])




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

fun <- function(M) {
  while (sum(abs(P[,T]-P[,T-1])) > 0.001) {
    P <- cbind(P,rep(0,1000))
    P[,T+1] <- M%*%P[,T]
    T <- T + 1
  }
      return(P[,T])
}
fun(M)
sum(P[,T])
