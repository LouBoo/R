# Principal Component Analysis

head(mtcars)

data.car1 <- mtcars[,c("mpg","wt")]
data.normalize1 <- scale(data.car1)
apply(data.normalize1, MARGIN=2, sd)
colMeans(data.normalize1)

plot(data.normalize1)


cov.mat1 <- t(data.normalize1) %*% data.normalize1/nrow(data.normalize1)
eig.data1 <- eigen(cov.mat1)

pc <- eig.data1$vectors

# In practice, we can use prcomp or princomp function.

pc1 <- prcomp(data.normalize1)
pc1$rotation

# Let's introduce more variables.
data.car <- mtcars[,1:7]
pairs(data.car)

pc.car <- prcomp(data.car, scale.=TRUE)
pc.car$rotation

summary(pc.car)
plot(pc.car, type="l")
biplot(pc.car)


# Exercise
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