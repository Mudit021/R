iris <- read.csv("iris.csv")

cor_test <- cor.test(iris$sepal_length, iris$petal_length, method = "spearman")

print(cor_test)