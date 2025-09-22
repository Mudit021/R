library(readr)

df <- read_csv(file.choose())

# Find columns with missing values and display them
colSums(is.na(df))