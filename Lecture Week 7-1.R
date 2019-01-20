# Function

# input => function => return

#############################
# use a built in function

sd(c(1,5,6,7))

value <- c(1,5,6,7)
sd(value)
my_sd <- sd(value)

?sd

# arguments: X: data (numeric vector), na.rm: logical value. Other than default arguments, you should specify

value <- c(1,5,6,7,NA)
sd(value)

# arguments by position
sd(value, TRUE)

# arguments by name
sd(na.rm=TRUE, x=value)

##############################
# Write a function

# syntax
# my_fun <- function(arg1, arg1, ...) {
# body
# }

sq <- function(x) {
  square <- x^2
  return(square)
}

sq(3)
sq(c(3,4,5))
sq(rbind(c(1,2),c(3,4))) # can use different data types

treatment_effect <- function(tg, cg, trim = FALSE) {
  if (trim) {
    effect <- mean(tg, trim = 0.2) - mean(cg, trim = 0.2)
  } else {
    effect <- mean(tg) - mean(cg)
  }
  variance <- sd(tg)^2 + sd(cg)^2
  t.value <- effect/sqrt(variance)
  if (abs(t.value) > 1.96) {
    print("The average treatment effect is significant")
  } else {
    print("The average treatment effect is not significant")
  }
  result <- list(average_effect=effect, t.value=t.value)
  return(result)
}

# Invoking the function
a <- rnorm(15,5,2)
b <- rnorm(15,0,2)
treatment_effect(a,b)

treatment_effect(tg=a, cg=b, trim = TRUE)
t.value             # variables that are defined in a function are not
                    # accessible outside that function

triple <- function(x) {
  x <- 3*x
  x
}

x <- 4
triple(x)
x

source(file.choose())

test <- function(x) {
  x <- x^2
  return(x)
}
test(2)

############################################
# R packages

# R packages are collections of functions and data sets developed by the community.
# Built in functions such as mean and sd are in the
# base package.
# To use a function, you first need to install packages.
# Base package is automatically installed when you install R

install.packages("ggplot2")

# load package to current work session using library() or require()
search()
library(ggplot2)          # You can also use require(ggplot2)
search()
ggplot(mtcars, aes(x = wt, y= mpg)) + geom_point() + geom_smooth()