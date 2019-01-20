set.seed(pi)
nor <- rnorm(200, 6, 9)
nor_mid <- nor[nor>=4 & nor<=7]
which(nor %in% nor_mid)
nor_end <- nor[nor>=9 | nor<=3]
nor_end
rm(nor, nor_mid, nor_end)


set.seed(1)
num <- rchisq(1000, 8)
quantile <- quantile(num, c(.4,  .6))
quantile
hist(num[num >= quantile[1] & num <= quantile[2]])
rm(num, quantile)


linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(linkedin) <- week
names(facebook) <- week
pop_linkedin <- linkedin > 15
pop_linkedin
quiet_linkedin <- linkedin <= 5
quiet_linkedin
compare <- linkedin > facebook
compare
rm(compare, facebook, linkedin, pop_linkedin, quiet_linkedin, week)

vec <- rnorm(1000, 0, 1)
extreme <- as.character(vec < -1.96 | vec > 1.96)
extreme <- replace(extreme, extreme == "FALSE", "0")
trues <- length(extreme[extreme == "TRUE"])
proportion <- (trues/1000)
proportion
rm(extreme, proportion, trues, vec)


set.seed(pi)
numbers <- sample(1:1000, 1000, replace=TRUE)
numbers1 <- numbers %% 2 == 0
length(numbers1[numbers1 == "TRUE"])
rm(numbers, numbers1)


salary <- c(54, 35, 65, 34, 67, 76, 100, 3, 154, 44, 37, 98, 254)
name <- c("Tom", "Annie", "John", "Park", "Kim", "Bob", "Julia", "Ben", "Steven", "Nick", "Lee", "Rick", "Don")
names(salary) <- name
salary1 <- salary[name > "A" & name < "K"]
salary1
rm(name, salary, salary1)