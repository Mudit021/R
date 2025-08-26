# Load the dataset
data <- read.csv("M:/codes wagera/R/R/DS-A lab 1/7.Data Analysis – IPL Dataset (batting_bowling_ipl_bat.csv)/batting_bowling_ipl_bat.csv")

# Check column names to confirm
names(data)

# Assuming the columns are named "Mat" for matches and "Runs" for runs
correlation <- cor(data$HF, data$Runs, use = "complete.obs")

# Print the result
print(paste("Correlation between Matches Played and Runs Scored:", round(correlation, 3)))