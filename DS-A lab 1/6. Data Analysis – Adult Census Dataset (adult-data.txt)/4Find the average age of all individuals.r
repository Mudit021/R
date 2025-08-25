# Load the dataset
data <- read.table("M:/codes wagera/R/R/DS-A lab 1/6. Data Analysis – Adult Census Dataset (adult-data.txt)/adult-data.txt", header = FALSE, sep = ",")

# Assuming age is in the first column
average_age <- mean(data[[1]])

cat("Average age of individuals:", round(average_age, 2))
