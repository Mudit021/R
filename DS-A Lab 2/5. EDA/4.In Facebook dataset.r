install.packages("readxl")
install.packages("ggplot2")
library(readxl)
library(ggplot2)
df <- read_excel(file.choose())
scatter_plot <- ggplot(df, aes(x = comment, y = like)) +
  geom_point(alpha = 0.5, color = "red") +
  labs(
    title = "Likes vs. Comments",
    x = "Comments",
    y = "Likes"
  ) +
  theme_minimal()
print(scatter_plot)

histogram_plot <- ggplot(df, aes(x = share)) +
  geom_histogram(binwidth = 25, fill = "red", color = "black", na.rm = TRUE) +
  labs(
    title = "Histogram of Post Shares",
    x = "Number of Shares",
    y = "Frequency (Count)"
  ) +
  theme_minimal()
print(histogram_plot)