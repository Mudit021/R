# load csv file
data1 <- read.csv("M:\\codes wagera\\R\\R\\DS-A Lab 2\\dataset_Faccebook.csv")
View(data1)

#load excel file
library(readxl)
data2 <- read_excel("M:\\codes wagera\\R\\R\\DS-A Lab 2\\LungCap_Dataset.xls")
View(data2)

#load text file
data3 <- read.table("M:\\codes wagera\\R\\R\\DS-A Lab 2\\", header = TRUE)
