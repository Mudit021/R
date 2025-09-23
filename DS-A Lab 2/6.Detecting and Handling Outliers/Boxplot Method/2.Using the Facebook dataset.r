# --- Step 1: Load the necessary libraries ---
# You only need to run the install.packages line once, not every time.
# install.packages(c("ggplot2", "dplyr", "scales", "tidyr"))
library(ggplot2)
library(dplyr)
library(scales)
library(tidyr)


# --- Analysis for Titanic Dataset ---

# --- Step 2: Read the Titanic data ---
# Using file.choose() will open a window and let you select the file manually.
cat("Please select the 'train_titanic.csv' file from the dialog window.\n")
titanic_data <- read.csv(file.choose())


# --- Step 3: Prepare Titanic data for the pie chart ---
# We will count how many people survived (1) vs. did not survive (0).
survivor_counts <- titanic_data %>%
  count(Survived) %>%
  mutate(label = ifelse(Survived == 1, "Survived", "Did Not Survive")) %>%
  mutate(
    percentage = n / sum(n),
    label_text = paste0(label, "\n", percent(percentage, accuracy = 0.1))
  )


# --- Step 4: Create a Pie Chart for Titanic Survivors ---
titanic_pie_chart <- ggplot(survivor_counts, aes(x = "", y = n, fill = label)) +
  geom_bar(stat = "identity", width = 1, color="white") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = label_text), position = position_stack(vjust = 0.5)) +
  labs(
    title = "Proportion of Survivors on the Titanic",
    fill = "Outcome"
  ) +
  theme_void() +
  scale_fill_manual(values = c("Did Not Survive" = "#c0392b", "Survived" = "#27ae60"))

print(titanic_pie_chart)
ggsave("titanic_survival_pie_chart.png", plot = titanic_pie_chart, width = 8, height = 6)


# --- Step 5: Create a Boxplot of Fare to Identify Outliers ---
fare_boxplot <- ggplot(titanic_data, aes(y = Fare)) +
  geom_boxplot(fill = "#3498db", color = "black") +
  labs(
    title = "Distribution of Passenger Fares",
    y = "Fare Price"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_blank())

print(fare_boxplot)
ggsave("titanic_fare_boxplot.png", plot = fare_boxplot, width = 8, height = 6)
cat("\nThe Fare boxplot shows several points above the main box and whisker, indicating potential outliers. These represent passengers who paid a significantly higher fare than the majority.\n")


# --- Step 6: Create a Boxplot of Age separated by Survival ---
titanic_age_data <- titanic_data %>%
  filter(!is.na(Age))

age_survival_boxplot <- ggplot(titanic_age_data, aes(x = factor(Survived, labels = c("Did Not Survive", "Survived")), y = Age, fill = factor(Survived, labels = c("Did Not Survive", "Survived")))) +
  geom_boxplot() +
  labs(
    title = "Age Distribution by Survival Outcome",
    x = "Survival Status",
    y = "Age"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("Did Not Survive" = "#c0392b", "Survived" = "#27ae60")) +
  theme(legend.position = "none")

print(age_survival_boxplot)
ggsave("titanic_age_survival_boxplot.png", plot = age_survival_boxplot, width = 8, height = 6)


# --- Step 7: Answer the Question about Age Spread ---
cat("\n--- Question: Which group (Survived/Not Survived) has more spread in ages? ---\n")
cat("Based on the boxplot of Age by Survival Status, the 'Did Not Survive' group appears to have a slightly larger spread in ages. The box (representing the middle 50% of passengers) is taller, and the whiskers extend further, indicating more variability in the ages of those who did not survive compared to those who did.\n\n")


# --- Analysis for Facebook Dataset ---

# --- Step 8: Read the Facebook data ---
cat("\nPlease select the 'dataset_Faccebook.csv' file from the dialog window.\n")
# read.csv2 is used for semicolon-separated files.
facebook_data <- read.csv2(file.choose())

# --- Step 9: Clean the Facebook Data ---
# Convert relevant columns to numeric, as they might be read as text.
facebook_data$like <- as.numeric(as.character(facebook_data$like))
facebook_data$comment <- as.numeric(as.character(facebook_data$comment))
facebook_data$share <- as.numeric(as.character(facebook_data$share))

# Remove rows where the key variables might be NA after conversion.
facebook_data <- na.omit(facebook_data, cols=c("like", "comment", "share"))


# --- Step 10: Create a Boxplot of Likes ---
likes_boxplot <- ggplot(facebook_data, aes(y = like)) +
  geom_boxplot(fill = "#4267B2", color = "black") +
  labs(title = "Distribution of Facebook Post Likes", y = "Number of Likes") +
  theme_minimal() +
  # Use a log scale to better visualize the distribution due to extreme outliers.
  scale_y_log10() +
  theme(axis.text.x = element_blank())

print(likes_boxplot)
ggsave("facebook_likes_boxplot.png", plot = likes_boxplot, width = 8, height = 6)
cat("\nThe Likes boxplot shows many points far above the main box, which are extreme posts (outliers) that received a very high number of likes compared to the average post.\n")


# --- Step 11: Create a Combined Boxplot for Likes, Shares, and Comments ---
# We need to reshape the data from wide to long format for ggplot2.
facebook_long <- facebook_data %>%
  select(like, comment, share) %>%
  pivot_longer(cols = c(like, comment, share), names_to = "Metric", values_to = "Value")

# Create the combined boxplot.
combined_boxplot <- ggplot(facebook_long, aes(x = Metric, y = Value, fill = Metric)) +
  geom_boxplot() +
  labs(
    title = "Comparison of Likes, Comments, and Shares",
    x = "Interaction Type",
    y = "Count"
  ) +
  theme_minimal() +
  # Use a log scale to make the comparison clearer.
  scale_y_log10() +
  theme(legend.position = "none")

print(combined_boxplot)
ggsave("facebook_combined_boxplot.png", plot = combined_boxplot, width = 8, height = 6)


# --- Step 12: Answer the Question about Metric Variation ---
cat("\n--- Question: Which metric (Likes, Comments, Shares) has the highest variation? ---\n")
cat("Based on the combined boxplot, 'Likes' has the highest variation. Its box is the tallest and its whiskers stretch the furthest, indicating a much wider range of values compared to comments and shares.\n\n")


# --- Step 13: Final Message ---
cat("Analysis complete. All plots for both Titanic and Facebook datasets have been saved to your folder.\n")