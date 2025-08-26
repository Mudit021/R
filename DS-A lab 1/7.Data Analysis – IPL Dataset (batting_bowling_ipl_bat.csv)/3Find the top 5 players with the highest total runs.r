data <- read.csv("M:/codes wagera/R/R/DS-A lab 1/7.Data Analysis – IPL Dataset (batting_bowling_ipl_bat.csv)/batting_bowling_ipl_bat.csv")

# Top 5 players with highest total runs
top_players <- head(data[order(data$Runs, decreasing = TRUE), c("Name", "Runs")], 5)
print(top_players)