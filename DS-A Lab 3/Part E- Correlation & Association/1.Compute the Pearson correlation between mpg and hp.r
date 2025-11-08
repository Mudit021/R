data(mtcars)

correlation <- cor(mtcars$mpg, mtcars$hp, method = "pearson")

print(correlation)