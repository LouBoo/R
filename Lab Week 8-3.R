data.soccer <- read.csv("complete.csv")
head(data.soccer)
data.psa <- data.soccer[,c(6, 7, 10, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)]
pairs(data.psa)
rownames(data.psa) <- data.soccer[,1]
data.psa <- na.omit(data.psa)
head(data.psa)

pc.soccer <- prcomp(data.psa, scale.=TRUE)
pc.soccer$rotation
plot(pc.soccer, type="l")
biplot(pc.soccer)