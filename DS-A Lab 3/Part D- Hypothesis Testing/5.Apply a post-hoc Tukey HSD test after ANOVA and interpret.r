iris <- read.csv(file.choose())

anova_result <- aov(sepal_length ~ species, data = iris)

tukey_result <- TukeyHSD(anova_result)

print(tukey_result)