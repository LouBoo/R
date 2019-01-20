data.set <- read.csv("county_data.csv", stringsAsFactors=FALSE)

head(data.set)
str(data.set)

data.1 <- data.set[1:111,]

data.state <- factor(data.1$State, levels=c("Alabama", "Alaska", "Arizona"))
summary(data.state)

table(data.state)

plot(state.data)    # If plot() function is used for a single factor, it will cou
title(main="Number of County")

plot(data.state, data.1$IncomePerCap, range=1, las=1) # If plot() is used for x=factor, y=numeric
boxplot(data.1$IncomePerCap~data.state, range=1, las=2) # How the distribution of y changes
                                                        #
                                                        #

big <- NA
big[data.1$TotalPop > 70000] <- "big"
big[data.1$TotalPop <= 70000] <- "small"

par(mar=c(6,4,2,1))
boxplot(data.1$IncomePerCap~big*data.state, col=c("blue", "red"), main="Income per Capita", range=1, las=2)

plot(data.1[,3:ncol(data.1)])
pairs(data.1[,3:ncol(data.1)])

# highlight outliers
data.2 <- data.set[data.set$State == "California",]
plot(data.2$TotalPop)
index.1 <- which(data.2$TotalPop > 10000000)
abline(h=10000000, lty=2)
points(index.1, data.2$TotalPop[index.1], pch=16, col="red")

index.2 <- which(data.2$TotalPop > 2000000 & data.2$TotalPop < 10000000)
abline(h=2000000, lty=2)
points(index.2, data.2$TotalPop[index.2], pch=16, col="blue")

text(c(index.1, index.2), data.2$TotalPop[c(index.1, index.2)], labels=data.2$County[c(index.1, index.2)], cex=0.8)

# Adding a straight line to a plot
proportion <- data.1$Women/data.1$TotalPop
plot(proportion, data.1$Unemployment, pch=20, xlab="Women/Total Population", ylab="Unemployment Rate")
linear.fit <- lm(data.1$Unemployment~proportion)
abline(linear.fit, lwd=3, col="red")

linear.fit
# You can also specify coefficient directly using abline()
abline(a=-3, b=30, lwd=3, lty=4, col="blue")

plot(proportion, data.1$Unemployment, pch=20, xlab="Women/Total Population", ylab="Unemployment Rate")
abline(v=0.5, col="red", lwd=3, lty=2)
abline(h=15, col="blue", lwd=3, lty=1)

# hist(), image(): histogram and heatmap
# heat.colors(), topo.colors(), etc.: create a color vector
# density(): estimate density, which can be plotted

# Plotting a histogram
# To plot a histogram of a numeric vector, use hist()

ave.income <- data.set$IncomePerCap
hist(ave.income)

# Histogram options
# Several options are available as arguments to hist(), such as col, ferq,
# breaks, xlab, ylab, main

hist(ave.income, col="pink", freq=TRUE)  # Frequency scale, default

# freq=FALSE leads to probability scale, and more options 

hist(ave.income, col="pink", freq=FALSE, breaks=seq(0, 70000, by=10000, xlab="Income per capita", main="County Level Average Income per Capita"))

hist(ave.income, col="pink", freq=FALSE, breaks=seq(0, 70000, by=50, xlab="Income per capita", main="County Level Average Income per Capita"))

hist(ave.income, col="pink", freq=FALSE, breaks=seq(0,70000, by=2000, xlab="Income per capita", main="County Level Average Income per Capita"))

# Adding histogram to an existing plot

# To add a histogram to an existing plot (say, another histogram) use hist()
# with add=TRUE

hist(ave.income + 2000, col=rgb(0.0,0.5,0.5,0.2), freq=FALSE, breaks=seq(0, 90000, by=2000), add=TRUE)

# Adding a density curve to a histogram

# To estimate a density from a numeric vector, use density()
# This returns a list; it has components x and y, so we can actually
# call lines() directly on the returned object

density.est <- density(ave.income, adjust=1.5) # l.5 times the default bandwidth

hist(ave.income, col="pink", freq=FALSE, breaks=seq(0, 70000, by=2000, xlab="Income per capita", main="County Level Average Income per Capita"))

lines(density.est, lwd=3)
polygon(density.est, col=rgb(0.5, 0.8, 0.5, 0.5), border="blue")