# Data structure: 2. Matrix

#Matrix is a two-dimensional array of numbers and strings.
mymat <- matrix(data = 1:30, nrow = 3, ncol = 10)     #mymat <- matrix (1:30, 3, 10)
mymat
mymat1 <- matrix(1:30, 3, 10, byrow = TRUE)
mymat1
mymat1_1 <- matrix(mymat1, 30, 1)

is.matrix(mymat)
class(mymat)

mymat2 <- matrix(state.abb, 5, 10)
dim(mymat2)
nrow(mymat2)                        #the number of rows
ncol(mymat2)                        #number of columns
length(mymat2)                      #the number of elements

#Define names of the columns and rows
rownames(mymat) <- LETTERS[1:3]
colnames(mymat) <- letters[1:10]
mymat

#Submatrix selection
mymat1[c(1, 3), ]
mymat1[2:3, c(3, 5)]

col(mymat1)
row(mymat1)
mymat_up <- col(mymat1) >= row(mymat1)
mymat_up <- col(mymat1) >= (row(mymat1) +3)
mymat_up
mymat1[mymat_up]                  #vector
mymat1 * mymat_up

#Matrix operations
trans_mymat <- t(mymat)
ele_pro <- mymat1 * mymat         #hadamard (entrywise) multiplication
mat_pro <- t(mymat1) %*% mymat
mat_pro2 <- crossprod(mymat1, mymat)  #since the second argument is the same
mymat / mymat1                        #elementwise

sum(mat_pro)                      #Sum of all the elements
colSums(mymat)                    #colMeans(mymat), rowMeans(mymat)
rowSums(mymat)

#Combine matrices
cbind(mymat, mymat1)
rbind(mymat, mymat1)
