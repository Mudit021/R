# rbinom(1000, 10, 0.5) means:
# 1000 = number of samples to generate
# 10   = number of trials (n)
# 0.5  = probability of success (p)
samples <- rbinom(1000, 10, 0.5)

hist(samples,
     main = "Histogram of Binomial Samples (n=10, p=0.5)",
     xlab = "Number of Successes",
     col = "lightblue")