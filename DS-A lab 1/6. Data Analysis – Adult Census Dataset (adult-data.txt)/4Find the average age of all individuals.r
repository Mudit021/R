# Load the dataset
data <- read.table(file.choose(), header = FALSE, sep = ",") # choose the appropriate text file

# Assuming age is in the first column
average_age <- mean(data[[1]])

cat("Average age of individuals:", round(average_age, 2))
