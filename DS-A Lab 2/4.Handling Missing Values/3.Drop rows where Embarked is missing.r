library(readr)
library(dplyr)
library(tidyr)

df <- read_csv(file.choose())

# Print the number of rows before dropping
cat("Number of rows before drop:", nrow(df), "\n")

# Drop rows where the 'Embarked' column has missing values
df_cleaned <- df %>% drop_na(Embarked)

# Print the number of rows after dropping
cat("Number of rows after drop:", nrow(df_cleaned), "\n")
View(df)