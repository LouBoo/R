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

pdf(file="time series.pdf")

plot(gdp, col="blue", lwd=3, ylab="GDP")
abline(reg=lm(gdp~time(gdp)), lwd=3)

plot(aggregate(gdp, FUN=mean))

boxplot(gdp~cycle(gdp))

plot(gdp, col="blue", lwd=3, ylab="GDP")

legend("topleft", legend="GDP", col="blue", lty=1, lwd=3)

title(main="GDP")

seasDecom <- stl(log(gdp), s.window="periodic")
plot(seasDecom, lwd=3)

dev.off()

summary(seasDecom)
seasDecom