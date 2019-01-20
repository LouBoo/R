# Time and date data

today <- Sys.Date()
today
class(today)

now <- date()
now
class(now)

# Use as.Date() to convert string to dates
a <- c("2007-06-22", "2004-02-13")
class(a)
mydates <- as.Date(a)
mydates
class(mydates)

a1 <- c("01/13/2013", "Feb-03-2013", "12/11/2014")
as.Date(a1)
mydates1 <- as.Date(a1, format = c("%m/%d/%Y", "%b-%d-%Y"))   # b or B for Feb or February; y for '14 or Y for 2014
mydates1

# The following symbols can be used with the format() function to print dates

# Symbol    Meaning                 Example
# %d        day as a number (0-31)  01-31
# %a        abbreviated weekday     Mon
# %A        unabbreviated weekday   Monday
# %m        month (00-12)           00-12
# %b        abbreviated month       Jan
# %B        unabbreviated month     January
# %y        2-digit year            07
# %Y        4-digit year            2007

format(mydates1, format = "%B %d %Y")
format(mydates1, format = "%m-%d-%y")
format(mydates1, format = "%Y")

# We can compare dates
mydates1[1] > mydates[2]
days <- mydates1[1] - mydates[2]
days
class(days)

mydates[1]
mydates[1] + 1
mydates[1] + 30
mydates[1] + 365