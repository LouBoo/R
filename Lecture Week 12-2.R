# What is a Stationary Time Series?

# A time series is said to be stationary if it holds the following conditions true

# The mean value of time-series is constant over time, which implies, there is no trend.
# The variance does not change over time
# Seasonality effect is minimal.

# This means there is no trend of seasonal pattern, which makes it look like a random white noise
# irrespective of the observed time interval.

# Standard forecasting requires stationarity of data

laggedex <- lag(excaus, 1)
dif <- diff(excaus,1)
plot(dif)

# First we need to check whether the process is stationary
install.packages("tseries")
library(tseries)
adf.test(excaus, alternative="stationary")  # Augmented Dickey-Fuller Test: H0 nonstationary vs H1 nonstationary
# do not reject H0 => statistical evidence that the process is nonstationary
adf.test(diff(log(excaus)), alternative="stationary")  # Augmented Dickey-Fuller Test: H0 nonstationary vs H1 nonstationary

# AR(1) model with strong serial correlation
y <- rep(NA,5*12)

set.seed(pi)

y[1] <- rnorm(1)

for (i in seq(2,5*12,1)) {
  y[i] <- 1 + 1*y[i-1] + rnorm(1)
}

y_ts <- ts(y, start=c(2008,1), end=c(2012,12), frequency=12)
plot(y_ts)
acf(y_ts)

# ACF plots : autocorrelation function corr(Yt, Yt-1)
acf(excaus)
acf(diff(log(excaus)))
pacf(diff(log(excaus)))

fit <- arima(log(excaus), c(0,1,1), seasonal=list(order=c(0,1,1), period=12))  
#c(0,1,1) => c(autoregressive order, take difference, moving average order)
pred <- predict(fit,n.ahead=2*12)
ts.plot(excaus, exp(pred$pred), log='y', lty=c(1,3), col=c("black", "blue"), lwd=3)

# Do time series analysis with your own data or with US GDP. You can get data from:
# https://fred.stlouisfed.org/series/GDP