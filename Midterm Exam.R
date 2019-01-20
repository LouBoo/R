# Q1
#(1)
setwd("P:/R")
county <- read.csv("county_data.csv", stringsAsFactors = FALSE, na.strings = "")
county_pop <- county[c("State", "County", "TotalPop")]
county_pop$State <- as.factor(county_pop$State)
max_county_pop <- aggregate(county_pop[, c("TotalPop")], list(county_pop$State), max)
index <- match(max_county_pop$x, county$TotalPop)
max_county_pop$x <- county_pop$County[index]
population <- aggregate(county_pop[, c("TotalPop")], by=list(county_pop$State), max)
max_county_pop <- cbind(max_county_pop, population$x)
names(max_county_pop) <- c("State", "County", "TotalPop")
total_pop_178942 <- county_pop[county_pop$TotalPop == 178942,]
max_county_pop$County[43] <- total_pop_178942[2,2]
max_county_pop


#(2)
rank <- order(county_pop[, "TotalPop"], decreasing=TRUE)
county_pop_ordered <- county_pop[rank,]
quant <- quantile(county_pop_ordered$TotalPop, probs=c(.9))
top_10_pct <- county_pop_ordered[county_pop_ordered$TotalPop >= quant,]
median <- median(top_10_pct$TotalPop)
mean <- mean(top_10_pct$TotalPop)
names(median) <- c("Median")
names(mean) <- c("Mean")
mean
median



# Q2
x <- matrix(rnorm(100), nrow=10, ncol=10)
min <- apply(x, MARGIN=1, FUN=min)
names(min) <- c("Row 1 Min", "Row 2 Min", "Row 3 Min", "Row 4 Min", "Row 5 Min", "Row 6 Min", "Row 7 Min", "Row 8 Min", "Row 9 Min", "Row 10 Min")
min



# Q3
fun <- function(x, y) {
  x <- county$Men/county$Women
  x2 <- x ** 2
  y <- county$Unemployment
  reg <- lm(y ~ x + x2)
  return(reg$coefficients)
}
fun(x, y)