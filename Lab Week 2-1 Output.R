> my_apples <- 5
> print (my_apples)
[1] 5
> B <- rchisq(1, 5)
> my_oranges <- (round(my_apples * B))
> comp <- (my_apples > my_oranges)
> my_fruit = my_apples + my_oranges
> print (my_fruit)
[1] 26
> 
  > 
  > my_character <- "Father"
  > print (my_character)
  [1] "Father"
  > my_character2 <- "Mother"
  > my_character2 == my_character
  [1] FALSE
  > my_character2 > my_character
  [1] TRUE
  > my_character2 < my_character
  [1] FALSE
  > char.logi <- (is.character(my_character) + is.logical(my_character) - 0.5) * 2
  > char.logi
  [1] 1
  > 
    > 
    > reject <- 0
    > for (i in 1 : 1000){
      +   x <- rbinom(100,1,0.5)
      +   x_bar <- mean(x)
      +   se_x <- sd(x)
      +   t_x <- (x_bar - 0.5)/(se_x/sqrt(100))
      +   reject <- reject + as.numeric(t_x > -1.96 & t_x < 1.96)}
    > print (reject/1000)
    [1] 0.941
    > 
      > 
      > First.name <- "Louis"
      > Last.name <- "Booth"
      > My.name <- paste(First.name, Last.name)
      > print (My.name)
      [1] "Louis Booth"
      > 
        > 
        > state.name
      [1] "Alabama"        "Alaska"         "Arizona"        "Arkansas"       "California"     "Colorado"      
      [7] "Connecticut"    "Delaware"       "Florida"        "Georgia"        "Hawaii"         "Idaho"         
      [13] "Illinois"       "Indiana"        "Iowa"           "Kansas"         "Kentucky"       "Louisiana"     
      [19] "Maine"          "Maryland"       "Massachusetts"  "Michigan"       "Minnesota"      "Mississippi"   
      [25] "Missouri"       "Montana"        "Nebraska"       "Nevada"         "New Hampshire"  "New Jersey"    
      [31] "New Mexico"     "New York"       "North Carolina" "North Dakota"   "Ohio"           "Oklahoma"      
      [37] "Oregon"         "Pennsylvania"   "Rhode Island"   "South Carolina" "South Dakota"   "Tennessee"     
      [43] "Texas"          "Utah"           "Vermont"        "Virginia"       "Washington"     "West Virginia" 
      [49] "Wisconsin"      "Wyoming"       
      > claim <- "Conecticut" %in% state.name
      > print (claim)
      [1] FALSE