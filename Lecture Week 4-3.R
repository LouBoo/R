# Data structure: 4. data.frame - continued

# Merging two data frames horizontally

rm(list=ls())
name <- c("Tom", "James", "Mary", "Paker")
score <- c(9, 7, 6, 10)
grade <- factor(c("A", "C", "D", "A"), ordered = TRUE, levels = c("D", "C", "B", "A"))
Econ_dep <- data.frame(name, score, grade)

name <- c("Tom", "James", "Mary")   # Note that Paker is missing here.

attendance <- c("all", "some", "never")
attitude <- c("good", "good", "bad")
Econ_dep_1 <- data.frame(name, attendance, attitude)

rm(name, score, grade)
rm(attendance, attitude)

Econ_dep_f <- merge(Econ_dep, Econ_dep_1, by = "name", all = TRUE, sort = FALSE)
Econ_dep_f

# Adding more units to a data.frame

name <- c("Jane", "Kim", "John")
score <- c(8, 9 ,5)
grade <- factor(c("A", "A", "D"), ordered = TRUE, levels = c("D", "C", "B", "A"))
Econ_dep2 <- data.frame(score, name, grade)   # Note that the order of columns can be different

# Data structure: 5. list

# List is a collection of a variety of data structures under one name. Data structures can be matrices,
# vectors, factor, data frames, and other lists, etc. Lists are used to collect together items
# of different types

age1 <- c(3, 4,5)
age2 <- c(4, 3)
emp <- list(employee = c("Anna", "Tom"), children = c(3, 2), children_age = list(age1, age2))
length(emp)
str(emp)
class(emp)
# employee, children, children_age are the name of components

gdp<- c(1549.13, 1371.15, 1613.46, 1788.65, 1824.29, 1792.88, 1552.81, 1529.76)
year <- 2008:2015
names(gdp) <- year

provinces <- c("AB", "BC", "MB", "NB", "NS", "ON", "PE", "QC", "SK")

cities <- data.frame(name = c("Toronto", "Montreal", "Vancouver", "Calgary"), pop = c(5930, 4100, 2463, 1393))

Canada <- list(gdp, provinces, cities)
Canada
str(Canada)

names(Canada) <- list("GDP", "Prov", "City")
rm(gdp, year, provinces, cities)
Canada
str(Canada)
Canada$GDP

# Select a subset of a list

# 1. list slicing: We get a list slice with the single square bracket [].
Canada[3]
Canada[-3]
Canada[c(1, 3)]
Canada[c(T, F, T)]
Canada[names(Canada)=="City"]

is.list(Canada[3])  #How can you select a component from the GDP vector?
Canada[3][1]        # Does not work, because it is list type with []

# 2. Select components from the inside of a list. Not slicing.
Canada[[3]]
class(Canada[[3]])
Canada[[3]][2,]
Canada[[2]][3]
Canada[["GDP"]][3]
Canada[["GDP"]][names(Canada[["GDP"]])==2010]

Canada$GDP[names(Canada$GDP)==2010]   # Instead of using [[]], we can use $

Canada[[3]][1,]     # VS. Canada[3] is still a list with one component
                    # In contrast, Canada[[3]] is a data.frame.

# Adding additional component to a list

Lan = c("English", "French")
Canada$Language <- Lan
str(Canada)