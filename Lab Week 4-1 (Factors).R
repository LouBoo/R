set.seed(pi)
r <- rnorm(2754, 0, 1)
income <- exp(r)
quant <- quantile(income, c(.1, .35, .75, .98))
quant

income.level <- rep(NA, 2754)
income.level[income <= quant[1]] <- "VL"
income.level[income > quant[1] & income <= quant[2]] <- "L"
income.level[income > quant[2] & income <= quant[3]] <- "M"
income.level[income > quant[3] & income <= quant[4]] <- "H"
income.level[income > quant[4]] <- "VH"

factor_income.level <- factor(income.level, ordered = TRUE, levels <- c("VL", "L", "M", "H", "VH"))
factor_income.level
levels(factor_income.level) <- c("Very Low", "Low", "Middle", "High", "Very High")
summary(factor_income.level)
income.high <- income[substr(factor_income.level, 1, 2754) %in% c("Middle", "High", "Very High")]
income.high
hist(income.high, breaks = 20)
mean(income.high)
income.high_VH <- income[substr(factor_income.level, 1, 2754) %in% c("Very High")]
income.high_VH
income.high_H <- income[substr(factor_income.level, 1, 2754) %in% c("High")]
income.high_H
mean(income.high_VH) - mean(income.high_H)





industry <- sample(c("Manufacture", "Service", "IT"), 100, replace = TRUE, prob = c(.3, .5, .2))
stock <- rep(NA, 100)
stock[industry == "Manufacture"] <- rnorm(sum(industry == "Manufacture"), 3, 2)
stock[industry == "Service"] <- rnorm(sum(industry == "Service"), 2, 4)
stock[industry == "IT"] <- rnorm(sum(industry == "IT"), 8, 8)
factor.industry <- factor(industry)
summary(factor.industry)
industry.manufacture <- stock[substr(industry, 1, 100) %in% c("Manufacture")]
industry.service <- stock[substr(industry, 1, 100) %in% c("Service")]
industry.IT <- stock[substr(industry, 1, 100) %in% c("IT")]
mean(industry.manufacture)
sd(industry.manufacture)
mean(industry.service)
sd(industry.service)
mean(industry.IT)
sd(industry.IT)