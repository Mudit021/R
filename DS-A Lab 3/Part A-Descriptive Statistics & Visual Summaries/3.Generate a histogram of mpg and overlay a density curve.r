data(mtcars)
hist(data$mpg,
main = "Histogram of mpg",
xlab = "Values",
col = "blue",
border = "white")

lines(density(data$mpg), col = "red", lwd = 2)
