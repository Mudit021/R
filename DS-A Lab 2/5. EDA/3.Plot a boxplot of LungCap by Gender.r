library(readxl)

# Read the dataset (adjust path as needed)
data <- read_excel(file.choose())
names(data)[1] <- "LungCap"

# Create boxplot of Lung Capacity by Gender
boxplot(LungCap ~ Gender,
        data = data,
        main = "Boxplot of Lung Capacity by Gender",
        xlab = "Gender",
        ylab = "Lung Capacity (cc)",
        col = c("#362fff", "#720749"))