pdf(file="histograms.pdf")


data.set <- read.csv("histogram.csv", stringsAsFactors=FALSE)
data.set <- data.set[data.set$YRDATA==2013,]

data.1 <- data.set[data.set$STATE=="Connecticut",]
data.1 <- data.1[data.1$ENROLL>0,]
data.1 <- data.1[,c(1,2,3,4,9)]

expn_student <- data.1$TOTALEXP/data.1$ENROLL
data.1 <- cbind.data.frame(data.1, expn_student)
index <- which(expn_student>30)
top_ct <- data.1[index,]

plot(data.1$expn_student)
points(index, data.1$expn_student[index], pch=16, col="red")
text(index, data.1$expn_student[index], labels=data.1$NAME[index], cex=0.8)



data.al <- data.set[data.set$STATE=="Alabama",]
data.al <- data.al[data.al$ENROLL>0,]
data.al <- data.al[,c(1,2,3,4,9)]
expn_student_al <- data.al$TOTALEXP/data.al$ENROLL
data.al <- cbind.data.frame(data.al, expn_student_al)

data.ct <- data.set[data.set$STATE=="Connecticut",]
data.ct <- data.ct[data.ct$ENROLL>0,]
data.ct <- data.ct[,c(1,2,3,4,9)]
expn_student_ct <- data.ct$TOTALEXP/data.ct$ENROLL
data.al <- cbind.data.frame(data.ct, expn_student_ct)

hist(expn_student_al, col=rgb(0.5, 0.5, 0.5, 0.5), freq=FALSE, breaks=6, xlab="Expenditure per Student", main="School Level Expenditure per Student")
hist(expn_student_ct, col=rgb(0.2,0.5,0.5,0.2), breaks=6, freq=FALSE, add=TRUE)


dev.off()
