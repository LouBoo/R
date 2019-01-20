# Simulation: imitation of the operation of a real-world process using some model and computation.

# Example: Coin tossing. Suppose that you play a coin tossing game and want to know what the probability of winning is.

Win_you <- 0
Win_Min <- 0
trial <- 2000

for (i in 1:trial) {
  you <- 4
  Min <- 12
  while (you > 0 & Min > 0) {
    a <- sample(1:2, 1)
    if (a == 1) {
      you <- you + 1
      Min <- Min - 1
    } else {
      you <- you - 1
      Min <- Min + 1
    } 
  }
  if (you == 0) {
    Win_Min <- Win_Min + 1
  } else {
    Win_you <- Win_you + 1
  }
}

print(c(Win_you, Win_Min)/trial)

# Online advertisement model

# Suppose we had a model about how effective online advertisement is for sales compared to TV advertisement.
# We believe that if we do online advertisement instead of TV advertisement sales_online ~ chisq(3, unif(5,9)), 
# The second parameter is noncentrality parameter which is sum of squared means. sum(mu_i^2)
# And if we spend that money on TV advertisement sales_TV ~ chisq(5, 1)

# Which one yields better sales?

# Answer used to be: get out your pen and paper, make some approximations
# Answer is now: simulate from the model, no approximations required!

# Simulate, supposing we have 1000 different markets.  

set.seed(0)
n = 1000 
ncp = runif(n,5,9)
sales_online = rchisq(n=n,df=3,ncp=ncp) 
sales_TV = rchisq(n=n,df=5,ncp=1)

# Find the range of all the measurements together, and define breaks
x.range = range(c(sales_online,sales_TV))
breaks = seq(min(x.range),max(x.range),length=20)

# Produce hist of the non drug measurements, then drug measurements on top
hist(sales_online, breaks=breaks, probability=TRUE, xlim=x.range, 
     col="lightgray", xlab="Sales", 
     main="Comparison of Sales", ylim=c(0,0.15))

# Plot a histogram of the drug measurements, on top
hist(sales_TV, breaks=breaks, probability=TRUE, col=rgb(1,0,0,0.2), add=TRUE) 

# Draw estimated densities on top, for each dist
lines(density(sales_online), lwd=3, col=1)
lines(density(sales_TV), lwd=3, col=2)
legend("topright", legend=c("Online Advertisement","TV Advertisement"), lty=1, lwd=3, col=1:2)

mean((sales_online - sales_TV) > 0)
var(sales_online) - var(sales_TV)

# Endogeneity Bias

bhat <- NA
b0 <- 1
b1 <- 0
rho <- 0.5
for (i in 1:1000) {
  u <- rnorm(100,0,3)
  x <- rho * u + rnorm(100,3,2)
  y <- b0 + b1 * x + u
  reg <- lm(y~x)
  bhat[i] <- coef(reg)[2]
}

MSE <- mean((bhat-0)^2)

# Exercise 

# Suppose that you have a model for your commuting time. In your model, you assume it depends on method and weather.
# If you drive, your commuting time is C = Exp(mean=R)+1, R=2 if it rains, R=0.5 otherwise.
# If you take a train, your commuing time is T = Exp(1)+3.
# Suppose that the chance to have rain is 0.3. 
# Exp denotes the exponential distribution which is often used to characterize the time between events.
# You can generate samples from this distribution using "rexp()" with the rate = 1/R
