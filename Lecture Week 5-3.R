# conditional statement: if and is-else

# Sometimes, we want to run one piece of code if some condition is true, but a
# different piece of code if it is false.  We can do this using if-else statement.

# syntex of if statement
# if condition {
# statement
# }
#

if (3 != 4) {
  print("3 is not equal to 4")
}

if(nchar("boy") < nchar("girl")) {
  print("Girl is taller than boy")
}

if(3 == 4) {
  print("3 is equal to 4")    # nothing executed because the condition doesn't hold
}

# syntax of if-else statement
# if (condition) {
# statement 1
# } else {
# statement 2
# }
#

# The else part is optional and is only evaluated if condition is false. IT is important to know that the
# else must be in the same line as the closing brace of the if statement

set.seed(4)
R <- c("Zaur", "Rob", "Louis", "Tim", "Hanli", "Chris", "Jieun", "Xizi", "Busra", "Jinsoon", "Xuanye", "Chaoyuan", "Yiyan", "Rui", "Tyler", "Kenn", "Alexandra", "Di", "Zhonghui", "Lindsay")
R.boy <- c("Zaur", "Rob", "Louis", "Tim", "Chris", "Xizi", "Jinsoon", "Chaoyuan", "Tyler", "Kenn")
R.girl <- R[!(R %in% R.boy)]

a <- sample(x=R, size=5, replace=FALSE)

if (sum(a %in% R.girl) > sum(a %in% R.boy)) {
  cat("Girls are more than boys in R class")
} else {
  cat("Boys are more than girls in R class")
}

# if (condition 1) {
# statement 1
# } else if (condition 2) {
# statement 2
# } else if (condition 3) {
# statement 3
# } else {
#
# 

player1 <- "rock"
player2 <- "rock"

if








# While loop: Loops are used in programming to repeat a specific block of code.
# While loop repeats as long as the given condition is true.
# Draw a flowchart

# Syntax of while loop
# while (condition) {
# statement
# }

# Example: Initialize the speed variable
speed <- 64
# Code the while loop
while ( speed > 30) {
  cat("Slow down!")
  speed <- speed - 7
}








# Newton-Raphson method for f(x) = x^3 + 2*x
# The Newton-Raphson method is an approach for finding the roots of nonlinear
# equations and is one of the most common root-finding algorithms due to its
# relative simplicity

x <- seq(-3,3, by=0.01)
y <- x^3 + 2*x
plot(x,y, type="l")

x <- c(0, 5)
i <- 2

while (abs(x[i] - x[i-1] > 0.0001) {
  x[i+1] <- x[i] - (x[i]^3 + 2*x[i])/(3*x[i]^2 +2)
  i <- i +1
}
cat("The solution to the equation x^3 + 2*x = 0 is x=", x[i])

# Law of large numbers

xbar <- c(10)
i = 1
mu = 0
while (abs(xbar[i] - mu) > 0.0001) {
  x <- runif(i, -3, 3)
  xbar[i+1] <- mean(x)
  i <- i+1
}

cat("xbar is", round(xbar[i],3))