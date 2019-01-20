mtcars
head(mtcars)
tail(mtcars)
str(mtcars)
lm(mtcars$mpg ~ mtcars$cyl + mtcars$hp)





name <- c("Apple", "MS", "Google", "Honda", "GM", "Volks", "Hyundai", "Amazon")
type <- c("IT", "IT", "IT", "Auto", "Auto", "Auto", "Auto", "IT")
stock <- c(165.5, 55.48, 1119.20, 36.16, 41, 172.06, 162.5, 1429.95)
US <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
portfolio <- data.frame(name, type, stock, US)
rm(name, type, stock, US)
str(portfolio)
portfolio[portfolio$name=="Google", c(FALSE, FALSE, TRUE, FALSE)]
portfolio[portfolio$name=="Google",]
portfolio[c(1:5), c(FALSE, FALSE, TRUE, FALSE)]
portfolio[portfolio$type=="IT",]
subset(portfolio, subset = stock < stock[name=="Apple"])
portfolio[portfolio$stock < portfolio$stock[portfolio$name == "Apple"],]
rank <- order(portfolio$stock, decreasing = TRUE)
portfolio[rank,]
