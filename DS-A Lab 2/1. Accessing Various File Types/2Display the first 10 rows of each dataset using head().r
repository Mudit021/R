# Showing first 10 inputs of dataset_facebook
head(read.csv(file.choose()),10)

#showing first 10 inputs of LA 2017
library(readxl)
head(read_excel(file.choose()),10)

#showing first 10 elements of LungCap_Dataset
library(readxl)
head(read_excel(file.choose()),10)

#showing first 10 elements of train_titanic
head(read.csv(file.choose()),10)
