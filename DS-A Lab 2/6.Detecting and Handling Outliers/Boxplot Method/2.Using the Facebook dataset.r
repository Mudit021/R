# 1. Load library to read Excel files
# install.packages("readxl")
library(readxl)

# 2. Let user pick the Excel file
df <- read_excel(file.choose())

# --- Task 1: Boxplot of Likes & Identify Outliers ---
print("--- 1. Boxplot of Likes ---")
boxplot(df$like, 
        main = "Boxplot of Post Likes", 
        ylab = "Number of Likes",
        horizontal = TRUE, # Makes it horizontal
        col = "lightblue")

# Identify extreme posts (outliers)
Q3 <- quantile(df$like, 0.75, na.rm = TRUE)
Q1 <- quantile(df$like, 0.25, na.rm = TRUE)
IQR <- Q3 - Q1
upper_bound <- Q3 + 1.5 * IQR

print(paste("Outlier threshold for 'Likes':", upper_bound))

# Filter and show the top outliers
outliers_df <- df[df$like > upper_bound & !is.na(df$like), ]
print("--- Top 5 Extreme Posts (Outliers) for Likes ---")
print(head(outliers_df[order(-outliers_df$like), c("Type", "like", "comment", "share")]))

# --- Task 2: Combined Boxplot ---
print("--- 2. Combined Boxplot ---")
boxplot(df$like, df$comment, df$share,
        main = "Combined Boxplot of Engagement",
        names = c("Likes", "Comments", "Shares"),
        ylab = "Count",
        col = c("blue", "green", "pink")
)

# --- Task 3: Calculate Variation (Standard Deviation) ---
print("--- 3. Metric with Highest Variation ---")
std_likes <- sd(df$like, na.rm = TRUE)
std_comments <- sd(df$comment, na.rm = TRUE)
std_shares <- sd(df$share, na.rm = TRUE)

print(paste("Standard Deviation of Likes:", round(std_likes, 2)))
print(paste("Standard Deviation of Comments:", round(std_comments, 2)))
print(paste("Standard Deviation of Shares:", round(std_shares, 2)))
print("Conclusion: Likes has the highest variation.")