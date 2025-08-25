# Load the dataset
data <- read.table("M:/codes wagera/R/R/DS-A lab 1/6. Data Analysis – Adult Census Dataset (adult-data.txt)/adult-data.txt",
                   header = FALSE, sep = ",", strip.white = TRUE)

# Assign column names
colnames(data) <- c("age", "workclass", "fnlwgt", "education", "education_num",
                    "marital_status", "occupation", "relationship", "race", "sex",
                    "capital_gain", "capital_loss", "hours_per_week", "native_country", "income")

# Calculate average hours-per-week for each income group
avg_hours <- aggregate(hours_per_week ~ income, data = data, FUN = mean)

# Print results
print(avg_hours)
