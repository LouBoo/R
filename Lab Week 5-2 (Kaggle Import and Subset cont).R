rm(list=ls())
days <- c("1/13/1903", "2/14/2018")
days <- as.Date(days, format = "%m/%d/%Y")
days1 <- days[2] - days[1]
days1

a <- seq(as.Date("2018/1/1"), as.Date("2018/2/14"), by = 1)



sc.game <- read.csv("results.csv", stringsAsFactors = FALSE, na.strings = "")
head(sc.game)
str(sc.game)
sc.game$date <- as.Date(sc.game$date)
str(sc.game)

goals1 <- sc.game[sc.game$date <= "1939-12-31" & sc.game$date >= "1930-01-01",]
goals2 <- sc.game[sc.game$date <= "2014-12-31" & sc.game$date >= "2005-01-01",]

sum1 <- sum(goals1$home_score) + sum(goals1$away_score)
sum2 <- sum(goals2$home_score) + sum(goals2$away_score)
sum1 > sum2
sum2 > sum1

ave.goal.1930s <- sum1/nrow(goals1)
ave.goal.2005_2014 <- sum2/nrow(goals2)




game.1950s <- sc.game[sc.game$date <= "1959-12-31" & sc.game$date >= "1950-01-01", c("away_score", "home_score", "date")]
home_win <- game.1950s[game.1950s$home_score > game.1950s$away_score, c("home_score", "date")]
sum(home_win$home_score)
proportion <- as.numeric(nrow(home_win)/nrow(game.1950s))
proportion



year <- format(sc.game$date, format = "%Y")
plot(factor(year))
