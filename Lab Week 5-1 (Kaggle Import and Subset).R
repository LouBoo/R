getwd("P:/R/data")
dir()
complete <- read.csv("complete.csv", stingsAsFactors = FALSE, na.strings = "")
wage <- aggregate(complete[ ,c("eur_wage")], list(complete$league), mean, na.rm = TRUE)
order(wage$x, decreasing = TRUE)
wage[14,]
overall <- aggregate(complete[ ,c("overall")], list(complete$league), mean, na.rm = TRUE)
order(overall$x, decreasing = TRUE)
wage[41,]



complete$club <- as.factor(complete$club)
values <- aggregate(complete[ ,c("eur_value")], list(complete$club), mean, na.rm = TRUE)
order(values$x, decreasing = TRUE)
values[226,]



wage_age <- aggregate(complete[ ,c("eur_wage")], list(complete$age), mean, na.rm = TRUE)
plot(wage_age)



under_23 <- complete[complete$age < "23", c("club", "age")]
df <- data.frame(table(under_23$club))
df2 <- df[order(df$Freq, decreasing = TRUE),]
df2[1,]
df2[2,]









### Possible answer

rm(list=ls())
setwd("P:/R/data")
dir()
complete <- read.csv("complete.csv", stringsAsFactors = FALSE, na.strings = "")
complete <- complete[,c("name", "club", "age", "league", "eur_value", "eur_wage", "overall")]
head(complete)

str(complete)
summary(complete)

league_wage <- aggregate(complete[, "eur_wage"], list(complete$league), mean)
names(league_wage) <- c("league", "ave_wage")
head(league_wage)
tail(league_wage)

# This is the way to sort several variables by one variable
rank_wage <- order(league_wage[, "ave_wage"], decreasing = TRUE)
league_wage <- league_wage[rank_wage,]

league_overall <- aggregate(complete[, "overall"], list(complete$league), mean)
names(league_overall) <- c("league", "ave_overall")

rank_overall <- order(league_overall[, "ave_overall"], decreasing = TRUE)
league_overall <- league_overall[rank_overall,]

cbind(league_wage, league_overall)

# 2. Based on "eur_value", which team has the most players in top 100?
# hint: 1. Sort based on eur_value, 2. Make sure that team is a factor

rank_value <- order(complete[, "eur_value"], decreasing = TRUE)
league_value <- complete[rank_value,]
league_value100 <- league_value[1:100,]
league_value100$rank_value <- 1:100

league_value100
str(league_value100)
team_stat <- summary(factor(league_value100$club))  # or you can use table
team_stat
sort(team_stat, decreasing = TRUE)

# 3. Present the distribution of average wage (eur_wage) based on age.
# hint: Use aggregate() function to obtain average wages for each age, 2. Use plot() function

age_wage <- aggregate(complete[,"eur_wage"], list(complete$age), mean)
names(age_wage) <- c("age", "ave_wage")
age_wage
plot(age_wage$age, age_wage$ave_wage, xlab = "age", ylab = "average wage", type = "b")
boxplot(eur_wage~age, data = complete, xlab = "age", ylab = "wage", range = 0)


# 4. Which team has the most players under 23?

team23 <- factor(complete[complete$age < 23, "club"])
team_age <- table(team23)
team_age_rank <- sort(team_age, decreasing = TRUE)
team_age_rank[1:10]
