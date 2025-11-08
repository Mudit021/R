install.packages("arules")
library(arules)

trans <- as(list(
  c("milk", "bread"),
  c("bread", "butter"),
  c("milk", "butter"),
  c("bread", "eggs")
), "transactions")

rules <- apriori(trans, parameter = list(supp = 0.3, conf = 0.6))

inspect(rules)