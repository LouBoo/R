# while loop + if else

j <- 0
k <- 0
# Extend/adapt thw hile loop
while (j < 5 & k <5) {
  a <- sample(c("Head", "Tail"), size = 1)
  b <- sample(c("Head", "Tail"), size = 1)
  print(paste("Tome chooses", a, "and John chooses", b))
  if (a==b) {
    print("Tome wins!")
    j <- j + 1
  } else {
    print("John wins!")
    k <- k + 1
  }
}
print(paste("Tom won", j, "times and John won", k, "times."))

# for loop

# for loop is used to repeat a block of code in the loop as many times as specified


# syntax

# for (var in sequence) {
# statement
# }

# Sequence is a vector. In each iteration, var takes on a value of sequence in order in each round
# and statement is evaluated

Econ5495 <- c("Zaur", "Rob", "Louis", "Tim", "Hanli", "Chris", "Jieun", "Xizi", "Busra", "Jinsoon", "Xuanye", "Chaoyuan", "Yiyan", "Rui", "Tyler", "Kenn", "Alexandra", "Di", "Zhonghui", "Lindsay")

for (i in Econ5495) {
  print(paste("hello", i))
}

for (i in 1:length(Econ5495)) {
  print(paste("Hello", Econ5495[i]))
}

# break statement:
# break is used inside a loop (for, while) to stop the iterations and get out of the loop

x <- seq(-6, 6, by=0.01)
y <- x^3 + 2*x
plot(x, y, type="l")

x <- 5

for (i in 1:1000) {
  x[i+1] <- x[i] - (x[i]^3 + 2*x[i])/(3*x[i]^2 + 2)
  print(i)
  if (abs(x[i+1] - x[i]) < 0.0001) {
    break
  }
}
print(paste("The solution to the equation x^3 + 2*x = 0 is x=", x[i]))

# Next statement
# A next statement is useful when we want to skip the current iteration of a loop without
# terminating it. On encountering next, the R skips further evaluation and starts
# next iteration of the loop.

Econ5495 <- c("Zaur", "Rob", "Louis", "Tim", "Hanli", "Chris", "Jieun", "Xizi", "Busra", "Jinsoon", "Xuanye", "Chaoyuan", "Yiyan", "Rui", "Tyler", "Kenn", "Alexandra", "Di", "Zhonghui", "Lindsay")
Econ5495.boy <- c("Zaur", "Rob", "Louis", "Tim", "Chris", "Xizi", "Jinsoon", "Chaoyuan", "Tyler", "Kenn")
Econ5495.girl <- NULL

for (i in 1:length(Econ5495)) {
  if (Econ5495[i] %in% Econ5495.boy) {
    next
  }
  Econ5495.girl <- paste(Econ5495.girl, Econ5495[i])
}

print(paste("Girls in Econ 5495 are", Econ5495.girl))

# for loop in a matrix
# We can employ a for loop inside a for loop

# syntax
# for (var1 in sequence 1) {
#   for (var2 in sequence 2) {
#     statement
#   }
# }

oil.shock <- rnorm(10, 0, 1)
state.characteristic <- runif(5, -1, 1)

Economy <- matrix(rep(NA, 100), 10, 5)
rownames(Economy) <- 2000:2009
colnames(Economy) <- state.abb[1:5]

for (i in 1:length(oil.shock)) {
  for (j in 1:length(state.characteristic)) {
    Economy[i,j] <- as.numeric(oil.shock[i]*state.characteristic[j] > 0)
  }
}

Economy

# Alternative way to for loop: matrix operation

oil.shock.mat <- matrix(rep(oil.shock, 5), 10, 5)
state.characteristic.mat <- matrix(rep(state.characteristic, 10), 10, 5, byrow=TRUE)

Economy1 <- (oil.shock.mat*state.characteristic.mat > 0)*1
rownames(Economy1) <- 2000:2009
colnames(Economy1) <- state.abb[1:5]

Economy1