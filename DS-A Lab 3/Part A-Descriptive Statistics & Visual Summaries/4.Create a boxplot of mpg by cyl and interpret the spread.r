# Load the built-in mtcars dataset
data(mtcars)

# Create the boxplot using the formula notation
boxplot(mpg ~ cyl, 
        data = mtcars,
        main = "MPG Distribution by Number of Cylinders",
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon (mpg)",
        col = "blue",
        border = "black")