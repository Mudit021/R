data <-read.csv("M:/codes wagera/R/R/DS-A lab 1/7.Data Analysis – IPL Dataset (batting_bowling_ipl_bat.csv)/batting_bowling_ipl_bat.csv")


# find the player with the highest batting average
highest_batting_avg <- head(data[order(data$Ave , decreasing = T),],1)
print(highest_batting_avg)