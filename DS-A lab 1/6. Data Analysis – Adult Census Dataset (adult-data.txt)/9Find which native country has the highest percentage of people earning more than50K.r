# Load the dataset
data <- read.table("M:/codes wagera/R/R/DS-A lab 1/6. Data Analysis – Adult Census Dataset (adult-data.txt)/adult-data.txt",
                   header = FALSE, sep = ",", strip.white = TRUE)

# Assign column names
colnames(data) <- c("age", "workclass", "fnlwgt", "education", "education_num",
                    "marital_status", "occupation", "relationship", "race", "sex",
                    "capital_gain", "capital_loss", "hours_per_week", "native_country", "income")

# Filter out rows with missing values
data <- subset(data, native_country != "?" & income != "?")

# Total people per country
total_by_country <- table(data$native_country)

# People earning >50K per country
high_income_by_country <- table(data$native_country[data$income == ">50K"])

# Match dimensions and calculate percentage
# Fill missing countries with 0
all_countries <- names(total_by_country)
high_income_vector <- rep(0, length(all_countries))
names(high_income_vector) <- all_countries
high_income_vector[names(high_income_by_country)] <- high_income_by_country

# Calculate percentage
percentage_high_income <- (high_income_vector / total_by_country) * 100

# Sort and find top country
sorted_percentages <- sort(percentage_high_income, decreasing = TRUE)
top_country <- names(sorted_percentages)[1]
top_percentage <- sorted_percentages[1]

# Display result
cat("Country with highest percentage earning >50K:\n")
cat(paste0(top_country, " with ", round(top_percentage, 2), "%\n"))