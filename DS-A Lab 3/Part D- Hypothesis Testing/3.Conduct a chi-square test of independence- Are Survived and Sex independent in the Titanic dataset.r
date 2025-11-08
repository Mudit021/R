data <- read.csv(file.choose())

survival_sex_table <- table(data$Survived, data$Sex)

chi_test_result <- chisq.test(survival_sex_table)

print(chi_test_result)