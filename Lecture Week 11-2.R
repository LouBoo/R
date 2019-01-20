setwd("D:/Documents (Louis Booth)/R/data")

# College data: Demographic characteristics, tuition, and more for USA colleges.

# Private: Public/private indicator
# Apps: Number of applications received
# Accept: Number of applicants accepted
# Enroll: Number of new students enrolled
# Top10perc: New students from top 10 % of high school class
# Top25perc: New students from top 25 % of high school class
# F.Undergrad: Number of full-time undergraduates
# P.Undergrad: Number of part-time undergraduates
# Outstate: Out-of-state tuition
# Room.Board: Room and board costs
# Books: Estimated book costs
# Personal: Estimated personal spending
# PhD: Percent of faculty with Ph.D.'s
# Terminal: Percent of faculty with terminal degree
# S.F.Ratio: Student/faculty ratio
# perc.alumni: Percent of alumni who donate
# Expend: Instructional expenditure per student
# Grad.Rate: Graduation rate

college <- read.csv("College.csv")
dim(college)
head(college)
college.1 <- college[,c(-1,-7,-8,-9,-10,-11,-12,-14,-15)]
college.1$Private.1 <- as.numeric(college$Private == "Yes")
college.1$enr.rate <- round(college.1$Enroll/college.1$Accept * 100,1)
college.1 <- college.1[,c(-3,-4)]

head(college.1)

reg <- lm(perc.alumni ~ Private + Top10perc, data=college.1)
reg

plot(perc.alumni~Private, data=college.1)
plot(perc.alumni~Top10perc, data=college.1)

# Utility functions
# Linear models in R come with a bunch of utility functions, such as coef(), fitted(), residuals(), summary(), plot(),
# predict(), to call coefficients, fitted values and residuals, to produce summaries and diagnostic plots, and
# make predictions, respectively

# These tasks can also be done manually, by extracting the components of the returned object from lm(), 
# and manipulating them appropriately. But this is discouraged, because:

# 1. The manual strategy is more tedious and error can occur
# 2. Once you master the utility functions, you'll be able to call coefficients, fitted values, make predictions, etc., 
#    in the same way for model objects returned by other regression functions glm(), gam(), and many others

# Call estimated coefficients with coef()
reg.coef <- coef(reg)
reg.coef
reg$coefficients

# Call fitted values with fitted()
# Using the fitted() function, we can plot the actual values versus the fitted ones:
reg.fit <- fitted(reg)
plot(reg.fit, college.1$perc.alumni, main="Actual vs Fitted", xlab="Fitted values", ylab="% of Alumni who donate")
abline(a=0, b=1, lty=2, lwd=3, col="red")

# Displaying an overview with summary()
# The function summary() gives us a nice summary of the linear model we fit:

summary(reg)
# This tells us:

# The quantiles of the residuals: close to normal?
# The coefficient estimates
# Their standard errors
# P-values for their individual significances
# (Adjusted) R-squared value: how much variability is explained by the model?
# F-statistic for the significance of the overall model

# Regression diagnostics with plot()
# Regression diagnostics are used to evaluate the model assumptions (linearity, normality, homoskedasticity, no outlier) 

plot(reg) # produce 4 diagnostic figures.

# 1. Residuals vs Fitted (model specification): This plot shows if residuals have non-linear patterns.  
# There could be a non-linear relationship between predictor variables and an outcome variable and the pattern could show up in this plot 
# if the model doesn't capturethe non-linear relationship.
# If you find equally spread residuals around a horizontal line without distinct patterns, that is a good indication you don't have non-linear 
# relationships.

x <- runif(100, min=0, max=2*pi)
y <- 10*sin(x) + rnorm(100)

reg1 <- lm(y~x)
plot(x,y)
abline(reg1)
plot(reg1)

# 2. NOrmal Q-Q: This plot shows if residuals are normally distributed. If residuals are lined well on the straight dashed line, the residuals
# are close to normal.

# 3. Scale-Location: It's also called Spread-Location plot. This plot shows if residuals are spread equally along the ranges of predictors. 
# This is how you can check the assumption of equal variance (homoscedasticity). It's good if you see a horizontal line with equally 
# (randomly) spread points

x <- runif(100, min=0, max=2)
y <- x + rnorm(100)*x

reg2 <- lm(y~x)
plot(x,y)
abline(reg2)
plot(reg2)

# 4. Residuals vs Leverage
# leverage point: an observation that has a value of x that is far away from the mean of x. 
# Influential observations: An influential observation is defined as an observation that changes the slope of the line. 
# Cook's distance", which is a measure of the influence of each observation on the regression coefficients.

x_temp <- runif(50, min=0, max=2)
y_temp <- x_temp + rnorm(50,0,0.5)
x <- c(2,x_temp)
y <- c(-10,y_temp)

reg3 <- lm(y~x)
plot(x,y)
abline(reg3)
plot(reg3)

coef(reg3)
reg4 <- lm(y[2:length(x)]~x[2:length(x)])
coef(reg4)

# Making predictions with predict()
# With new observations on Private and Top10perc, we may predict perc.alumni based on the estimated model.

new.obs <- data.frame(Private="Yes", Top10perc=30)
pred.reg <- predict(reg, new.obs)
pred.reg

# Some tips
# If you don't want to include an intercept
reg5 <- lm(perc.alumni ~ 0 + Private + Top10perc, data=college.1)

# Include all predictors: use . on the right-hand side of the formula
reg6 <- lm(perc.alumni ~ ., data=college.1[,-9])

# Include interaction terms: use : between two predictors of interest, to include the interaction between them as a predictor.
reg7 <- lm(perc.alumni ~ Private + Top10perc + Private:Top10perc, data=college.1)

# include polynomial terms as regressors
reg8 <- lm(perc.alumni ~ Private + Top10perc + I(Top10perc^2), data=college.1)
summary(reg8)