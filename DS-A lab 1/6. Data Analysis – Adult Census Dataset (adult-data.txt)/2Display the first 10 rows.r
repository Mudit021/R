data1 <- read.table(file.choose()) # choose the file "adult-data.txt" from the directory
colnames(data1) <- c('Age','Job-Type','Social Security Number','Education','Years','Marital Status','Job','Family','Color','Sex','Capital_gain','Capital_Loss','Hour_Per_Week','Country','Salary')

#display the first 10 data from the dataset
head(data1,10)