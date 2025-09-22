# convert the CSV file to xlsx
install.packages("openxlsx")
library(openxlsx)
data <- read.csv(file.choose())
write.xlsx(data,"Facebook_Data.xlsx")

facebook_data <- read.csv(file.choose())
View(facebook_data)
summary(facebook_data)
#Find the post with the maximum number of likes.

View(facebook_data[c("like")])
