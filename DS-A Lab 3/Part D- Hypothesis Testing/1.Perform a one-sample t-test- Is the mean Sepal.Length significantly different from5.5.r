data(iris)
test_result <- t.test(iris$Sepal.Length, mu = 5.5)
print(test_result)