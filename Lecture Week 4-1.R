#Data structure: 3. Factor

#Factor one of data structures used to store categorical variables. (e.g., gender)

#Gender vector

gender <- c("Male", "Female", "Female", "Male", "Male")
is.vector(gender)
class(gender)

#Convert gender_vector to a factor
factor_gender <- factor(gender)
factor_gender

# numeric vector
a <- c(0,0,1,0,1,1,1,0,1,0)
factor_a <- factor(a)

#There are two different types of categorical variables:
#nominal categorical variable and ordinal categorical variable.
#1. Nominal categorical variable: There is no implied order among categories.
#For example, Male and Female, and Cat, Dog, and Turtle
#2. Ordinal categorical variables: There is a natural ordering.
#For example, "Low", "Medium", "High", and "Primary", "Middle", and "High"

#No ordering
pet <- c("Cat", "Dog", "Turtle", "Dog", "Cat", "Cat")
factor_pet <- factor(pet)
factor_pet
summary(factor_pet)
class(factor_pet)

#Natural ordering
income <- c("High", "High", "Low", "Medium", "Low")
#You can specify the order (or level)
factor_income <- factor(income, ordered = TRUE, levels <- c("Low", "Medium", "High"))
factor_income <- factor(income, ordered = TRUE)               #Defaults to alphabetically ordered levels
factor_income
class(factor_income)


#In survey, abbreviations are often used because itr is convenient to record.
#But this can be confusing when you use survey data.
#You can recover the full words using levels function.
edu <- c("E", "E", "H", "M", "H", "C")
#If you don't specify the level, it will be alphabetical.
factor_edu <- factor(edu, ordered = TRUE, levels <- c("E", "M", "H", "C"))
levels(factor_edu) <- c("Elementary", "Middle", "High", "College")
factor_edu
as.numeric(factor_edu)

#summarize the factor
summary(factor_edu)
summary(edu)

#Compare elements of a factor
a <- factor_edu[3]
b <- factor_edu[6]
a
b
a > b
