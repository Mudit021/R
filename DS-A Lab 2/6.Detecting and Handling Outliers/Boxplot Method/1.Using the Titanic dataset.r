library(ggplot2)
library(dplyr)
library(scales)

titanic_data <- read.csv(file.choose())

survivor_counts <- titanic_data %>%

  count(Survived) %>%
  mutate(label = ifelse(Survived == 1, "Survived", "Did Not Survive")) %>%
  mutate(
    percentage = n / sum(n),
    label_text = paste0(label, "\n", percent(percentage, accuracy = 0.1))
  )

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