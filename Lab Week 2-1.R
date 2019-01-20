my_apples <- 5
print (my_apples)
B <- rchisq
my_oranges <- (round(my_apples * B))
comp <- (my_apples > my_oranges)
my_fruit = my_apples + my_oranges
print (my_fruit)



my_character <- "Father"
print (my_character)
my_character2 <- "Mother"
my_character2 == my_character
my_character2 > my_character
my_character2 < my_character
char.logi <- (is.character(my_character) + is.logical(my_character) - 0.5) * 2
char.logi



reject <- 0
for (i in 1 : 1000){
  x <- rbinom(100,1,0.5)
  x_bar <- mean(x)
  se_x <- sd(x)
  t_x <- (x_bar - 0.5)/(se_x/sqrt(100))
  reject <- reject + as.numeric(t_x > -1.96 & t_x < 1.96)}
print (reject/1000)



First.name <- "Louis"
Last.name <- "Booth"
My.name <- paste(First.name, Last.name)
print (My.name)



state.name
claim <- "Conecticut" %in% state.name
print (claim)
