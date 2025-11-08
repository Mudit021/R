data(iris)

model <- lm(Petal.Length ~ Sepal.Length, data = iris)

plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Petal.Length vs Sepal.Length",
     xlab = "Sepal Length", ylab = "Petal Length",
     pch = 19, col = "blue")

abline(model, col = "red", lwd = 2)

residuals <- resid(model)
segments(iris$Sepal.Length, iris$Petal.Length,
         iris$Sepal.Length, fitted(model),
         col = "gray")