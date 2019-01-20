b <- c(TRUE, TRUE, FALSE, FALSE)
is.logical(b)
class(b)

b1 <- c(3>0, 4>3, "Father" > "Mother", "Father" == "Mother")
b1
is.logical(b1)
b1 <- as.numeric(b)       #convert from logical vector to numeric vector
class(b1)

c <- b*1
class(c)
c1 <- as.logical(c)


vec <- c(3, FALSE, 5, 6, 2, NA, pi);
class(vec);
vec[is.na(vec)] <- 0      #Assign 0 to any NA values
vec2 <- c("character", TRUE)  #TRUE recognized as character
class(vec2)


#Evaluate how one object is related with another object
c(3>0, -3<0) & c(3%in%1:5, -3%in%1:5)
c(3>0, -3<0) && c(3%in%1:5, -3%in%1:5)  #only looks at first components (&&)
c(3>0, -3<0) && c(-3%in%1:5, 3%in%1:5)

c(3>0, -3>0) | c(3%in%-5:-1, -3%in%1:5)
c(3>0, -3>0) || c(3%in%-5:-1, -3%in%1:5)
c(-3>0, 3>0) || c(3%in%-5:-1, -3%in%1:5)

c(!(3>0), !(-3>0))  #Not greater than 0,  [!(3>0)]
!c(-3>0, 3>0)

1:10 %in% 3:7

1:10 > 5

#WE can use this logical vector to select subests of a vector.
#Elements are selected if they are corresponding to TRUE
#Alternatively, you can us "which()" function.
z <- runif(10, min = -1, max = 1)
z_sub <- z[c(1, 3, 5)]      #Elements 1, 3, and 5 of z selected
z_plus <- z[z>0]            #Elements >0 selected
z_minus <- z[!(z>=0)]       #Elements not greater than or equal to 0
z[z<0] <- -z[z<0]           #Change sign of elements from negative to positive
z

z_ind <- 1:20
z_ind[z>0.5]                #Recycling rule applies  (index 1 becomes index 11 in z)





poker_vector <- c(140, -50, 20, -120,  240)
roulette_vector <- c(-24, -50, 100, 350, 10)
days_vector <- c("Mon", "Tues", "Wed", "Thu", "Fri")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
selection_vector <- poker_vector > 0
poker_winning_days <- poker_vector[selection_vector]
total <- poker_vector + roulette_vector
winning_days <- poker_vector > 0 & roulette_vector > 0
total_winning_days <- total[winning_days]
sum(poker_vector > 0 | roulette_vector > 0)
