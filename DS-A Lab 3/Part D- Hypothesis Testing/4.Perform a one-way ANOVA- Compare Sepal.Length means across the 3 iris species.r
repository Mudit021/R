iris <- read.csv(file.choose())

anova_result <- aov(sepal_length ~ species, data = iris)

summary(anova_result)