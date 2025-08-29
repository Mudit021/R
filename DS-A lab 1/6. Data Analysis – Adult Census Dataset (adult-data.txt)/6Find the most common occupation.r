data <- read.table(file.choose(), header = FALSE, sep = ",")
occupationalStatus <- table(data[[7]])
print(occupationalStatus)
