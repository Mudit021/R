install.packages(c("ggplot2", "dplyr", "scales"))
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