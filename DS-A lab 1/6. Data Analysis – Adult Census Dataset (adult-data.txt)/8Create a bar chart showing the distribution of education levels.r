#load necessary libraries
library(edu_freq)

# Load the dataset
data <- read.table("M:/codes wagera/R/R/DS-A lab 1/6. Data Analysis – Adult Census Dataset (adult-data.txt)/adult-data.txt",
                   header = FALSE, sep = ",", strip.white = TRUE)

# Assign column names
colnames(data) <- c("age", "workclass", "fnlwgt", "education", "education_num",
                    "marital_status", "occupation", "relationship", "race", "sex",
                    "capital_gain", "capital_loss", "hours_per_week", "native_country", "income")

# Create frequency table of education levels
edu_freq <- table(data$education)

# Plot bar chart
barplot(edu_freq,
        main = "Distribution of Education Levels",
        xlab = "Education Level",
        ylab = "Frequency",
        col = "blue",
        las = 2,         # Rotate x-axis labels
        cex.names = 0.8  # Adjust label size
)