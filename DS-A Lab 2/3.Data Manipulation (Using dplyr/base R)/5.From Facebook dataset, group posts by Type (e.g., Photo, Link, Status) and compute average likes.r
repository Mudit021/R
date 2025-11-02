install.packages("readxl")
library(readxl)
df <- read_excel(file.choose())
avg_likes_summary <- aggregate(like ~ Type, data = df, FUN = mean, na.rm = TRUE)

print(avg_likes_summary)