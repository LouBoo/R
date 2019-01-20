setwd("D:/Documents (Louis Booth)/R/data")
gdp <- read.csv("GDP.csv", stringsAsFactors = FALSE)
head(gdp)
str(gdp)
gdp$DATE <- as.Date(gdp$DATE)
str(gdp)
gdp$Time <- format(gdp$DATE, format="%y/%m")
gdp <- gdp[,c(3,2)]

gdp1 <- mean(gdp[gdp$Time > 47/01,2])

gdp <- ts(gdp$GDP, start=c(1947, 01), end=c(2017, 04), frequency=4)
str(gdp)
start(gdp)
end(gdp)
frequency(gdp)
summary(gdp)

pdf(file="time series 2.pdf")

plot(gdp, col="blue", lwd=3, ylab="GDP")
abline(reg=lm(gdp~time(gdp)), lwd=3)

plot(aggregate(gdp, FUN=mean))

boxplot(gdp~cycle(gdp))

plot(gdp, col="blue", lwd=3, ylab="GDP")

legend("topleft", legend="GDP", col="blue", lty=1, lwd=3)

title(main="GDP")

seasDecom <- stl(log(gdp), s.window="periodic")
plot(seasDecom, lwd=3)

summary(seasDecom)
seasDecom





laggedex <- lag(gdp, 1)
dif <- diff(gdp,1)
plot(dif)

##install.packages("tseries")
library(tseries)
adf.test(gdp, alternative="stationary")
adf.test(diff(log(gdp)), alternative="stationary")

y <- rep(NA,5*4)
set.seed(pi)
y[1] <- rnorm(1)

for (i in seq(2,5*4,1)) {
  y[i] <- 1 + 1*y[i-1] + rnorm(1)
}

y_ts <- ts(y, start=c(1947,1), end=c(2017,4), frequency=4)
plot(y_ts)
acf(y_ts)

acf(gdp)
acf(diff(log(gdp)))
pacf(diff(log(gdp)))

fit <- arima(log(gdp), c(0,1,1), seasonal=list(order=c(0,1,1), period=4))  
pred <- predict(fit,n.ahead=5*4)
ts.plot(gdp, exp(pred$pred), log='y', lty=c(1,3), col=c("black", "blue"), lwd=3)

dev.off()