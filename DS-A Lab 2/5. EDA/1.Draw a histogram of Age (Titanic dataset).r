# Make sure you have the ggplot2 package installed. If not, uncomment the line below and run it.
install.packages("ggplot2")
library(ggplot2)


# Read the Titanic dataset from the CSV file
titanic_data <- read.csv(file.choose())

# Draw the histogram
ggplot(titanic_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black", na.rm = TRUE) +
  labs(title = "Age Distribution of Titanic Passengers",
       x = "Age",
       y = "Frequency") +
  theme_minimal()
