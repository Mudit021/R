get_top_5_values <- function(df, column_name) {
  # Check if column exists
  if (is.null(df[[column_name]])) {
    stop(paste("Column", column_name, "not found in the data frame."))
  }
  
  # Extract the column and get top 5 values
  top_values <- sort(df[[column_name]], decreasing = TRUE)
  return(head(top_values, 5))
}

# Sample data frame
data <- data.frame(
  Name = c("A", "B", "C", "D", "E", "F"),
  Score = c(88, 95, 70, 99, 85, 92)
)

# Call the function
get_top_5_values(data, "Score")