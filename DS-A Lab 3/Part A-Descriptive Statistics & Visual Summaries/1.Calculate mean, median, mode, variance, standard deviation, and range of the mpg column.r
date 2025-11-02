# Load the built-in mtcars dataset
data(mtcars)

# 1. Define a simple function to calculate the mode
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# 2. Calculate all the statistics
mean_mpg <- mean(mtcars$mpg)
median_mpg <- median(mtcars$mpg)
mode_mpg <- get_mode(mtcars$mpg)
variance_mpg <- var(mtcars$mpg)
std_dev_mpg <- sd(mtcars$mpg)
range_mpg <- max(mtcars$mpg) - min(mtcars$mpg)
min_mpg <- min(mtcars$mpg)
max_mpg <- max(mtcars$mpg)

print(paste("Mean:", round(mean_mpg, 2)))
print(paste("Median:", median_mpg))
print(paste("Mode:", mode_mpg))
print(paste("Variance:", round(variance_mpg, 2)))
print(paste("Std. Deviation:", round(std_dev_mpg, 2)))
print(paste("Range:", round(range_mpg, 2), "(Min:", min_mpg, ", Max:", max_mpg, ")"))