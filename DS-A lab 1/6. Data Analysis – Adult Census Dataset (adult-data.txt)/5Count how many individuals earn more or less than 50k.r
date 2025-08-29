data <- read.table(file.choose(), header = FALSE, sep = ",")
count_salary <-table(data[[15]])
print(count_salary)

