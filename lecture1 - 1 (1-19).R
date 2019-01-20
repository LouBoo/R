# Let's try a few of random commands'

"hello world"
100

hello world

n <- 1000                           # Create a variable n and assign 1000
                                    # If you use the source window, commands are separated either 
                                    # by a ; or by a new line. 
                                    # you can add a comment that is not executed after '#'

x <- rnorm(n, mean = 3, sd = 2)     # Generate 1000 pairs of normal variables
y <- rnorm(n, mean = 2, sd = 1)
hist(c(x, y+3), breaks = 25)        # ?hist() or help(hist)
                                    # c() is a function that combines its arguments 
                                    # Create a histogram of a mixture of normal.
                                    # distributions with the number of bins 25. 
ls()                                # See variable names that are stored in the workspace.
rm(n,x,y)                           # Remove n, x, y from the workspace
