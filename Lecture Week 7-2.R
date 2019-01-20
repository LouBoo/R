# The apply family

# Apply functions allows you to apply a function accross different subsets of data.
# For example, you may want to obtain the mean (max, min, or median) for each column of
# a data.frame
# It offers an alternative to explicit iteration using for() loop. Can be faster

# The apply family includes
# apply(): apply a function to rows or columns of a data.frame
# lapply(): apply a function to elements of a list of vector
# sapply(): same as lapply(), but simplifies the output
# tapply(): apply a function to levels of a factor vector

# 1. apply()
# apply(x, MARGIN=1, FUN=my.fun): apply my.fun() accross rows of a matrix or data.frame
# apply(x, MARGIN=2, FUN=my.fun): apply my.fun() accross columns of a matrix or data.frame

# Examples

x <- matrix(rnorm(9), 3, 3)
x

apply(x, MARGIN=1, FUN=min) #Rows
apply(x, MARGIN=2, FUN=min) #Columns

for (i in 1:nrow(x)) {
  print(min(x[i,]))
}

apply(x, MARGIN=2, FUN=sum)
colSums(x)

# Applying a function that takes extra arguments
# Sometimes we want to use a function over rows or columns of a matrix, that takes extra
# arguments (besides the row or column itself). We can put these as inputs to apply().

setwd("P:/R/data")
rev_exp0 <- read.csv("district_rev_exp.csv", na.strings="-")
head(rev_exp0)

maximum <- apply(rev_exp0[,-c(1,3)], MARGIN = 2, FUN = max, na.rm = TRUE) #"[,-c(1,3)] excludes first and third columns

first <- apply(rev_exp0[,-c(1,3)], MARGIN=2, FUN=which.max)
first
rev_exp0[first[1],]

second <- apply(rev_exp0[-first[1],-c(1,3)], MARGIN=2, FUN=which.max)
second
rev_exp0[second[1],]

# We can use this apply() to our own functions.
my.fun <- function(x) {
  m1 <- median(x, na.rm=TRUE)
  m2 <- mean(x, na.rm=TRUE)
  return(c(m1,m2))
}

apply(rev_exp0[,-c(1,3)], MARGIN=2, FUN=my.fun)

# lapply(), elements of a list (vector and data.frame)

my.list = list(nums=seq(0.1,0.6,by=0.1), chars=letters[1:12], TF=sample(c(TRUE, FALSE), 6, replace=TRUE))
my.list

lapply(my.list, FUN=mean)   # The type of output is always list

# lapply() with extra arguments

mean.omitting.one = function(i, vec) {
  return(mean(vec[-i]))
}

my.vec = rev_exp0[,"TOTALEXP"]
n = length(my.vec)
my.vec.jack = lapply(1:n, FUN=mean.omitting.one, vec=my.vec)

head(my.vec.jack) # It's a list, and here are the first 6 elements

# sapply(), elements of a list or vector
# The sapply() function works just like lapply(), but tries to simplify the return value when
# E.g., most common is the conversion from a list to a vector

my.vec.jack1 = sapply(1:n, FUN=mean.omitting.one, vec=my.vec)
head(my.vec.jack1)

sqrt((n-1)^2/n) * sd(my.vec.jack1)  # Jackknife standard error

sd(my.vec)/sqrt(n)                  # conventional standard error

# tapply(), levels of a factor vector
# tapply(x, INDEX=my.index, FUN=my.fun): apply my.fun() to subsets of elements in x that share

str(rev_exp0)

tapply(rev_exp0[, "TOTALREV"], INDEX=list(ST=rev_exp0$STATE, EnR=rev_exp0$ENROLL > 1000), FUN=mean, na.rm=TRUE)
aggregate(rev_exp0[,c("ENROLL", "TOTALREV", "TOTALEXP")], by=list(ST=rev_exp0$STATE, EnR=rev_exp0$ENROLL > 1000), FUN=mean, na.rm=TRUE)