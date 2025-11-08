data(mtcars)

test_result <- t.test(mtcars$mpg)

print(test_result)

cat("95% Confidence Interval")
print(test_result$conf.int)