vec <- function(a){
    print(paste("Mean is : ",mean(a))) # prints mean of vector
    print(paste("Median is : ", median(a))) # prints median of vector
    print(paste("Standard Deviation is : ",sd(a))) # standard deviation
}

nums <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
vec(nums)