linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(linkedin) <- week
names(facebook) <- week

if ((sum(linkedin)/length(linkedin)) > (sum(facebook)/length(facebook))) {
  cat("You are more popular on linkedin than on facebook")
} else {
  cat("You are more popular on facebook than on linkedin")
}



li <- 15
fb <- 9

if (fb >= 15 & li >= 15) {
  sns <- 2*(li + fb)
} else if (fb < 10 & li < 10) {
  sns <- .5*(li + fb)
} else {
  sns <- (li + fb)
}



x <- c(0, 5)
i <- 2

while (abs(x[i] - x[i-1]) > 0.0001) {
  x[i+1] <- x[i] - ((x[i] - 1)^3 + 0.5*(x[i]^2) - x[i] - 2)/(3*(x[i] - 1)^2 + x[i] - 1)
  i <- i + 1
}
cat("The solution to the equation (x-1)^3 + 0.5*(x^2) - x - 2 = 0 is x=", x[i])
