library(ggplot2)

titanic_data <- read.csv(file.choose())

titanic_data$Pclass <- as.factor(titanic_data$Pclass)

p <- ggplot(titanic_data, aes(x = Pclass)) +
  # Add the bar layer. The `fill` and `color` aesthetics are for styling.
  geom_bar(fill = "steelblue", color = "black") +
  
  # Add labels and a title to make the plot informative.
  labs(
    title = "Passenger Count by Pclass on the Titanic",
    x = "Passenger Class",
    y = "Count"
  ) +
  
  # Use a clean theme for a professional look.
  theme_minimal() +
  
  # Improve the aesthetics with custom theme settings.
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"), # Center and bold the title
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

# Display the plot
print(p)
