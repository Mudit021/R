# load csv file
data1 <- read.csv(file.choose()) # choose dataset_Facebook.csv file from the directory
View(data1)

#load excel file
library(readxl)
data2 <- read_excel(file.choose()) # choose LungCap_dataset.excel file from the directory
View(data2)

#load text file
data3 <- read.table(file.choose(), header = TRUE) # choose text file from the directory
View(data3)
