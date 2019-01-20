# Matrix Algebra

A <- matrix(rnorm(25), 5, 5)
A
t(A)
diag(A)

diag(c(1,1,1,1))

Ainv <- solve(A)
round(A %in% Ainv, digit=3)

# inverse matrix
b <- 1:5
x <- solve(A,b) # solve b = Ax
x

solve(A)%*%b

B <- t(A)%*%A

eigen.B <- eigen(B)
eigen.B