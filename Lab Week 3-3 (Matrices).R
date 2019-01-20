a <- matrix(data = 1:9, nrow = 3, ncol = 3)
a
b <- matrix(data = a^2, nrow = 3, ncol = 3)
b
trans_b <- t(b)
trans_b


Storrs <- c(365, 489)
Hartford <- c(426, 387)
Stamford <- c(571, 486)
HP_vector <- c(Storrs, Hartford, Stamford)
HP_vector
HP_matrix <- matrix(data = HP_vector, nrow = 3, byrow = TRUE)
HP_matrix
Area <- c("Storrs", "Hartford", "Stamford")
type <- c("House", "Condo")
colnames(HP_matrix) <- type 
rownames(HP_matrix) <- Area
CT_average <- colMeans(HP_matrix)
HP_matrix.2 <- rbind(HP_matrix, CT_average)
HP_matrix.f <- rowMeans(HP_matrix.2)


Income <- rchisq(100, 5)
yrsofedu <- sample(7:16, 100, replace = TRUE)
CT <- cbind(Income, yrsofedu)                     #or    CT <- matrix(c(Income, yrsofedu), 100, 2)
CT
gender <- sample(c("Male", "Female"), 100, replace =TRUE)
CT1 <- CT[gender == "Female", ]                   #or CT1 <- CT[gender, ]  (Leaves out entries with FALSE values)
CT1
CT2 <- CT[yrsofedu > 12, ]
CT2
CT1_mean <- colMeans(CT1)                         # or mean(CT1[,1])
CT1_mean
CT2_mean <- colMeans(CT2)                         # or mean(CT2[,1])
CT2_mean
