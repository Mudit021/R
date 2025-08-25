data <- read.table("M:/codes wagera/R/R/DS-A lab 1/6. Data Analysis – Adult Census Dataset (adult-data.txt)/adult-data.txt", header = FALSE, sep = ",")
count_salary <-table(data[[15]])
print(count_salary)

