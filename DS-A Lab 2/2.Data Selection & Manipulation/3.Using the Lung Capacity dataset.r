# Load the necessary library for data manipulation
library(dplyr)

# Read the dataset directly from a URL.
# This URL provides a clean, correctly formatted CSV file.
df <- read.csv(file.choose(), header = TRUE)

# 1. Select children below age 12.
children_below_12 <- df %>%
  filter(Age < 12)

# 2. Group by Gender and calculate the average Lung Capacity.
average_lung_capacity_by_gender <- children_below_12 %>%
  group_by(Gender) %>%
  summarise(Average_Lung_Capacity = mean(LungCap, na.rm = TRUE))

cat("Average Lung Capacity for children below age 12, grouped by gender:\n")
print(average_lung_capacity_by_gender)

# 3. Find the child with the maximum Lung Capacity from the filtered group.
# Correct way to find the row with the maximum LungCap for clarity and robustness 
child_with_max_lung_cap <- children_below_12 %>%
  slice_max(LungCap)

cat("\nChild with the maximum Lung Capacity among those below age 12:\n")
print(child_with_max_lung_cap)