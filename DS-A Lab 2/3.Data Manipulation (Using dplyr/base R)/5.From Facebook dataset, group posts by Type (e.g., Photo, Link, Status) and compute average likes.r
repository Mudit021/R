library(readr)
library(dplyr)

df <- read_csv(file.choose())

# Group by 'Type' and summarize the average 'Likes'
average_likes <- df %>%
  group_by(Type) %>%
  summarise(mean_likes = mean(Likes, na.rm = TRUE))

print(average_likes)