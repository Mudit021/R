install.packages("boot")
library(boot)

data(mtcars)

mean_hp <- function(data, indices) {
  d <- data[indices] 
  return(mean(d)) 
}

boot_results <- boot(data = mtcars$hp, statistic = mean_hp, R = 1000)

ci_results <- boot.ci(boot_results, type = "bca") # Bias-Corrected and Accelerated

print(boot_results)
print(ci_results)