# Importing data

# The first step for data management and analysis is to have data. You may
# enter data using the keyboard, but, in most cases, you will import data file
# (from Excel, Text, Stata, Sas, etc) into R.

# 1. csv: comma separated values
getwd()
setwd("C:/Users/ljb14001/Desktop/data")
dir()
rev_exp <- read.csv("district_rev_exp.csv")

rev_exp <- read.csv(file.choose(), stringsAsFactors = FALSE)


rev_exp$STATE <- as.factor(rev_exp$STATE)

class(rev_exp)
head(rev_exp)
tail(rev_exp)

str(rev_exp)
summary(rev_exp)

rev_exp$TOTALREV[rev_exp$TOTALREV == "-"] <- NA
rev_exp$TSTREV[rev_exp$TSTREV == "-"] <- NA
rev_exp$TOTALREV <- as.numeric(rev_exp$TOTALREV)

# Calculate the vaerages of enrollment, total revenue and total
# expenditure for each state
colMeans(rev_exp[rev_exp$STATE == "California", c("ENROLL", "TOTALREV", "TOTALEXP")], na.rm = TRUE)
colMeans(rev_exp[rev_exp$STATE == "Connecticut", c("ENROLL", "TOTALREV", "TOTALEXP")], na.rm = TRUE)
colMeans(rev_exp[rev_exp$STATE == "Massachusetts", c("ENROLL", "TOTALREV", "TOTALEXP")], na.rm = TRUE)
colMeans(rev_exp[rev_exp$STATE == "Missouri", c("ENROLL", "TOTALREV", "TOTALEXP")], na.rm = TRUE)
aggregate(rev_exp[ ,c("ENROLL", "TOTALREV", "TOTALEXP")], list(rev_exp$STATE), mean, na.rm = TRUE)

# list() specifies the criterion to make groups
aggregate(rev_exp[ ,c("ENROLL", "TOTALREV", "TOTALEXP")], by = list(ST = rev_exp$STATE, EnR = rev_exp$ENROLL > 1000), FUN = mean, na.rm = TRUE)
a <- na.omit(rev_exp)   # Eliminates the rows that contain NA

# 2. text file: tab-delimited file
# district_rev_exp.txt
rev_exp1 <- read.delim(file.choose(), stringsAsFactors = FALSE)

head(rev_exp1)
tail(rev_exp1)

# 3. read.table: read any tabular file as a data.frame

# Use district_rev_exp_readtable.txt
rev_exp2 <- read.table(file.choose(), sep = "/", header = TRUE)
names(rev_exp2)
rev_exp2 <- read.table(file.choose(), sep = "/", header = TRUE, stringsAsFactors = FALSE)
names(rev_exp2)
str(rev_exp2)

# We can also read csv file and tab delimited txt file using read.table
rev_exp3 <- read.table(file.choose(), sep = "/,", header = TRUE, stringsAsFactors = FALSE)
rev_exp3 <- read.table(file.choose(), sep = "/t", header = TRUE, stringsAsFactors = FALSE)



# You can save excel file with csv or tab delimited txt file. Then, you can use
# to read the file.
# You can read excel file directly.
# First install the package "readxl".
install.packages("readxl")
library("readxl")
excel_sheets(file.choose())                       # list different sheets
rev_exp4 <- read_excel(file.choose(), sheet = 1)  # actually import data R

# You can also import data from Stata
# You first install the package "foreign".
install.packages("foreign")
library("foreign")
read.dta(file.choose())

