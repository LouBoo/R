data.cars <- mtcars
pairs(data.cars)

pc.car <- prcomp(data.car, scale.=TRUE)
pc.car$rotation

summary(pc.car)
plot(pc.car, type="l")
biplot(pc.car)

data.soccer <- read.csv("PCA.csv")
head(data.soccer)
data.psa <- data.soccer[,2:10]
pairs(data.psa)
rownames(data.psa) <- data.soccer[,1]
head(data.psa)

pc.soccer <- prcomp(data.psa, scale.=TRUE)
pc.soccer$rotation
plot(pc.soccer, type="l")
biplot(pc.soccer)