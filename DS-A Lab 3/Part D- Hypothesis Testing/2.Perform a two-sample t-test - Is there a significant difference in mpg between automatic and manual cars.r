data(mtcars)

test_result <- t.test(mpg ~ am, data = mtcars)

print(test_result)