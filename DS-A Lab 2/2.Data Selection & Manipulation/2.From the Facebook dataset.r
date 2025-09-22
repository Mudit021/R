# Load the necessary libraries
install.packages("dplyr")
library(dplyr)

# Read the dataset from the uploaded CSV file
# The delimiter is specified as a semicolon based on the file preview.
df <- read.csv(file.choose(), sep = ";")

# Rename columns for easier access
names(df) <- c("Page_total_likes", "Type", "Category", "Post_Month", "Post_Weekday", "Post_Hour", "Paid",
               "Lifetime_Post_Total_Reach", "Lifetime_Post_Total_Impressions", "Lifetime_Engaged_Users",
               "Lifetime_Post_Consumers", "Lifetime_Post_Consumptions",
               "Lifetime_Post_Impressions_by_people_who_have_liked_your_Page",
               "Lifetime_Post_reach_by_people_who_like_your_Page",
               "Lifetime_People_who_have_liked_your_Page_and_engaged_with_your_post",
               "Comments", "Likes", "Shares", "Total_Interactions")

# 1. Find the post with the maximum number of likes
# We first identify the maximum value in the "Likes" column.
max_likes <- max(df$Likes, na.rm = TRUE)

# Then, we filter the data frame to find the row(s) with this value.
post_with_max_likes <- df %>%
  filter(Likes == max_likes)

print("Post with the maximum number of likes:\n")
print(post_with_max_likes)

# 2. Calculate the average number of shares per post
# We use the mean() function on the "Shares" column.
average_shares <- mean(df$Shares, na.rm = TRUE)

cat("\nAverage number of shares per post:", average_shares, "\n")

# 3. Create a new column Engagement = Likes + Comments + Shares
# We use mutate() to add the new "Engagement" column.
df_with_engagement <- df %>%
  mutate(Engagement = Likes + Comments + Shares)

# Print the first few rows of the new dataframe to show the added column
print("\nData frame with the new 'Engagement' column:\n")
head(df_with_engagement)