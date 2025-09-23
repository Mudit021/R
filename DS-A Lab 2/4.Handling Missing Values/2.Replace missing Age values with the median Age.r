library(readr)
library(dplyr)

df <- read_csv(file.choose())
summary(df)
# Calculate the median age, ignoring NA values
median_age <- median(df$Age, na.rm = TRUE)

# Replace missing values in the 'Age' column with the median
df$Age[is.na(df$Age)] <- median_age
summary(df)
