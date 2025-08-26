data <- read.csv("M:/codes wagera/R/R/DS-A lab 1/7.Data Analysis – IPL Dataset (batting_bowling_ipl_bat.csv)/batting_bowling_ipl_bat.csv")

# Top 10 by strike rate
top10 <- head(data[order(data$SR, decreasing = TRUE), ], 10)

# Basic bar chart
barplot(top10$SR, names.arg = top10$Player, las = 2, col = "red",
        main = "Top 10 Players by Strike Rate", ylab = "Strike Rate")