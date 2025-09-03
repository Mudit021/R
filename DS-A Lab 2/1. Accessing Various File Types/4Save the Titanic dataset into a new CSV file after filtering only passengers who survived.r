#loading the old dataset
data <- read.table(file.choose()) #select train_titanic datasets
View(data)

# survived passengers
survived_passengers <- data$Name[data$Survived == 1]
View(survived_passengers)
