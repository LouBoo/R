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
college.2 <- college[,c(-1,-7,-8,-9,-10,-11,-12,-14,-15)]

head(college.2)

reg <- lm(perc.alumni ~ Private + Top10perc, data=college.2)
summary(reg)

# Making predictions with predict()
# With new observations on Private and Top10perc, we may predict perc.almuni based
# on the estimated model.

new.obs <- data.frame(Private="Yes", Top10perc=30)
pred.reg <- predict(reg, new.obs)
pred.reg

# Some tips
# If you don't want to include an intercept
reg5 <- lm(perc.alumni ~ 0 + Private + Top10perc, data=college.2)

# Include all predictors: use . on the right-hand side of the formula
reg6 <- lm(perc.alumni ~ ., data=college.2)

# Include interaction terms: use : between two predictors of interest, to include
# the interaction between them as a predictor.
reg7 <- lm(perc.alumni ~ Private + Top10perc + Private:Top10perc, data=college.2)

# include polynomial terms as regressors
# Or: college.2$z <- college.2$Top10perc^2 and add z instead of I(Top10perc^2)
reg8 <- lm(perc.alumni ~ Private + Top10perc + I(Top10perc^2), data=college.2)

# Beyond linear models
# Logistic regression modeling
# We can use glm() to fit a logistic regression model.  The arguments are very similar
# to lm()
# The first argument is a formula, of the form Y ~ X1 + X2 + ... + Xp, where Y is the
# response and X1, ... , Xp are the predictors.
# We must also specify family="binomial" to get logistic regression

table(college.2$Private)

head(college.2)

# You may want to see which variables are associated with Private
par(mfrow=c(3,3), mar=c(4,4,2,0.5))

for (j in c(2:10)) {
  plot(college.2[,1], college.2[,j], xlab="Private",
       main=paste("Boxplot of", colnames(college.2)[j]),
       col="lightblue")
}

logistic <- glm((Private=="Yes") ~ S.F.Ratio + perc.alumni, data=college.2, family="binomial")

# Utility functions work as before
# To call coefficients, fitted values, residuals, summarizing, plotting, making
# predictions,
# the utility functions coef(), fitted(), residuals(), summary(), plot(), predict()
# work pretty much just as lm().

coef(logistic)

summary(logistic)

p.hat <- fitted(logistic)
y.hat <- round(p.hat)
table(y.hat)
table(y.hat, y.true=college.2$Private)