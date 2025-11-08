data(mtcars)

plot(mtcars$hp, mtcars$mpg,
     main = "MPG vs Horsepower",
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     pch = 19, col = "blue")

model <- lm(mpg ~ hp, data = mtcars)
abline(model, col = "red", lwd = 2)

correlation <- cor(mtcars$mpg, mtcars$hp)
legend("topright", legend = paste("r =", round(correlation, 2)), bty = "n")