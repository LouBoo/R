# Time series and forecasting

setwd("D:/Documents (Louis Booth)/R/data")
excaus <- read.csv("EXCAUS.csv", stringsAsFactors = FALSE)
head(excaus)
str(excaus)
excaus$DATE <- as.Date(excaus$DATE)
excaus$Time <- format(excaus$DATE, format="%y/%m")
excaus <- excaus[,c(3,2)]

excaus1 <- mean(excaus[excaus$Time > 16/01,2])

# Use ts() function
excaus <- ts(excaus$EXCAUS, start=c(2008, 1), end=c(2018, 4), frequency=12)
str(excaus)
start(excaus)
end(excaus)
frequency(excaus)
summary(excaus)

plot(excaus, col="blue", lwd=3, ylab="Exchange Rate")
abline(reg=lm(excaus~time(excaus)), lwd=3)

# display yearly averages
plot(aggregate(excaus, FUN=mean))

# Box plot across months will give us a sense of seasonal effect
boxplot(excaus~cycle(excaus))

exuseu <- read.csv("EXUSEU.csv", stringsAsFactors = FALSE)
exeuus <- (exuseu$DEXUSEU)^(-1)
exeuus <- ts(exeuus, start=c(2008, 4), end=c(2018, 3), frequency=12)
plot(excaus, col="blue", lwd=3, ylim=c(0.6,1.5), ylab="Exchange Rate")
lines(exeuus, col="red", lty=2, lwd=3)

legend("topleft", legend=c("CAD/USD", "EUR/USD"), col=c("blue", "red"), lty=c(1,2), lwd=3)

title(main="Exchange Rate")

# Seasonal Decomposition

# A time series with additive trend, seasonal, and irregular component can be decomposed
# using the stl() function

# For additive time series
# Yt=St+Tt+Et
# For multiplicative time series
# Yt=St*Tt*Et

# Note that a series with multiplicative effects can often be transformed
# into series with additive effects through a log transformation (i.e., newts <- log(myts))

# Seasonal Decomposition
seasDecom <- stl(log(excaus), s.window="periodic")
plot(seasDecom, lwd=3)

summary(seasDecom)
seasDecom

# Use gdp data from https://fred.stlouisfed.org/series/GDP