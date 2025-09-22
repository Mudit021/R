install.packages("tidyverse")
library(readr)
library(dplyr)

df <- read_csv("your_titanic_dataset.csv")

# Calculate the mean Fare grouped by Pclass and Survived status
mean_fare <- df %>%
  group_by(Pclass, Survived) %>%
  summarise(mean_Fare = mean(Fare, na.rm = TRUE)) # na.rm = TRUE to handle missing values

print(mean_fare)