#character vector

#Character is a symbol in a written language like letters, numerals,
#punctuation, space, etc.
#String is a sequence of characters bound together.
#a lot of interesting data is in character form e.g., webpages,
#emails, surveys,...

#A character vector is a vector of text strings whose elements are
#specified in quotes.

name1 <- c("Clinton", "Bush", "Obama");
name2 <- c("Reagan", "Carter", "Ford");
name <- c(name1, name2);
is.vector(name)
class(name)
is.character(name)

rev.name <- rev(name)
num <- nchar(name)                    #We can also use "nchar" for
                                      #a numeric or logical vector.
num2 <- nchar(c("Bill Clinton", "Spider-Man"))
size <- length(name)

#Substring
phrase <- "Give me a break"
substr(phrase, 1, 4)
substr(phrase, nchar(phrase) - 4, nchar(phrase))
substr(name, 1, 2)
substr(name, 1:6, 1:6)
substr(name, 1, 1:6)                  #Recycling

name[substr(name, 1, 1) %in% c("B", "C")]

#Replacement
substr(phrase, 1, 1) <- "L"
phrase
substr(phrase, 1, 4) <- "Show"
name
first.letters <- substr(name, 1, 1)
first.letters.scrambled <- sample(first.letters)
substr(name, 1, 1) <- first.letters.scrambled
name


#Split
word <- strsplit(phrase, split = " ")
word <- unlist(word)

lett <- strsplit(name, split = "")
lett <- unlist(lett)

#Combine
edu <- c("elementary", "middle", "high", "university")
ord <- c(1, 2, 3, 4)
yrs <- c(5, 3, 4, 4)

paste(ord, edu)                       #Elementwise
paste(ord, edu, sep = ".")
paste(edu, " (", yrs, ")", sep = "")


#Converting other data types to strings
num_string <- as.character(num)
logi_string <- as.character(c(T, T, F, F, NA))

#Converting to lower or upper case
name_upper <- toupper(name1)
name_lower <- tolower(name2)

#If we want to remove " " in the output, we can use the cat function.
cat(c("Annie", "John", "Pam", "Sean", "Tom", "Ken"))
cat("What is \"R\"?")                 # \ : escape character
                                      #also use cat('What is \"R\"?')

#Built-in character vectors in R
LETTERS
letters
month.abb
month.name

"hi" %in% c("hola", "hi", "hello")
"hi" %in% c("hola", "hide", "hello")