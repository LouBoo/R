# Plotting in R

# plot(): generic plotting function
# points(): add points to an existing plot
# lines(), abline(): add lines to an existing plot
# text(), legend(): add text to an existing plot


# To make a scatter plot of one variable versus another, use plot()
n = 50
set.seed(0)
x = sort(runif(n, min=-2, max=2))
y = x^3 + rnorm(n)
plot(x, y)

# The type of argument controls the plot type. Default is "p"for points; set to "l" for lines
plot(x, y, type="p")
plot(x, y, type="l")

# Try also "b" or "o", for both points and lines

# Labels
# The main argument controls the title; xlab and ylab are the x and y labels
plot(x, y, main="A noisy cubic") # Note the default x and y labels are the variable names
plot(x, y, main="A noisy cubic", xlab="My x variable", ylab="My y variable")

# Point type
# Use the pch argument to control point type
plot(x, y, pch=20) # Empty circles, default
plot(x, y, pch="a")
# Try also 20 for small filled circles, or "." for single pixels
?pch

# Line type
# Use the lty argument to control the line type, and lwd to control the line width
plot(x, y, type="l", lty=1, lwd=1) # Solid line, default width
plot(x, y, type="l", lty=2, lwd=3) # Dashed line, three times as thick
?par

# Color
# Use the col argument to control the color. Can be:
# An integer between 1 and 8 for basic colors
# A string for any of the 657 available named colors
colors()

plot(x, y, pch=1, col=1) # Black, default
plot(x, y, pch=19, col=2:4) # Red, green, blue

# Multiple plots
# To combine multiple plots into one overall graph, use the par() function, with the
par(mfrow=c(2,2), mar=c(4,4,2,0.5)) # bottom, left, up, right
plot(x, y, main="Red cubic", pch=20, col="red")
plot(x, y, main="Blue cubic", pch=20, col="blue")
plot(rev(x), y, main="Flipped green", pch=20, col="green")
plot(rev(x), y, main="Flipped purple", pch=20, col="purple")

# Margin
# To change margins in graph, use the par() function, with the argument mar.
par(mfrow=c(2,2), mar=c(4,4,2,0.5))
plot(x, y, main="Red cubic", pch=20, col="red")
plot(x, y, main="Blue cubic", pch=20, col="blue")
plot(rev(x), y, main="Flipped green", pch=20, col="green")
plot(rev(x), y, main="Flipped purple", pch=20, col="purple")

# Saving
# Use the pdf() function to save a pdf file of your plot, in your R working directory
# Use getwd() to get the working directory, and setwd() to set it
getwd()
pdf(file="noisy_cubics.pdf", height=7, width=7) # Height, width are inches
par(mfrow=c(2,2), mar=c(4,4,2,0.5))
plot(x, y, main="Red cubic", pch=20, col="red")
plot(x, y, main="Blue cubic", pch=20, col="blue")
plot(rev(x), y, main="Flipped green", pch=20, col="green")
plot(rev(x), y, main="Flipped purple", pch=20, col="purple")

par(mfrow=c(1,1))
plot(rev(x), y, main="Flipped purple", pch=20, col="purple")

graphics.off()