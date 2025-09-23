library(ggplot2)
library(dplyr)
library(scales)

titanic_data <- read.csv(file.choose())

survivor_counts <- titanic_data %>%
  # Group by the 'Survived' column and count the number of passengers in each group.
  count(Survived) %>%
  # Create a new column with more descriptive labels.
  mutate(label = ifelse(Survived == 1, "Survived", "Did Not Survive")) %>%
  # Calculate the percentage for each group to display on the chart.
  mutate(
    percentage = n / sum(n),
    label_text = paste0(label, "\n", percent(percentage, accuracy = 0.1))
  )

titanic_pie_chart <- ggplot(survivor_counts, aes(x = "", y = n, fill = label)) +
  # geom_bar creates the bar chart. stat="identity" means use the values from 'y'.
  geom_bar(stat = "identity", width = 1, color="white") +
  # coord_polar turns the bar chart into a pie chart.
  coord_polar("y", start = 0) +
  # Add the text labels (e.g., "Survived 38.4%") to the pie slices.
  geom_text(aes(label = label_text), position = position_stack(vjust = 0.5)) +
  # Add a title and customize the legend title.
  labs(
    title = "Proportion of Survivors on the Titanic",
    fill = "Outcome"
  ) +
  # theme_void() removes all the background grids and axis labels for a clean look.
  theme_void() +
  # Add some nicer colors for the chart.
  scale_fill_manual(values = c("Did Not Survive" = "#c0392b", "Survived" = "#27ae60"))

print(titanic_pie_chart)

fare_boxplot <- ggplot(titanic_data, aes(y = Fare)) +
  geom_boxplot(fill = "#3498db", color = "black") +
  labs(
    title = "Distribution of Passenger Fares",
    y = "Fare Price"
  ) +
  theme_minimal() +
  # The x-axis is not meaningful for a single boxplot, so we remove its text.
  theme(axis.text.x = element_blank())

print(fare_boxplot)

titanic_age_data <- titanic_data %>%
  filter(!is.na(Age))

# Now create the boxplot comparing ages of survivors and non-survivors.
age_survival_boxplot <- ggplot(titanic_age_data, aes(x = factor(Survived, labels = c("Did Not Survive", "Survived")), y = Age, fill = factor(Survived, labels = c("Did Not Survive", "Survived")))) +
  geom_boxplot() +
  labs(
    title = "Age Distribution by Survival Outcome",
    x = "Survival Status",
    y = "Age"
  ) +
  theme_minimal() +
  # Use the same colors as the pie chart for consistency.
  scale_fill_manual(values = c("Did Not Survive" = "#c0392b", "Survived" = "#27ae60")) +
  # Hide the legend as the x-axis labels are clear enough.
  theme(legend.position = "none")

print(age_survival_boxplot)