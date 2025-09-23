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


# --- Step 8: Calculate and Count Fare Outliers ---
# Compute the first quartile (Q1), third quartile (Q3), and Interquartile Range (IQR).
Q1_fare <- quantile(titanic_data$Fare, 0.25)
Q3_fare <- quantile(titanic_data$Fare, 0.75)
IQR_fare <- IQR(titanic_data$Fare)

# Define the upper and lower bounds for detecting outliers.
lower_bound <- Q1_fare - 1.5 * IQR_fare
upper_bound <- Q3_fare + 1.5 * IQR_fare

# Filter the data to find all passengers with fares outside this range.
fare_outliers <- titanic_data %>%
  filter(Fare < lower_bound | Fare > upper_bound)

# Count how many outliers were found.
outlier_count <- nrow(fare_outliers)

# Print the results of the outlier analysis.
cat("\n--- Titanic Fare Outlier Analysis ---\n")
cat("First Quartile (Q1) for Fare:", Q1_fare, "\n")
cat("Third Quartile (Q3) for Fare:", Q3_fare, "\n")
cat("Interquartile Range (IQR) for Fare:", IQR_fare, "\n\n")
cat("Lower Bound for Outliers:", lower_bound, "\n")
cat("Upper Bound for Outliers:", upper_bound, "\n\n")
cat("Number of passengers with fares outside the 1.5 * IQR range:", outlier_count, "\n\n")