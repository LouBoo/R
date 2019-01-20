pdf(file="boxplots.pdf")

data.set = read.csv("College.csv", stringsAsFactors = FALSE)
head(data.set)
data_1 <- data.set[data.set$Private == "Yes" | data.set$Private == "No",]
data_1$Private <- factor(data_1$Private, levels=c("Yes", "No"))
boxplot(data_1$Personal~data_1$Private)
t.test(data_1$Personal[data_1$Private == "Yes"], data_1$Personal[data_1$Private == "No"], var.equal=FALSE)



data_2 <- read.csv("College.csv", stringsAsFactors = FALSE)
rank <- order(data_2$Top10perc, decreasing=TRUE)
data_2 <- data_2[rank,]
data_2$Group[1:259] <- "Top"
data_2$Group[260:518] <- "Middle"
data_2$Group[519:777] <- "Bottom"
data_2$Group <- factor(data_2$Group, levels=c("Top", "Middle", "Bottom"))
str(data_2)
boxplot(data_2$Grad.Rate~data_2$Group)
anova(lm(data_2$Grad.Rate~data_2$Group))
pairwise.t.test(data_2$Grad.Rate, data_2$Group, p.adj="bonferroni")

dev.off()