# Regression model: examine the relation between X and Y
# Y|X ~ P(\beta)
# E(Y|X) = beta0 + beta1 * X
# Y = beta0 + beta1 X + u, E(u|X) = 0,
# In this mean regression, we may assess model validity: Estimation and
# Inference on beta
# We may predict Y using X: prediction

#  College data: Demographic characteristics, tuition, and more for USA colleges.

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

college = read.csv("College.csv")
dim(college)
head(college)
college.1 <- college[,c(-1,-7,-8,-9,-10,-11,-12,-14,-15)]
head(college.1)
college.1$Private.1 <- as.numeric(college$Private == "Yes")
college.1$enr.rate <- round(college.1$Enroll/college.1$Accept * 100,1)
college.1 <- college.1[,c(-3,-4)]
dim(college.1)
head(college.1)

# Some questions we may want to investigate:

# What is the relationship between Private and Expend?
# What is the relationship between Private and perc.alumni?
# Which variable is associated with Grad.Rate?
# Can we predict perc.alumni with other variables?

# Exploratory data analysis(EDA): Before pursuing a specific regression model,
# it's generally a good idea to explore your data to understand the main
# characteristics of each variable.

dim(college.1)
par(mfrow=c(3,3), mar=c(4,4,2,0.5)) # Setup the dimension for the matrix of
                                    # multiple graphs and margins

# To see the distribution of each variable:
for (j in 2:ncol(college.1)) {
  hist(college.1[,j], xlab=colnames(college.1)[j],
       main=paste("Histogram of", colnames(college.1)[j]),
       col="lightblue", breaks=20)
}
# What can we find?
# 1. application, personal, expend, perc.alumni, Top10perc and enrollment
# ratio are skewed.
# 2. acceptance rate is left skewed. 
# 3. Private is binary
# 4. Grade.Rate has fat right tails
# 5. S.F. ratio looks relatively normal.

# Correlations between variables

cor.college <- cor(college.1[,2:ncol(college.1)])
round(cor.college,3)

# Some strong correlations! Let's find the biggest (in absolute value):

cor.college[lower.tri(cor.college,diag=TRUE)] = 0 # Why only upper tri part?
cor.college

cor.college.sorted = sort(abs(cor.college), decreasing=T)
cor.college.sorted
cor.college.sorted[cor.college.sorted>0]

a <- which(abs(cor.college)==cor.college.sorted[1])
a
var.big.cor <- arrayInd(a, dim(cor.college)) # Convert the index number from
                                             # which() to the row number and column number
var.big.cor

# Another way to convert
var.big.cor1 <- c(a%%nrow(cor.college), (a%/%nrow(cor.college))+1)
var.big.cor1

colnames(cor.college)[var.big.cor]

# Let's find the second biggest correlation (in absolute value):
cor.college.sorted[2]
a2 <- which(abs(cor.college)==cor.college.sorted[2])
var.big.cor2 <- arrayInd(a2,dim(cor.college))

cor.college.sorted[3]
a3 <- which(abs(cor.college)==cor.college.sorted[3])
var.big.cor3 <- arrayInd(a3,dim(cor.college))

colnames(cor.college)[var.big.cor3]

var1 <- rep(NA,10)
var2 <- rep(NA,10)
high.cor <- rep(NA,10)

high.cor.data <- data.frame(var1, var2, high.cor, row.names=1:10)
for (i in 1:10) {
  which(abs(cor.college)==cor.college.sorted[i])
  a <- which(abs(cor.college)==cor.college.sorted[i])
  var.big.cor <- arrayInd(a,dim(cor.college))
  high.cor.data[i,1:2] <- colnames(cor.college)[var.big.cor]
  high.cor.data[i,3] <- cor.college[var.big.cor]
}
high.cor.data

# Visualizing relationships among variables, with
pairs(college.1[,2:ncol(college.1)])

pairs(~S.F.Ratio+Expend+Top10perc+Grad.Rate+perc.alumni, data=college.1)

pc.college <- prcomp(college.1[,2:ncol(college.1)], scale.=TRUE)

summary(pc.college)
par(mfrow=c(1,1))
plot(pc.college, type="l")
biplot(pc.college)

# Linear regression model
# We can use lm() to fit a linear regression model. The first argument is
# a formula, of the form Y ~ X1 + X2 + .. + Xp, where Y is the
# dependent variable and X1,...,Xp are the regressors. These refer to
# column names of variables in a data frame, that we pass in through the
# argument

reg <- lm(perc.alumni ~ enr.rate + Private + S.F.Ratio + Expend + Top10perc, data=college.1)
summary(reg)
round(reg$coefficients,5)

# Exercise: Choose your own dataset (maybe for your project) and conduct the 
# EDA.