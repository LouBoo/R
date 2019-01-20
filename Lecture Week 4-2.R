# Data structure: 4. Data frame
# A data frame is a two dimensional format of data structure that is useful to
# store data in tables. In general, each column is for a different item and
# each row is for a different unit
# Variables in each column is of the same length, but possibly of
# different type of variables. (numeric, factor, character)
# <-> Elements of a matrix should be of the same type.

rm(list=ls())
name <- c("Tom", "James", "Mary", "Paker")
score <- c(9, 7, 6, 10)
grade <- factor(c("A", "C", "D", "A"), ordered=TRUE, levels=c("D", "C", "B", "A"))
Econ_dep <- data.frame(name, score, grade)

Econ_dep

str(Econ_dep) # gives us the number of observations (# or rows),
              # the number of variables (# of columns), full list of the variables names,

# Name is not a factor. Two persons with the same name are not in the same category.
# A character vector is converted to a factor in data.frame if we don't specify as a character

Econ_dep1 <- data.frame(name, score, grade, stringsAsFactors = FALSE)
str(Econ_dep1)
Econ_dep2 <- data.frame(I(name), score, grade)
str(Econ_dep2)

Econ_dep$name
name

rm(name, score, grade)

#subset seection and subset elimination
Econ_dep[c(3,1),]
Econ_dep[c(1,3),]
Econ_dep[-c(2,3),]
Econ_dep[c(TRUE,TRUE,FALSE,FALSE),]
Econ_dep[Econ_dep$name=="James",]
Econ_dep[!(Econ_dep$name=="James"),]
subset(Econ_dep, !(Econ_dep$name=="James"))

Econ_dep[,2]
Econ_dep[,-2]
Econ_dep[,c("name", "grade")]
Econ_dep[,c(TRUE, FALSE, TRUE)]
Econ_dep[,!c(TRUE, FALSE, TRUE)]

Econ_dep$grade <- NULL
Econ_dep

# Add a vector to data.frame
attendance <- c("all", "some", "never", "all")
Econ_dep <- cbind(Econ_dep, attendance)
Econ_dep$gender <- c("Male", "Male", "Female", "Female")
str(Econ_dep)     #We can see that Econ_dep$gender is a character vector not factor

Econ_dep$year <- NA
Econ_dep$year[Econ_dep$name %in% c("Tom", "Mary")] <- 4
Econ_dep

#Sort midterm using order() function
rank <- order(Econ_dep$score, decreasing = TRUE)
Econ_dep[rank,]

detach(Econ_dep)

attach(Econ_dep)  # data.frame "midterm" is attached to the R search path. So, we don't
                  # need to put midterm$ to call a variable in midterm

name

detach(Econ_dep)
name

as.matrix(Econ_dep) #easy to convert data.frame to matrix *(all elements now character type)

#Grouped data
ID <- 1:20
rand.number <- rnorm(20)
participant <- data.frame(ID, rand.number)

#Generate two data frames "group1" and "group2" from "participant"

group1 <- participant[participant$rand.number > 0,]   #conditional selection
group2 <- subset(participant, subset = rand.number <= 0)    #You can use subset function.

#Create a new variable "level" in "participant" to group data.

participant$level[participant$rand.number > 0.5] <- "first"
participant$level[participant$rand.number > 0 & participant$rand.number <= 0.5] <- "second"
participant$level[participant$rand.number > -0.5 & participant$rand.number <= 0] <- "third"
participant$level[participant$rand.number <= -0.5] <- "fourth"

participant$level <- as.factor(participant$level)
levels(participant$level) = c("first", "second", "third", "fourth")

participant$rank <- as.numeric(participant$level)

participant