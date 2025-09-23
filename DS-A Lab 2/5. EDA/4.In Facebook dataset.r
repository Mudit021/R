library(ggplot2)

facebook_data <- read.csv2(file.choose())

print("Here are the original column names:")
print(names(facebook_data))

facebook_data$like <- as.numeric(as.character(facebook_data$like))
facebook_data$comment <- as.numeric(as.character(facebook_data$comment))
facebook_data$share <- as.numeric(as.character(facebook_data$share))

facebook_data <- na.omit(facebook_data, cols=c("like", "comment", "share"))

scatter_plot <- ggplot(facebook_data, aes(x = comment, y = like)) +
  # geom_point() creates the actual scatter plot with dots.
  geom_point(alpha = 0.5, color = "#4267B2") +
  # labs() sets the title and axis labels.
  labs(
    title = "Likes vs. Comments on Facebook Posts",
    x = "Number of Comments",
    y = "Number of Likes"
  ) +
  # theme_minimal() gives the plot a clean, simple look.
  theme_minimal() +
  # geom_smooth() adds a trend line to show the relationship.
  geom_smooth(method = "lm", col = "#F5624D", se = FALSE) +
  # Using a log scale helps to see the pattern better when there are
  # many posts with low numbers and a few posts with very high numbers.
  scale_x_log10() +
  scale_y_log10()

print(scatter_plot)

histogram_shares <- ggplot(facebook_data, aes(x = share)) +
  # geom_histogram() creates the bars. 'bins' controls how many bars there are.
  geom_histogram(bins = 50, fill = "#4267B2", color = "white") +
  # Add a title and labels.
  labs(
    title = "Distribution of Shares on Facebook Posts",
    x = "Number of Shares",
    y = "Frequency (Number of Posts)"
  ) +
  # Use a clean theme.
  theme_minimal() +
  # Use a log scale on the x-axis to make the distribution easier to see.
  scale_x_log10()

print(histogram_shares)