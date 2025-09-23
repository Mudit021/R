# --- Step 1: Load necessary library ---
# Install once if not already installed: install.packages("dplyr")
library(dplyr)

# --- Step 2: Read the dataset ---
cat("Please select the 'LungCap_Dataset.xls - LungCapData.txt.csv' file.\n")
lung_data <- read.csv(file.choose(), fileEncoding = "UTF-16LE", sep = "\t")

# --- Step 3: Detect the Lung Capacity column automatically ---
col_name <- grep("LungCap", names(lung_data), value = TRUE)

if (length(col_name) == 0) {
  stop("No LungCap column found! Please check your dataset column names.")
}

cat("\nDetected Lung Capacity column:", col_name, "\n\n")

# --- Step 4: Average before removing outliers ---
avg_before <- mean(lung_data[[col_name]], na.rm = TRUE)
cat("--- Lung Capacity Analysis ---\n")
cat("Average Lung Capacity (before removing outliers):", round(avg_before, 4), "\n")

# --- Step 5: Outlier detection using IQR ---
Q1 <- quantile(lung_data[[col_name]], 0.25, na.rm = TRUE)
Q3 <- quantile(lung_data[[col_name]], 0.75, na.rm = TRUE)
IQR_lungcap <- IQR(lung_data[[col_name]], na.rm = TRUE)

lower_bound <- Q1 - 1.5 * IQR_lungcap
upper_bound <- Q3 + 1.5 * IQR_lungcap

cat("First Quartile (Q1):", Q1, "\n")
cat("Third Quartile (Q3):", Q3, "\n")
cat("Interquartile Range (IQR):", IQR_lungcap, "\n")
cat("Lower bound for outliers:", round(lower_bound, 4), "\n")
cat("Upper bound for outliers:", round(upper_bound, 4), "\n")

# --- Step 6: Remove outliers ---
lung_data_no_outliers <- lung_data %>%
  filter(.data[[col_name]] >= lower_bound & .data[[col_name]] <= upper_bound)

outlier_count <- nrow(lung_data) - nrow(lung_data_no_outliers)
cat("Number of outliers detected and removed:", outlier_count, "\n")

# --- Step 7: Average after removing outliers ---
avg_after <- mean(lung_data_no_outliers[[col_name]], na.rm = TRUE)
cat("Average Lung Capacity (after removing outliers):", round(avg_after, 4), "\n\n")

# --- Step 8: Final Summary ---
cat("Summary: After removing", outlier_count, "outliers, the average lung capacity changed from",
    round(avg_before, 4), "to", round(avg_after, 4), ".\n")

# --- Step 9 (Optional): Boxplots for visualization ---
par(mfrow = c(1, 2)) # side by side plots
boxplot(lung_data[[col_name]], main = "With Outliers", col = "lightblue")
boxplot(lung_data_no_outliers[[col_name]], main = "Without Outliers", col = "lightgreen")
par(mfrow = c(1, 1)) # reset layout