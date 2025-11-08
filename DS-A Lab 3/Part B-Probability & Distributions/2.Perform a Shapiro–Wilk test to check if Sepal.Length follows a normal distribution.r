data(iris)
shapiro_result <- shapiro.test(iris$Sepal.Length)
print(shapiro_result)