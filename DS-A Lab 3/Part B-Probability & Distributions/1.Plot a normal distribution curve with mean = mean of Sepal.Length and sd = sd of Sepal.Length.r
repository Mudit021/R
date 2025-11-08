data(iris)
mean_sl <- mean(iris$Sepal.Length)
sd_sl <- sd(iris$Sepal.Length)

x_values <- seq(mean_sl - 4 * sd_sl, mean_sl + 4 * sd_sl, length.out = 1000)

y_values <- dnorm(x_values, mean = mean_sl, sd = sd_sl)

plot(x_values, y_values,
     type = "l",  
     lwd = 2,     
     col = "blue",  
     main = "Normal Distribution of Sepal Length",
     xlab = "Sepal Length",
     ylab = "Density"
)

abline(v = mean_sl, col = "red", lty = 2)
legend("topright", 
       legend = paste("Mean =", round(mean_sl, 2)), 
       col = "red", 
       lty = 2)