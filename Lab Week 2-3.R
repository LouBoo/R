set.seed(2)
x <- rchisq(20, 5)
e <- rnorm(length(x), 0, 5)
y <- 3 + 2*x +e
x_bar <- mean(x)
y_bar <- mean(y)
numerator <- sum((x - x_bar) * (y - y_bar))
denominator <- sum((x - x_bar)^2)
b_hat <- numerator/denominator
b_hat
lm(y~x)
rm(b_hat, denominator, e, numerator, x, x_bar, y, y_bar)



vector1 <- rbinom(100, 1, 0.5)
vector2 <- sample(c(-1, 0, 1), 100, replace = TRUE)
same <- which(vector1 == vector2)
print(same)
rm(same, vector1, vector2)



poker_vector <- c(140, -50, 20, -120,  240)
roulette_vector <- c(-24, -50, 100, 350, 10)
days_vector <- c("Mon", "Tues", "Wed", "Thu", "Fri")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
poker_midweek <- poker_vector[c("Tues", "Thu")]
ave_poker_midweek <- mean(poker_midweek)
max(poker_vector)
which.max(poker_vector)
which(poker_vector > roulette_vector)
total <- poker_vector + roulette_vector
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)
total_poker > total_roulette
rm(ave_poker_midweek, days_vector, poker_midweek, poker_vector, roulette_vector, total, total_poker, total_roulette)



set.seed(0)
num <- sample(c(1:10), 1000, replace = TRUE)
num
a <- sample(c(1:1000), 20, replace = TRUE)
a
num1 <- replace(num, num == c(1:10), NA)
num1
missing <- is.na(num1)
missing1 <- which(missing == TRUE)
missing1
rm(a, missing, missing1, num, num1)

set.seed(pi)
num <- sample(c(1:10), 1000, replace = TRUE)
num
a <- sample(c(1:20), 20, replace = TRUE)
a
num_1 <- which(num %in% c(1:10))
num_1
b <- match(num_1, a, nomatch = 0)
b
b2 <- replace(b, b != 0, NA)
b2
matches <- which(b2 %in% NA)
matches
rm(a, b, b2, matches, num, num_1)
