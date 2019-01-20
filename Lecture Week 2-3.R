weight <- c(60, 72, 57, 90, 95, 72)
weight
is.vector(weight)
is.numeric(weight)
name <- c("Tom", "JOhn", "Victor", "Ivan", "Brendan", "Andres")
names(weight) <- name
weight
mu <- mean(weight)
sigma2 <- sum((weight - mu)^2)/(length(weight)-1)
sigma <- sd(weight)        #or use sqrt(sigma2)
total <- sum(weight)
med <- median(weight)
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight/height^2
bmi


1:3
1:3 + 1:3
1:3 * 1:3
1:3*2
(1:3)*2
1:3^2
(1:3)^2
c(2, 8, 9)/1:3
abs(-2:2)
sqrt(c(81, 100, 121))
x <- exp(1:3)
log(x)


x <- c(10, 5, 3, 4, 9)
y <- c(x, x, 1)
v <- 2*x + y + 1


x1 <- seq(4, 9)
x2 <- seq(4, 10, 2)    # Or  x2 <- seq(from=4, to=10, by=2)
x3 <- 4:9
x4 <- rep(x1, 3)
x5 <- rep(x2, 1:4)     #4 repeated once, 6 repeated twice, 8 repeated 3 times, 10 repeated 4 times
x6 <- c(x3, NA)
is.na(x6)

mean(x6)
mean(x6, na.rm=TRUE)  #remove NA values


set.seed(pi)

z <- runif(20, min = -1, max = 1)
z1 <- z[1:10]
z2 <- z[-(1:10)]    # "-" means "other than", other than first 10 elements in this case   Or z2 <- z[11:20]
print(min(z))
mini <- which.min(z)
print(mini)
print(z[mini])
print(which(z>0))

x <- rep(NA, 6)
x[2*(1:3)] <- (1:3)^2
x[2*(1:3)-1] <- -(1:3)^2

weight
weight[c("Tom", "Victor")]



x <- c(1.3411, 4.603, 3.5)
x_round1 <- round(x)
x_round2 <- round(x, 2)
x_floor <- floor(x)
x_ceiling <- ceiling(x)
