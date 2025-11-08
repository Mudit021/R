samples <- rbinom(1000, 10, 0.5)

sample_mean <- mean(samples)
sample_var <- var(samples)

theoretical_mean <- 10 * 0.5
theoretical_var <- 10 * 0.5 * (1 - 0.5)

print(paste("Sample Mean:", sample_mean))
print(paste("Theoretical Mean:", theoretical_mean))
print(paste("Sample Variance:", sample_var))
print(paste("Theoretical Variance:", theoretical_var))