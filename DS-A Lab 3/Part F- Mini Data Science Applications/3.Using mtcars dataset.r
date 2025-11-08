data(mtcars)

features <- mtcars[, c("mpg", "hp", "wt")]

scaled_features <- scale(features)

set.seed(123)
km <- kmeans(scaled_features, centers = 3)

mtcars$cluster <- as.factor(km$cluster)

library(ggplot2)
pca <- prcomp(scaled_features)
pca_df <- data.frame(pca$x[, 1:2], cluster = mtcars$cluster)

ggplot(pca_df, aes(x = PC1, y = PC2, color = cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering of mtcars", x = "PC1", y = "PC2") +
  theme_minimal()