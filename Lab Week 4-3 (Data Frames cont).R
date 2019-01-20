mtcars
nrow(mtcars)
a <- which(row.names(mtcars) == "Cadillac Fleetwood")
mtcars1 <- mtcars[1:a-1,]
mtcars2 <- mtcars[a:nrow(mtcars),]
mtcars2[,c("vs", "am")] <- NULL
mtcars2[,c("vs", "am")] <- NA
mtcars_f <- rbind(mtcars1, mtcars2)
rm(a)
rm(list=ls())
#mtcars2$vs <- NA
#mtcars2$am <- NA




ncol(mtcars)
b <- which(names(mtcars) == "wt")
mtcars3 <- mtcars[,1:b-1]
mtcars4 <- mtcars[,b:ncol(mtcars)]
name <- row.names(mtcars)
mtcars3 <- cbind(name, mtcars3)
mtcars4 <- cbind(name, mtcars4)
row.names(mtcars3) <- NULL
row.names(mtcars4) <- NULL
mtcars3
mtcars4
b <- substr(row.names(mtcars), 1, 4)
mtcars4 <- mtcars4[!(b == "Merc"),]
mtcars4
mtcars_all <- merge(mtcars3, mtcars4, by = "name", all = TRUE)
mtcars_all
rm(b, name)
rm(list=ls())



mov <- "The Shining"
act <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelso")
scores <- c(4.5, 4.0, 5.0)
sources <- c("IMDb1", "IMDb2", "IMDb3")
comments <- c("Best Horror Film I have ever seen", "A truly brilliant and scary film", "A masterpiece of psychological horror")
rev <- data.frame(scores, sources, comments)
shine_list <- list(mov, act, rev)
rm(mov, act, scores, comments, rev)
names(shine_list) <- list("moviename", "actors", "reviews")
shine_list[[2]]
shine_list[[2]][2]
(shine_list[[3]][1])*5
shine_list[[3]][3]
shine_list$year <- 1980
rm(sources)
rm(list=ls())