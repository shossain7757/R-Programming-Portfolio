favourite_number <- 5
favourite_number
times <- c(6,9,8,5,7.5,6.4,5,2.5,5,4,7.5,8,8)
times
mean(times)
times <- c("None",9,8,5,7.5,6.4,5,2.5,5,4,7.5,8,8)
times
minutes <- times * 60
times <- c(6,9,8,5,7.5,6.4,5,2.5,5,4,7.5,8,8)
minutes <- times * 60
1:13*times
sd(times)
range(times)
stderr(time)
stderr(times)
stderr(times)
range(times)
length(times)
times < 6
table(times < 6)
times == 5
times < 4 | times > 9
any(times < 6)
all(times < 6)
which(times < 6)
times[which(times < 6)]
times < 5
times[times < 5]
times[times < 5] == c(NA,NA)
times[times < 5] <- NA
mtcars
head(mtcars)
tail(mtcars)
str(mtcars)
nrow(mtcars)
ncol(mtcars)
summary(mtcars)
row.names(mtcars)
names(mtcars)
table(row.names(mtcars))
mean(mtcars$mpg)
