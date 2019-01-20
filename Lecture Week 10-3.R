# Testing means between groups

# 1. Comparison between two groups: Two sample t test
# Data are now from two groups, x_1,...,x_n and y_1,...,y_T.
# Assume these two groups follow N(mu1, sigma1^2) and N(mu2, sigma2^2)
# H0: Two groups have the same mean (mu1=mu2)
# t = (x_bar - y_bar)/(SEDM), SEDM = sqrt(sigma1_hat^2/n + sigma2_hat^2/T)

data.set = read.csv("county_data.csv", stringsAsFactors = FALSE)
head(data.set)

data_1 <- data.set[data.set$State == "California" | data.set$State == "Connecticut",]
data_1$State <- factor(data_1$State, levels=c("Califronia", "Connecticut"))
boxplot(data_1$Unemployment~data_1$State)

t.test(data_1$Unemployment[data_1$State == "California"], data_1$Unemployment[data_1$State == "Connecticut"], var.equal=FALSE)

# In textbooks, it is usually assumed that the variances 
t.test(data_1$Unemployment[data_1$State == "California"], data_1$Unemployment[data_1$State == "Connecticut"], var.equal=TRUE)






# If there is no group structure, MSB = sum_i sum_j ni (xi_bar - x_bar)^2/(k-1)
# is also the estimate of sigma^2

# F = MSB / MSW ~ F(k-1, n-k)

data_2 <- data.set[data.set$State %in% c("California", "Connecticut", "Alabama", "Ohio"),]
data_2$State <- factor(data_2$State, levels = c("California", "Connecticut", "Alabama", "Ohio"))
str(data_2)

boxplot(data_2$Unemployment~data_2$State)
anova(lm(data_2$Unemployment~data_2$State))
# In the outcome: Residual is the within group variation, data_2$State
# is the between group variation.

# Pairwise comparison

# You can partly do this from the regression coefficients
reg <- lm(data_2$Unemployment~data_2$State)   # Categorical variables (factors)
                                              # are used as dummies
summary(reg)

# This does not compare California, Connecticut and Ohio.
# In multiple testing, use p.adj="bonferroni" to be conservative.

pairwise.t.test(data_2$Unemployment, data_2$State, p.adj="bonferroni")