# Truncate data set ~1000 observations and ~10 predictors
# rerun processes to explore data
# get descriptions of variables
### Examine distribution of predictors by response level ###

setwd("D:/Documents (Louis Booth)/R/Term Project/train.csv")
train <- read.table("train.csv", sep=",", header=TRUE)

setwd("D:/Documents (Louis Booth)/R")

var.names <- c("Response", "Product_Info_4", "Ins_Age", "Ht", "Wt", "BMI", "Employment_Info_1", "Employment_Info_4", "Employment_Info_6", "Insurance_History_5", "Family_Hist_2", "Family_Hist_3", "Family_Hist_4", "Family_Hist_5", "Medical_History_2", "Medical_History_10")
var.cols <- which(names(train) %in% var.names)
train <- train[,var.cols]

dim(train)
head(train)

pdf(file="Lab Week 11-1.pdf")

for (j in 1:ncol(train)) {
  hist(train[,j], xlab=colnames(train)[j],
       main=paste("Histogram of", colnames(train)[j]),
       col="red")
}

dev.off()


cor.train <- cor(train[,c(1:5, 16, 14)])
round(cor.train,3)

cor.train[lower.tri(cor.train,diag=TRUE)] = 0
cor.train

cor.train.sorted = sort(abs(cor.train), decreasing=T)
cor.train.sorted
cor.train.sorted[cor.train.sorted>0]

a <- which(abs(cor.train)==cor.train.sorted[1])
a
var.big.cor <- arrayInd(a, dim(cor.train))
var.big.cor

var.big.cor1 <- c(a%%nrow(cor.train), (a%/%nrow(cor.train))+1)
var.big.cor1
colnames(cor.train)[var.big.cor]

cor.train.sorted[2]
a2 <- which(abs(cor.train)==cor.train.sorted[2])
var.big.cor2 <- arrayInd(a2,dim(cor.train))
colnames(cor.train)[var.big.cor2]

cor.train.sorted[3]
a3 <- which(abs(cor.train)==cor.train.sorted[3])
var.big.cor3 <- arrayInd(a3,dim(cor.train))
colnames(cor.train)[var.big.cor3]

var1 <- rep(NA,10)
var2 <- rep(NA,10)
high.cor <- rep(NA,10)

high.cor.data <- data.frame(var1, var2, high.cor, row.names=1:10)
for (i in 1:10) {
  which(abs(cor.train)==cor.train.sorted[i])
  a <- which(abs(cor.train)==cor.train.sorted[i])
  var.big.cor <- arrayInd(a,dim(cor.train))
  high.cor.data[i,1:2] <- colnames(cor.train)[var.big.cor]
  high.cor.data[i,3] <- cor.train[var.big.cor]
}

high.cor.data


png(file="Lab Week 11-1 pairs1.png")

pairs(train[,c(1:5, 16, 14)])

dev.off()

png(file="Lab Week 11-1 pairs2.png")

pairs(~Response+Product_Info_4+Ins_Age+Ht+Wt+BMI+Medical_History_2, data=train)

dev.off()

pc.train <- prcomp(train[,c(1:5, 16, 14)], scale.=TRUE)

summary(pc.train)
par(mfrow=c(1,1))

png(file="Lab Week 11-1 PC plot.png")

plot(pc.train, type="l")

dev.off()

png(file="Lab Week 11-1 PC biplot.png")

biplot(pc.train)

dev.off()


reg <- lm(Response~Product_Info_4+Ins_Age+Ht+Wt+BMI+Medical_History_2, data=train)
summary(reg)
round(reg$coefficients,5)

install.packages("MASS")
library(MASS)
train$Response <- as.factor(train$Response)
str(train)
logreg <- polr(Response~Product_Info_4+Ins_Age+Ht+Wt+BMI+Medical_History_2, data=train, Hess = TRUE)
summary(logreg)
logLik(logreg) # higher is better

summary(update(logreg, method = "probit", Hess = TRUE), digits = 3)
logLik(update(logreg, method = "probit", Hess = TRUE), digits = 3)
summary(update(logreg, method = "loglog", Hess = TRUE), digits = 3)
logLik(update(logreg, method = "loglog", Hess = TRUE), digits = 3)
summary(update(logreg, method = "cloglog", Hess = TRUE), digits = 3)
logLik(update(logreg, method = "cloglog", Hess = TRUE), digits = 3)