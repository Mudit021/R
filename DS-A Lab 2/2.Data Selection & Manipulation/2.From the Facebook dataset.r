install.packages("dplyr")
install.packages("readxl")

library(dplyr)
library(readxl)

file_path <- file.choose()

# Read the Excel file
# read_excel() will automatically find the first sheet
df_original <- read_excel(file_path)

# --- Rename columns ---
df <- df_original %>%
  rename(
    Page_total_likes = `Page total likes`,
    Type = Type,
    Category = Category,
    Post_Month = `Post Month`,
    Post_Weekday = `Post Weekday`,
    Post_Hour = `Post Hour`,
    Paid = Paid,
    Lifetime_Post_Total_Reach = `Lifetime Post Total Reach`,
    Lifetime_Post_Total_Impressions = `Lifetime Post Total Impressions`,
    Lifetime_Engaged_Users = `Lifetime Engaged Users`,
    Lifetime_Post_Consumers = `Lifetime Post Consumers`,
    Lifetime_Post_Consumptions = `Lifetime Post Consumptions`,
    Lifetime_Post_Impressions_by_people_who_have_liked_your_Page = `Lifetime Post Impressions by people who have liked your Page`,
    Lifetime_Post_reach_by_people_who_like_your_Page = `Lifetime Post reach by people who like your Page`,
    Lifetime_People_who_have_liked_your_Page_and_engaged_with_your_post = `Lifetime People who have liked your Page and engaged with your post`,
    Comments = comment,
    Likes = like,
    Shares = share,
    Total_Interactions = `Total Interactions`
  )

# --- 1. Find the post with the maximum number of likes ---
max_likes <- max(df$Likes, na.rm = TRUE)

post_with_max_likes <- df %>%
  filter(Likes == max_likes)

print("--- 1. Post with the maximum number of likes ---")
print(post_with_max_likes)
cat("\nMaximum number of likes:", max_likes, "\n")
# --- 2. Calculate the average number of shares per post ---
average_shares <- mean(df$Shares, na.rm = TRUE)

cat("\n--- 2. Average number of shares per post ---\n")
cat(sprintf("%.2f", average_shares), "\n")


# --- 3. Create a new column Engagement = Likes + Comments + Shares ---
df_with_engagement <- df %>%
  mutate(
    Engagement = coalesce(Likes, 0) + coalesce(Comments, 0) + coalesce(Shares, 0)
  )

cat("\n--- 3. Data frame with new 'Engagement' column (first 5 rows) ---\n")
print(head(df_with_engagement %>% select(Type, Comments, Likes, Shares, Engagement)))