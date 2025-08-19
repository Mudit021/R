data1 <- read.table("DS-A lab 1\\6. Data Analysis – Adult Census Dataset (adult-data.txt)\\adult-data.txt")
colnames(data1) <- c('Age','Job-Type','Social Security Number','Education','Years','Marital Status','Job','Family','Color','Sex','Capital_gain','Capital_Loss','Hour_Per_Week','Country','Salary')

# Structure of the dataset
str(data1)