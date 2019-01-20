setwd("D:/Documents (Louis Booth)/R/data")
county <- read.csv("county_data.csv")
dim(county)
head(county)
county.1 <- county[,c(-5,-11)]
county.1$dummy_unemp <- as.numeric(county.1$Unemployment > mean(county.1$Unemployment))
###par(mfrow=c(3,3), mar=c(4,4,2,0.5))
pdf(file="logit_histograms.pdf")

for (j in c(3,4,5,6,7,8,9,10)) {
  plot(county.1[,12], county.1[,j], xlab="Unemployment",
       main=paste("Boxplot of", colnames(county.1)[j]),
       ylab="Count", col="lightblue")
}
dev.off()

logistic.1 <- glm((dummy_unemp=="1") ~ TotalPop + Men + Hispanic + White + Black + Native + Asian + IncomePerCap, data=county.1, family="binomial")
coef(logistic.1)
summary(logistic.1)
p.hat.1 <- fitted(logistic.1)
y.hat.1 <- round(p.hat.1)
table(y.hat.1)
table(y.hat.1, y.true=county.1$dummy_unemp)


county.2 <- county.1[,c(-7, -8, -9)]
logistic.2 <- glm((dummy_unemp=="1") ~ TotalPop + Men + Hispanic + White + IncomePerCap, data=county.2, family="binomial")
coef(logistic.2)
summary(logistic.2)
p.hat.2 <- fitted(logistic.2)
y.hat.2 <- round(p.hat.2)
table(y.hat.2)
table(y.hat.2, y.true=county.1$dummy_unemp)